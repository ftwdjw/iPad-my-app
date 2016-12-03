//
//  ViewController.swift
//  webView2
//
//  Created by John Mac on 11/2/16.
//  Copyright © 2016 John Wetters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    

    
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
        print("\ngo back")
    }
    
  
    @IBAction func goHome(_ sender: Any) {
        let url = NSURL (string: "http://www.wsj.com/");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);
        webView.scalesPageToFit = true
        print("\nnow at home")
        URLCache.shared.removeAllCachedResponses()
        
        print("removed cache")
    }
    
    
    @IBAction func goForward(_ sender: Any) {
        webView.goForward()
        print("\ngo forward")
    }
  
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://www.wsj.com/");
        let requestObj = NSURLRequest(url: url! as URL);
        self.webView.loadRequest(requestObj as URLRequest);
        
        self.webView.delegate = self
        print("web view did load")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //Remove all cache
        URLCache.shared.removeAllCachedResponses()
        
         print("removed cache")
        
        
        // deleting any associated cookies
        if let cookies = HTTPCookieStorage.shared.cookies{
        for cookie in cookies {
            HTTPCookieStorage.shared.deleteCookie(cookie)
        }
    }
        
    }
}
    
    




