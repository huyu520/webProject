package com.cjg.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.HibernateTemplate;


public abstract class CommonDao<T> {
 @Resource
 private HibernateTemplate hibernateTemplate;
 @Resource
 private SessionFactory sessionFactory;
 private Class<T> entityClass;

 public HibernateTemplate getHibernateTemplate() {
  return hibernateTemplate;
 }

 public SessionFactory getSessionFactory() {
  return sessionFactory;
 }

 public Session getSession() {
  Session session = sessionFactory.getCurrentSession();
  return session;
 }

 public Criteria getCriteria() {
  Criteria criteria = getSession().createCriteria(entityClass);
  return criteria;
 }

 @SuppressWarnings({ "unchecked", "rawtypes" })
 public CommonDao() {
  Class c = getClass();
  Type type = c.getGenericSuperclass();
  if (type instanceof ParameterizedType) {
   Type[] types = ((ParameterizedType) type).getActualTypeArguments();
   entityClass = (Class<T>) types[0];
  }
 }

 /**
  * �����¼.
  *
  * @param entity
  */
 public void save(T entity) {
  getSession().save(entity);
 }

 /**
  * ���¼�¼.
  *
  * @param entity
  */
 public void update(T entity) {
  getSession().update(entity);
 }

 /**
  * ȡ��ָ��ID�Ķ���.
  *
  * @param entityClass
  * @param id
  * @return
  */
 @SuppressWarnings("unchecked")
 public T get(Serializable id) {
  T t = (T) getSession().get(entityClass, id);
  return t;
 }

 /**
  * ɾ��һ������.
  *
  * @param entity
  */
 public void delete(T entity) {
  getSession().delete(entity);
 }

 /**
  * ȡ�ñ���ܼ�¼��
  *
  * @return
  */
 public Long getCount(Criteria criteria) {
  criteria.setProjection(Projections.rowCount());
  Long totalCount = (Long) criteria.uniqueResult();
  return totalCount;
 }

 /**
  * ȡ��ָ��ҳ�ļ�¼
  */
 @SuppressWarnings("unchecked")
 public List<T> listByPage(Criteria criteria, int pageNo, int pageSize) {
  int firstResult = (pageNo - 1) * pageSize;
  criteria.setFirstResult(firstResult);
  criteria.setMaxResults(pageSize);
  List<T> list = criteria.list();
  return list;
 }

// public Page<T> getPage(Criteria criteria, int pageNo, int pageSize) {
//  // ����ܼ�¼��.
//  Long total = getCount(criteria);
//  Page<T> page = new Page<T>(pageNo, pageSize, total);
//  // ���ҵ�ǰҳ��¼.
//  List<T> list = listByPage(criteria, pageNo, pageSize);
//  
//  page.setList(list);
//  return page;
// }
}
