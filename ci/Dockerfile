FROM oursource/lambda-rust:latest

RUN curl https://musl.libc.org/releases/musl-latest.tar.gz -o musl-latest.tar.gz && \
    tar xvfz musl-latest.tar.gz && cd musl-* && ./configure --prefix=/usr && make -j $(nproc) install && cd .. && \
    . ~/.profile && \
    rustup component add clippy rustfmt && \
    rustup target add x86_64-unknown-linux-musl && \
    cargo install --force cargo-make && \
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh && \
    curl --silent --location https://rpm.nodesource.com/setup_current.x | bash - && \
    yum -y install nodejs && \
    npm install -g serverless && \
    cargo clippy --help && \
    cargo fmt --version
