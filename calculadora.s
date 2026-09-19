.data
    menu:   .asciz "\n--- Calculadora ---\n1. Suma\n2. Resta\n3. Multiplicacion\n4. Division\n5. Potencia\n6. Factorial\n7. Salir\nOpcion: "
    fmt_in: .asciz "%d"
    fmt_out:.asciz "Resultado: %d\n"
    msg_op1:.asciz "Ingrese num 1 (o base/numero para factorial): "
    msg_op2:.asciz "Ingrese num 2 (o exponente): "
    msg_err_div:.asciz "Error: Division entre cero.\n"
    msg_err_neg:.asciz "Error: Numero negativo invalido.\n"
    msg_err_opc:.asciz "Error: Opcion invalida.\n"

    opcion: .word 0
    num1:   .word 0
    num2:   .word 0

.text
.global main

main:
    stp x29, x30, [sp, -16]!

ciclo_menu:
    ldr x0, =menu
    bl printf

    ldr x0, =fmt_in
    ldr x1, =opcion
    bl scanf
    
    ldr x1, =opcion
    ldr w19, [x1]

    cmp w19, #7
    beq salir

    cmp w19, #1
    blt opcion_invalida
    cmp w19, #7
    bgt opcion_invalida

    ldr x0, =msg_op1
    bl printf
    ldr x0, =fmt_in
    ldr x1, =num1
    bl scanf

    cmp w19, #6
    beq ejecutar_operacion

    ldr x0, =msg_op2
    bl printf
    ldr x0, =fmt_in
    ldr x1, =num2
    bl scanf

ejecutar_operacion:
    ldr x0, =num1
    ldr w1, [x0]
    ldr x0, =num2
    ldr w2, [x0]

    cmp w19, #1
    beq op_suma
    cmp w19, #2
    beq op_resta
    cmp w19, #3
    beq op_multi
    cmp w19, #4
    beq op_div
    cmp w19, #5
    beq op_potencia
    cmp w19, #6
    beq op_factorial

opcion_invalida:
    ldr x0, =msg_err_opc
    bl printf
    b ciclo_menu

op_suma:
    bl sub_suma
    b mostrar_resultado

op_resta:
    bl sub_resta
    b mostrar_resultado

op_multi:
    bl sub_multi
    b mostrar_resultado

op_div:
    cmp w2, #0
    beq error_div
    bl sub_div
    b mostrar_resultado

op_potencia:
    cmp w2, #0
    blt error_negativo
    bl sub_potencia
    b mostrar_resultado

op_factorial:
    cmp w1, #0
    blt error_negativo
    bl sub_factorial
    b mostrar_resultado

error_div:
    ldr x0, =msg_err_div
    bl printf
    b ciclo_menu

error_negativo:
    ldr x0, =msg_err_neg
    bl printf
    b ciclo_menu

mostrar_resultado:
    mov w1, w0
    ldr x0, =fmt_out
    bl printf
    b ciclo_menu

salir:
    ldp x29, x30, [sp], 16
    mov w0, #0
    ret

sub_suma:
    add w0, w1, w2
    ret

sub_resta:
    sub w0, w1, w2
    ret

sub_multi:
    mul w0, w1, w2
    ret

sub_div:
    sdiv w0, w1, w2
    ret

sub_potencia:
    mov w0, #1
ciclo_pot:
    cmp w2, #0
    beq fin_pot
    mul w0, w0, w1
    sub w2, w2, #1
    b ciclo_pot
fin_pot:
    ret

sub_factorial:
    mov w0, #1
ciclo_fact:
    cmp w1, #0
    beq fin_fact
    mul w0, w0, w1
    sub w1, w1, #1
    b ciclo_fact
fin_fact:
    ret
