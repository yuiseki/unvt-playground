FROM ubuntu:24.04

RUN apt-get update -y

# install sudo
RUN apt-get install -y sudo

# install git
RUN apt-get install -y git

# install gnupg, ca-certificates and apt-transport-https
RUN apt-get install -y gnupg ca-certificates apt-transport-https

# install curl, wget and rsync
RUN apt-get install -y curl wget rsync

# install zip, unzip, gzip and zlib1g-dev
RUN apt-get install -y zip unzip gzip zlib1g-dev

# install editors
RUN apt-get install -y nano vim emacs sed jq

# install screen, tmux, htop, parallel and tree
RUN apt-get install -y screen tmux htop parallel tree

# install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get update && apt-get install -y nodejs

# install python3 and python-is-python3
RUN apt-get install -y python3 python-is-python3

# install VSCode code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --install-extension MS-CEINTL.vscode-language-pack-ja
RUN code-server --install-extension ms-vsliveshare.vsliveshare
RUN code-server --install-extension vscode-icons-team.vscode-icons
RUN code-server --install-extension ms-vscode.vscode-typescript-next
RUN code-server --install-extension rvest.vs-code-prettier-eslint
RUN code-server --install-extension streetsidesoftware.code-spell-checker
RUN code-server --install-extension oderwat.indent-rainbow
RUN code-server --install-extension mosapride.zenkaku
RUN code-server --install-extension GitHub.copilot
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension ms-python.vscode-pylance
RUN code-server --install-extension ms-toolsai.jupyter
RUN code-server --install-extension ms-toolsai.jupyter-keymap
RUN code-server --install-extension vscodevim.vim

#
# advanced dependencies
#
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
ENV SHELL=/bin/bash
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

WORKDIR /home/user
