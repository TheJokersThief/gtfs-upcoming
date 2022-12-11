FROM cimg/python:3.11.0

ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION="python"

WORKDIR /home/circleci/project
COPY pyproject.toml /home/circleci/project/pyproject.toml
COPY poetry.lock /home/circleci/project/poetry.lock
RUN poetry config virtualenvs.create false && poetry install --only main --no-root

ADD ./ /home/circleci/project/

CMD ["python", "main.py", "--config", "/config/config.ini", "--gtfs", "/config/google_transit_combined", "--env", "prod", "--port", "6824", "--promport", "8000"]
