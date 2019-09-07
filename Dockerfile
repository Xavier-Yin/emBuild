From ubuntu:18.04

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends wget libx11-6 libfreetype6 libxrender1 libfontconfig1 libxext6 && \
    mkdir -p /_tmp && \
    cd /_tmp && \
    wget --no-check-certificate -qO SES https://www.segger.com/downloads/embedded-studio/EmbeddedStudio_ARM_Linux_x64 && \
    tar xvf SES && \
    printf 'yes\n' | DISPLAY=:1 $(find arm_segger_* -name "install_segger*") --copy-files-to /ses && \
    cd / && \
    rm -rf /_tmp && \
    apt-get -qq remove -y wget && \
    apt-get -qq autoremove --purge && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*
    
ENV PATH="/ses/bin:$PATH"
    
CMD ["emBuild"]
