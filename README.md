# jupyter-multi
Jupyter notebook with multiple kernel support

## List of kernel
* Python3
* [SoS (Plugin for multi-lenguage into one Notebook)](https://vatlab.github.io/sos-docs/)
* [Java](https://github.com/SpencerPark/IJava)
* [Ruby](https://github.com/sciruby/iruby)
 
## Docker Image
[jupyter-multi](https://hub.docker.com/r/singhiqbal1007/jupyter-multi)

## Running in docker

```
$ docker run -p 8888:8888 --volume='/path/of/notebooks:/server/notebook' jupyter-multi:latest
```
