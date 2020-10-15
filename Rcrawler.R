## Download all pages which have table body from Cricinfo.com 
## using Rcrawler

library(Rcrawler)
library(processx)

#Set working directory where html files will be stored
setwd("D:/Crawled websites")

Rcrawler(Website = "https://www.espncricinfo.com/",no_cores = 4, no_conn = 4,FUNPageFilter = istable,MaxDepth=2)


istable<- function(x)
{
  decision<-FALSE
  vtable<-tryCatch(ContentScraper(HTmlText = x$Info$Source_page,XpathPatterns = c("//table","//tbody")))
 
  if(!is.null(vtable) && !is.na(vtable)) 
  {
    decision<-TRUE
  }  
  decision
}

## Index will show count of downlaaded pages
INDEX


