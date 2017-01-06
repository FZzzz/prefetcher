CC = gcc
CFLAGS_common = --std gnu99 -O0 -Wall
CFLAGS_sse = -msse2
CFLAGS_avx = -mavx2
EXEC = native_transpose sse_transpose sse_prefetch_transpose avx_transpose avx_prefetch_transpose

GIT_HOOKS := .git/hooks/pre-commit


all: native_transpose sse_transpose sse_prefetch_transpose avx_transpose avx_prefetch_transpose


#	$(CC) $(CFLAGS_common) $(CFLAGS_orig) \
#		-DIMPL="\"$@.h\"" -o $@ \
#		$(SRCS_common) $@.c
native_transpose:
#	$(GIT_HOOKS) main.c
	$(CC) $(CFLAGS_common) -DIMPL="\"$@.h\"" -o $@ main.c
	echo $@
sse_transpose:
#	$(GIT_HOOKS) main.c
	$(CC) $(CFLAGS_common) $(CFLAGS_sse) -DIMPL="\"$@.h\"" -o $@ main.c
sse_prefetch_transpose:
#	$(GIT_HOOKS) main.c
	$(CC) $(CFLAGS_common) $(CFLAGS_sse) -DIMPL="\"$@.h\"" -o $@ main.c

avx_transpose: 
#	$(GIT_HOOKS) main.c
	$(CC) $(CFLAGS_common) $(CFLAGS_avx) -DIMPL="\"$@.h\"" -o $@ main.c

avx_prefetch_transpose:
#	$(GIT_HOOKS) main.c
	$(CC) $(CFLAGS_common) $(CFLAGS_sse) $(CFLAGS_avx) -DIMPL="\"$@.h\"" -o $@ main.c -DPFDIST=64


$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo
exec: all
	./native_transpose
	./sse_transpose
	./sse_prefetch_transpose
	./avx_transpose
	./avx_prefetch_transpose


clean:
	$(RM) $(EXEC)
