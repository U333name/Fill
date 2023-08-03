format binary
org 100h

mov ah, 00h
mov al, 0Dh
int 10h

mov ah, 0Ch
mov bh, 0
mov al, 16

jmp my

my:
  xor cx, cx
  xor dx, dx
  jmp fillStart

fillStart:
  jmp c

fill:
  int 10h
  inc dx
  cmp dx, 200
  je nl
  cmp cx, 320
  jne fillStart
  jmp my

nl:
  inc cx
  xor dx, dx
  jmp fill

c:
  dec al
  cmp al, 0
  je set16
  jmp fill

set16:
  mov al, 16
  jmp fill