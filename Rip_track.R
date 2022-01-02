library(ggplot2)
library(tidyverse)

rip_track<-read.csv("Ripley_data.csv")

rip_track<- rip_track %>%rowwise() %>%  mutate(sum_neg_behav= sum(Jump, Bark_in, Bark_outside, Attack, Harass_cats, Destroy, Chase_me, na.rm=T))
rip_track<- rip_track %>%rowwise() %>%  mutate(training_aid= sum(Time_out, Walk, Play_outside, Play_inside, Training_session, Crate_session, Enrichment, na.rm=T))

theme_set(theme_bw())

ggplot(data=rip_track, aes(x=Date, y=sum_neg_behav, group=1))+geom_point()+geom_line()


ggplot(data=rip_track, aes(x=training_aid, y=sum_neg_behav))+geom_point()


rip_long<-rip_track %>% pivot_longer(c(Jump, Bark_in, Bark_outside, Attack, Harass_cats, Destroy, Chase_me), names_to = "Neg_behav", values_to = "behav_count")

ggplot(data=rip_long, aes(x=Date, y=behav_count, colour=Neg_behav, group=Neg_behav))+geom_point()+geom_line()+theme_bw()


ggplot(data=rip_long, aes(x=training_aid, y=behav_count, colour=Neg_behav, group=Neg_behav))+geom_point()+geom_line()+theme_bw()
