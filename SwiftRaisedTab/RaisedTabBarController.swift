//
//  RaisedTabBarController.swift
//  SwiftRaisedTabDemo
//
//  Created by Kaynine on 9/23/2015.
//  Copyright (c) 2015 Kaynine. All rights reserved.
//

import UIKit

open class RaisedTabBarController: UITabBarController {
    
    open var raisedButton:UIButton?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func insertEmptyTabItem(_ title: String, atIndex: Int) {
        let vc = UIViewController()
        vc.tabBarItem = UITabBarItem(title: title, image: nil, tag: 0)
        vc.tabBarItem.isEnabled = false
        
        self.viewControllers?.insert(vc, at: atIndex)
    }
    
    open func addRaisedButton(_ buttonImage: UIImage?, highlightImage: UIImage?, offset:CGFloat? = nil) {
        if let buttonImage = buttonImage {
            self.raisedButton = UIButton(type: UIButtonType.custom)
            self.raisedButton!.autoresizingMask = [UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleBottomMargin, UIViewAutoresizing.flexibleTopMargin]
            
            self.raisedButton!.frame = CGRect(x: 0.0, y: 0.0, width: buttonImage.size.width, height: buttonImage.size.height)
            self.raisedButton!.setBackgroundImage(buttonImage, for: UIControlState())
            self.raisedButton!.setBackgroundImage(highlightImage, for: UIControlState.highlighted)
            
            let heightDifference = buttonImage.size.height - self.tabBar.frame.size.height
            
            if (heightDifference < 0) {
                self.raisedButton!.center = self.tabBar.center
            }
            else {
                var center = self.tabBar.center
                center.y -= heightDifference / 2.0
                
                self.raisedButton!.center = center
            }
            
            if offset != nil
            {
                //Add offset
                var center = self.raisedButton!.center
                center.y = center.y + offset!
                self.raisedButton!.center = center
            }
            
            self.raisedButton!.addTarget(self, action: #selector(RaisedTabBarController.onRaisedButton(_:)), for: UIControlEvents.touchUpInside)
            self.view.addSubview(self.raisedButton!)
        }
    }
    
    open func onRaisedButton(_ sender: UIButton!) {
        
    }
}
