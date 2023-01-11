FROM eddelbuettel/r2u:20.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
RUN install.r \
    shiny \
    jsonlite \
    ggplot2 \
    htmltools \
    remotes \
    renv \
    knitr \
    rmarkdown \
    quarto \
    DT
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN python3 -m pip install -U pip \
  && python3 -m pip install jupyter \
  && python3 -m pip install matplotlib
EXPOSE 8080
CMD ["bash"]
