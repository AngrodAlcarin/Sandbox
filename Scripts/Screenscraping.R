#look at robots.txt to see which information you are allowed to scrape
browseURL("https://nzz.ch/robots.txt")
#download the page so you have a local copy, independent of changes to the page
download.file(url = "https://nzz.ch",destfile = here::here("nzz_page.html"))
#this function is called "read_html", but it's not actually reading, but parsing the html page!
nzz<-rvest::read_html("nzz_page.html")
#this extracts the actual elements of the page
rvest::html_elements(nzz,css="p")
#xpath is more powerful, but harder
