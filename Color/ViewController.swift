//
//  ViewController.swift
//  Color
//
//  Created by Alexey Ivanov on 17/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorMeView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newColor = UIColor(red: CGFloat(redSlider.value),
                               green: CGFloat(greenSlider.value),
                               blue: CGFloat(blueSlider.value),
                               alpha: 1.0)
        colorMeView.backgroundColor = newColor
        
        updateColorLabel()
    }
    
    func updateColorLabel() {
        guard let currentColor = colorMeView.backgroundColor else { return }
        colorValueLabel.text = "Red: \(currentColor.rgba.red), Green: \(currentColor.rgba.green), Blue: \(currentColor.rgba.blue)"
    }

    @IBAction func reSliderChanged(_ sender: Any) {
        let redValue = redSlider.value
        if let currentColor = colorMeView.backgroundColor {
            colorMeView.backgroundColor = UIColor(red: CGFloat(redValue),
                                                  green: currentColor.rgba.green,
                                                  blue: currentColor.rgba.blue,
                                                  alpha: 1.0)
            
        }
        updateColorLabel()
    }
    
    @IBAction func greenChanged(_ sender: Any) {
        let greenValue = greenSlider.value
        if let currentColor = colorMeView.backgroundColor {
            colorMeView.backgroundColor = UIColor(red: currentColor.rgba.red,
                                                  green: CGFloat(greenValue),
                                                  blue: currentColor.rgba.blue,
                                                  alpha: 1.0)
        }
        updateColorLabel()
    }
    
    @IBAction func blueChanged(_ sender: Any) {
        let blueValue = blueSlider.value
        if let currentColor = colorMeView.backgroundColor {
            colorMeView.backgroundColor = UIColor(red: currentColor.rgba.red,
                                                  green: currentColor.rgba.green,
                                                  blue: CGFloat(blueValue),
                                                  alpha: 1.0)
        }
        updateColorLabel()
    }
}


extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
