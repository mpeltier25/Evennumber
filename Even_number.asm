org 100h
jmp START

_numberOperators EQU 7h
operatorString db ' 2468'
START:
mov ah, 07h		 
int 21h			
mov ah, 02h		 
mov dl, al		 
int 21h

push dx
call IS_EVEN
pop dx
mov ah, 02h
int 21h
mov ah, 02h
mov dl,0Dh
int 21h
mov dl,0Ah
int 21h
	 
jmp START
;IS_EVEN returns true(1) or false(0) that the input parameter is even
IS_EVEN Proc
push ax
push bx
push bp

mov bp,sp
mov ax,[bp+08h]
mov bx, _numberOperators
mov operatorString[0],al
	 
jmp WHILE_CONDITION             
WHILE_TOP:
dec bx
WHILE_CONDITION:
cmp	al,operatorString[bx]
jNE	WHILE_TOP
cmp  bx,0							
je END_IF
mov bx,1
END_IF:
add bx,30h

mov [bp+08h], bx
pop bp							
pop bx							
pop ax							
ret  
IS_EVEN ENDP