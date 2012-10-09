//
//  ViewController.h
//  SocialFrameworkExample
//
//  Created by Lei Jing on 9/10/12.
//  Copyright (c) 2012 com.leijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLComposeViewController;

@interface ViewController : UIViewController
{
    SLComposeViewController *slComposerSheet;
}

@property (nonatomic) NSString *sharingText;
@property (nonatomic) UIImage *sharingImage;

@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *weiboButton;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;

- (IBAction)shareToFacebook:(id)sender;
- (IBAction)shareToTwitter:(id)sender;
- (IBAction)shareToWeibo:(id)sender;
- (IBAction)shareByActivity:(id)sender;

@end
