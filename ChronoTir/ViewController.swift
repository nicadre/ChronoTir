//
//  ViewController.swift
//  ChronoTir
//
//  Created by Nicolas CHEVALIER on 4/11/16.
//  Copyright © 2016 Nicolas CHEVALIER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var timePreference: UISwitch!

	var timer = NSTimer()
	var count = 10
	var tapRecognizer: UITapGestureRecognizer!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.manageTimer))
		self.view.addGestureRecognizer(tapRecognizer)
		self.initViewWithValue(10, andColor: UIColor.redColor())
		self.updateLabel()
	}

	//	timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.firstTimer), userInfo: nil, repeats: true)

	func updateLabel() {
		self.timeLabel.text = "\(self.count)"
	}

	func initViewWithValue(value: Int, andColor color: UIColor) {
		count = value
		self.view.backgroundColor = color
	}
	
	func firstTimer() {
		count -= 1
		updateLabel()

		if (count == 0) {
			// Play sound
			initViewWithValue(self.timePreference.on ? 240 : 120, andColor: UIColor.greenColor())
			updateLabel()
			timer.invalidate()
			timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
		}
	}
	
	func manageTimer() {
		if (timer.valid) {
			timer.invalidate()
			initViewWithValue(10, andColor: UIColor.redColor())
			updateLabel()
		} else {
			// Play sound
			timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.firstTimer), userInfo: nil, repeats: true)
		}
	}

	func timerAction() {
		count -= 1
		if (count == 0) {
			// Play sound
			self.view.backgroundColor = UIColor.redColor()
			timer.invalidate()
			initViewWithValue(10, andColor: UIColor.redColor())
		} else if (count <= 30) {
			self.view.backgroundColor = UIColor.yellowColor()
		} else {
			self.view.backgroundColor = UIColor.greenColor()
		}
		updateLabel()
	}

}
