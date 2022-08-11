//
//  ViewController.swift
//  ImageAdjust2
//
//  Created by yeh on 2022/8/3.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var aliceImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    //Slider
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    //Label
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    //Switch
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var alphaSwitch: UISwitch!
    
    //button
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var defaultButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //主圖片圓角及加框
        aliceImage.layer.cornerRadius = 50
        aliceImage.layer.borderWidth = 4
        aliceImage.layer.borderColor = UIColor.black.cgColor
        //背景圖圓角
        backgroundImage.layer.cornerRadius = 50
        //圓形按鈕
        randomButton.layer.cornerRadius = 50
        defaultButton.layer.cornerRadius = 50
        
        //slider小圓點圖案
        let heartImage = UIImage(systemName: "suit.heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
        redSlider.setThumbImage(heartImage, for: .normal)
        let clubImage = UIImage(systemName: "suit.club.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
        greenSlider.setThumbImage(clubImage, for: .normal)
        let spadeImage = UIImage(systemName: "suit.spade.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
        blueSlider.setThumbImage(spadeImage, for: .normal)
        let diamondImage = UIImage(systemName: "suit.diamond.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        alphaSlider.setThumbImage(diamondImage, for: .normal)
    }

    //背景圖片依據slider數值更改顏色的function
    func changeColor()
    {
        aliceImage.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    //建立四個分別恢復原始值的function
    func redDefault()
    {
        redSlider.value = 0
        redLabel.text = "0.00"
        //redSwitch.isEnabled
    }
    func greenDefault()
    {
        greenSlider.value = 0
        greenLabel.text = "0.00"
    }
    func blueDefault()
    {
        blueSlider.value = 0
        blueLabel.text = "0.00"
    }
    func alphaDefault()
    {
        alphaSlider.value = 0
        alphaLabel.text = "0.00"
    }
    
    
    
        
    //slider改變顏色，並顯示數值
    @IBAction func colorSliderChange(_ sender: UISlider)
    {
        changeColor()
        switch sender
            {
                case redSlider:
                    redLabel.text = String(format: "%.2f", redSlider.value)
                case greenSlider:
                    greenLabel.text = String(format: "%.2f", greenSlider.value)
                case blueSlider:
                    blueLabel.text = String(format: "%.2f", blueSlider.value)
                case alphaSlider:
                    alphaLabel.text = String(format: "%.2f", alphaSlider.value)
                default:
                    break
            }
    }
   
    //顏色的開關，關起來時會變回初始值0
    @IBAction func switchTap(_ sender: UISwitch)
    {
        if sender == redSwitch
        {
            redSlider.isEnabled = sender.isOn
            redDefault()
            changeColor()
        }
        else if sender == greenSwitch
        {
            greenSlider.isEnabled = sender.isOn
            greenDefault()
            changeColor()
        }
        else if sender == blueSwitch
        {
            blueSlider.isEnabled = sender.isOn
            blueDefault()
            changeColor()
        }
        else if sender == alphaSwitch
        {
            alphaSlider.isEnabled = sender.isOn
            alphaDefault()
            changeColor()
        }
    }
     
    //隨機更換背景顏色
    @IBAction func randomPress(_ sender: UIButton)
    {
        //設定slider值的亂數
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        //顯示生成的亂數結果
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
        
        if redSwitch.isOn == false
        {
            redDefault()
        }
        if greenSwitch.isOn == false
        {
            greenDefault()
        }
        if blueSwitch.isOn == false
        {
            blueDefault()
        }
        if alphaSwitch.isOn == false
        {
            alphaDefault()
        }
        //亂數帶入背景圖片變動
        changeColor()
    }
    
    //背景顏色回到初始值0
    @IBAction func defaultPress(_ sender: UIButton)
    {
        redDefault()
        greenDefault()
        blueDefault()
        alphaDefault()
        changeColor()
    }
}


