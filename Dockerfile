FROM dawn001/z_mirror:latest
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
COPY . .

RUN apt-get update
RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt -y install curl
RUN apt-get -y install git
RUN git clone https://github.com/axiomatic-systems/Bento4.git && \
cd Bento4 &&\
apt-get -y install cmake && \
mkdir cmakebuild && \ 
cd cmakebuild/ && \
cmake -DCMAKE_BUILD_TYPE=Release .. &&\
make &&\ 
make install
RUN pip3 install -r requirements.txt
CMD python3 main.py

#!git clone https://github.com/axiomatic-systems/Bento4.git && cd Bento4 && apt-get -y install cmake && mkdir cmakebuild && cd cmakebuild/ && cmake -DCMAKE_BUILD_TYPE=Release .. && make && make install
