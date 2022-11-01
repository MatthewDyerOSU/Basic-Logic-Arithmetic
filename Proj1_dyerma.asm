TITLE Project1 Basic Logic/Arithmetic Program     (Proj1_dyerma.asm)

; Author: Matthew Dyer
; Last Modified: 10/10/22
; OSU email address: dyerma@oregonstate.edu
; Course number/section:   CS271
; Project Number: 1                 Due Date: 10/16/22
; Description: A program that receives 3 numbers from the user in descending order and returns the sums and differences

INCLUDE Irvine32.inc

.data

firstNumber		DWORD	?	;First integer to be entered by the user
secondNumber	DWORD	?	;Second integer to be entered by the user
thirdNumber		DWORD	?	;Third integer to be entered by the user
intro			BYTE	"Enter 3 Numbers A > B > C, and I'll show you the sums and differences.",0
prompt_1		BYTE	"Enter the first number ",0
prompt_2		BYTE	"Enter the second number ",0
prompt_3		BYTE	"Enter the third number ",0
plus			BYTE	" + ",0
minus			BYTE	" - ",0
equals			BYTE	" = ",0
loopPrompt		BYTE	"Enter 1 to go again, enter 0 to quit ",0
exCredit_1		BYTE	"**EC: Program repeats until user chooses to quit."

.code
main PROC

; Introduction
	mov		EDX, OFFSET		intro
	call	WriteString
	call	CrLf

; Extra Credit Intro
	mov		EDX, OFFSET		exCredit_1
	call	WriteString
	call	CrLf

top:

; Get first number(A)
	mov		EDX, OFFSET		prompt_1
	call	WriteString
	call	ReadDec
	mov		firstNumber, EAX

; Get second number(B)
	mov		EDX, OFFSET		prompt_2
	call	WriteString
	call	ReadDec
	mov		secondNumber, EAX

; Get third number(C)
	mov		EDX, OFFSET		prompt_3
	call	WriteString
	call	ReadDec
	mov		thirdNumber, EAX

; Compute and Display A + B
	mov		EAX, firstNumber
	call	WriteDec
	mov		EDX, OFFSET		plus
	call	WriteString
	mov		EAX, secondNumber
	call	WriteDec
	add		EAX, firstNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Compute and Display A + C
	mov		EAX, firstNumber
	call	WriteDec
	mov		EDX, OFFSET		plus
	call	WriteString
	mov		EAX, thirdNumber
	call	WriteDec
	add		EAX, firstNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Compute and Display B + C
	mov		EAX, secondNumber
	call	WriteDec
	mov		EDX, OFFSET		plus
	call	WriteString
	mov		EAX, thirdNumber
	call	WriteDec
	add		EAX, secondNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Compute and Display A + B + C
	mov		EAX, firstNumber
	call	WriteDec
	mov		EDX, OFFSET		plus
	call	WriteString
	mov		EAX, secondNumber
	call	WriteDec
	call	WriteString
	mov		EAX, thirdNumber
	call	WriteDec
	add		EAX, firstNumber
	add		EAX, secondNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Compute and Display A - B
	mov		EAX, firstNumber
	call	WriteDec
	mov		EDX, OFFSET		minus
	call	WriteString
	mov		EAX, secondNumber
	call	WriteDec
	mov		EAX, firstNumber
	sub		EAX, secondNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Compute and Display A - C
	mov		EAX, firstNumber
	call	WriteDec
	mov		EDX, OFFSET		minus
	call	WriteString
	mov		EAX, thirdNumber
	call	WriteDec
	mov		EAX, firstNumber
	sub		EAX, thirdNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Compute and Display B - C
	mov		EAX, secondNumber
	call	WriteDec
	mov		EDX, OFFSET		minus
	call	WriteString
	mov		EAX, thirdNumber
	call	WriteDec
	mov		EAX, secondNumber
	sub		EAX, thirdNumber
	mov		EDX, OFFSET		equals
	call	WriteString
	call	WriteDec
	call	CrLf

; Ask to play again
	mov		EDX, OFFSET		loopPrompt
	call	WriteString
	call	ReadDec
	cmp		EAX, 1
	je		top

	Invoke ExitProcess,0	; exit to operating system
main ENDP


END main
