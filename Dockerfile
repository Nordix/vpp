ARG VPP_VERSION=v20.09
ARG SUSE_VERSION=15.2

FROM opensuse/leap:${SUSE_VERSION} as version
ARG VPP_VERSION
ENV VPP_VERSION ${VPP_VERSION}
CMD echo ${VPP_VERSION}

FROM opensuse/leap:${SUSE_VERSION} as vppbuild
ARG VPP_VERSION
RUN zypper install -y make sudo
COPY . .
RUN make install-dep
RUN make install-ext-deps
RUN make pkg-rpm
