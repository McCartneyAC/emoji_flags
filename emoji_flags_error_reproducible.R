# devtools::install_github("dill/emoGG")

library(tidyverse)
library(emoGG)

# emoji_search("tulip")
# ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#   geom_emoji(emoji="1f337")

# ggplot(mtcars, aes(wt, mpg))+ geom_emoji(emoji="1f697")

getwd()
hof<-read_csv("hofstede.csv")

###
flags<-emoji_search("flag")

# every country is Albania"
hof %>% 
  filter(isregion==0) %>% 
  ggplot(aes(x = pdi, y = idv)) +
  geom_emoji(emoji="1f1e6")

# Every country is itself: 
hof %>% 
  filter(isregion==0) %>% 
  ggplot(aes(x = pdi, y = idv)) +
  geom_emoji(emoji=ji_1)

