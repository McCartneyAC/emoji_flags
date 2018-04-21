# emoji_flags
To demonstrate that ggplot does not plot flag emoji as flags


Hi Guys, 

The goal here is to plot international data sets with each country's data point represented by its flag emoji. I have tried this with several emoji packages, including Hadley's Emo and also GuangchuangYu/emojifont. There are two main problems:

1. It doesn't seem possible to pass an individual emoji code into any versions of the geom_emoji() function, which seems to require that all points be the same emoji. This *might* be possible using something like geom_text() but I haven't figured it out yet. 

2. When plotting emoji for country flags, the various emoji libraries which exist all seem to default to using 1 or 2 letter country codes (e.g., plots A for Albania and L for Luxembourg) rather than the emoji of the flag itself). 



EDIT:

looks like package: https://github.com/rensa/ggflags/ works very well. Run the following to download country codes:
```

library(rvest)
url<-"http://www.nationsonline.org/oneworld/country_code_list.htm"
country_codes<-url %>% 
  read_html() %>% 
  html_nodes(xpath='//*[@id="codelist"]') %>% 
  html_table() %>% 
  as.data.frame() %>% 
  as_tibble() %>% 
  select(Country.or.Area.Name, ISO..ALPHA.2.Code) %>% 
  rename("name" = "Country.or.Area.Name" ,
         "code" = "ISO..ALPHA.2.Code" ) %>% 
  na.omit()
country_codes$code<-tolower(country_codes$code)
country_codes


```
