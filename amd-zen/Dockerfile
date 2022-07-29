ARG LTS=22.04
FROM ubuntu:${LTS} AS Base
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl wget ca-certificates && \
    apt-get install -y --no-install-recommends g++ gcc gfortran git make && \
    apt-get remove --purge -y
WORKDIR /src
ARG OPENBLAS_VERSION=0.3.9
ENV OPENBLAS_VERSION=${OPENBLAS_VERSION}
RUN wget "https://github.com/xianyi/OpenBLAS/archive/v${OPENBLAS_VERSION}.tar.gz" && \
    tar zxvf v${OPENBLAS_VERSION}.tar.gz && rm v${OPENBLAS_VERSION}.tar.gz
WORKDIR /src/OpenBLAS-${OPENBLAS_VERSION}
RUN make clean && \
    make TARGET=ZEN DYNAMIC_ARCH=1 DYNAMIC_OLDER=1 USE_THREAD=0 USE_OPENMP=0 FC=gfortran CC=gcc COMMON_OPT="-O3 -g -fPIC" FCOMMON_OPT="-O3 -g -fPIC -frecursive" NMAX="NUM_THREADS=128" LIBPREFIX="libopenblas" NO_LAPACKE=1 NO_LAPACKE=1 INTERFACE64=0 NO_STATIC=1
RUN make PREFIX=/usr NO_STATIC=1 install

FROM scratch
ARG OPENBLAS_VERSION=0.3.9
ENV OPENBLAS_VERSION=${OPENBLAS_VERSION}
COPY --from=Base /usr/lib/libopenblas-r${OPENBLAS_VERSION}.so /usr/lib/