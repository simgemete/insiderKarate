package insider.swagger;

import com.intuit.karate.junit5.Karate;

class PetsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("pets").relativeTo(getClass());
    }    

}
