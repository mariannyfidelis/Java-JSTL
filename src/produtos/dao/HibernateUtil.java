package produtos.dao;

import produtos.modelo.Produto;
import produtos.modelo.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

	private static final SessionFactory sessionFactory;

	static {

		AnnotationConfiguration configuration = new AnnotationConfiguration();
		configuration.addAnnotatedClass(Produto.class);
		configuration.addAnnotatedClass(Usuario.class);
		sessionFactory = configuration.buildSessionFactory();

	}

	public Session openSession() {
		return sessionFactory.openSession();
	}
}