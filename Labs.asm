//Sum_app
;Задание 1. Сложения чисел, записанных по адресам 0В00h и 0В01h, и записи результата по адресу 0В02 

$ADR 0000h;			;Адрес начала программы

					;Инициализация ячеек памяти значениями
					;при вводе значений в P_manef удали строки с 8-11
MVI A,3;			;Загрузка в аккумулятор 03h (3)
STA 0B00h;			;Запоминание содержимого аккумулятора в памяти по адресу 0B00h
MVI A,7;			;Загрузка в аккумулятор 07h (7)		
STA 0B01h;			;Запоминание содержимого аккумулятора в памяти по адресу 0B01h
					
					;Сложение
LDA 0B00h			;Передача содержимого памяти по адресу 0B00h в аккумулятор
MOV D,A				;Передача содержимого аккумулятора в регистр D
LDA 0B02h			;Передача содержимого памяти по адресу 0B02h в аккумулятор
ADD D				;Прибавление содержимого регистра D к содержимому в аккумуляторе и сохранение в аккумуляторе
STA 0B02h;			;Запоминание содержимого аккумулятора в памяти по адресу 0B02h

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
