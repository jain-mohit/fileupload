//
//  ViewController.m
//  fileupload
//
//  Created by Mohit Jain on 5/8/13.
//  Copyright (c) 2013 Compuware. All rights reserved.
//

#import "ViewController.h"
#define BASE_URL http://localhost:8080/uploadFile/

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fetch:(id)sender {
 
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *serverUrl = @"http://localhost:8080/uploadFile/user/data/?id=2";
    
    NSURL *url = [[NSURL alloc] initWithString:
                  [serverUrl stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

// webservice request

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    
    data = [[NSMutableData alloc] init];
}

-(void)connection: (NSURLConnection *)connection didReceiveData:(NSData *)theData {
    [data appendData:theData];
}

-(void)connectionDidFinishLoading: (NSURLConnection*)connection {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"dict is %@",dictionary);
//    NSArray* bytesdata = [dictionary objectForKey:@"avatar"];
//    NSLog(@"class..%@", [[bytesdata objectAtIndex:0] class]);
//    NSData *imageData = [NSData dataWithBytes:(__bridge const void *)(bytesdata) length:[bytesdata count]];
//    NSLog(@"image data is %@",imageData);
//    UIImage *image = [UIImage imageWithData:imageData];
//    UIImage *i = [[UIImage alloc]initWithData:imageData];
//   self.img = [[UIImageView alloc] initWithImage:i];
    NSString *filepath = [dictionary objectForKey:@"filePath"];
    NSString *file = [NSString stringWithFormat:@"file://%@",filepath];
    //  UIImage *image = [UIImage imageWithContentsOfFile:filepath];
    // self.img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:filepath]];
    NSURL *imageurl = [NSURL URLWithString:file];
    

    NSData *imagedata = [[NSData alloc]initWithContentsOfURL:imageurl];
    
    UIImage *image = [UIImage imageWithData: imagedata];
    NSLog(@"image url is %@ data is %@ image is %@",imageurl, imagedata,image);
    [self.img setImage: image];
}


-(void)connection: (NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}



@end
