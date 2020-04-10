Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4421A4786
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 16:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgDJOfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 10:35:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:15156 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgDJOfr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 10:35:47 -0400
IronPort-SDR: 3McL4GqwpyXGBCwM11Hfyt6wfdzPzt4wi9bQxxz9oFbcuvJeYNYMAQodNAzzWfhbq0jLr/7WmQ
 FTQgihf/UDUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2020 07:35:47 -0700
IronPort-SDR: zbr0ICL8riBJrAXbriEa/9w1ujdIoqqgAGMjnLyN9w4Nec3cKPTFsGtKgxVvoM//J3X4m11JrW
 N6k7oPxJliCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,367,1580803200"; 
   d="scan'208";a="260698530"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Apr 2020 07:35:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jMukq-000Dv4-1O; Fri, 10 Apr 2020 22:35:36 +0800
Date:   Fri, 10 Apr 2020 22:35:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, qperret@google.com, bsegall@google.com,
        mgorman@suse.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, khilman@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, lukasz.luba@arm.com,
        patrick.bellasi@matbug.net, orjan.eide@arm.com,
        rdunlap@infradead.org, mka@chromium.org
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than
 CPUs in Energy Model
Message-ID: <202004102201.DHeSXu2d%lkp@intel.com>
References: <20200410084210.24932-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-5-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Lukasz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20200409]
[cannot apply to pm/linux-next tip/sched/core linus/master linux/master v5.6 v5.6-rc7 v5.6-rc6 v5.6]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Lukasz-Luba/Add-support-for-devices-in-the-Energy-Model/20200410-172456
base:    873e37a44b1ee8ad4628ca257dc51c0c7c654326

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/power/energy_model.c:394:15: warning: Variable 'ret' is assigned a value that is never used. [unreadVariable]
    int cpu, ret = 0;
                 ^

vim +/ret +394 kernel/power/energy_model.c

27871f7a8a341e Quentin Perret  2018-12-03  370  
27871f7a8a341e Quentin Perret  2018-12-03  371  /**
b4dc5cca354b8a Lukasz Luba     2020-04-10  372   * em_dev_register_perf_domain() - Register the Energy Model (EM) for a device
b4dc5cca354b8a Lukasz Luba     2020-04-10  373   * @dev		: Device for which the EM is to register
1ccc27ced21bf5 Lukasz Luba     2020-04-10  374   * @nr_states	: Number of performance states to register
27871f7a8a341e Quentin Perret  2018-12-03  375   * @cb		: Callback functions providing the data of the Energy Model
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  376   * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
b4dc5cca354b8a Lukasz Luba     2020-04-10  377   *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
b4dc5cca354b8a Lukasz Luba     2020-04-10  378   *		type of devices this should be set to NULL.
27871f7a8a341e Quentin Perret  2018-12-03  379   *
27871f7a8a341e Quentin Perret  2018-12-03  380   * Create Energy Model tables for a performance domain using the callbacks
27871f7a8a341e Quentin Perret  2018-12-03  381   * defined in cb.
27871f7a8a341e Quentin Perret  2018-12-03  382   *
27871f7a8a341e Quentin Perret  2018-12-03  383   * If multiple clients register the same performance domain, all but the first
27871f7a8a341e Quentin Perret  2018-12-03  384   * registration will be ignored.
27871f7a8a341e Quentin Perret  2018-12-03  385   *
27871f7a8a341e Quentin Perret  2018-12-03  386   * Return 0 on success
27871f7a8a341e Quentin Perret  2018-12-03  387   */
b4dc5cca354b8a Lukasz Luba     2020-04-10  388  int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  389  				struct em_data_callback *cb, cpumask_t *cpus)
27871f7a8a341e Quentin Perret  2018-12-03  390  {
27871f7a8a341e Quentin Perret  2018-12-03  391  	unsigned long cap, prev_cap = 0;
27871f7a8a341e Quentin Perret  2018-12-03  392  	struct em_perf_domain *pd;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  393  	struct em_device *em_dev;
27871f7a8a341e Quentin Perret  2018-12-03 @394  	int cpu, ret = 0;
27871f7a8a341e Quentin Perret  2018-12-03  395  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  396  	if (!dev || !nr_states || !cb)
27871f7a8a341e Quentin Perret  2018-12-03  397  		return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  398  
27871f7a8a341e Quentin Perret  2018-12-03  399  	/*
27871f7a8a341e Quentin Perret  2018-12-03  400  	 * Use a mutex to serialize the registration of performance domains and
27871f7a8a341e Quentin Perret  2018-12-03  401  	 * let the driver-defined callback functions sleep.
27871f7a8a341e Quentin Perret  2018-12-03  402  	 */
27871f7a8a341e Quentin Perret  2018-12-03  403  	mutex_lock(&em_pd_mutex);
27871f7a8a341e Quentin Perret  2018-12-03  404  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  405  	em_dev = _em_dev_find_existing(dev);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  406  	if (em_dev) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  407  		mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  408  		dev_dbg(dev, "EM: found exisiting pd%d\n", em_dev->id);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  409  		return -EEXIST;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  410  	}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  411  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  412  	if (_is_cpu_device(dev)) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  413  		if (!cpus) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  414  			mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  415  			dev_err(dev, "EM: invalid CPU mask\n");
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  416  			return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  417  		}
27871f7a8a341e Quentin Perret  2018-12-03  418  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  419  		/* Make sure we don't register domain for existing CPUs */
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  420  		if (em_cpus_pd_exist(cpus)) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  421  			mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  422  			return -EEXIST;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  423  		}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  424  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  425  		for_each_cpu(cpu, cpus) {
27871f7a8a341e Quentin Perret  2018-12-03  426  			/*
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  427  			 * All CPUs of a domain must have the same
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  428  			 * micro-architecture since they all share the same
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  429  			 * table.
27871f7a8a341e Quentin Perret  2018-12-03  430  			 */
8ec59c0f5f4966 Vincent Guittot 2019-06-17  431  			cap = arch_scale_cpu_capacity(cpu);
27871f7a8a341e Quentin Perret  2018-12-03  432  			if (prev_cap && prev_cap != cap) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  433  				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  434  					cpumask_pr_args(cpus));
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  435  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  436  				mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  437  				return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  438  			}
27871f7a8a341e Quentin Perret  2018-12-03  439  			prev_cap = cap;
27871f7a8a341e Quentin Perret  2018-12-03  440  		}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  441  	}
27871f7a8a341e Quentin Perret  2018-12-03  442  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  443  	pd = em_create_pd(dev, nr_states, cb, cpus);
27871f7a8a341e Quentin Perret  2018-12-03  444  	if (!pd) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  445  		mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  446  		return -EINVAL;
27871f7a8a341e Quentin Perret  2018-12-03  447  	}
27871f7a8a341e Quentin Perret  2018-12-03  448  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  449  	em_dev = kzalloc(sizeof(struct em_device), GFP_KERNEL);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  450  	if (!em_dev) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  451  		ret = -ENOMEM;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  452  		goto free_pd;
27871f7a8a341e Quentin Perret  2018-12-03  453  	}
27871f7a8a341e Quentin Perret  2018-12-03  454  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  455  	em_dev->id = ida_simple_get(&em_dev_ida, 0, 0, GFP_KERNEL);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  456  	if (em_dev->id < 0) {
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  457  		ret = em_dev->id;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  458  		goto free_em_dev;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  459  	}
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  460  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  461  	em_dev->em_pd = pd;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  462  	em_dev->dev = dev;
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  463  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  464  	kref_init(&em_dev->kref);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  465  	list_add(&em_dev->em_dev_list, &em_pd_dev_list);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  466  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  467  	em_debug_create_pd(em_dev);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  468  	dev_dbg(dev, "EM: created perf domain pd%d\n", em_dev->id);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  469  
27871f7a8a341e Quentin Perret  2018-12-03  470  	mutex_unlock(&em_pd_mutex);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  471  	return 0;
27871f7a8a341e Quentin Perret  2018-12-03  472  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  473  free_em_dev:
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  474  	kfree(em_dev);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  475  free_pd:
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  476  	kfree(pd->table);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  477  	kfree(pd);
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  478  
9cf8494b5f4eb8 Lukasz Luba     2020-04-10  479  	mutex_unlock(&em_pd_mutex);
27871f7a8a341e Quentin Perret  2018-12-03  480  	return ret;
27871f7a8a341e Quentin Perret  2018-12-03  481  }
b4dc5cca354b8a Lukasz Luba     2020-04-10  482  EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
b4dc5cca354b8a Lukasz Luba     2020-04-10  483  

:::::: The code at line 394 was first introduced by commit
:::::: 27871f7a8a341ef5c636a337856369acf8013e4e PM: Introduce an Energy Model management framework

:::::: TO: Quentin Perret <quentin.perret@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
