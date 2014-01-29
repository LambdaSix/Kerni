# Rakefile for Kerni

task :build do
	puts %x{nasm -f aout boot.asm -o k.o}
	puts %x{gcc -c k_main.c -o kernel.o}
	puts %x{ld -T linker.ld -o kernel.bin k.o kernel.o}
end

task :clean do
  puts %x{rm k.o kernel.o kernel.bin}
end
