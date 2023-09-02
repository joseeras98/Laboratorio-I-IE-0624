;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"dado.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__gptrget2
	extern	__gptrput2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_lfsr16
	global	_display_time

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_dado_0	udata
r0x1014	res	1
r0x1013	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x100C	res	1
r0x100B	res	1
r0x100A	res	1
r0x100E	res	1
r0x100D	res	1
r0x1010	res	1
r0x100F	res	1
r0x1011	res	1
r0x1012	res	1
r0x1003	res	1
r0x1002	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
_main_rnd_number_65537_5	res	2
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_dado	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _display_time
;   _display_time
;   _display_time
;   _display_time
;   _display_time
;   _display_time
;   _lfsr16
;   __moduint
;   _display_time
;   _display_time
;   _display_time
;   _display_time
;   _display_time
;   _display_time
;   _lfsr16
;   __moduint
;10 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   STK00
;   STK01
;   r0x1019
;   STK02
;; Starting pCode block
S_dado__main	code
_main:
; 2 exit points
;	.line	14; "dado.c"	TRISIO = 0b00100000;
	MOVLW	0x20
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	17; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	21; "dado.c"	unsigned short rnd_number = 1;
	MOVLW	0x01
	BANKSEL	_main_rnd_number_65537_5
	MOVWF	_main_rnd_number_65537_5
	CLRF	(_main_rnd_number_65537_5 + 1)
;	.line	22; "dado.c"	unsigned short *ptr_rnd = &rnd_number;
	MOVLW	high (_main_rnd_number_65537_5 + 0)
	BANKSEL	r0x1013
	MOVWF	r0x1013
	MOVLW	(_main_rnd_number_65537_5 + 0)
	MOVWF	r0x1014
	CLRF	r0x1015
;	.line	23; "dado.c"	unsigned short dice_number = 0;
	CLRF	r0x1016
	CLRF	r0x1017
_00117_DS_:
;	.line	28; "dado.c"	if (GP5) {
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00114_DS_
;;unsigned compare: left < lit(0x1=1), size=2
;	.line	29; "dado.c"	switch (dice_number) {
	MOVLW	0x00
	BANKSEL	r0x1017
	SUBWF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00137_DS_
	MOVLW	0x01
	SUBWF	r0x1016,W
_00137_DS_:
	BTFSS	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7ffc88610d40
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x7=7), size=2
	MOVLW	0x00
	BANKSEL	r0x1017
	SUBWF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00138_DS_
	MOVLW	0x07
	SUBWF	r0x1016,W
_00138_DS_:
	BTFSC	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7ffc88610d40
	BANKSEL	r0x1016
	DECF	r0x1016,W
	MOVWF	r0x1018
	MOVLW	HIGH(_00139_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00139_DS_
	BANKSEL	r0x1018
	ADDWF	r0x1018,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00139_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
_00105_DS_:
;	.line	34; "dado.c"	GPIO = 0b00000010;
	MOVLW	0x02
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	35; "dado.c"	display_time(time);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_display_time
	CALL	_display_time
	PAGESEL	$
;	.line	36; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	37; "dado.c"	break;
	GOTO	_00117_DS_
_00106_DS_:
;	.line	39; "dado.c"	GPIO = 0b00000001;
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	40; "dado.c"	display_time(time);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_display_time
	CALL	_display_time
	PAGESEL	$
;	.line	41; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	42; "dado.c"	break;
	GOTO	_00117_DS_
_00107_DS_:
;	.line	44; "dado.c"	GPIO = 0b00000011;
	MOVLW	0x03
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	45; "dado.c"	display_time(time);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_display_time
	CALL	_display_time
	PAGESEL	$
;	.line	46; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	47; "dado.c"	break;
	GOTO	_00117_DS_
_00108_DS_:
;	.line	49; "dado.c"	GPIO = 0b00010001;
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	50; "dado.c"	display_time(time);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_display_time
	CALL	_display_time
	PAGESEL	$
;	.line	51; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	52; "dado.c"	break;
	GOTO	_00117_DS_
_00109_DS_:
;	.line	54; "dado.c"	GPIO = 0b00010110;
	MOVLW	0x16
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	55; "dado.c"	display_time(time);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_display_time
	CALL	_display_time
	PAGESEL	$
;	.line	56; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	57; "dado.c"	break;
	GOTO	_00117_DS_
_00110_DS_:
;	.line	59; "dado.c"	GPIO = 0b00011001;
	MOVLW	0x19
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	60; "dado.c"	display_time(time);
	MOVLW	0xd0
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_display_time
	CALL	_display_time
	PAGESEL	$
;	.line	61; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	62; "dado.c"	break;
	GOTO	_00117_DS_
_00114_DS_:
;	.line	69; "dado.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	71; "dado.c"	lfsr16(ptr_rnd);
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	STK01
	MOVF	r0x1013,W
	MOVWF	STK00
	MOVF	r0x1015,W
	PAGESEL	_lfsr16
	CALL	_lfsr16
	PAGESEL	$
;	.line	73; "dado.c"	dice_number = 1 + (rnd_number % 6);
	BANKSEL	_main_rnd_number_65537_5
	MOVF	_main_rnd_number_65537_5,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_main_rnd_number_65537_5
	MOVF	(_main_rnd_number_65537_5 + 1),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0x06
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
	MOVF	r0x1018,W
	MOVWF	r0x1016
	MOVF	r0x1019,W
	MOVWF	r0x1017
	GOTO	_00117_DS_
;	.line	76; "dado.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;; Starting pCode block
S_dado__display_time	code
_display_time:
; 2 exit points
;	.line	93; "dado.c"	void display_time(unsigned int time) {
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
;	.line	95; "dado.c"	for (i = 0; i < time; i++) {
	CLRF	r0x1004
	CLRF	r0x1005
_00158_DS_:
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	SUBWF	r0x1005,W
	BTFSS	STATUS,2
	GOTO	_00179_DS_
	MOVF	r0x1003,W
	SUBWF	r0x1004,W
_00179_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3307: created from rifx:0x7ffc88610d40
;	.line	96; "dado.c"	for (j = 0; j < 256; j++);
	BANKSEL	r0x1006
	CLRF	r0x1006
	MOVLW	0x01
	MOVWF	r0x1007
_00156_DS_:
	MOVLW	0xff
	BANKSEL	r0x1006
	ADDWF	r0x1006,W
	MOVWF	r0x1008
	MOVLW	0xff
	MOVWF	r0x1009
	MOVF	r0x1007,W
	BTFSC	STATUS,0
	INCFSZ	r0x1007,W
	ADDWF	r0x1009,F
	MOVF	r0x1008,W
	MOVWF	r0x1006
	MOVF	r0x1009,W
	MOVWF	r0x1007
	MOVF	r0x1009,W
	IORWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	95; "dado.c"	for (i = 0; i < time; i++) {
	INCF	r0x1004,F
	BTFSC	STATUS,2
	INCF	r0x1005,F
	GOTO	_00158_DS_
_00160_DS_:
;	.line	98; "dado.c"	}
	RETURN	
; exit point of _display_time

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;13 compiler assigned registers:
;   r0x100A
;   STK00
;   r0x100B
;   STK01
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   STK02
;   STK03
;   r0x1011
;   r0x1012
;; Starting pCode block
S_dado__lfsr16	code
_lfsr16:
; 2 exit points
;	.line	78; "dado.c"	void lfsr16(unsigned short *rnd_number) {
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x100B
	MOVF	STK01,W
;	.line	80; "dado.c"	if ((*rnd_number) & 1) {
	MOVWF	r0x100C
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	BTFSS	r0x100E,0
	GOTO	_00145_DS_
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
;	.line	82; "dado.c"	(*rnd_number) >>= 1;
	BCF	STATUS,0
	RRF	r0x100D,W
	MOVWF	r0x100F
	RRF	r0x100E,W
	MOVWF	r0x1010
	MOVF	r0x100F,W
	MOVWF	STK02
	MOVF	r0x1010,W
	MOVWF	STK03
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
;	.line	85; "dado.c"	(*rnd_number) ^= (1<<15) + (1<<14) + (1<<12) + (1<<3);
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	MOVWF	r0x1011
	MOVF	r0x100F,W
	MOVWF	r0x1012
	MOVLW	0x08
	XORWF	r0x1011,W
	MOVWF	r0x1011
	MOVWF	r0x1010
	MOVLW	0xd0
	XORWF	r0x1012,W
	MOVWF	r0x100F
	MOVWF	r0x1012
	MOVWF	STK02
	MOVF	r0x1011,W
	MOVWF	STK03
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
	GOTO	_00147_DS_
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
_00145_DS_:
;	.line	89; "dado.c"	(*rnd_number) >>= 1;
	BCF	STATUS,0
	BANKSEL	r0x100D
	RRF	r0x100D,W
	MOVWF	r0x100F
	RRF	r0x100E,W
	MOVWF	r0x1010
	MOVF	r0x100F,W
	MOVWF	STK02
	MOVF	r0x1010,W
	MOVWF	STK03
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
_00147_DS_:
;	.line	91; "dado.c"	}
	RETURN	
; exit point of _lfsr16


;	code size estimation:
;	  232+   62 =   294 instructions (  712 byte)

	end
