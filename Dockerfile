# https://github.com/lambci/docker-lambda#documentation
FROM lambci/lambda:build-provided.al2

ENV RUST_VERSION=1.50.0
ENV CARGO_HOME=/cargo
ENV RUSTUP_HOME=/rustup
RUN yum install -y jq
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
 | sh -s -- -y --profile minimal --default-toolchain $RUST_VERSION
ADD build.sh /usr/local/bin/
VOLUME ["/code"]
WORKDIR /code
ENTRYPOINT ["/usr/local/bin/build.sh"]
