SECTION .data
msg db "Кашин",0xa
len equ $ - msg
buffer resb 100

SECTION .text
global _start ; the program entry point
_start:
;вывод
mov eax, 4 ; 'write' syscall
mov ebx, 1 ; file descr. 1 (stdout)
mov ecx, msg ; pointer to the data
mov edx, len ; amount of data
int 0x80 ; call to the kernel

;ввод
mov eax, 3 ; 'write' syscall
mov ebx, 0 ; file descr. 1 (stdout)
mov ecx, buffer ; pointer to the data
mov edx, 100 ; amount of data
int 0x80 ; call to the kernel

;вывод
mov eax, 4 ; 'write' syscall
mov ebx, 1 ; file descr. 1 (stdout)
mov ecx, buffer ; pointer to the data
mov edx, 100 ; amount of data
int 0x80 ; call to the kernel

mov eax, 1 ; '_exit' syscall
mov ebx, 0 ; zero exit code (success)
int 0x80 ; call to the kernel
