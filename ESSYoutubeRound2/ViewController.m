//
//  ViewController.m
//  ESSYoutubeRound2
//
//  Created by Marlena Abraham on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end


@implementation ViewController

@synthesize videoURL;
@synthesize yt;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)uploadButton:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;    
    imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
    
    [self presentModalViewController:imagePicker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *youTubeAPIKey = [NSString stringWithString:@"AI39si49vyxKrytc91B-twvW4z56pxs6jxlRkP28wyiIh0G3ytVgq2Bqajasr2Ju-lUKS_PnRfsYFP2iplzcur_1Zu7HtDFw7A"];
    
    self.yt = [[[ESSYouTube alloc] initWithDelegate:self
									   developerKey:youTubeAPIKey] autorelease];

    if ([info objectForKey:UIImagePickerControllerMediaURL] != nil) {
        NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
        NSLog(@"URL: %@", url);
        [self dismissModalViewControllerAnimated:YES];
        
        [self.yt performSelector:@selector(uploadVideoAtURL:) withObject:url afterDelay:1.0];
    }
    
    
}

- (UIViewController *)ESSYouTubeNeedsCurrentViewControllerToAttachTo:(ESSYouTube *)youtube{
    return self;
}


@end
