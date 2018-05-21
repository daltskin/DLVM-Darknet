FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04


RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y \
    git \
    wget \
    unzip \
    libopencv-dev \
    vim

#RUN git clone https://github.com/pjreddie/darknet.git 
#RUN git clone https://github.com/AlexeyAB/darknet.git

# Fork of AlexeyAB includes compile fix for opencv/highui.hpp
RUN git clone https://github.com/daltskin/darknet.git
#RUN git clone https://github.com/ryubidragonfire/mydarknet.git darknet

WORKDIR /darknet
RUN sed -i "s/OPENCV=0/OPENCV=1/g" Makefile \
    && sed -i 's/GPU=0/GPU=1/g' Makefile \
    && sed -i 's/CUDNN=0/CUDNN=1/g' Makefile \
    && sed -i 's/LIBSO=0/LIBSO=1/g' Makefile \
    && sed -i 's/DEBUG=1/DEBUG=0/g' Makefile
RUN make
