Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B2A1F18D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 14:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgFHMeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 08:34:44 -0400
Received: from foss.arm.com ([217.140.110.172]:52186 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgFHMeo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 08:34:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F87B1FB;
        Mon,  8 Jun 2020 05:34:43 -0700 (PDT)
Received: from [10.37.12.95] (unknown [10.37.12.95])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25CD83F52E;
        Mon,  8 Jun 2020 05:34:39 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     lkp@intel.com, Dan Carpenter <error27@gmail.com>,
        kbuild-all@lists.01.org, Dietmar.Eggemann@arm.com,
        cw00.choi@samsung.com
References: <20200608115155.GY30374@kadam>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <b347fb60-46d3-e59c-59fa-a2b10932fc49@arm.com>
Date:   Mon, 8 Jun 2020 13:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200608115155.GY30374@kadam>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dan,

Thank you for your analyzes.

On 6/8/20 12:51 PM, Dan Carpenter wrote:
> Hi Lukasz,
> 
> I love your patch! Perhaps something to improve:
> 
> url:    https://github.com/0day-ci/linux/commits/Lukasz-Luba/Add-support-for-devices-in-the-Energy-Model/20200527-180614
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> 
> config: i386-randconfig-m021-20200605 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> kernel/power/energy_model.c:316 em_dev_register_perf_domain() error: we previously assumed 'dev->em_pd' could be null (see line 277)
> 
> # https://github.com/0day-ci/linux/commit/110d050cb7ba1c96e63ada498979d1fd99529be2
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout 110d050cb7ba1c96e63ada498979d1fd99529be2
> vim +316 kernel/power/energy_model.c
> 
> 0e294e607adaf3 Lukasz Luba     2020-05-27  262  int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
> 110d050cb7ba1c Lukasz Luba     2020-05-27  263  				struct em_data_callback *cb, cpumask_t *cpus)
> 27871f7a8a341e Quentin Perret  2018-12-03  264  {
> 27871f7a8a341e Quentin Perret  2018-12-03  265  	unsigned long cap, prev_cap = 0;
> 110d050cb7ba1c Lukasz Luba     2020-05-27  266  	int cpu, ret;
> 27871f7a8a341e Quentin Perret  2018-12-03  267
> 110d050cb7ba1c Lukasz Luba     2020-05-27  268  	if (!dev || !nr_states || !cb)
> 27871f7a8a341e Quentin Perret  2018-12-03  269  		return -EINVAL;
> 27871f7a8a341e Quentin Perret  2018-12-03  270
> 27871f7a8a341e Quentin Perret  2018-12-03  271  	/*
> 27871f7a8a341e Quentin Perret  2018-12-03  272  	 * Use a mutex to serialize the registration of performance domains and
> 27871f7a8a341e Quentin Perret  2018-12-03  273  	 * let the driver-defined callback functions sleep.
> 27871f7a8a341e Quentin Perret  2018-12-03  274  	 */
> 27871f7a8a341e Quentin Perret  2018-12-03  275  	mutex_lock(&em_pd_mutex);
> 27871f7a8a341e Quentin Perret  2018-12-03  276
> 110d050cb7ba1c Lukasz Luba     2020-05-27 @277  	if (dev->em_pd) {
>                                                              ^^^^^^^^^^
> Check for NULL.
> 
> 27871f7a8a341e Quentin Perret  2018-12-03  278  		ret = -EEXIST;
> 27871f7a8a341e Quentin Perret  2018-12-03  279  		goto unlock;
> 27871f7a8a341e Quentin Perret  2018-12-03  280  	}
> 27871f7a8a341e Quentin Perret  2018-12-03  281
> 110d050cb7ba1c Lukasz Luba     2020-05-27  282  	if (_is_cpu_device(dev)) {
> 110d050cb7ba1c Lukasz Luba     2020-05-27  283  		if (!cpus) {
> 110d050cb7ba1c Lukasz Luba     2020-05-27  284  			dev_err(dev, "EM: invalid CPU mask\n");
> 110d050cb7ba1c Lukasz Luba     2020-05-27  285  			ret = -EINVAL;
> 110d050cb7ba1c Lukasz Luba     2020-05-27  286  			goto unlock;
> 110d050cb7ba1c Lukasz Luba     2020-05-27  287  		}
> 110d050cb7ba1c Lukasz Luba     2020-05-27  288
> 110d050cb7ba1c Lukasz Luba     2020-05-27  289  		for_each_cpu(cpu, cpus) {
> 110d050cb7ba1c Lukasz Luba     2020-05-27  290  			if (em_cpu_get(cpu)) {
> 110d050cb7ba1c Lukasz Luba     2020-05-27  291  				dev_err(dev, "EM: exists for CPU%d\n", cpu);
> 110d050cb7ba1c Lukasz Luba     2020-05-27  292  				ret = -EEXIST;
> 110d050cb7ba1c Lukasz Luba     2020-05-27  293  				goto unlock;
> 110d050cb7ba1c Lukasz Luba     2020-05-27  294  			}
> 27871f7a8a341e Quentin Perret  2018-12-03  295  			/*
> 110d050cb7ba1c Lukasz Luba     2020-05-27  296  			 * All CPUs of a domain must have the same
> 110d050cb7ba1c Lukasz Luba     2020-05-27  297  			 * micro-architecture since they all share the same
> 110d050cb7ba1c Lukasz Luba     2020-05-27  298  			 * table.
> 27871f7a8a341e Quentin Perret  2018-12-03  299  			 */
> 8ec59c0f5f4966 Vincent Guittot 2019-06-17  300  			cap = arch_scale_cpu_capacity(cpu);
> 27871f7a8a341e Quentin Perret  2018-12-03  301  			if (prev_cap && prev_cap != cap) {
> 110d050cb7ba1c Lukasz Luba     2020-05-27  302  				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
> 110d050cb7ba1c Lukasz Luba     2020-05-27  303  					cpumask_pr_args(cpus));
> 110d050cb7ba1c Lukasz Luba     2020-05-27  304
> 27871f7a8a341e Quentin Perret  2018-12-03  305  				ret = -EINVAL;
> 27871f7a8a341e Quentin Perret  2018-12-03  306  				goto unlock;
> 27871f7a8a341e Quentin Perret  2018-12-03  307  			}
> 27871f7a8a341e Quentin Perret  2018-12-03  308  			prev_cap = cap;
> 27871f7a8a341e Quentin Perret  2018-12-03  309  		}
> 110d050cb7ba1c Lukasz Luba     2020-05-27  310  	}
> 27871f7a8a341e Quentin Perret  2018-12-03  311
> 110d050cb7ba1c Lukasz Luba     2020-05-27  312  	ret = em_create_pd(dev, nr_states, cb, cpus);
> 
> 
> If it's a _is_cpu_device() then it iterates through a bunch of devices
> and sets up cpu_dev->em_pd for each.  Presumably one of the devices is
> "dev" or this would crash pretty early on in testing?

Yes, all of the devices taken from 'cpus' mask will get the em_pd set
including the suspected @dev.
To calm down this static analyzer I can remove the 'else'
in line 204 to make 'dev->em_pd = pd' set always.
199         if (_is_cpu_device(dev))
200                 for_each_cpu(cpu, cpus) {
201                         cpu_dev = get_cpu_device(cpu);
202                         cpu_dev->em_pd = pd;
203                 }
204         else
205                 dev->em_pd = pd;


Do you think it's a good solution and will work for this tool?

Regards,
Lukasz

> 
> 110d050cb7ba1c Lukasz Luba     2020-05-27  313  	if (ret)
> 27871f7a8a341e Quentin Perret  2018-12-03  314  		goto unlock;
> 27871f7a8a341e Quentin Perret  2018-12-03  315
> 110d050cb7ba1c Lukasz Luba     2020-05-27 @316  	em_debug_create_pd(dev);
>                                                                             ^^^
> Dereferences dev->em_pd.
> 
> 110d050cb7ba1c Lukasz Luba     2020-05-27  317  	dev_info(dev, "EM: created perf domain\n");
> 27871f7a8a341e Quentin Perret  2018-12-03  318
> 27871f7a8a341e Quentin Perret  2018-12-03  319  unlock:
> 27871f7a8a341e Quentin Perret  2018-12-03  320  	mutex_unlock(&em_pd_mutex);
> 27871f7a8a341e Quentin Perret  2018-12-03  321  	return ret;
> 27871f7a8a341e Quentin Perret  2018-12-03  322  }
> 0e294e607adaf3 Lukasz Luba     2020-05-27  323  EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
