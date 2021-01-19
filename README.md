Docker build for Apache TrafficServer (ATS)
================================

This repository provides Dockerfile for [Apache TrafficServer][0] 

### Status
- Debian: wheezy
- TrafficServer: 8.1.1

Built images are uploaded to [index.docker.io][1]

### Usage:

 - Install Docker: [http://docs.docker.io/][2]
 - Execute
 `docker run -d --name TrafficServer -p 8080:8080 shaker/trafficserver`
 - Browse [http://&lt;your server ip address&gt;:8080/][3]
 - Stop and start again
   - `docker stop TrafficServer`
   - `docker start TrafficServer`

### Configuration:

This build comes with the standard configuration as provided by TrafficServer, configuration are under the following path: `/etc/trafficserver`

You can use docker volumes mount feature to run TrafficServer with your specific configuration, for example:

`docker run -d --name TrafficServer -p 8080:8080 /MY-CONFIGS/trafficserver/:/etc/trafficserver/ shaker/trafficserver`

You need to change `/MY-CONFIGS/trafficserver/` to your configuration path.

  [0]: http://trafficserver.apache.org/
  [1]: https://index.docker.io/u/shaker/
  [2]: http://docs.docker.io/en/latest/ "docs.docker.io"
  [3]: http://127.0.0.1:8080/
