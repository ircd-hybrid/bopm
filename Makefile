CFLAGS= -Wall -g -O3
CC= gcc

ifdef DEBUG_GCOV
CFLAGS += -fprofile-arcs -ftest-coverage -fbranch-probabilities
LFLAGS += -fprofile-arcs -ftest-coverage -fbranch-probabilities
endif

ifdef DEBUG_GDB
CFLAGS += -ggdb
LFLAGS += -ggdb
endif

ifdef DEBUG_GPROF
CFLAGS += -pg
LFLAGS += -pg
endif

objects = config.o dnsbl.o irc.o log.o main.o misc.o opercmd.o scan.o \
          stats.o

checker_obj = bopchecker.o config.o misc.o scan.o

all: bopm bopchecker
	rm -f *.da

config.o:  config.h                        log.h
dnsbl.o:            dnsbl.h extern.h irc.h log.h        opercmd.h scan.h
irc.o:     config.h dnsbl.h extern.h irc.h log.h        opercmd.h scan.h
log.o:                      extern.h       log.h
main.o:                     extern.h irc.h log.h        opercmd.h scan.h stats.h
misc.o:                     extern.h             misc.h
opercmd.o:                  extern.h irc.h log.h misc.h opercmd.h scan.h
scan.o:    config.h dnsbl.h extern.h irc.h log.h        opercmd.h scan.h stats.h
stats.o:                    extern.h irc.h       misc.h                  stats.h

bopchecker.o: bopchecker.h config.h irc.h options.h scan.h

bopm: $(objects)
	$(CC) $(LFLAGS) -o bopm $(objects)

bopchecker: $(checker_obj)
	$(CC) $(LFLAGS) -o bopchecker $(checker_obj)

.PHONY: clean
clean: 
	rm -f *.o *.da bopm bopchecker

