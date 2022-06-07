CC = gcc
CFLAGS = -ansi -pedantic-errors -Wall -fstack-protector-all -Werror

all: application.x main.x tester.x

application.x: application.o test-equal.o
	${CC} application.o test-equal.o -o application.x

main.x: main.o init.o test-equal.o
	${CC} main.o init.o test-equal.o -o main.x

tester.x: tester.o init.o increment.o add-elements.o
	${CC} tester.o init.o increment.o add-elements.o -o tester.x

application.o: application.c test-equal.h
	${CC} ${CFLAGS}	-c application.c

main.o: main.c init.h test-equal.h
	${CC} ${CFLAGS}	-c main.c

tester.o: tester.c init.h increment.h add-elements.h
	${CC} ${CFLAGS} -c tester.c

add-elements.o: add-elements.c add-elements.h
	${CC} ${CFLAGS} -c add-elements.c

test-equal.o: test-equal.c test-equal.h
	${CC} ${CFLAGS} -c test-equal.c

increment.o: increment.c increment.h
	${CC} ${CFLAGS} -c increment.c

init.o: init.c init.h
	${CC} ${CFLAGS} -c init.c

clean:
	rm application.x main.x tester.x *.o
