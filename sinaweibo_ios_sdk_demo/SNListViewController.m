//
//  SNListViewController.m
//  sinaweibo_ios_sdk_demo
//
//  Created by wgdadmin on 13-1-30.
//  Copyright (c) 2013年 SINA. All rights reserved.
//

#import "SNListViewController.h"

@interface SNListViewController ()

@end

@implementation SNListViewController

@synthesize weiBo;

-(void)dealloc
{
    [weiBo release];
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    pageIndex = 1;
    [self getFollowers:0];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView
{
    UIView *temp = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = temp;
    self.view.backgroundColor = [UIColor whiteColor];
    [temp release];
}

#pragma mark --SinaWeiBoDelegate
//- (void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response;
//- (void)request:(SinaWeiboRequest *)request didReceiveRawData:(NSData *)data;

-getFollowers:(int )cursor
{
    NSString *url = @"friendships/followers.json";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"李开复" forKey:@"screen_name"];
    NSString *cursorStr = [NSString stringWithFormat:@"%d",cursor*50];
    [dic setObject:cursorStr forKey:@"cursor"];
    [self.weiBo requestWithURL:url params:dic httpMethod:@"GET" delegate:self];
    [dic release];
}
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"error :%@",error);
}

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    NSLog(@"result:%@",result);
}
@end
