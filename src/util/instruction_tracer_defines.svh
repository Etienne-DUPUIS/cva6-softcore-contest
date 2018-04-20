// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Florian Zaruba, ETH Zurich
// Date: 16.05.2017
// Description: Instruction Tracer Defines

parameter INSTR_LUI       = { 25'b?, OPCODE_LUI };
parameter INSTR_AUIPC     = { 25'b?, OPCODE_AUIPC };
parameter INSTR_JAL       = { 25'b?, OPCODE_JAL };
parameter INSTR_JALR      = { 17'b?, 3'b000, 5'b?, OPCODE_JALR };
// BRANCH
parameter INSTR_BEQZ     =  { 7'b?, 5'b0, 5'b?, 3'b000, 5'b?, OPCODE_BRANCH };
parameter INSTR_BEQ      =  { 7'b?, 5'b?, 5'b?, 3'b000, 5'b?, OPCODE_BRANCH };
parameter INSTR_BNEZ     =  { 7'b?, 5'b0, 5'b?, 3'b001, 5'b?, OPCODE_BRANCH };
parameter INSTR_BNE      =  { 7'b?, 5'b?, 5'b?, 3'b001, 5'b?, OPCODE_BRANCH };
parameter INSTR_BLTZ     =  { 7'b?, 5'b0, 5'b?, 3'b100, 5'b?, OPCODE_BRANCH };
parameter INSTR_BLT      =  { 7'b?, 5'b?, 5'b?, 3'b100, 5'b?, OPCODE_BRANCH };
parameter INSTR_BGEZ     =  { 7'b?, 5'b0, 5'b?, 3'b101, 5'b?, OPCODE_BRANCH };
parameter INSTR_BGE      =  { 7'b?, 5'b?, 5'b?, 3'b101, 5'b?, OPCODE_BRANCH };
parameter INSTR_BLTU     =  { 7'b?, 5'b?, 5'b?, 3'b110, 5'b?, OPCODE_BRANCH };
parameter INSTR_BGEU     =  { 7'b?, 5'b?, 5'b?, 3'b111, 5'b?, OPCODE_BRANCH };

// OP-IMM
parameter INSTR_LI       =  { 12'b?, 5'b0, 3'b000, 5'b?, OPCODE_OP_IMM };
parameter INSTR_ADDI     =  { 17'b?, 3'b000, 5'b?, OPCODE_OP_IMM };
parameter INSTR_SLTI     =  { 17'b?, 3'b010, 5'b?, OPCODE_OP_IMM };
parameter INSTR_SLTIU    =  { 17'b?, 3'b011, 5'b?, OPCODE_OP_IMM };
parameter INSTR_XORI     =  { 17'b?, 3'b100, 5'b?, OPCODE_OP_IMM };
parameter INSTR_ORI      =  { 17'b?, 3'b110, 5'b?, OPCODE_OP_IMM };
parameter INSTR_ANDI     =  { 17'b?, 3'b111, 5'b?, OPCODE_OP_IMM };
parameter INSTR_SLLI     =  { 6'b000000, 11'b?, 3'b001, 5'b?, OPCODE_OP_IMM };
parameter INSTR_SRLI     =  { 6'b000000, 11'b?, 3'b101, 5'b?, OPCODE_OP_IMM };
parameter INSTR_SRAI     =  { 6'b010000, 11'b?, 3'b101, 5'b?, OPCODE_OP_IMM };

// OP-IMM-32
parameter INSTR_ADDIW    =  { 17'b?, 3'b000, 5'b?, OPCODE_OP_IMM_32 };
parameter INSTR_SLLIW    =  { 7'b0000000, 10'b?, 3'b001, 5'b?, OPCODE_OP_IMM_32 };
parameter INSTR_SRLIW    =  { 7'b0000000, 10'b?, 3'b101, 5'b?, OPCODE_OP_IMM_32 };
parameter INSTR_SRAIW    =  { 7'b0100000, 10'b?, 3'b101, 5'b?, OPCODE_OP_IMM_32 };

// OP
parameter INSTR_ADD      =  { 7'b0000000, 10'b?, 3'b000, 5'b?, OPCODE_OP };
parameter INSTR_SUB      =  { 7'b0100000, 10'b?, 3'b000, 5'b?, OPCODE_OP };
parameter INSTR_SLL      =  { 7'b0000000, 10'b?, 3'b001, 5'b?, OPCODE_OP };
parameter INSTR_SLT      =  { 7'b0000000, 10'b?, 3'b010, 5'b?, OPCODE_OP };
parameter INSTR_SLTU     =  { 7'b0000000, 10'b?, 3'b011, 5'b?, OPCODE_OP };
parameter INSTR_XOR      =  { 7'b0000000, 10'b?, 3'b100, 5'b?, OPCODE_OP };
parameter INSTR_SRL      =  { 7'b0000000, 10'b?, 3'b101, 5'b?, OPCODE_OP };
parameter INSTR_SRA      =  { 7'b0100000, 10'b?, 3'b101, 5'b?, OPCODE_OP };
parameter INSTR_OR       =  { 7'b0000000, 10'b?, 3'b110, 5'b?, OPCODE_OP };
parameter INSTR_AND      =  { 7'b0000000, 10'b?, 3'b111, 5'b?, OPCODE_OP };
parameter INSTR_MUL      =  { 7'b0000001, 10'b?, 3'b???, 5'b?, OPCODE_OP };

// OP-32
parameter INSTR_ADDW     =  { 7'b0000000, 10'b?, 3'b000, 5'b?, OPCODE_OP_32 };
parameter INSTR_SUBW     =  { 7'b0100000, 10'b?, 3'b000, 5'b?, OPCODE_OP_32 };
parameter INSTR_SLLW     =  { 7'b0000000, 10'b?, 3'b001, 5'b?, OPCODE_OP_32 };
parameter INSTR_SRLW     =  { 7'b0000000, 10'b?, 3'b101, 5'b?, OPCODE_OP_32 };
parameter INSTR_SRAW     =  { 7'b0100000, 10'b?, 3'b101, 5'b?, OPCODE_OP_32 };
parameter INSTR_MULW     =  { 7'b0000001, 10'b?, 3'b???, 5'b?, OPCODE_OP_32 };

// MISC-MEM
parameter INSTR_FENCE    =  { 4'b0, 8'b?, 13'b0, OPCODE_MISC_MEM };
parameter INSTR_FENCEI   =  { 17'b0, 3'b001, 5'b0, OPCODE_MISC_MEM };
// SYSTEM
parameter INSTR_CSRW     =  { 12'b?, 5'b?, 3'b001, 5'b0, OPCODE_SYSTEM };
parameter INSTR_CSRRW    =  { 12'b?, 5'b?, 3'b001, 5'b?, OPCODE_SYSTEM };
parameter INSTR_CSRR     =  { 12'b?, 5'b0, 3'b010, 5'b?, OPCODE_SYSTEM };
parameter INSTR_CSRRS    =  { 12'b?, 5'b?, 3'b010, 5'b?, OPCODE_SYSTEM };
parameter INSTR_CSRS     =  { 12'b?, 5'b?, 3'b010, 5'b0, OPCODE_SYSTEM };
parameter INSTR_CSRRC    =  { 12'b?, 5'b?, 3'b011, 5'b?, OPCODE_SYSTEM };
parameter INSTR_CSRC     =  { 12'b?, 5'b?, 3'b011, 5'b0, OPCODE_SYSTEM };

parameter INSTR_CSRWI    =  { 17'b?, 3'b101, 5'b0, OPCODE_SYSTEM };
parameter INSTR_CSRRWI   =  { 17'b?, 3'b101, 5'b?, OPCODE_SYSTEM };
parameter INSTR_CSRSI    =  { 17'b?, 3'b110, 5'b0, OPCODE_SYSTEM };
parameter INSTR_CSRRSI   =  { 17'b?, 3'b110, 5'b?, OPCODE_SYSTEM };
parameter INSTR_CSRCI    =  { 17'b?, 3'b111, 5'b0, OPCODE_SYSTEM };
parameter INSTR_CSRRCI   =  { 17'b?, 3'b111, 5'b?, OPCODE_SYSTEM };

parameter INSTR_ECALL    =  { 12'b000000000000, 13'b0, OPCODE_SYSTEM };
parameter INSTR_EBREAK   =  { 12'b000000000001, 13'b0, OPCODE_SYSTEM };
parameter INSTR_MRET     =  { 12'b001100000010, 13'b0, OPCODE_SYSTEM };
parameter INSTR_SRET     =  { 12'b000100000010, 13'b0, OPCODE_SYSTEM };
parameter INSTR_WFI      =  { 12'b000100000101, 13'b0, OPCODE_SYSTEM };
parameter INSTR_SFENCE   =  { 12'b0001001?????, 13'b?, OPCODE_SYSTEM };

// RV32M
parameter INSTR_PMUL     =  { 7'b0000001, 10'b?, 3'b000, 5'b?, OPCODE_OP };
parameter INSTR_DIV      =  { 7'b0000001, 10'b?, 3'b100, 5'b?, OPCODE_OP };
parameter INSTR_DIVU     =  { 7'b0000001, 10'b?, 3'b101, 5'b?, OPCODE_OP };
parameter INSTR_REM      =  { 7'b0000001, 10'b?, 3'b110, 5'b?, OPCODE_OP };
parameter INSTR_REMU     =  { 7'b0000001, 10'b?, 3'b111, 5'b?, OPCODE_OP };

// RVFD
parameter INSTR_FMADD    =  { 5'b?, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_MADD};
parameter INSTR_FMSUB    =  { 5'b?, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_MSUB};
parameter INSTR_FNSMSUB  =  { 5'b?, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_NMSUB};
parameter INSTR_FNMADD   =  { 5'b?, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_NMADD};

parameter INSTR_FADD     =  { 5'b00000, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FSUB     =  { 5'b00001, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FMUL     =  { 5'b00010, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FDIV     =  { 5'b00011, 2'b?, 5'b?, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FSQRT    =  { 5'b01011, 2'b?, 5'b0, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FSGNJ    =  { 5'b00100, 2'b?, 5'b?, 5'b?, 3'b000, 5'b?, OPCODE_OP_FP};
parameter INSTR_FSGNJN   =  { 5'b00100, 2'b?, 5'b?, 5'b?, 3'b001, 5'b?, OPCODE_OP_FP};
parameter INSTR_FSGNJX   =  { 5'b00100, 2'b?, 5'b?, 5'b?, 3'b010, 5'b?, OPCODE_OP_FP};
parameter INSTR_FMIN     =  { 5'b00101, 2'b?, 5'b?, 5'b?, 3'b000, 5'b?, OPCODE_OP_FP};
parameter INSTR_FMAX     =  { 5'b00101, 2'b?, 5'b?, 5'b?, 3'b001, 5'b?, OPCODE_OP_FP};
parameter INSTR_FLE      =  { 5'b10100, 2'b?, 5'b?, 5'b?, 3'b000, 5'b?, OPCODE_OP_FP};
parameter INSTR_FLT      =  { 5'b10100, 2'b?, 5'b?, 5'b?, 3'b001, 5'b?, OPCODE_OP_FP};
parameter INSTR_FEQ      =  { 5'b10100, 2'b?, 5'b?, 5'b?, 3'b010, 5'b?, OPCODE_OP_FP};

parameter INSTR_FCVT_F2F =  { 5'b01000, 2'b?, 5'b000??, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FMV_F2X  =  { 5'b11100, 2'b?, 5'b0, 5'b?, 3'b000, 5'b?, OPCODE_OP_FP};
parameter INSTR_FCLASS   =  { 5'b11100, 2'b?, 5'b0, 5'b?, 3'b001, 5'b?, OPCODE_OP_FP};
parameter INSTR_FMV_X2F  =  { 5'b11110, 2'b?, 5'b0, 5'b?, 3'b000, 5'b?, OPCODE_OP_FP};
parameter INSTR_FCVT_F2I =  { 5'b11000, 2'b?, 5'b000??, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};
parameter INSTR_FCVT_I2F =  { 5'b11010, 2'b?, 5'b000??, 5'b?, 3'b?, 5'b?, OPCODE_OP_FP};

// Load/Stores
parameter INSTR_LOAD     =  {25'b?, OPCODE_LOAD};
parameter INSTR_LOAD_FP  =  {25'b?, OPCODE_LOAD_FP};
parameter INSTR_STORE    =  {25'b?, OPCODE_STORE};
parameter INSTR_STORE_FP =  {25'b?, OPCODE_STORE_FP};
