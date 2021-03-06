FROM ubuntu:20.04 AS android-ndk

RUN apt-get update && apt-get install -y \
    wget \
    unzip

ARG NDK_VERSION=r22b
RUN wget -q -nv https://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-linux-x86_64.zip
RUN unzip -qq android-ndk-${NDK_VERSION}-linux-x86_64.zip
RUN rm android-ndk-${NDK_VERSION}-linux-x86_64.zip
ENV NDK_VERSION=${NDK_VERSION}
RUN mv /android-ndk-${NDK_VERSION} /android-ndk
ENV ANDROID_NDK=/android-ndk
RUN echo "export ANDROID_NDK=${ANDROID_NDK}" >> /etc/profile