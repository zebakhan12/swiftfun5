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
    var audioPlayer : AVAudioPlayer?
    var audioURL : URL?
    
    
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
                self.audioURL = audioURL
                
                //3. create a dictionary of settings
                
                var settings : [String:Any] = [:]
                settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
                settings[AVSampleRateKey] = 44100.0
                settings[AVNumberOfChannelsKey] = 2
                
                //4. create audio recorder
                
                audioRecorder = try? AVAudioRecorder(url: audioURL, settings: settings)
                audioRecorder?.prepareToRecord()
                
            }
        }
        playTextField.isEnabled = false
        titleTextField.isEnabled = false
        addTextField.isEnabled = false
    }
    
    @IBAction func recordButtonTapped(_ sender: Any) {
        
        if let audioRecorder = self.audioRecorder{
            if audioRecorder.isRecording {
                audioRecorder.stop()
                recordTextField.setTitle("Record", for: .normal)
                playTextField.isEnabled = true
                titleTextField.isEnabled = true
                addTextField.isEnabled = true
            } else {
                audioRecorder.record()
                recordTextField.setTitle("Stop", for: .normal)
                playTextField.isEnabled = false
                titleTextField.isEnabled = false
                addTextField.isEnabled = false
            }
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if let audioURL = self.audioURL {
            audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.play()
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
}
