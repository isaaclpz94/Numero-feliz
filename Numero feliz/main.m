//
//  main.m
//  Numero feliz
//
//  Created by Isaac Mac on 12/9/16.
//  Copyright (c) 2016 Isaac Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variables
        int res;
        NSMutableArray *array = [[NSMutableArray alloc] init];
        Boolean primera = true;
        NSString *cadena;
        
        //Guardamos la cadena de numeros
        const char *numeroC = argv[1];
        
        do{
            if(primera){
                //La pasamos a NSString para poder separarla con la funcion characterAtIndex
                cadena = [NSString stringWithCString: numeroC encoding:(NSUTF8StringEncoding)];
                primera = false;
            }else{
                //pasamos de res a string
                cadena = [NSString stringWithFormat:@"%d", res];
            }
            
            NSLog(@"La cadena es esta: %@", cadena);
            
            //Recorremos los valores
            for(int i=0 ; i < [cadena length] ; i++){
                //Extraigo un valor
                unichar caracterC = [cadena characterAtIndex:i];
                
                //Lo convierto a NSUinteger
                NSUInteger *numero = [[NSString stringWithFormat:@"%c", caracterC] integerValue];
                
                //Lo convierto a NSNumber para poder meterlo en el array
                NSNumber *num = [NSNumber numberWithInteger:numero];
                
                //Lo meto en el array
                [array addObject: num];
            }
            
            NSLog(@"Valores numéricos separados: %@", array);
        
            //Aquí voy a recorrer el array para ir obteniendo la suma de sus valores
            int sumando = 0;
            for(NSNumber *numero in array){
                int numeroActual = [numero intValue];
                sumando += numeroActual;
            }
            res = sumando;
            array = [[NSMutableArray alloc] init];
            
        } while (res >= 10);
        
        NSLog(@"Crápulo: %d", res);
        
        return 0;
    }
}
