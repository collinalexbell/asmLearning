.text 			// code section
.globl _start
_start:
	mov x0, 1 	 	// stdout has file descriptor 1
	ldr x1, =msgAscii 	// buffer to write
	mov x2, msg_len	 	// size of buffer
	mov x8, 64 		// sys_write() is at index 64 in kernel functions table
	svc #0 			// generate kernel call sys_write(stdout, msg, len);

	mov x0, 1 	
	ldr x1, =msgAsciz
	mov x2, msg_len	
	mov x8, 64 	
	svc #0 		

	mov x0, 1 	
	ldr x1, =msgByte 	
	mov x2, msg_len	
	mov x8, 64 	
	svc #0 		





	mov x0, 123 	// exit code
	mov x8, 93 	// sys_exit() is at index 93 in kernel functions table
	svc #0 		// generate kernel call sys_exit(123);

.data			// data section
msgAscii: 
	.ascii "segmentation fault\n\0" //added newline to the problem for pretty printing
msgAsciz:
	.asciz "segmentation fault\n"
msgByte:
	.byte 's', 'e', 'g', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', ' ', 'f', 'a', 'u', 'l', 't', '\n', 0


msg_len = . - msgByte
