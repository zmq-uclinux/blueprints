FROM debian:latest

RUN apt-get update && apt-get install -y \
    binfmt-support \
    debootstrap \
    fakeroot \
    lxc \
    make \
    qemu \
    qemu-user-static \
    ubuntu-archive-keyring \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ENV MARU_WORKSPACE /var/maru
ENV MARU_OUT ${MARU_WORKSPACE}/out
ENV MARU_TEMPLATES ${MARU_WORKSPACE}/lxc/templates

RUN mkdir -p ${MARU_WORKSPACE} && mkdir -p ${MARU_OUT}
WORKDIR ${MARU_WORKSPACE}
COPY . ${MARU_WORKSPACE}

CMD ./build.sh -t debian -n jessie
