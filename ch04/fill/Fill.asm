// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// color = 0
    @color
    M=0
// saved = 0
    @saved
    M=0
// If (KBD != 0) goto BLACK
(LISTEN)
    @KBD
    D=M
    @BLACK
    D;JNE
// Else, color = 0 (white)
    @color
    M=0
    @CHECKSAVED
    0;JMP
(BLACK)
    @color
    M=-1
// If saved = color goto LISTEN
(CHECKSAVED)
    @saved
    D=M
    @color
    D=D-M
    @LISTEN
    D;JEQ
// saved = color
    @color
    D=M
    @saved
    M=D
// i = 0
    @i
    M=0
// If (i > 8192) goto LISTEN
(LOOP)
    @i
    D=M
    @8192
    D=D-A
    @LISTEN
    D;JGT
// RAM[SCREEN + i] = color
    @SCREEN
    D=A
    @i
    D=D+M
// Store address of next word in screen map
    @nextword
    M=D
// Set color of next word in screen map
    @color
    D=M
    @nextword
    A=M
    M=D
// i = i + 1
    @i
    M=M+1
// goto LOOP
    @LOOP
    0;JMP