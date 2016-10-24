//Sum_app

$ADR 0000h;
MVI A,3;
LXI B, 0B00h;
STAX B;
MVI A,7;
LXI B, 0B01h;
STAX B;
LXI B, 0B00h;
LDAX B;
MOV D,A;
LXI B, 0B01h;
LDAX B;
ADD D;
LXI B, 0B02h;
STAX B;

//Comparison_app

$ADR 0000h;
MVI A,10;
LXI B, 0B00h;
STAX B;
MVI A,7;
LXI B, 0B01h;
STAX B;

LXI B, 0B00h;
LDAX B;
MOV D,A;

LXI B, 0B01h;
LDAX B;

SUB D;
JM TWO;

ONE: LXI B, 0B01h;
LDAX B;
MOV B,A;

JMP END;
TWO: MOV B,D;

END: ;

//Comparison_app_2

$ADR 0000h;

MVI A, 0h;
OUT 30h;

IN 20h;
MOV D,A;

IN 25h;
MOV E,A;

SUB D;

JZ THREE;

JM TWO;

ONE: INR E;
MOV A,E;
OUT 30h;

JMP END;

TWO: INR D;
MOV A,D;
OUT 30h;

THREE: MVI A, 0FFh;
OUT 30h;
END: ;

//Lights_app

$ADR 0000h;

MVI A, 0h;
OUT 30h;

IN 20h;
MOV D,A;

ANI 1000b;

JZ ONE;
JMP END;

ONE: MOV A,D;
ANI 100000b;
JZ END;

MVI A, 0FFh;
OUT 30h;

END: ;