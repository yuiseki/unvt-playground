FROM ubuntu:22.04

RUN apt-get update && apt-get install -y nano vim emacs git curl wget

# install sudo
RUN apt-get install -y sudo

# install git
RUN apt-get install -y git

# install gnupg and ca-certificates
RUN apt-get install -y gnupg ca-certificates

# install curl, wget and rsync
RUN apt-get install -y curl wget rsync

# install zip, unzip, gzip and zlib1g-dev
RUN apt-get install -y zip unzip gzip zlib1g-dev

# install editors
RUN apt-get install -y nano vim emacs

# install screen, tmux, htop, parallel
RUN apt-get install -y screen tmux htop parallel tree

# install jq
RUN apt-get install -y jq

# install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get update && apt-get install -y nodejs

# install VSCode code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --install-extension MS-CEINTL.vscode-language-pack-ja

#
# advanced dependencies
#
# install python3 and python-is-python3
RUN apt-get install -y python3 python-is-python3

# install sqlite3 and libsqlite3-dev
RUN apt-get install -y sqlite3 libsqlite3-dev

# install build-essential and related packages
RUN apt-get install -y build-essential autoconf automake gcc g++ make cmake

# install gis related packages
RUN apt-get install -y gdal-bin pdal
RUN apt-get install -y libgeos-dev libproj-dev libgdal-dev

RUN useradd -m user
RUN echo user ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user
USER user

WORKDIR /home/user