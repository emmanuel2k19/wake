//
//  secondViewController.swift
//  wakemeUIKit
//
//  Created by Emmanuel Pena on 1/2/24.
//

import UIKit
import AVFoundation
class secondViewController: UIViewController {
    
    
    @IBOutlet weak var digitalClockLabel: UILabel!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.datePickerMode = .time
        updateDigitalClockLabel()
        digitalClockLabel.font = UIFont(name: "Digital-7Mono", size: 45)
        updateDigitalClockLabel()
        setupAudioPlayer()
        
    }
    
    func setupAudioPlayer(){
        do {
                  if let path = Bundle.main.path(forResource: "tacobell-sound", ofType: "mp3") {
                      let url = URL(fileURLWithPath: path)
                      audioPlayer = try AVAudioPlayer(contentsOf: url)
                  }
              } catch {
                  print("Error initializing audio player: \(error.localizedDescription)")
              }
          
    }
    
    
    
    @IBAction func scheduleSound(_ sender: UIButton) {
        let selectedTime = timePicker.date
                let timeInterval = selectedTime.timeIntervalSinceNow

                // Schedule playback using a Timer
                let timer = Timer(timeInterval: timeInterval, target: self, selector: #selector(playScheduledSound), userInfo: nil, repeats: false)
                RunLoop.main.add(timer, forMode: .common)
            }
    
    @objc func playScheduledSound() {
        audioPlayer?.play()
    }
    
    
    
    
    
    func updateDigitalClockLabel() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "hh:mm:ss"
                    self.digitalClockLabel.text = dateFormatter.string(from: Date())
                }
            }
    }
    
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



