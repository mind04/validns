OPTIMIZE=-O2 -g
CFLAGS=-Wall
INCPATH=-I/usr/local/include

validns: main.o carp.o mempool.o textparse.o rr.o soa.o
	cc $(CFLAGS) $(OPTIMIZE) -o validns \
	    main.o carp.o mempool.o textparse.o \
	    rr.o soa.o \
	    -L/usr/local/lib -lJudy

clean:
	-rm validns main.o carp.o mempool.o textparse.o
	-rm rr.o soa.o
	-rm validns.core
	@echo ':-)'

main.o: main.c
	cc $(CFLAGS) $(OPTIMIZE) -c -o main.o main.c $(INCPATH)

carp.o: carp.c
	cc $(CFLAGS) $(OPTIMIZE) -c -o carp.o carp.c $(INCPATH)

mempool.o: mempool.c
	cc $(CFLAGS) $(OPTIMIZE) -c -o mempool.o mempool.c $(INCPATH)

textparse.o: textparse.c
	cc $(CFLAGS) $(OPTIMIZE) -c -o textparse.o textparse.c $(INCPATH)

rr.o: rr.c
	cc $(CFLAGS) $(OPTIMIZE) -c -o rr.o rr.c $(INCPATH)

soa.o: soa.c
	cc $(CFLAGS) $(OPTIMIZE) -c -o soa.o soa.c $(INCPATH)

main.c: common.h carp.h mempool.h rr.h

rr.c: common.h carp.h mempool.h rr.h

soa.c: common.h carp.h mempool.h rr.h

carp.c: carp.h common.h

mempool.c: mempool.h carp.h

textparse.c: common.h

base64.c: base64.h

common.h: textparse.h carp.h mempool.h

test:
	cc -Wall -O2 -o base64-test base64.c -DTEST_PROGRAM
	./base64-test
