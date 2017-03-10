#FROM ubuntu:xenial
FROM ubuntu:trusty

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        bundler \
        curl \
        git-core \
        libxml2-dev \
        libxslt1-dev \
        ruby \
        ruby-dev \
        zlib1g-dev \
    && apt-get clean

WORKDIR /puppet-docker

ADD . /puppet-docker

# Need to set this specific version. Otherwise, bundle installs
# a newer version, and for some reason it doesn't work...
#RUN gem install rake -v '10.5.0'

#RUN PUPPET_GEM_VERSION="~> 4.0" bundle install --verbose
RUN bundle install --verbose --full-index --without development system_tests
