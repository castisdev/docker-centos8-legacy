# Pull base image
FROM centos:8

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl-devel \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  valgrind \
  mariadb-devel \
  postgresql-server-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mariadb-connector-odbc \
  sysstat \
  psmisc \
  yum-utils \
  tbb-devel \
  gperftools-devel \
  iproute \
  net-tools; \
  yum -y clean all

RUN yum -y --enablerepo=PowerTools install boost-static; yum -y clean all

ADD install_xercesc280.sh /script/
RUN /script/install_xercesc280.sh

ADD install_cmake3170.sh /script/
RUN /script/install_cmake3170.sh

ADD install_cryptopp820.sh /script/
RUN /script/install_cryptopp820.sh

ADD install_googletest1100.sh /script/
RUN /script/install_googletest1100.sh

ADD install_python382.sh /script/
RUN /script/install_python382.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck190.sh /script/
RUN /script/install_cppcheck190.sh

ADD install_zsh58.sh /script/
RUN /script/install_zsh58.sh

ADD install_ninja1100.sh /script/
RUN /script/install_ninja1100.sh

ADD install_ffmpeg422.sh /script/
RUN /script/install_ffmpeg422.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD .bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["zsh"]
