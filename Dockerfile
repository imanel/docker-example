FROM ubuntu
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ruby ruby-dev ruby-bundler postgresql-client-9.3 libpq-dev nodejs

ADD . /data

WORKDIR /data

RUN bundle install --deployment

CMD ["bundle", "exec", "rails", "server"]
