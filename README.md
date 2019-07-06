# Concourse Worker Tile

Pivotal Operations Manager tile for Concourse external workers. Enables the automation of deploying bosh managed workers 
into the `infrastructure` network of a `PAS` or `PKS` deployment. 

Currently supports Concourse 4.2.4. 

```yaml
product-name: concourse-workers
product-properties:
  .properties.tsa_endpoint:
    value: ((tsa_hostname))
  .properties.tsa_host_key:
    value: ((tsa_host.public_key)
  .properties.tsa_port:
    value: 2222
  .properties.worker_key:
    value: ((worker.private_key))
  .properties.worker_tag:
    value: ((worker_tag))
network-properties:
  network:
    name: infrastructure
  other_availability_zones:
  - name: zone-1
  singleton_availability_zone:
    name: zone-1
resource-config:
  worker:
    instances: 2
    instance_type:
      id: automatic
    internet_connected: false
```
