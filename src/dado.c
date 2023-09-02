#include <pic14/pic12f683.h>

// Se desabilita el MCLR (se pone el MCLRE en OFF) y el WDT (se pone el WDTE en OFF)
unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF&_WDTE_OFF);

// Declaración de las funciones
void lfsr16(unsigned short *rnd_number);
void display_time(unsigned int time);

// Declaración de la función main
void main(void) {
	// Se pone GP0, GP1, GP2, GP3 y GP4 como salidas
	// Se pone GP5 como entrada ya que se trata del
	TRISIO = 0b00100000;

	// Se desactivan todos los pines
	GPIO = 0b00000000;

	// Con time = 1000 es aprox 1 segundo de delay en simulador
	unsigned int time = 2000;
	unsigned short rnd_number = 1;
	unsigned short *ptr_rnd = &rnd_number;
	unsigned short dice_number = 0;

	while (1)
	{
		// Si el botón es presionado
		if (GP5) {
			switch (dice_number) {
			// Se representan que pines se activan segun el numero en la cara del dado.
			// Se espera un cierto tiempo
			// Se pone en bajo el o los pines encendidos
			case 1: //#1
				GPIO = 0b00000010;
				display_time(time);
				GPIO = 0b00000000;
				break;
			case 2: //#2
				GPIO = 0b00000001;
				display_time(time);
				GPIO = 0b00000000;
				break;
			case 3: //#3
				GPIO = 0b00000011;
				display_time(time);
				GPIO = 0b00000000;
				break;
			case 4: //#4
				GPIO = 0b00010001;
				display_time(time);
				GPIO = 0b00000000;
				break;
			case 5: //#5
				GPIO = 0b00010110;
				display_time(time);
				GPIO = 0b00000000;
				break;
			case 6: //#6
				GPIO = 0b00011001;
				display_time(time);
				GPIO = 0b00000000;
				break;
			default:
				break;
			}
		}
		else {
			// Se desactivan todos los pines
			GPIO = 0b00000000;
			// Número aleatorio
			lfsr16(ptr_rnd);
			// Se ajusta el número aleatorio a un valor entre 1 y 6
			dice_number = 1 + (rnd_number % 6);
		}
	}
}

void lfsr16(unsigned short *rnd_number) {
	// Se pregunta si el último bit es 1
	if ((*rnd_number) & 1) {
		// Se desplaza el número un bit a la derecha
		(*rnd_number) >>= 1;
		// Se hace un XOR del número con la máscara y
		// se actualiza a sí mismo
		(*rnd_number) ^= (1<<15) + (1<<14) + (1<<12) + (1<<3);
	}
	else {
		// Se desplaza el número un bit a la derecha
		(*rnd_number) >>= 1;
	}
}

void display_time(unsigned int time) {
	unsigned int i, j;
	for (i = 0; i < time; i++) {
		for (j = 0; j < 256; j++);
	}
}