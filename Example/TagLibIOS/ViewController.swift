//
//  ViewController.swift
//  TagLibIOS
//
//  Created by lemonhead94 on 08/14/2018.
//  Copyright (c) 2018 lemonhead94. All rights reserved.
//

import UIKit
import TagLibIOS

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileManager = FileManager.default
        let audioExtension = "flac"
        let audioFilePath = getDocumentsDirectory().appendingPathComponent("\(randomString(length: 5)).\(audioExtension)")
        
        let resourcePath = URL(fileURLWithPath: Bundle.main.path(forResource: "audio", ofType: audioExtension)!)
        do {
            try fileManager.copyItem(at: resourcePath, to: audioFilePath)
        } catch{
            print("Error for file write")
        }
        
        print("--------------------------------------------------------------------------------------")
        print("--- Original File - \(resourcePath.lastPathComponent)")
        print("--------------------------------------------------------------------------------------")
        let audio = TLAudio(fileAtPath: audioFilePath.path)!
        audio.audioProperties.forEach { print("audio.audioProperties key -> \($0) value -> \($1)") }
        audio.allTags.forEach { print("audio.allTags key -> \($0) value -> \($1)") }
        print("audio.frontCoverPicture.byteCount = \(audio.frontCoverPicture?.count ?? 0)")
        print("audio.artistPicture.byteCount = \(audio.artistPicture?.count ?? 0)")
        
        audio.title = "exampleTitle"
        audio.artist = "exampleArtist"
        audio.album = "exampleAlbum"
        audio.comment = "exampleComment"
        audio.genre = "exampleGenre"
        audio.year = 2001
        audio.track = 1
        //--- some tag editors store the album artist with a space, some don't, both work, so...
        audio.updateTag("ALBUMARTIST", stringValue: "exampleAlbumArtist")
        audio.updateTag("ALBUM ARTIST", stringValue: "example Album Artist")
        audio.updateTag("DISCNUMBER", stringValue: "1")
        audio.updateTag("TOTALDISCS", stringValue: "2")
        audio.updateTag("TOTALTRACKS", stringValue: "15")
        
        let imageDataURL = URL(fileURLWithPath: Bundle.main.path(forResource: "coverArt", ofType: "png")!)
        if let image = UIImage(contentsOfFile: imageDataURL.path) {
            audio.frontCoverPicture = image.jpegData(compressionQuality: 0.95)
            audio.artistPicture = image.jpegData(compressionQuality: 0.95)
        }
        
        let status = audio.save()
        print("")
        print("File modifications saved \n\tStatus -> \(status)\n\tPath -> \(audioFilePath.path)")
        print("")
        
        print("--------------------------------------------------------------------------------------")
        print("--- Edited File - \(audioFilePath.lastPathComponent)")
        print("--------------------------------------------------------------------------------------")
        let newAudio = TLAudio(fileAtPath: audioFilePath.path)!
        newAudio.audioProperties.forEach { print("newAudio.audioProperties key -> \($0) value -> \($1)") }
        newAudio.allTags.forEach { print("newAudio.allTags key -> \($0) value -> \($1)") }
        print("newAudio.frontCoverPicture.byteCount = \(newAudio.frontCoverPicture?.count ?? 0)")
        print("newAudio.artistPicture.byteCount = \(newAudio.artistPicture?.count ?? 0)")

        print("newAudio.title = \(newAudio.title!)")
        print("newAudio.artist = \(newAudio.artist!)")
        print("newAudio.album = \(newAudio.album!)")
        print("newAudio.comment = \(newAudio.comment!)")
        print("newAudio.genre = \(newAudio.genre!)")
        print("newAudio.year = \(newAudio.year!)")
        print("newAudio.track = \(newAudio.track!)")
        //--- some tag editors store the following with a space, some don't, both work, so...
        print("newAudio.allTags[\"ALBUMARTIST\"] = \(newAudio.allTags["ALBUMARTIST"] ?? "")")
        print("newAudio.allTags[\"ALBUM ARTIST\"] = \(newAudio.allTags["ALBUM ARTIST"] ?? "")")
        print("newAudio.allTags[\"DISCNUMBER\"] = \(newAudio.allTags["DISCNUMBER"] ?? "")")
        print("newAudio.allTags[\"TOTALDISCS\"] = \(newAudio.allTags["TOTALDISCS"] ?? "")")
        print("newAudio.allTags[\"TOTALTRACKS\"] = \(newAudio.allTags["TOTALTRACKS"] ?? "")")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
}

