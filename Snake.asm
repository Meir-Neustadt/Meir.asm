dseg segment
x db 40
y db 13
dseg ends
;=======================
cseg segment
assume cs:cseg, ds:dseg
;----------Function
ClS proc
mov ax, dseg
mov ds, ax
mov cx, 25
mov dl, 10
mov ah, 2
Shoov: 
int 21h
loop Shoov
mov dl, x
mov dh, y
mov  ah, 2    
mov  bh, 0            
int  10h
ret 
ClS endp  
;----------Main: direction
Start:
call ClS
Snake: 
mov ah, 7
int 21h
cmp al, 'd'
jz MovRight
cmp al, 's'
jz MovDown
cmp al, 'a'
jz MovLeft
cmp al, 'w'
jz MovUp
jmp Sof
;----------Direction updete
movRight:
inc x
jmp Move
MovDown: 
inc y
jmp Move
MovUp: 
dec y
jmp Move
MovLeft: 
dec x
;----------Snake building
Move: 
mov ah, 2
mov dl, '#'
int 21h
mov dl, x
mov dh, y  
mov bh, 0            
int 10h
jmp Snake  
;----------------------
Sof: int 3h
cseg ends
end Start
;====================== 
