//
//  CameraView.swift
//  Phlash
//
//  Created by Ollie Haydon-Mulligan on 17/06/2016.
//  Copyright © 2016 Phlashers. All rights reserved.
//

import UIKit

class CameraView: UIView, UITextFieldDelegate {
    
    private let mainScreen = UIScreen.mainScreen()
    
    private let screenBounds:CGSize = UIScreen.mainScreen().bounds.size
    var logoutButton = UIButton()
    let phollowButton = UIButton()
    let flipCamera = UIButton()
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    let panGesture = UIPanGestureRecognizer()
    var identificationLabel = UILabel()
    var pendingPhlashesLabel = UILabel()
    var captionField = UITextField()
    private let whiteColor = UIColor.whiteColor()
    var statusLabel = UILabel()
    let tap: UITapGestureRecognizer = UITapGestureRecognizer()
    let FONT_SIZE = UIScreen.mainScreen().bounds.size.height/40
    private let backgroundGreen: UIColor = UIColor( red: CGFloat(62/255.0), green: CGFloat(200/255.0), blue: CGFloat(172/255.0), alpha: CGFloat(0.75))
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.clearColor()
        addLogoutButton()
        addPhollowButton()
        addFlipCamera()
        addRightSwipe()
        addLeftSwipe()
        addIdLabel()
        addStatusLabel()
        addCaptionField()
        addPendingPhlashesLabel()
        addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addFlipCamera() {
        flipCamera.frame = CGRect(x: screenBounds.width*4/5, y: 100, width: screenBounds.width/5, height: 30)
        flipCamera.setTitleColor(.whiteColor(), forState: .Normal)
        flipCamera.setTitle("Flip", forState: .Normal)
        addSubview(flipCamera)
    }
    
    func addLogoutButton() {
        logoutButton.frame = CGRect(x: screenBounds.width*4/5, y: 20, width: screenBounds.width/5, height: 30)
        logoutButton.setTitleColor(.whiteColor(), forState: .Normal)
        logoutButton.setTitle("Logout", forState: .Normal)
        logoutButton.accessibilityLabel = "logout"
        addSubview(logoutButton)
    }
    
    func addPendingPhlashesLabel() {
        pendingPhlashesLabel.frame = CGRect(x: 0, y: 40, width: screenBounds.width, height: 30)
        pendingPhlashesLabel.textColor = UIColor.whiteColor()
        pendingPhlashesLabel.textAlignment = .Right
        pendingPhlashesLabel.userInteractionEnabled = false
        pendingPhlashesLabel.text = "Phlashes to View"
        addSubview(pendingPhlashesLabel)
    }
    
    func addRightSwipe() {
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        addGestureRecognizer(swipeRight)
    }
    
    func addLeftSwipe() {
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        addGestureRecognizer(swipeLeft)
    }
    
    func addPhollowButton() {
        phollowButton.frame = CGRect(x: 0, y: 20, width: screenBounds.width/5, height: 30)
        phollowButton.setTitleColor(.whiteColor(), forState: .Normal)
        phollowButton.setTitle("Phollow", forState: .Normal)
        phollowButton.accessibilityLabel = "phollow"
        addSubview(phollowButton)
    }
    
    func addIdLabel() {
        identificationLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        identificationLabel.text = "CameraView"
        identificationLabel.textColor = UIColor.clearColor()
        identificationLabel.userInteractionEnabled = false
        addSubview(identificationLabel)
    }
    
    func addStatusLabel() {
        statusLabel.frame = CGRect(x: 0, y: -40, width: screenBounds.width, height: 40)
        statusLabel.textColor = backgroundGreen
        statusLabel.backgroundColor = whiteColor
        statusLabel.textAlignment = .Center
        statusLabel.userInteractionEnabled = false
        statusLabel.hidden = true
        
        statusLabel.font = UIFont.systemFontOfSize(FONT_SIZE)
        statusLabel.minimumScaleFactor = 0.5
        statusLabel.adjustsFontSizeToFitWidth = true
        statusLabel.numberOfLines = 1
        addSubview(statusLabel)
    }
    
    func addCaptionField(){
        captionField.frame = CGRect(x: 0, y: screenBounds.height/8, width: screenBounds.width, height: screenBounds.height/15)
        captionField.backgroundColor = UIColor.colorWithAlphaComponent(whiteColor)(0.5)
        captionField.font = UIFont.systemFontOfSize(FONT_SIZE)
        captionField.placeholder = "Caption..."
        captionField.textAlignment = .Center
        captionField.autocorrectionType = .No
        captionField.delegate = self
        captionField.addGestureRecognizer(panGesture)
        captionField.userInteractionEnabled = true
       
        addSubview(captionField)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string) as NSString
        let textSize:CGSize = text.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(FONT_SIZE)])

        return textSize.width < textField.bounds.size.width
    }

    
    
}

