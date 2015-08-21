//
//  ViewController.swift
//  NSProgressExample
//
//  Created by Jaanus Kase on 14/08/15.
//  Copyright © 2015 Jaanus Kase. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, ProgressSheetInterface, ProgressSheetDelegate {

    // Use progress reporting because the sheet asks for our progress
    var progress = NSProgress()
    
    var worker1, worker2: NSWindowController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        worker1 = self.storyboard?.instantiateControllerWithIdentifier("Worker") as? NSWindowController
        worker2 = self.storyboard?.instantiateControllerWithIdentifier("Worker") as? NSWindowController
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func start(sender: AnyObject) {
        fixWindowPositions()
        worker1?.showWindow(self)
        worker2?.showWindow(self)
        
        progress = NSProgress()
        
        if let worker1 = worker1 as? ChildTaskInterface, worker2 = worker2 as? ChildTaskInterface {
            
//            progress.becomeCurrentWithPendingUnitCount(2)
            
            worker1.startTaskWithDuration(3)
            worker2.startTaskWithDuration(4)
            
//            progress.resignCurrent()
            
//            progress.addChild(worker1.progress, withPendingUnitCount: 3)
//            progress.addChild(worker2.progress, withPendingUnitCount: 4)
            
        }
        
        performSegueWithIdentifier("presentProgressSheet", sender: self)
    }
    
    func fixWindowPositions() {
        let myFrame = self.view.window?.frame as NSRect!
        
        let x = CGRectGetMaxX(myFrame!) + 32
        let y = CGRectGetMaxY(myFrame!)
        
        worker1?.window?.setFrameTopLeftPoint(NSPoint(x: x, y: y))

        let y2 = CGRectGetMinY((worker1!.window?.frame)!) - 32
        worker2?.window?.setFrameTopLeftPoint(NSPoint(x: x, y: y2))        
    }
    
    
    
    // MARK: - ProgressSheetInterface
    
    var sheetUserInteractive: Bool {
        get {
            return true
        }
    }
    
    var sheetLabel: String? {
        get {
            return nil
        }
    }
    
    
    
    // MARK: - ProgressSheetDelegate
    
    func cancel() {
        
    }
    
    func pause() {
        
    }
    
    func resume() {
        
    }
    
}
