/*
    purpose: This file contains how to read from a file
    Author: Karim Mahmoud Kamal
    Date:    7th of February 2024
*/

module read_from_file();

    int map[string];
    int min_a, max_a;

    initial begin
        int myfile;
        int i;
        string s;
        
        // The handler of the file
        // r: in read mode
        myfile = $fopen("map.txt","r");

        // check the end of file
        while( ! $feof(myfile) ) begin
            // read the elements from the file
            $fscanf(myfile, "%d  %s", i , s );
            map[s] = i;
        end

        $fclose(myfile);

        min_a = map["min_address"];
        $display("%0d",min_a);

        if( map.exists("max_Address") )
            max_a = map["max_Address"];
        else
            max_a = 1000;

        $display(map);

        $display( "%0d           %0d", min_a, max_a );

        // Each file has a unique handler e.g. 8000 0003
        $display( "%0d", myfile);


    end

endmodule