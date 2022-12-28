.586
	.model flat, stdcall
	includelib libucrt.lib
	includelib kernel32.lib
	includelib ../Debug/KNI-2022LIB.lib
	ExitProcess PROTO :DWORD


	RandNum PROTO :DWORD 
	GetHours PROTO :DWORD 
	GetMonth PROTO :DWORD 
	GetMinutes PROTO :DWORD 
	GetDate PROTO :DWORD 
outputuint PROTO :DWORD
outputchar PROTO :BYTE
outputstr PROTO :DWORD

.stack 4096
.const
divideOnZeroExeption BYTE "Попытка деления на ноль.", 0  ;STR, для вывода ошибки при делении на ноль
	FindFactor$LEX1 DWORD 1 ;INT
	main$LEX4 BYTE 'q' ;CHR
	main$LEX5 BYTE "Symbol", 0  ;STR
	main$LEX6 BYTE "Factorial of number 5", 0  ;STR
	main$LEX7 DWORD 5 ;INT
	main$LEX8 BYTE "Number to be circilar shifted:", 0  ;STR
	main$LEX10 DWORD 33 ;INT
	main$LEX12 BYTE "1<<3:", 0  ;STR
	main$LEX13 BYTE "1>>1:", 0  ;STR
	main$LEX14 DWORD 6 ;INT
	main$LEX16 BYTE "If construction works", 0  ;STR
	main$LEX19 BYTE "If construction not works", 0  ;STR
	main$LEX24 DWORD 100 ;INT
	main$LEX25 BYTE "Hours:", 0  ;STR
	main$LEX26 BYTE "Minutes:", 0  ;STR
	main$LEX27 BYTE "Date:", 0  ;STR
	main$LEX28 BYTE "Month:", 0  ;STR
	main$LEX29 BYTE "Random number:", 0  ;STR
	main$LEX30 DWORD 0 ;INT
.data
	FindFactoranswer DWORD 0 ;INT
	mainsymb BYTE 0 ;CHR
	mainnumber DWORD 0 ;INT
	maindemo DWORD 0 ;INT
	maindemo1 DWORD 0 ;INT
	maindemo2 DWORD 0 ;INT
	mainnumber1 DWORD 0 ;INT
	mainnumber2 DWORD 0 ;INT
	mainnumber3 DWORD 0 ;INT
	mainnumber4 DWORD 0 ;INT
	mainnumber5 DWORD 0 ;INT

.code
$FindFactor PROC uses ebx ecx edi esi ,	FindFactora: DWORD 
; String #3 :ivl
push FindFactor$LEX1
pop FindFactoranswer

While17Start: 
mov eax, FindFactora
mov ebx, FindFactor$LEX1
cmp eax, ebx
jl While17End

; String #6 :iviiv
push FindFactoranswer
push FindFactora
pop ebx
pop eax
mul ebx
push eax
pop FindFactoranswer

; String #7 :ivilv
push FindFactora
push FindFactor$LEX1
pop ebx
pop eax
sub eax, ebx
push eax
pop FindFactora
jmp While17Start
While17End: 

mov eax, FindFactoranswer
ret
$FindFactor ENDP

main PROC

; String #20 :ivl
movzx eax, main$LEX4
push eax 
pop eax
mov mainsymb, al

push offset main$LEX5
CALL outputstr
push eax
movzx eax, mainsymb
push eax
CALL outputchar
pop eax


push offset main$LEX6
CALL outputstr

; String #26 :ivil@1
invoke $FindFactor, main$LEX7
push eax ;результат функции
pop mainnumber

push mainnumber
CALL outputuint

push offset main$LEX8
CALL outputstr

; String #31 :ivl
push FindFactor$LEX1
pop maindemo

push maindemo
CALL outputuint

; String #34 :ivilv
push maindemo
push main$LEX10
pop ebx
pop eax
push ecx ; сохраняем данные регистра ecx
mov ecx, ebx
SHL eax, cl
pop ecx
push eax
pop maindemo1

; String #36 :ivilv
push maindemo
push FindFactor$LEX1
pop ebx
pop eax
push ecx ; сохраняем данные регистра ecx
mov ecx, ebx
SHR eax, cl
pop ecx
push eax
pop maindemo2

push offset main$LEX12
CALL outputstr

push maindemo1
CALL outputuint

push offset main$LEX13
CALL outputstr

push maindemo2
CALL outputuint

If167Start: 
mov eax, main$LEX14
mov ebx, main$LEX7
cmp eax, ebx
jl If167End

push offset main$LEX16
CALL outputstr
If167End: 

If178Start: 
mov eax, main$LEX7
mov ebx, main$LEX14
cmp eax, ebx
jl If178End

push offset main$LEX19
CALL outputstr
If178End: 

; String #56 :ivil@1
invoke GetHours, FindFactor$LEX1
push eax ;результат функции
pop mainnumber1

; String #57 :ivil@1
invoke GetMinutes, FindFactor$LEX1
push eax ;результат функции
pop mainnumber2

; String #58 :ivil@1
invoke GetDate, FindFactor$LEX1
push eax ;результат функции
pop mainnumber3

; String #59 :ivil@1
invoke GetMonth, FindFactor$LEX1
push eax ;результат функции
pop mainnumber4

; String #60 :ivil@1
invoke RandNum, main$LEX24
push eax ;результат функции
pop mainnumber5

push offset main$LEX25
CALL outputstr

push mainnumber1
CALL outputuint

push offset main$LEX26
CALL outputstr

push mainnumber2
CALL outputuint

push offset main$LEX27
CALL outputstr

push mainnumber3
CALL outputuint

push offset main$LEX28
CALL outputstr

push mainnumber4
CALL outputuint

push offset main$LEX29
CALL outputstr

push mainnumber5
CALL outputuint

mov eax, main$LEX30
	jmp endPoint
	div_by_0:
	push offset divideOnZeroExeption
CALL outputstr
endPoint:
	invoke		ExitProcess, eax
main ENDP
end main