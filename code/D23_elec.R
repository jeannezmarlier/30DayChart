library(tidyverse)
library(viridis)

elec <- elec %>% filter(Entity %in% c("Eastern Africa", "Middle Africa", "Southern Africa", "Western Africa", "Europe", "Asia Pacific", "North America", "South & Central America"))

plot_elec <- ggplot(elec, aes(x=Year, y=reorder(Entity,`Renewables (% electricity)`), fill=`Renewables (% electricity)`)) + 
  geom_tile() +
  scale_fill_viridis(option = "mako", limits=c(0,100)) +
  labs(y ="",
       x = "Year\n",
       title = "Share of electricity production from renewables, 1985-2020",
       subtitle = "Renewables includes electricity production from hydropower, solar, wind, biomass, waste, geothermal, wave and tidal sources.\n",
       caption = "\nData : BP Statistical Review of World Energy & Ember | @j_marlier") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    plot.margin = margin(t = 0.7, r = 0.5, b = 0.5, l = 0.5, unit = "cm"),
    panel.background = element_rect(fill = "#F0F0F0", color = "#F0F0F0"),
    plot.background = element_rect(fill = "#F0F0F0"),
    legend.position="bottom",
    legend.title = element_blank(),
    legend.text = element_text(family="Chivo", size = 10, color="#444444"),
    axis.text.x = element_text(family="Chivo", size = 15, color="#444444"),
    axis.text.y = element_text(family="Chivo", size = 16, color="#1E1E1E"),
    axis.title.x = element_text(family="Chivo", size = 15, vjust=-3, hjust=0.5, color="#1E1E1E"),
    plot.title = element_text(family="Chivo", face="bold", size=19, color="#1E1E1E", hjust=0.5),
    plot.subtitle = element_text(family="Chivo", size = 13, color="#1E1E1E", hjust=0.5),
    plot.caption = element_text(family="Chivo", size = 8, hjust=0.5, color="#444444")
  ) 
ggsave(filename = "plot_elec.png", plot = plot_elec, width = 15, height = 7)
 