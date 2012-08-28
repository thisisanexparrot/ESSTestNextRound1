//
//  ViewController.h
//  ESSYoutubeRound2
//
//  Created by Marlena Abraham on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESSYouTube.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (retain, nonatomic) NSURL *videoURL;
@property (retain) ESSYouTube *yt;

- (IBAction)uploadButton:(id)sender;

@end
