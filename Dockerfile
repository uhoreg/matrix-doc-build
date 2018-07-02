# Docker image to build the Matrix spec
# run as:
# docker run --rm -v [full-path-to-spec-dir]:/spec -u [your-userid] matrix-doc-build

FROM debian
MAINTAINER Hubert Chathi <hubert@uhoreg.ca>

COPY requirements.txt /tmp
RUN apt-get update \
 && apt-get install -y python-virtualenv git \
 && virtualenv /env && /env/bin/pip install -r /tmp/requirements.txt \
 && rm /tmp/requirements.txt \
 && mkdir /spec

WORKDIR /spec
CMD ["/bin/bash", "-c", "source /env/bin/activate && scripts/gendoc.py"]
