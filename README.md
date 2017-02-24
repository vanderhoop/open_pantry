# OpenPantry
## A management system for pantry programs to help people eat healthy meals with dignity

  * Getting started with development:
    * Install Postgres (However you like, postgresapp.com or `brew install postgres` are good ways to go on a Mac
    * if using Postgres.app you must initialize a data directory after installing, and follow instructions for adding CLI tools to your Terminal path...  `which psql` but succeed when done
      * (instructions defaulting to Mac below... for simplicity, linux users extrapolate, Windows, I have no idea, PR's with instructions for either/both welcome)
    * Install Elixir/Erlang (`brew install elixir`)
    * Install NPM and yarn (`brew install node && npm install -g yarn`)
    * Clone this repository locally, `git clone git@github.com:MasbiaSoupKitchenNetwork/open_pantry.git`
    * cd into the directory `cd open_pantry`
    * Download database from s3 via `wget https://s3.amazonaws.com/open-pantry/openpantry.dump`
    * Install Elixir package dependencies with `mix deps.get`
    * Create the database in Postgres with `mix ecto.create`, assuming default password etc in config works.
    * Import the dump to the database via `psql open_pantry_dev < openpantry.dump`
    * Migrate the database to add migrations since dump was created, via `mix ecto.migrate`
    * Install Node.js dependencies with `yarn install`
    * Start Phoenix endpoint with `mix phoenix.server`, or `iex -S mix phoenix.server` (this gives a server and REPL/console in one window)
  * ALTERNATIVELY (and with much less detail), if you DON'T WANT TO USE the dump file referenced above/want to generate a dump from scratch, the above dump was generated with a complete USDA food/nutrient database approximately as below, along with non-dump steps above:
    * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
    * Git clone https://github.com/MasbiaSoupKitchenNetwork/nutes locally and run make, modifying if necessary to point at your Postgres DB and the directory path to your local copy in imports.sql (requires golang to build data_cleanup tool)
    * Add seed data with `mix run priv/repo/seeds.exs`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Masbia Pantry: http://www.masbia.org/pantry
  * Volunteer to help develop this app, or other work with Masbia: http://www.masbia.org/volunteer_signup
