library(RSelenium)
library(beepr)
remDr=remoteDriver(remoteServerAddr = "127.0.0.1" , port = 4444 , browserName = "firefox")
remDr$open()
options(scipen=200)
jss(jss = 'document.getElementById("textarea").innerHTML="(bclas2=(A01))" ')

asave=remDr$findElement('xpath',"/html/body/div[1]/div[4]/div[4]/ul/li[1]")
asave$clickElement()
Sys.sleep(2)

for (x in 1:27) {
  endn=x*10000
  startn=endn-9999

  remDr$switchToWindow(remDr$getWindowHandles()[[2]])
  #著录项1-10000
  fw=remDr$findElement('xpath',"//*[@id='rangeValue']")
  fw$clearElement()
  numfw=paste0(startn,'-',endn)
  fw$sendKeysToElement(list(numfw))
  print(numfw)
  Sys.sleep(4)
  
 
  selectall=remDr$findElement('xpath',"/html/body/div[1]/div[2]/div[3]/div[2]/div[2]/div/label/input")
  # selectall$clickElement()
  xz=remDr$findElement('xpath',"/html/body/div[1]/div[2]/div[4]/div[1]/input")
  xz$clickElement()
  Sys.sleep(1)
  
  remDr$switchToWindow(remDr$getWindowHandles()[[3]])
  remDr$refresh()
  Sys.sleep(20)
  print("check downloanding")
  
  js2="var xuhao1=document.getElementById('table').getElementsByTagName('tr')[[1]];
      var td9=xuhao1.getElementsByTagName('td')[[7]].innerHTML;return( td9)"
  td=remDr$executeScript(js2)
  while (td[[1]]==0) {td=remDr$executeScript(js2)}
  
  remDr$switchToWindow(remDr$getWindowHandles()[[2]])
  beep(sound = 3, expr = NULL)
Sys.sleep(5)
}


jss=function(jss){
  remDr$navigate("https://www.incopat.com/")
  iplog=remDr$findElement('xpath','//*[@id="ipLoginBtn"]')
  iplog$clickElement()
  Sys.sleep(3)
  
  remDr$navigate("https://www.incopat.com/advancedSearch/init")
  Sys.sleep(3)
  #????????ʽ?????м???
  js1 = jss
  remDr$executeScript(js1)
  js2=remDr$findElement('xpath',"/html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/input[2]")
  js2$clickElement()
  Sys.sleep(3)
  
  #??????????????
  sort=remDr$findElement('xpath',"//*[@id='sort_ul']")
  Sys.sleep(1)
  sort$setElementAttribute("style",'3')
  Sys.sleep(1)
  adasc=remDr$findElement('xpath',"//*[@id='AD_ASC']")
  Sys.sleep(1)
  adasc$clickElement()
}


