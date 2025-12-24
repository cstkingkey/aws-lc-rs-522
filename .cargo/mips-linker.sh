#!/bin/bash

CRT_LIB_DIR="/usr/local/mips-linux-muslsf/lib"
CRT_GCC_DIR="/usr/local/lib/gcc/mips-linux-muslsf/9.2.0"

args=()
for arg in "$@"; do
  case "$arg" in
    "crt1.o")
      args+=("$CRT_LIB_DIR/crt1.o")
      ;;
    "crti.o")
      args+=("$CRT_LIB_DIR/crti.o")
      ;;
    "crtn.o")
      args+=("$CRT_LIB_DIR/crtn.o")
      ;;
    "crtbegin.o")
      args+=("$CRT_GCC_DIR/crtbegin.o")
      ;;
    "crtend.o")
      args+=("$CRT_GCC_DIR/crtend.o")
      ;;
    "crtbeginS.o")
      args+=("$CRT_GCC_DIR/crtbeginS.o")
      ;;
    "crtendS.o")
      args+=("$CRT_GCC_DIR/crtendS.o")
      ;;
    *)
      args+=("$arg")
      ;;
  esac
done

exec mips-linux-muslsf-gcc "${args[@]}"
