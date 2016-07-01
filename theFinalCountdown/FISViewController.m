//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()


@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.timerLabel.hidden = YES;
    self.datePicker.hidden = NO;
    self.pauseButtonLabel.enabled = YES;
    self.pauseButtonLabel.hidden = YES;
    self.cancelButton.enabled = NO;
    self.cancelButton.hidden = YES;
    self.resumeButton.enabled = NO;
    self.resumeButton.hidden = YES;
  
    
}

- (IBAction)startButton:(id)sender
{
    self.timerLabel.hidden = NO;
    self.datePicker.hidden = YES;
    self.pauseButtonLabel.enabled = YES;
    self.pauseButtonLabel.hidden = NO;
    self.cancelButton.enabled = YES;
    self.cancelButton.hidden = NO;
    self.startButtonLabel.hidden = YES;
    self.startButtonLabel.enabled = NO;
    self.resumeButton.hidden = YES;
    self.resumeButton.enabled = NO;
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startCounting) userInfo:nil repeats:YES];
    self.countDownInterval = (NSTimeInterval)self.datePicker.countDownDuration;
    self.remainder = self.countDownInterval;
    self.timerCountDown = self.countDownInterval - self.remainder % 60;
}

- (IBAction)pauseButton:(id)sender
{
    self.pauseButtonLabel.hidden = YES;
    self.pauseButtonLabel.enabled = YES;
    self.resumeButton.hidden = NO;
    self.resumeButton.enabled = YES;
    if (timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startCounting) userInfo:nil repeats:YES];
    }
    else
    {
        [timer invalidate];
        timer = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated
{


}

-(void)startCounting
{
    self.timerCountDown--;
    
    NSUInteger hours = self.timerCountDown / (60 * 60);
    NSUInteger minutes = (self.timerCountDown / 60) - (hours * 60);
    NSUInteger seconds = self.timerCountDown - (60 * minutes) - (60 * hours * 60);
    
    if(hours == 0)
    {
        self.timerLabel.text  = [NSString stringWithFormat:@"0%lu : %lu", minutes, seconds];
    }
    
    else if (hours < 10 && minutes < 10 && seconds < 10)
    {
        self.timerLabel.text = [NSString stringWithFormat:@"0%lu : 0%lu : 0%lu", hours, minutes, seconds];
    }
    else if(minutes < 10 && seconds > 9 && hours < 10)
    {
        self.timerLabel.text = [NSString stringWithFormat:@"0%lu : 0%lu : %lu", hours, minutes, seconds];
    }
    else if(minutes > 9 && seconds > 9 && hours < 10)
    {
        self.timerLabel.text = [NSString stringWithFormat:@"0%lu : %lu : %lu", hours, minutes, seconds];
    }
    else if(minutes > 9 && seconds < 10 && hours < 10)
    {
        self.timerLabel.text = [NSString stringWithFormat:@"0%lu : %lu : %lu", hours, minutes, seconds];
    }
    else if(minutes > 9 && seconds > 9 && hours > 9)
    {
        self.timerLabel.text = [NSString stringWithFormat:@"%lu : %lu : %lu", hours, minutes, seconds];
    }
    
        if (seconds == 0 && minutes == 0 && hours == 0)
        {
            self.timerLabel.text = @"Times Up!";
            [timer invalidate];
        }

}
- (IBAction)cancelButton:(id)sender
{
    self.pauseButtonLabel.enabled = NO;
    self.startButtonLabel.hidden = NO;
    self.startButtonLabel.enabled = YES;
    self.cancelButton.hidden = YES;
    self.timerLabel.hidden = YES;
    self.datePicker.hidden = NO;
    
    [timer invalidate];}

- (IBAction)resumeButton:(id)sender
{
    self.resumeButton.hidden = YES;
    self.resumeButton.enabled = NO;
    self.pauseButtonLabel.hidden = NO;
    self.pauseButtonLabel.enabled = YES;
    
    //[timer fireDate]; doesnt work =[
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startCounting) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
