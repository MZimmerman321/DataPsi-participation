

library(tidyverse)
library(gapminder)
library(here)


(gap_asia_2007 <- gapminder %>% filter(year == 2007, continent == "Asia"))


write_csv(gap_asia_2007, here::here("data", "s008_data", "exported_file.csv"))


library(readxl) 
dir.create(here::here("data", "s008_data"), recursive = TRUE)


xls_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"
download.file(xls_url, here::here("data", "s008_data", "some_file.xls"), mode = "wb")

file_name <- basename(xls_url)
download.file(xls_url, here::here("data", "s008_data", file_name), mode = "wb")

read_excel(here::here("data", "s008_data", file_name))















(clevel <- haven::read_spss(here::here("data", "s008_data", "clevel.sav")))


clevel_cleaned <-
  clevel %>% 
  mutate(language = as_factor(language),
         gender = as_factor(gender),
         isClevel = factor(isClevel, 
                           levels = c(0, 1), 
                           labels = c("No", "Yes"))
) %>% 
    print()


write_csv(clevel_cleaned, here::here("data", "s008_data", "clevel_cleaned.csv"))


clevel_plot <-
  clevel_cleaned %>% 
  mutate(isClevel = recode(isClevel, 
                           No = "Below C-level", 
                           Yes = "C-level"),
         gender = recode(gender,
                         Female = "Women",
                         Male = "Men")) %>% 
  ggplot(aes(paste(isClevel, gender, sep = "\n"), Extraversion, color = gender)) +
  geom_boxplot() +
  geom_jitter(height = .2) +
  scale_color_manual(values = c("#1b9e77", "#7570b3")) +
  ggtitle("Extraversion Stan Scores") +
  scale_y_continuous(breaks = 1:9) +
  ggthemes::theme_fivethirtyeight() %>% 
  print()

dir.create(here::here("output", "figures"), recursive = TRUE)
ggsave(here::here("output", "figures", "clevel_extraversion.svg"), clevel_plot)

ggsave(here::here("output", "figures", "clevel_extraversion.eps"), clevel_plot)
ggsave(here::here("output", "figures", "clevel_extraversion.pdf"), clevel_plot)
ggsave(here::here("output", "figures", "clevel_extraversion.tiff"), clevel_plot)
ggsave(here::here("output", "figures", "clevel_extraversion.png"), clevel_plot)

