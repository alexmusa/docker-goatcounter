# baethon/goatcounter

Unofficial Docker image for [goatcounter](https://github.com/zgoat/goatcounter) - simple web statistics

## How to use this image

```bash
docker run --name goatcounter \
  -e GOATCOUNTER_DOMAIN=stats.domain.com \
  -e GOATCOUNTER_EMAIL=admin@domain.com \
  baethon/goatcounter
```

This command will start a single instance with pre-configured `stats.domain.com` site.

`GOATCOUNTER_DOMAIN` and `GOATCOUNTER_EMAIL` are mandatory.

## Environment Variables

### `GOATCOUNTER_DOMAIN`

This mandatory environment variable is used to create the initial site.

### `GOATCOUNTER_EMAIL`

This mandatory environment variable defines the e-mail address of the admin user.  

It's used to create the initial site and is passed as an `-email-from` option to the `serve` command.

### `GOATCOUNTER_PASSWORD`

 Password to log in; will be asked interactively if omitted. It is mandatory to create the initial site if the container is running detached.

### `GOATCOUNTER_SMTP`

This optional environment variable defines the SMTP server (e.g., `smtp://user:pass@server.com:587`) which will be used by the server. 

_Default:_ `stdout` - print email contents to stdout

### `GOATCOUNTER_DB`

This optional environment variable defines the location of the database. By default, the server will use SQLite database which is recommended solution. 

It's possible to use the Postgres DB however, the image was not tested against it.  

Don't change this value unless you know what you're doing.

_Default:_ `sqlite:///goatcounter/db/goatconter.sqlite3`

### `GOATCOUNTER_LISTEN`

This optional environment variable defines the address to listen on.

_Default:_ `0.0.0.0:8080`

## Troubleshooting

### The server displays migration info

During startup, the container will try to execute all available migrations. What you see, is the output of `goatcounter migrate` command.

### line X: GOATCOUNTER_*: unbound variable

You forgot to set one of the mandatory env variables.

### zdb.TX fn: cname: already exists.

The entrypoint script tries to create the initial site on every container startup. Once it's created, the `goatcounter create` command will report this error. It's safe to ignore it.
