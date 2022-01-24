library(tidyverse)
load('data/emissions-clean.RData')

# emissions over time
fig1a <- emissions %>%
  ggplot(aes(x = year, 
             y = total.co2, 
             group = state)) +
  geom_path() +
  theme_bw() +
  scale_y_log10()

# plot population against emissions
fig1b <- emissions %>%
  ggplot(aes(x = log(population), 
             y = log(total.co2),
             color = year,
             group = state)) +
  geom_path() +
  theme_bw() 

# combine
fig1 <- gridExtra::grid.arrange(fig1a, fig1b, nrow = 1)

# export
ggsave(plot = fig1,
       filename = 'results/figures/co2-emissions.png', 
       width = 7, 
       height = 3, 
       units = 'in', 
       dpi = 300)
