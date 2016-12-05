//
//  ViewController.swift
//  webView2
//
//  Created by John Mac on 11/2/16.
//  Copyright © 2016 John Wetters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBAction func newHome(_ sender: UIButton) {
        
        let url = NSURL (string: "http://www.wsj.com/");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);
        webView.scalesPageToFit = true
        print("\nnow at home")
        URLCache.shared.removeAllCachedResponses()
        
        print("removed cache")
        
        
        
    }
    
    
    
    
    @IBOutlet var testView: UIView!
    
    //initialize left,right and down UI swipe gesture recognizers
    let leftSwipe = UISwipeGestureRecognizer()
    let rightSwipe = UISwipeGestureRecognizer()

  
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://www.wsj.com/");
        let requestObj = NSURLRequest(url: url! as URL);
        self.webView.loadRequest(requestObj as URLRequest);
        
        self.webView.delegate = self
        print("web view did load")
        
        
        
        testView.addGestureRecognizer(leftSwipe)
        leftSwipe.direction = .left
        
        testView.addGestureRecognizer(rightSwipe)
        rightSwipe.direction = .right
        
        
        testView.isUserInteractionEnabled  = true
        
        leftSwipe.addTarget(self, action: #selector(ViewController.swipedViewLeft))
        
        rightSwipe.addTarget(self, action: #selector(ViewController.swipedViewRight))
        
       
        
        //tapView.addGestureRecognizer(tapRec)
         //tapRec.addTarget(self, action: #selector(ViewController.tappedView))
        
        //tapView.isUserInteractionEnabled = true;
    
     
        
        print("view did load")
        
        
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
    
    
    func swipedViewLeft(){
        
        print("Swipe Left")
     
        webView.goBack()
        print("\ngo back")
        
    }
    
    func swipedViewRight(){
        print("Swipe Right")
        
        webView.goForward()
        print("\ngo forward")
        
        
    }
    

    
    
}






