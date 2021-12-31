FROM ubuntu:20.04

WORKDIR /server

# install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y curl

# Install python
RUN apt-get update && apt-get install -y python3-dev python3
RUN apt-get update && apt-get install -y python3-pip

# Install Java
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Install Ruby
RUN apt-get update && apt-get install -y libtool libffi-dev ruby ruby-dev make
RUN apt-get update && apt-get install -y libzmq3-dev libczmq-dev

# Install jupyter and python dependency
RUN pip3 install jupyter \
                rise \
                jupyter_nbextensions_configurator \
                jupyter_contrib_nbextensions \
                sos \
                sos-notebook

# Configure jupyter plugin for install extension
RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user

# Configure sos (for multi languages in single notebook)
RUN python3 -m sos_notebook.install

# Configure iJava (Java kernel)
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip
RUN unzip ijava-kernel.zip -d ijava-kernel \
  && cd ijava-kernel \
  && python3 install.py --sys-prefix

# Configure iRuby (Ruby Kernel)
RUN gem install cztop
RUN gem install iruby --pre
RUN iruby register --force


WORKDIR /server/notebook
CMD jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token=''
