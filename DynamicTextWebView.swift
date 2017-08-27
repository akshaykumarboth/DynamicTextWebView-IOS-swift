//
//  DynamicHeightWebView.swift
//  ViksitIOS
//
//  Created by Akshay Kumar Both on 8/26/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit


class DynamicTextWebView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet var webView: UIWebView!
    @IBOutlet var textView: UILabel!
    @IBOutlet var textStackView: UIStackView!
    
    var observing = false
    var text: String = ""
    var editEnabled: Bool = false
    let padding = "1"
    
    var MyObservationContext = 0
    
    func setText(text: String, font: CGFloat){
        self.text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        self.textView.text = removeHtmlTags(string: self.text)
        self.textView.font = UIFont.systemFont(ofSize: font)
        
        let fontSize = UIScreen.main.scale * textView.font.pointSize
        //startObservingHeight()
        self.webView.loadHTMLString(self.wrapInHtml(body: self.text, fontSize: font), baseURL: nil)
        
        
       
    }
    
    
    convenience init(frame: CGRect, text: String, font: CGFloat) {
        self.init(frame: frame)
        setText(text: text, font: font)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DynamicTextWebView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func wrapInHtml(body: String, fontSize: CGFloat) -> String {
        let cssStr = String(format:"font-size: %.1fpx;", fontSize)
        
        var html = "<html>"
        html += "<head>"
        html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
        html += "<style> body { \(cssStr) padding: \(padding)px !important; margin: 0 !important } html { -webkit-text-size-adjust:none; } </style>"
        /*html += "<script type=\"text/javascript\">"
         html += "window.onload = function() {"
         html +=  "window.location.href = \"ready://\" + document.body.offsetHeight; }"
         html += "</script>"*/
        html += "</head>"
        html += "<body>"
        html += body
        html += "</body>"
        html += "</html>"
        
        return html
    }
    
    func removeHtmlTags(string: String) -> String{
        //var string = "<!DOCTYPE html> <html> <body> <h1>My First Heading</h1> <p>My first paragraph.</p> </body> </html>"
        let str: String = string.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        return str
    }
    
    
}





