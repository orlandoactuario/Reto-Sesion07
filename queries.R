library(DBI)
library(RMySQL)


MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'City')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
DataDB
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
DataDB %>% 
  filter(Language=="Spanish") %>%
  ggplot(aes(CountryCode,Percentage))+geom_bar(stat = "identity",aes(fill=IsOfficial))+coord_flip()
  
