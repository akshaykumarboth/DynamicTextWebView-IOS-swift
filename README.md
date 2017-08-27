# DynamicTextWebView
DynamicTextWebView adjusts its height according to the text present in it. You have the feature to set font size of the text. More useful for loading HTML String in the webview
 
 Example: 
 1. Download and copy DynamicTextWebView.swift and DynamicTextWebView.xib files inside your project
 2. In your View Controller scene in storyboard/Interface Builder, drag and drop the UIView from the object library and set the class of the UIView equal to "DynamicTextWebView" (Dont set the height or the height constraint).
 3. For more Details follow the code:
 ->
 
 import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var dynamicTextWebView: DynamicTextWebView!
    
    var testString: String = "  1<b>MS Excel Workshop</b><b>MS Excel Workshop</b>2 <b>MS Excel Workshop</b>3 1<b>MS Excel Workshop</b><b>MS Excel Workshop</b>2 <b>MS Excel Workshop</b>3 5 <b>MS Excel Workshop</b>6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicTextWebView.setText(text: testString, font: 20) //setting HTML String in text: String
    }
        
}
