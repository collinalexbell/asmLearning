// Using the "Hello World" program shown in Listing 2.2 as a template, write a program that will print your last name

	.section .rodata
mesg:	.asciz "Bell\n"

	.text
	.global main

main:	stp	x29, x30, [sp, #-16]!

	adr	x0, mesg
	bl	printf
	
	mov	w0, #0
	ldp	x29, x30, [sp], #16
	ret
	.size	main, (. - main)	
