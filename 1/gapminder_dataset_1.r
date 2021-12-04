library(tidyverse)
library(dplyr)
library(readr)
library(writexl)
library(pastecs)
library(plyr)

gapminder_tsv <- read_table2("C:/Users/lenovo/Desktop/Data_Camp/gapminder.tsv.txt")
View(gapminder_tsv)

#(1) Ba��ms�z veri seti:

#filtreleme:

gapminder_lifeExp <- gapminder_tsv %>%
  filter(continent %in% c("Asia", "Europe", "Americas")) %>%
  summarize(continent=continent, lifeExp=lifeExp) %>%
  arrange(desc(continent))
View(gapminder_lifeExp)

gp_eu <- gapminder_lifeExp %>%
  filter(continent=="Europe")

gp_usa <- gapminder_lifeExp %>%
  filter(continent=="Americas")

gp_asia <- gapminder_lifeExp %>%
  filter(continent=="Asia")

#�rneklem �ekme:

gp_eu_samp <- as.data.frame(list(sample(gp_eu$lifeExp,30,replace=F)))
colnames(gp_eu_samp) <- c("lifeExp")
gp_eu_samp$lifeExp <- as.numeric(gp_eu_samp$lifeExp)


gp_asia_samp <- as.data.frame(list(sample(gp_asia$lifeExp,30,replace=F)))
colnames(gp_asia_samp) <- c("lifeExp")
gp_asia_samp$lifeExp <- as.numeric(gp_asia_samp$lifeExp)


gp_usa_samp <- as.data.frame(list(sample(gp_usa$lifeExp,30,replace=F)))
colnames(gp_usa_samp) <- c("lifeExp")
gp_usa_samp$lifeExp <- as.numeric(gp_usa_samp$lifeExp)
 

#�zetleyici istatistikler: 

stat.desc(gp_eu_samp$lifeExp)
stat.desc(gp_asia_samp$lifeExp)
stat.desc(gp_usa_samp$lifeExp)


#normallik testi:
#H0: verilerin da��l�m� ile normal da��l�m aras�nda fark yoktur

shapiro.test(gp_asia_samp$lifeExp)
shapiro.test(gp_eu_samp$lifeExp)
shapiro.test(gp_usa_samp$lifeExp)
#   p-value < alpha=0.05 i�in %95 g�ven d�zeyiyle s�ylenebilir ki
#veriler ile normal da��l�m aras�nda fark vard�r.





















