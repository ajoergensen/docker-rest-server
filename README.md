rest-server
======================

#### Environment

`PUID`: User to run the rest-server process as. Default is 911.
`PGID`: Group to run the rest-server process as. Default is 911.
`OPTIONS`: Parameters to pass to the rest-server process
`DATA_DIRECTORY`: Where to store the data. Default `/data/`
`DISABLE_AUTHENTICATION`: Disable http authentication. NOT RECOMMENDED.
`PASSWORD_FILE`: htpasswd file to use for authentication. Default is `$DATA_DIRECTORY/.htpasswd`

#### Usage

#### Start

`docker pull ajoergensen/rest-server`

`docker run --name rest-server -e -p 8000:8000 -d -v ./data:/data --rm ajoergensen/rest-server`

##### Add/Remove users

`docker exec -it rest-server create_user <username>`

`docker exec -it rest-server delete_user <username>`

##### TLS

From the documentation

> By default the server uses HTTP protocol. This is not very secure since with Basic Authentication, username and passwords will travel in cleartext in every request. In order to enable TLS support just add the `-tls` argument and add a private and public key at the root of your persistence directory. You may also specify private and public keys by `--tls-cert` and `--tls-key`

### Persistent data

(Backup) data is stored in /data (or `$DATA_DIRECTORY` if set).
