Sys.setenv(TZ='UTC')
rm(list=ls())
proj <- '+proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=600000 +y_0=200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs '
#proj <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
#pdf('rplot.pdf',paper='a4r',width=11,height=8.5)
#dev.off()


packages <- c(
  #stat libraries
  'lattice','ade4','permute','reshape','zoo','miscTools',
  #'readxl','vegan',
  
  #Spatial libraries
  'foreign','sp','plotrix','raster','maps','proj4','rgeos','grid',
  'maptools','rgdal','deldir','splancs','spatial','spatialkernel',
  'spatstat','KernSmooth','scales',

  #NCDF, Rain and temperature libraries
  'fts','ncdf','gpclib',

  #BIOMOD libraries
  'splines','randomForest','survival','gbm','gam','mgcv','MASS','abind',
  'rpart','biomod2',

  #Looping libraries
  'foreach','iterators','parallel','doParallel',

  #graphics libraries
  'TeachingDemos','soiltexture','hexbin','corrgram','diagram',
  'rasterVis','latticeExtra','beanplot','vioplot','ggplot2','chron',
  'grid','GGally','RColorBrewer','classInt','extrafont','scatterplot3d',
#  'rgl',

  #R libraries
  'installr'
)


for(pkg in packages){
  libTest <- try(library(pkg,character.only=T),silent=T)
  if(class(libTest)=='try-error'){
    updteTest <- try(install.packages(pkg))    
    if(class(updteTest)=='try-error'){update.packages(pkg)}
    else{install.packages(pkg)}
    print(pkg)
    library(pkg,character.only=T)
  }
}

gpclibPermit()
print('#Register the number of cores for parallel computation')
registerDoParallel(cores=7)
# print('#Load fonts')
loadfonts(device="pdf")

print('Use font from the OS, list all fonts: fonttable()')
print('#pdf("rplot.pdf",paper="a4r",family="DINbeck",width=11,height=8.5)')
print('p+theme_bw(base_size = 18, base_family = "DINBek")+...')

try(setwd('/Users/erey/Documents/GIS/PyGIS_SSD'),silent=T)
try(setwd('e:/PyGIS'),silent=T)


colPalette <- c('Blues', 'BuGn', 'BuPu', 'GnBu', 'Greens', 'Greys', 'Oranges', 'OrRd', 'PuBu', 'PuBuGn', 'PuRd', 'Purples', 'RdPu', 'Reds', 'YlGn', 'YlGnBu', 'YlOrBr', 'YlOrRd',
                'BrBG', 'PiYG', 'PRGn', 'PuOr', 'RdBu', 'RdGy', 'RdYlBu', 'RdYlGn', 'Spectral',
                'Accent','Dark2','Paired','Pastel1','Pastel2','Set1','Set2','Set3')
print(colPalette)


#jet.colors <- colorRampPalette(c('black',"#00007F", "blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000",'black'))
jet.colors <- colorRampPalette(c('black',"#7F0000","red","#FF7F00","yellow","#7FFF7F","cyan","#007FFF","blue","#00007F",'black'))
BrBG <- colorRampPalette(c('#543005','#8c510a','#bf812d','#dfc27d','#f6e8c3','#f5f5f5','#c7eae5','#80cdc1','#35978f','#01665e','#003c30'))
cbbPalette <- colorRampPalette (c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"))
#plot(dem1,col=jet.colors(255),horizontal=T,legend.mar=3.1)
print('color set defined: use as col=jet.colors(255)')
print('color set defined: use as col=BrBG(255)')
print('color blind set defined: use as col=cbbPalette(255)')

