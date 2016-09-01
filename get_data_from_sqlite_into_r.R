# Download sqlite soccer database from https://www.kaggle.com/hugomathien/soccer

# Libraries
library(RSQLite)
library(DBI)

# Connect to database file
# (unzip it first)
con <- dbConnect(RSQLite::SQLite(),
                 dbname = 'database.sqlite')

# Get a list of all the tables in the dataframe
all_tables <- dbListTables(con)

# For each table, bring into memory
for (i in 1:length(all_tables)){
  table_name <- all_tables[i]
  assign(tolower(table_name),
         dbGetQuery(conn = con,
                    statement = paste0('select * from ',
                                       table_name)))
}