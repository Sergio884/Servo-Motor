	.include "m8535def.inc"
	.def aux = r16
	.macro pulso
	sbi porta,0
	ldi aux,@0
loop1:
	rcall delay
	dec aux
	brne loop1
	cbi porta,0
	ldi aux,@1
loop2:
	rcall delay
	dec aux
	brne loop2
	rjmp otro
	.endm
main:
	ldi aux,low(ramend)
	out spl,aux
	ldi aux,high(ramend)
	out sph,aux
	ser aux
	out ddra,aux
	out portd,aux    
otro:
	sbis pind,0
	rjmp cero
	sbis pind,1
	rjmp uno
	sbis pind,2
	rjmp dos
	sbis pind,3
	rjmp tres
	sbis pind,4
	rjmp cuatro
	sbis pind,5
	rjmp cinco
	sbis pind,6
	rjmp seis
	sbis pind,7
	rjmp siete
	rjmp otro
cero:
	pulso 8,38
uno:
	pulso 9,38
dos:
	pulso 10,37
tres:
	pulso 11,37
cuatro:
	pulso 12,37
cinco:
	pulso 13,37
seis:
	pulso 14,36
siete:
	pulso 15,36
delay:
; ============================= 
; ----------------------------- 
; warte 123 Zyklen:
          ldi  R17, $29
WGLOOP0:  dec  R17
          brne WGLOOP0
; ----------------------------- 
; warte 2 Zyklen:
          nop
          nop
; ============================= 
	ret
