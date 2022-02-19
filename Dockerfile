# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
WORKDIR /app
COPY pdm.lock pyproject.toml .
RUN pip3 install pdm && pdm install
COPY . .
ENV PYTHONPATH __pypackages__/3.8/lib
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]
