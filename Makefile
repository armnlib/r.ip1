.SUFFIXES :

.SUFFIXES : .c .o

SHELL = /bin/sh

CPP = /lib/cpp

FFLAGS =

CFLAGS =

OPTIMIZ = -O 2
$(info OPTIMIZ is ${OPTIMIZ})

CPPFLAGS = 

VER = 5.3

LIBRMN = 

default: absolu

.ftn.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

.c.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(CFLAGS)" -src $<

.f.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

OBJET= r.ip1.o
OBJET2= r.ip.o

FICHIERS = $(FDECKS)

r.ip1: $(OBJET)
	s.compile -o r.ip1_$(VER)-$(BASE_ARCH) -obj $(OBJET) -bidon c -main r_ip1 -abi $(ABI) -librmn $(LIBRMN)
r.ip:  $(OBJET2)
	s.compile -o r.ip_$(VER)-$(BASE_ARCH) -obj $(OBJET2) -bidon c -main r_ip -abi $(ABI) -librmn $(LIBRMN)

absolu: r.ip1 r.ip

clean:
#Faire le grand menage. On enleve tous les fichiers sources\ninutiles et les .o 
	-if [ "*.ftn" != "`echo *.ftn`" ] ; \
	then \
	for i in *.ftn ; \
	do \
	fn=`r.basename $$i '.ftn'`; \
	rm -f $$fn.f; \
	done \
	fi
	rm *.o r.ip1_$(VER)-$(BASE_ARCH)
