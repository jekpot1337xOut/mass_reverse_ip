from requests import get
from random import randint
from threading import Thread
from thread_pool import ThreadPool , CustomThread
from os import system
th = ThreadPool(max_workers=300)
def setTitle(title):
    try:
        system(f"title \"{title}\"")
    except:
        pass
def check(ip):
    global file
    global found
    try:
        req = get(f"https://api.scrapestack.com/scrape?access_key=6c1b98133d719f0ab4ff6a6136c41b99&url=https://api.hackertarget.com/reverseiplookup/?q={ip}")
        if req.status_code == 200 and not "API count exceeded" in req.text and not "No DNS A records found" in req.text:
            for x in req.text.split("\n"):
                file.write(x+"\n")
                file.flush()
                found += 1
                setTitle(f"MJ Mass Reverse Ip | Found : {found}")
        else:
            check(ip)
    except Exception as e:
        check(ip)

Thread(target,args=(int(input("Enter Proxy Refresh Interval : ")),)).start()
list_ips = [x.strip() for x in open("ips.txt").readlines()]
for ip in list_ips:
    th.appendThread(CustomThread(target=check,args=(ip,)))
