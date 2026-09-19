# Documentación Breve - Práctica 1: Calculadora en ARM64

**Curso:** Arquitectura de Computadores y Ensambladores 1  
**Semestre:** Segundo Semestre 2026  
**Estudiante:** Kristhoper Franklin Ucelo Pirir  

---

## 1. Descripción General
Se desarrolló una calculadora de números enteros ejecutada desde la consola Linux utilizando lenguaje ensamblador ARM64 puro (AArch64). El programa presenta un menú interactivo que permite realizar múltiples operaciones aritméticas de forma continua mediante un ciclo de ejecución, finalizando únicamente cuando el usuario selecciona explícitamente la opción de salir.

La solución implementa modularidad mediante llamadas a subrutinas (`bl` y `ret`) para mantener un código organizado y legible, aplicando el control de flujo con comparaciones y saltos condicionales para la validación estricta de las entradas.

---

## 2. Operaciones e Instrucciones Implementadas

El programa incluye las 6 operaciones solicitadas desarrolladas a bajo nivel[cite: 3]:

* **Suma:** Realizada con la instrucción `add`[cite: 3].
* **Resta:** Realizada con la instrucción `sub`[cite: 3].
* **Multiplicación:** Realizada con la instrucción `mul`[cite: 3].
* **División Entera:** Realizada con la instrucción `sdiv`[cite: 3].
* **Potencia:** Implementada mediante multiplicación repetida (`mul`) utilizando un ciclo iterativo decrementando el exponente[cite: 3].
* **Factorial:** Implementado mediante un ciclo iterativo que multiplica el acumulador por el contador hasta llegar a cero[cite: 3].

---

## 3. Validaciones y Control de Flujo

Para garantizar la estabilidad del programa, se agregaron las siguientes comprobaciones mediante comparaciones (`cmp`) y saltos condicionales (`beq`, `blt`, `bgt`)[cite: 3]:

* **Opción de menú inválida:** Se verifica que la opción esté en el rango de 1 a 7; de lo contrario, se despliega un mensaje de error y regresa al menú[cite: 3].
* **División entre cero:** Antes de invocar la subrutina de división, se evalúa si el divisor es igual a cero (`cmp w2, #0`)[cite: 3].
* **Exponentes negativos:** En la potencia se valida que el exponente no sea menor a cero (`blt`)[cite: 3].
* **Factorial de números negativos:** Se restringe el factorial únicamente a enteros no negativos (`cmp w1, #0`)[cite: 3].

---

## 4. Evidencias de Ejecución

### 4.1. Menú e Interacción Principal
<img width="1920" height="1080" alt="SO1 Practica1 1" src="https://github.com/user-attachments/assets/8afa3afc-9120-4658-82dc-a55d04090bc2" />


---

### 4.2. Manejo de Errores y Validaciones
<img width="1920" height="1080" alt="SO1 Practica1 2" src="https://github.com/user-attachments/assets/4570c109-3fd7-4e2a-9689-230c28f2e349" />


---

### 4.3. Depuración con GDB
<img width="1920" height="1080" alt="SO1 Practica1 3" src="https://github.com/user-attachments/assets/eee88784-fc88-4624-8f3a-7af42ada1484" />
