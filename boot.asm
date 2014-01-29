[BITS 32]
[global start]
[extern _k_main]

%include 'grub.inc'

start:
	call _k_main ; Invoke the c method

	cli		; Kill interrupts
	hlt		; Halt the cpu

	EXTERN code, bss, end

;; Setup for GRUB to load us

ALIGN 4
mboot:
	dd MULTIBOOT_HEADER_MAGIC
	dd MULTIBOOT_HEADER_FLAGS
	dd MULTIBOOT_CHECKSUM
; aout kludge. These must be PHYSICAL addresses
	dd mboot
	dd code
	dd bss
	dd end
	dd start
