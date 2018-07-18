# Docker image to build the Matrix spec
# run as:
# docker run --rm -v [full-path-to-spec-dir]:/spec -u [your-userid] matrix-doc-build

FROM debian
MAINTAINER Hubert Chathi <hubert@uhoreg.ca>

RUN apt-get update \
 && apt-get install -y virtualenv python3-virtualenv git \
 && virtualenv -p python3 /env \
 && mkdir /spec
COPY requirements.txt /tmp
RUN /env/bin/pip install -r /tmp/requirements.txt \
 && rm /tmp/requirements.txt

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

WORKDIR /spec
CMD ["/bin/bash", "-c", "source /env/bin/activate && scripts/gendoc.py"]
