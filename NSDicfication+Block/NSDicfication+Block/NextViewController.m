//
//  NextViewController.m
//  NSDicfication+Block
//
//  Created by Jane on 10/16/15.
//  Copyright © 2015 Jane. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"next ViewController";
    self.navigationItem.rightBarButtonItem = [self rightBt];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIBarButtonItem *)rightBt
{
    UIBarButtonItem *rightBt = [[UIBarButtonItem alloc] initWithTitle:@"disMissView" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtClick:)];
    return rightBt;
}

-(void)rightBtClick:(UIBarButtonItem *)sender
{
    //NSDictionary *user = [[NSDictionary alloc] init];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"disMissView" object:nil];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"disMissView" object:@"actionNum"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"userName",@"user", nil];
    [self dismissViewControllerAnimated:YES completion:^(void){
        //传递的是一个String
        [[NSNotificationCenter defaultCenter] postNotificationName:@"disMissView" object:@"actionNum"];
        //传递的是一个字典对象
        [[NSNotificationCenter defaultCenter] postNotificationName:@"disMissViewWithNSDictionary" object:self userInfo:dic];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
