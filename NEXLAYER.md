# Nexlayer — passport-mongo

<!-- nexlayer:meta version=1 analyzed=2026-06-05T16:51:33Z repo=https://github.com/armondhonore/passport-mongo branch=master -->

## Project Summary
<!-- nexlayer:section agent-managed=project_summary -->
A basic Node.js authentication example utilizing Express, Passport.js for authentication middleware, and MongoDB as the persistent user store.
<!-- nexlayer:end -->

## Technology Stack
<!-- nexlayer:section agent-managed=tech_stack -->
| Name | Kind | Version | Detected From |
|------|------|---------|---------------|
| Node.js | language | unknown | package.json |
| Express | framework | ~4.2.0 | package.json |
| MongoDB | database | latest | README.md, db.js |
| Passport.js | framework | ~0.2.0 | package.json |
| Mongoose | tool | ~3.8.12 | package.json |
<!-- nexlayer:end -->

## Repository Structure
<!-- nexlayer:section agent-managed=structure_map -->
- bin/ — Entry point (www) to start the server
- routes/ — Express route definitions
- models/ — Mongoose schema definitions for MongoDB
- passport/ — Passport authentication strategies
- views/ — Jade templates for the UI
- public/ — Static assets
- db.js — Database connection configuration
- app.js — Main application configuration and middleware setup
<!-- nexlayer:end -->

## External Services Required
<!-- nexlayer:section agent-managed=external_deps -->
_No external services detected._
<!-- nexlayer:end -->

## Local Development Setup
<!-- nexlayer:section user-editable=local_setup -->
### Prerequisites

- Node.js
- npm
- MongoDB

### Environment variables

Copy `.env.example` to `.env.local` and fill in:

```
MONGODB_URI=mongodb://localhost:27017/passport-mongo
```

### Steps

1. `npm install` — Install project dependencies
2. `npm start` — Start the server on the port defined in bin/www

<!-- nexlayer:end -->

## Nexlayer Deployment Plan
<!-- nexlayer:section user-editable=deployment_plan -->
### Pod Topology

| Pod | Image | Port | Role |
|-----|-------|------|------|
| web | mirror.gcr.io/library/node:22-alpine | 3000 | web |
| mongodb | mirror.gcr.io/library/mongo:latest | 27017 | database |

### Inter-pod environment variables

- `web` pod: `MONGODB_URI=mongodb://${mongodb:27017}/passport-mongo`

### Deployment notes

- The web pod connects to the database pod using the ${mongodb:27017} syntax per Nexlayer rules.
- MongoDB is isolated in its own pod to ensure data persistence and separate scaling.

<!-- nexlayer:end -->

## Build Notes
<!-- nexlayer:section user-editable=build_notes -->
<!-- Add notes for future builds here — preserved across re-analysis -->
<!-- nexlayer:end -->

## Nexlayer Configuration
<!-- nexlayer:section agent-managed=nexlayer_config -->
**Last deployed:** 2026-06-05T16:59:45Z  
**Live URL:** https://awesome-moose-fast-peak-passport-mongo.cloud.nexlayer.ai  
**Runtime:** node · **Port:** 3000  
**Deploy branch:** master  

```yaml
application:
  name: fast-peak-passport-mongo
  pods:
    - name: app
      image: "# filled by pipeline"
      path: /
      servicePorts:
        - 3000
      vars:
        - key: NODE_ENV
          value: production
        - key: PORT
          value: "3000"
        - key: HOSTNAME
          value: "0.0.0.0"
        - key: MONGODB_URI
          value: "mongodb://${mongodb:27017}/passport-mongo"
    - name: mongodb
      image: mirror.gcr.io/library/mongo:latest
      servicePorts:
        - 27017
```
<!-- nexlayer:end -->

## Build History
<!-- nexlayer:section agent-managed=build_history -->
| Date | Status | Notes |
|------|--------|-------|
| 2026-06-05T16:51:33Z | analyzed | initial repo analysis |
| 2026-06-05T16:59:45Z | success | deployed https://awesome-moose-fast-peak-passport-mongo.cloud.nexlayer.ai |
<!-- nexlayer:end -->
