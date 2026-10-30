# 4-Bit ALU Design Using Verilog

## 📌 Project Overview

This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs arithmetic and logical operations on two 4-bit binary inputs based on a 3-bit operation selector.

The design uses combinational logic and is simulated using Icarus Verilog on EDA Playground.

## 🎯 Project Objectives

- Design a 4-bit Arithmetic Logic Unit.
- Implement arithmetic and logical operations.
- Perform subtraction using the Two's Complement method.
- Reuse the same adder for addition and subtraction.
- Implement Carry and Zero flags.
- Verify functionality using a self-checking testbench.

## ⚙️ Supported Operations

| OP Code | Operation | Description |
|---|---|---|
| 000 | ADD | A + B |
| 001 | SUB | A - B |
| 010 | AND | Bitwise AND |
| 011 | OR | Bitwise OR |
| 100 | XOR | Bitwise XOR |
| 101 | NOT | Bitwise NOT of A |
| 110 | NAND | Bitwise NAND |
| 111 | DEFAULT | Output zero |

## 🔌 Input Signals

- `a[3:0]` – First 4-bit input operand.
- `b[3:0]` – Second 4-bit input operand.
- `op[2:0]` – Operation selection input.

## 📤 Output Signals

- `result[3:0]` – 4-bit operation result.
- `carry` – Arithmetic carry-out flag.
- `zero` – Indicates whether the result is zero.

## 🧮 Two's Complement Subtraction

Subtraction is implemented using the Two's Complement technique.

**Formula:**

A - B = A + (~B) + 1

When subtraction is selected:
1. Every bit of B is inverted.
2. One is added to the inverted B.
3. The modified B is added to A using the shared adder.

This allows the same adder circuit to perform both addition and subtraction without using a separate subtraction circuit.

For subtraction:
- Carry = 1 indicates no borrow.
- Carry = 0 indicates a borrow.

## 🧪 Testbench Verification

The self-checking testbench verifies 10 representative test cases:

1. Normal addition.
2. Addition overflow (15 + 1).
3. Positive subtraction (5 - 3).
4. Negative subtraction (3 - 5).
5. AND operation.
6. OR operation.
7. XOR operation.
8. NOT operation.
9. NAND operation.
10. Default operation.

The testbench checks the expected result, carry flag, and zero flag for each test case.

## ✅ Simulation Results

**Status: ALL TESTS PASSED!**

- Total test cases: 10
- Failed test cases: 0
- Simulator: Icarus Verilog 12.0
- Simulation platform: EDA Playground

## 🛠️ Tools and Technologies

- Verilog HDL
- Digital Logic Design
- Binary and Hexadecimal Arithmetic
- Two's Complement
- Icarus Verilog
- EDA Playground

## 📁 Project Files

| File | Description |
|---|---|
| `alu4.v` | Synthesizable ALU design module |
| `tb_alu4.v` | Self-checking Verilog testbench |
| `README.md` | Project documentation |

## 🔗 Online Simulation

[Run 4-Bit ALU on EDA Playground](https://edaplayground.com/x/NXsu)

## 💡 Real-World Applications

Arithmetic Logic Units are fundamental components of:
- CPUs and microprocessors.
- Digital Signal Processors (DSPs).
- Embedded systems.
- Digital computing architectures.

## 👨‍💻 Project Information

**Project:** 4-Bit Arithmetic Logic Unit (ALU)

**Design Type:** Combinational Digital Logic

**Hardware Description Language:** Verilog

**Simulation Tool:** Icarus Verilog

**Platform:** EDA Playground
