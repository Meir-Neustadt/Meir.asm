dseg segment
a dw 1234h
b db 66h
dseg ends

sseg segment stack
dw 10h dup(0077h)
sseg ends

cseg segment
assume cs:cseg, ds:dseg, ss:sseg

ShowStar Proc
mov bp, sp
push ax
push bx
push dx
mov bx, ss:[bp+2]
mov ah, 2
mov dx, bx
and dx, 0f000h
shr dx, 12
add dx, 48
int 21h
mov dx, bx
and dx, 0f00h
shr dx, 8
add dx, 48
int 21h
mov dx, bx
and dx, 00f0h
shr dx, 4
add dx, 48
int 21h
mov dx, bx
and dx, 000fh
add dx, 48
int 21h
pop dx
pop bx
pop ax
ret
ShowStar endp

Begin: mov ax,dseg
mov ds, ax
push a
call ShowStar
int 3h
cseg ends
end Begin
