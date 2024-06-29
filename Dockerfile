FROM python:3.10
ENV VENV_PATH="/venv"
ENV PATH="$VENV_PATH/bin:$PATH"
ENV PASSWORD=saf3532jj35oip23532ljfklj23jl324jk234jk234230ojfsjd;flwerwer45we56rw5erew
WORKDIR /app
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get upgrade -y && \
    apt-get install ffmpeg tesseract-ocr -y && \
    apt-get autoclean
RUN pip install --upgrade poetry
RUN python -m venv /venv
COPY . .
RUN poetry build && \
    /venv/bin/pip install --upgrade pip wheel setuptools &&\
    /venv/bin/pip install dist/*.whl
EXPOSE 80
CMD tgcf-web
