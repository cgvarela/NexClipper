package com.nexcloud.view.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/kubernetes")
public class KubernetesView {
	static final Logger logger = LoggerFactory.getLogger(KubernetesView.class);

	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String dashboard() {
		return "kubernetes/dashboard";
	}
	
	@RequestMapping(value="/cluster", method=RequestMethod.GET)
	public String cluster() {
		return "kubernetes/cluster/view";
	}
	
	@RequestMapping(value="/cluster/detail", method=RequestMethod.GET)
	public String clusterDetail() {
		return "kubernetes/cluster/detail";
	}

	@RequestMapping(value="/node", method=RequestMethod.GET)
	public String node() {
		return "kubernetes/node/view";
	}
	
	@RequestMapping(value="/node/{nodeIp}/detail", method=RequestMethod.GET)
	public ModelAndView nodeDetail(@PathVariable(value="nodeIp", required=false) String nodeIp) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kubernetes/node/detail");
		mav.addObject("nodeIp", nodeIp);
		return mav;
	}

	@RequestMapping(value="/pod", method=RequestMethod.GET)
	public String pod() {
		return "kubernetes/pod/view";
	}
	
	@RequestMapping(value="/pod/{podName}/detail", method=RequestMethod.GET)
	public ModelAndView podDetail(@PathVariable(value="podName", required=false) String podName) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kubernetes/pod/detail");
		mav.addObject("podName", podName);
		return mav;
	}
	
}
