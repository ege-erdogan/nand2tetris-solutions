// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Since there is no direct multiplication operation,
// we have to perform a series of additions.

@R0
D = M;

@i						// i (the letter) will be our counter, loop will end when i = 0
M = D;

@R2
M = 0;				// set mult. to 0 in case it was non-zero before

(LOOP)				// loop begins here
	@i
	D = M;	  	// retrieve i

	@END
	D; JEQ			// End loop if i = 0

	@R1
	D = M;			// retrieve the number that we add to itself

	@R2
	M = M + D;	// the operation that we are repeating	

	@i
	M = M - 1;  // decrement i			

	@LOOP
	0; JMP			// Goto LOOP

(END)
	@END
	0; JMP			// infinite loop to stop the loop