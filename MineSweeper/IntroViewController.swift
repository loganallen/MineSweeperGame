//
//  IntroViewController.swift
//  MineSweeperPractice
//
//  Created by Andrew Grossfeld on 11/28/15.
//  Copyright © 2015 Andrew Grossfeld. All rights reserved.
//

import UIKit

@objc
protocol IntroViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class IntroViewController: UIViewController {
    
    @IBOutlet weak var topBarImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var developersText: UILabel!
    
    var gameType: Int = 0
    var gameLevel: Int = 0
    
    var delegate: IntroViewControllerDelegate?
    var containerVC: ContainerViewController?
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        layoutTheme()
    }
    
     // set background and text colors according to theme
    func layoutTheme() {
        self.view.backgroundColor = Style.foundationColor
        for view in self.view.subviews {
            (view as? UILabel)?.textColor = Style.textColor
        }
        if Style.foundationColor == UIColor.blackColor(){
            //developersText.textColor = UIColor(red: 255/255, green: 251/255, blue: 81/255, alpha: 1)
            topBarImage.image = UIImage(named: "nightSkyBar.png")
        }else{
            topBarImage.image = UIImage(named: "skyBar.png")
        }
        topBarImage.layer.shadowColor = UIColor.blackColor().CGColor
        topBarImage.layer.shadowOffset = CGSizeMake(0,4)
        topBarImage.layer.shadowOpacity = 0.6
        topBarImage.layer.shadowRadius = 3
        
        titleLabel.layer.shadowColor = UIColor.blackColor().CGColor
        titleLabel.layer.shadowOpacity = 0.5
        titleLabel.layer.shadowOffset = CGSizeMake(2,2)
        titleLabel.layer.shadowRadius = 1
    }
    
    @IBAction func startGame (sender: UIButton) {
        let gameVC = GameViewController()
        
        gameVC.gameSize = 8 + 2*gameType
        gameVC.gameLevel = gameLevel
        gameVC.introVC = self as IntroViewController
        containerVC?.currentState = .GameSimulation
        self.navigationController?.pushViewController(gameVC, animated: true)
        
    }

    @IBAction func showHowToPlay(sender: UIButton) {
        let htpvc = HowToPlayViewController()
        presentViewController(htpvc, animated: true, completion: nil)
    }
    
    @IBAction func sideTapped(sender: AnyObject) {
        print("FUCK YOU")
        delegate?.toggleLeftPanel?()
    }
    @IBAction func scoreTapped(sender: UIButton) {
        delegate?.toggleRightPanel?()
    }
}
