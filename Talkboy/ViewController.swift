//
//  ViewController.swift
//  Talkboy
//
//  Created by Zeba Hashimi on 5/8/18.
//  Copyright © 2018 Zeba Khan. All rights reserved.
//

//first step is to add the capability to record audio

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var recordTextField: UIButton!
    
    @IBOutlet weak var playTextField: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addTextField: UIButton!
    
    var audioRecorder : AVAudioRecorder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. create an audio session
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try? session.overrideOutputAudioPort(.speaker)
        try? session.setActive(true)
        
        //2. URL to save audio (place in file system to save audio)
        if let basePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            //create a path component
            let pathComponents = [basePath, "audio.m4a"]
            //merge to create audio URL
            if let audioURL = NSURL.fileURL(withPathComponents: pathComponents) {
                
                //3. create some settings
                
                //4. create audio recorder
                
                audioRecorder = AVAudioRecorder(url: audioURL, settings: <#T##[String : Any]#>)
                audioRecorder?.prepareToRecord()
            
            }
        }
    }
    
    @IBAction func recordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
}
