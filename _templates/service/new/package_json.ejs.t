---
to: <%=h.changeCase.snakeCase(name)%>/package.json
---

{
  "name": "atom",
  "version": "1.0.0",
  "description": "My Moleculer microservices project",
  "scripts": {
    "build": "tsc",
    "dev": "npm run nodemon & npm run start-service",
    "start-service": "cross-var node --inspect=0.0.0.0:$NODE_INSPECT_PORT -r ts-node/register ./node_modules/moleculer/bin/moleculer-runner.js --hot --repl --config moleculer.config.ts services/*.service.ts",
    "nodemon": "./node_modules/nodemon/bin/nodemon.js --config nodemon.json --exec npm run build",
    "cli": "moleculer connect NATS",
    "start": "moleculer-runner services",
    "ci": "jest --watch",
    "test": "jest --coverage",
    "lint": "tslint -p tsconfig.json",
    "dc:up": "docker-compose up --build -d",
    "dc:down": "docker-compose down"
  },
  "keywords": [
    "microservices",
    "moleculer"
  ],
  "author": "",
  "devDependencies": {
    "@types/bluebird": "^3.5.28",
    "@types/jest": "^23.1.1",
    "@types/node": "^10.17.2",
    "@types/validator": "^10.11.3",
    "@types/node-fetch": "^2.5.4",
    "cross-var": "^1.1.0",
    "jest": "^25.0.0",
    "jest-cli": "^25.0.0",
    "moleculer-repl": "^0.6.1",
    "nodemon": "^1.19.4",
    "ts-jest": "^23.10.5",
    "ts-node": "^8.5.0",
    "tslint": "^5.11.0",
    "typescript": "^3.2.2"
  },
  "dependencies": {
    "ioredis": "^4.2.0",
    "moleculer": "next",
    "node-fetch": "^2.6.0",
    "nats": "^1.0.1",
<% if(locals.shouldExposeOnPort){ -%>
    "moleculer-web": "^0.8.5",
<% } -%>
<% if(locals.shouldAddDb){ -%>
    "moleculer-db": "^0.8.2",
    "moleculer-db-adapter-sequelize": "^0.2.2",
    "pg": "^7.12.1",
    "pg-hstore": "2.3.3",
    "sequelize": "^5.21.2",
    "sequelize-cli": "^5.5.1",
<% } -%>
    "jaeger-client": "^3.17.1"
  },
  "engines": {
    "node": ">= 8.x.x"
  },
  "jest": {
    "coverageDirectory": "<rootDir>/coverage",
    "testEnvironment": "node",
    "moduleFileExtensions": [
      "ts",
      "tsx",
      "js"
    ],
    "transform": {
      "^.+\\.(ts|tsx)$": "ts-jest"
    },
    "testMatch": [
      "**/*.spec.(ts|js)"
    ],
    "globals": {
      "ts-jest": {
        "tsConfig": "tsconfig.json"
      }
    }
  }
}