
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(dbplyr)
library(dplyr)
library(RODBC)
library(DBI)
library(RMySQL)


shinyServer(function(input, output) {
  
  withProgress(message = 'Analysing...', value = 2/10, {
    host="dstudiodb.cdgufecff0w0.eu-west-2.rds.amazonaws.com"
    port=3306
    dbname="dStudioDB"
    user="shiny"
    
    db <- dbConnect(RMySQL::MySQL(), dbname=dbname, username=user, password="kontoAMA22", host=host, port=port)
    x <- dbListTables(db)
    
    incProgress(8/10)
  })
  #my_db=src_mysql(dbname=dbname,host=host,port=port,user=user,password=password)

  
  output$tblDB <- renderText({
    print(x)
  })
  
})
