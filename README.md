# docker-osrm
Open Source Routing Machine (OSRM) Docker Image [\[Docker Hub\]](https://hub.docker.com/r/mudimages/docker-osrm/)

## Installation

1. Install [Docker](https://www.docker.com/)

2. Manual deploy (optional):
*Pull automated build from Docker Hub
```docker pull mudimages/docker-osrm```
*or build from GitHub
```$ docker build -t="mudimages/docker-osrm" github.com/mudimages/docker-osrm```
*or you can clone & build :)
```
$ git clone https://github.com/mudimages/docker-osrm.git
$ docker build -t="mudimages/docker-osrm" docker-osrm/
```

## Usage
Run it:
```docker run -d -p 5000:5000 mudimages/docker-osrm:latest label "http://your/path/to/data.osm.pbf"```
Explanation:
```-d -> Run container in background and print container ID```
```-p 5000:5000 -> Publish a container port to host```
```label -> Your label of OSM data```
```url -> Link to OSM data in PBF format```

For example:
```docker run -d -p 5000:5000 mudimages/docker-osrm:latest California "http://download.geofabrik.de/north-america/us/california-latest.osm.pbf"```
