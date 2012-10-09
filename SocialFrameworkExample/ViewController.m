//
//  ViewController.m
//  SocialFrameworkExample
//
//  Created by Lei Jing on 9/10/12.
//  Copyright (c) 2012 com.leijing. All rights reserved.
//

#import "ViewController.h"

#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.sharingText = @"iOS SocialFramework test.";
    self.sharingImage = [UIImage imageNamed:@"ios6.jpg"];
    
    if([SLComposeViewController class] != nil)
    {
        [self setButtonStatus];
    } else {
        UIAlertView *osAlert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your iOS version is NOT 6, can't run the demo." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [osAlert show];
        NSLog(@"Your iOS version is below iOS6");
        self.facebookButton.enabled = NO;
        self.facebookButton.alpha = 0.5f;
        self.twitterButton.enabled = NO;
        self.twitterButton.alpha = 0.5f;
        self.weiboButton.enabled = NO;
        self.weiboButton.alpha = 0.5f;
    }
    if([SLComposeViewController class] == nil)
    {
        self.activityButton.enabled = NO;
        self.activityButton.alpha = 0.5f;
    }
}

- (void)viewDidUnload {
    [self setFacebookButton:nil];
    [self setTwitterButton:nil];
    [self setWeiboButton:nil];
    [self setActivityButton:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//check the services availability
- (void)setButtonStatus {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"Facebook service is available");
        self.facebookButton.enabled = YES;
        self.facebookButton.alpha = 1.0f;
    } else {
        NSLog(@"Facebook service is NOT available");
        self.facebookButton.enabled = NO;
        self.facebookButton.alpha = 0.5f;
    }
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"Twitter service is available");
        self.twitterButton.enabled = YES;
        self.twitterButton.alpha = 1.0f;
    } else {
        NSLog(@"Twitter service is NOT available");
        self.twitterButton.enabled = NO;
        self.twitterButton.alpha = 0.5f;
    }
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        NSLog(@"Weibo service is available");
        self.weiboButton.enabled = YES;
        self.weiboButton.alpha = 1.0f;
    } else {
        NSLog(@"Weibo service is NOT available");
        self.weiboButton.enabled = NO;
        self.weiboButton.alpha = 0.5f;
    }
}


#pragma mark -
#pragma mark button's actions

- (IBAction)shareToFacebook:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        slComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [slComposerSheet setInitialText:self.sharingText];
        [slComposerSheet addImage:self.sharingImage];
        [slComposerSheet addURL:[NSURL URLWithString:@"http://www.facebook.com/"]];
        [self presentViewController:slComposerSheet animated:YES completion:nil];
    }
    
    [slComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSLog(@"start completion block");
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Message" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];

}

- (IBAction)shareToTwitter:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        slComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [slComposerSheet setInitialText:self.sharingText];
        [slComposerSheet addImage:self.sharingImage];
        [slComposerSheet addURL:[NSURL URLWithString:@"http://www.twitter.com/"]];
        [self presentViewController:slComposerSheet animated:YES completion:nil];
    }
    
    [slComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSLog(@"start completion block");
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter Message" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];    
}

- (IBAction)shareToWeibo:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo])
    {
        slComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        [slComposerSheet setInitialText:self.sharingText];
        [slComposerSheet addImage:self.sharingImage];
        [slComposerSheet addURL:[NSURL URLWithString:@"http://www.weibo.com/"]];
        [self presentViewController:slComposerSheet animated:YES completion:nil];
    }
    
    [slComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSLog(@"start completion block");
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Weibo Message" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
}

- (IBAction)shareByActivity:(id)sender {
    NSArray *activityItems;
    
    if (self.sharingImage != nil) {
        activityItems = @[self.sharingText, self.sharingImage];
    } else {
        activityItems = @[self.sharingText];
    }
    
    UIActivityViewController *activityController =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:nil];
    
    [self presentViewController:activityController
                       animated:YES completion:nil];
}


@end
