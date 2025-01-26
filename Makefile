.PHONY: all
all:
	swift build --triple riscv64-none-none-eabi -c release -Xswiftc -Osize -Xswiftc -experimental-hermetic-seal-at-link --experimental-lto-mode=full
