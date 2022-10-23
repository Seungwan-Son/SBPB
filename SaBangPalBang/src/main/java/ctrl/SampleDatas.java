package ctrl;

import javax.servlet.ServletContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import dao.Crawling;

/**
 * Application Lifecycle Listener implementation class sampleDatas
 *
 */
@WebListener
public class SampleDatas implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public SampleDatas() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
//    	ServletContext sc=sce.getServletContext();
//     sc.setAttribute("객체명", 객체);
//    	
//    	System.out.println("TestListener: contextInitialized(): 톰캣 시작이 감지");
//    	Crawling crawling =new Crawling();
//    	crawling.craw();
    }
	
}
