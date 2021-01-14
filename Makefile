



all:
	./scripts/check.sh



	nasm -f elf32 kernel.asm
	mv kernel.o kasm.o
	gcc -m32 -c -fno-builtin kernel.c -o kc.o
	ld -m elf_i386 -T link.ld -o kernel.bin kasm.o kc.o
	mv kernel.bin faoss/boot
	./scripts/rtrash.sh
	grub2-mkrescue -o faoss.iso faoss/



runqemu:

	./scripts/check.sh


	nasm -f elf32 kernel.asm
	mv kernel.o kasm.o
	gcc -m32 -c -fno-builtin kernel.c -o kc.o
	ld -m elf_i386 -T link.ld -o kernel.bin kasm.o kc.o
	mv kernel.bin faoss/boot
	./scripts/rtrash.sh





	qemu-system-x86_64 -kernel faoss/boot/kernel.bin



