#!/bin/bash
# Makefile for biathlon project

# makes virtual environment and dependencies, you can run the project with make run
all:
	if [ ! -d "venv" ]; then \
		make env; \
	fi 
	make deps; \
	make run; \

# runs application
run:
	source venv/bin/activate; \
	python src/biathlon_main.py; \

# sets up virtual environment
env:
	if [ ! -d "venv" ]; then \
		pip3 install virtualenv; \
		python3 -m venv venv; \
		source venv/bin/activate; \
	fi

# installs all dependencies
deps: 
	source venv/bin/activate; \
	pip install PyQt5; \
	pip install pyqtgraph; \
	pip install paramiko; \
	pip install pyobjc; \
	pip install opencv-python; \
	pip install pyinstaller==3.3.1; \

# installs all dependencies and then makes the single executable app, make sure you have activated the virtual environment first
# Note that this is not currently functional and needs work.
app:
	make deps; \
	pyinstaller src/biathlon_main.py --windowed; \

# removes everything except the virtual environment and code source files
clean:
	rm -rf stored_data
	rm -rf src/__pycache__
	rm -f demo_simple.log
	rm -rf build
	rm -rf dist
	rm -f src/*.pyc
	rm -f biathlon_main.spec
	rm -rf .eggs

# removes everything except the code source files
scrub:
	make clean
	rm -rf venv

	

