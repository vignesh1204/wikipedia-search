import sys
import datetime

'''
In cli mode, run python3 wikipedia.py <search-term> <log-file-name>
for example, python3 wikipedia.py "india" "log2.txt"

In interactive mode, run python3 wikipedia.py
'''

def wikipedia_search(keyword, file_name):
    keyword = keyword.replace(' ', '%20')
    url = "https://en.wikipedia.org/wiki/" + keyword
    file = open(file_name, 'a')
    d = datetime.datetime.now()
    d = d.strftime("%a %d. %b %H:%M:%S %Z %Y")
    file.write(d + ' - ' + keyword + ' - ' + url)
    file.close()

if __name__=='__main__':
    if len(sys.argv) == 3:
        res = wikipedia_search(sys.argv[1], sys.argv[2])
    elif len(sys.argv) == 1:
        search_term = input("Enter search term: ")
        log = input("Enter name of log file (default - logfile.txt): ")
        log = log or "logfile.txt"
        if search_term:
            res = wikipedia_search(search_term, log)
        else:
            print("Search term cannot be empty")
    else:
        print ("Requires 2 arguments in cli mode")
    
        