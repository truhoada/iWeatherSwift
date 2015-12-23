//
//  ViewController.swift
//  iWeather99
//
//  Created by hoangdangtrung on 12/22/15.
//  Copyright © 2015 hoangdangtrung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelButtonTemperature: UIButton!
    @IBOutlet weak var labelCDegree: UILabel!
    @IBOutlet weak var imageStatusWeather: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    
    let arrayQuotes = ["1111111111", "22222222222", "333333333333", "4444444444444"]
    let arrayLocations = ["New York", "Tokyo", "Hanoi", "Ho Chi Minh City"]
    let arrayImageStatusWeathers = ["cloud", "rain", "light", "sun"]
    
    var isCTemp = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnRefresh(sender: AnyObject) {
//        self.labelCDegree.text = "C"
        
        let locationIndex = arc4random_uniform(UInt32(arrayLocations.count))
        self.labelLocation.text = arrayLocations[Int(locationIndex)]
        
        let quoteIndex = arc4random_uniform(UInt32(arrayQuotes.count))
        self.labelQuote.text = arrayQuotes[Int(quoteIndex)]
        
        let imageStatusIndex = arc4random_uniform(UInt32(arrayImageStatusWeathers.count))
        
        self.imageStatusWeather.image = UIImage(named: arrayImageStatusWeathers[Int(imageStatusIndex)])
        
        self.labelButtonTemperature.setTitle(NSString(format: "%2.1f", getTemperature()) as String, forState: UIControlState.Normal)

    }
    
    @IBAction func btnTemperatureChanged(sender: UIButton) {
        let stringCurrentTemp = self.labelButtonTemperature.titleLabel?.text
        let floatCurrentTemp = (stringCurrentTemp! as NSString).floatValue
//        if self.labelCDegree.text == "C" {
        if isCTemp == true {
            self.labelCDegree.text = "F"
            let floatFTemp = (floatCurrentTemp * 1.8) + 32
            self.labelButtonTemperature.setTitle(NSString(format: "%2.1f", floatFTemp) as String, forState: UIControlState.Normal)
            isCTemp = false
        } else {
            self.labelCDegree.text = "C"
            let floatCTemp = (floatCurrentTemp - 32)/1.8
            self.labelButtonTemperature.setTitle(NSString(format: "%2.1f", floatCTemp) as String, forState: UIControlState.Normal)
            isCTemp = true
        }
    }
    
    func getTemperature() -> Float {
        var num = Float(14) + Float(arc4random_uniform(18)) + Float(arc4random()) / Float(UINT32_MAX)
        if isCTemp == true {
            return num
        } else {
            num = num * 1.8 + 32
        }
        return num
    }
}

