#look at robots.txt to see which information you are allowed to scrape
browseURL("https://nzz.ch/robots.txt")
#download the page so you have a local copy, independent of changes to the page
download.file(url = "https://www.unilu.ch/studium/studienangebot/master/kultur-und-sozialwissenschaftliche-fakultaet/",destfile = here::here("ksf.html"))
#this function is called "read_html", but it's not actually reading, but parsing the html page!
ksf<-rvest::read_html("ksf.html")
#this extracts the actual elements of the page
rvest::html_elements(ksf,css=".text")
#xpath is more powerful, but harder

library(rvest)
ksf %>% 
  html_elements(css=".text") %>% 
  html_text()

install.packages("downloader")
library(downloader)

download(url="https://portal.unilu.ch/search?&Semester=FS23",destfile = here::here("vv.html"),mode="wb")
vv23 <- read_html("vv.html")
vv23 <- vv23 %>% 
  html_elements(css ="#ctl00_ctl00_ctl00_masterPlaceHolder_sitePlaceHolder_sitePlaceHolder_grdSearchResults a") %>% 
  html_text()
vv23


nzz<-read_html("nzz_page.html",encoding = "UTF-8")
nzz %>% 
  html_elements(css=".teaser__title-name") %>% 
  html_text

download(url="https://studentservices.uzh.ch/uzh/anonym/vvzsearch/?sap-language=DE&sap-ui-language=DE#/SearchSM/2022/004",destfile=here::here("uzh.html"),mode="wb")
uzh<-read_html("uzh.html")
uzh %>% 
  html_elements(css=".sapMObjectIdentifierTopRow") %>% 
  html_text()

library(httr)

nzz<-GET("https://www.nzz.ch/",
         add_headers(From="marius.imholz@stud.unilu.ch",
                     `User-Agent`="angrod_alcarin"))
bin <- content(nzz, as="raw")
writeBin(object=bin,con="nzz.html")

session<-html_session("https://www.nzz.ch/",
                      add_headers(
                        From="marius.imholz@stud.unilu.ch",
                        `User-Agent`="angrod_alcarin"
                      )
)
text <- session %>% 
  html_elements(css=".teaser__title-name") %>% 
  html_text()
text

download("https://www.imdb.com/title/tt0096697/episodes?season=32",here::here("simpsons.html"),mode="wb" )
simp<-read_html("simpsons.html")
simp %>% 
  html_elements(css="#episodes_content strong a") %>% 
  html_attr("href")
