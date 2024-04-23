
# Use an official lightweight Python image.
FROM python:3.9-slim

# Set environment variables to keep the python output unbuffered (outputs directly to the terminal)
# This ensures that the logs from the python application are not buffered, and we get them instantly.
# And also to not allow python to write .pyc files on the disk (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory to /app
WORKDIR /app

# Install any dependencies
# Assume there is a requirements.txt file in the current directory with the required packages.
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the codebase into the container
COPY . /app/

# By default, run the application
# Assume there is an app.py file in the current directory that starts the application.
CMD ["python", "app.py"]
