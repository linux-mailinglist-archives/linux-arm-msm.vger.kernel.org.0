Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7746045FD52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Nov 2021 08:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238805AbhK0H5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Nov 2021 02:57:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:42355 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352616AbhK0Hzg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Nov 2021 02:55:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="259654569"
X-IronPort-AV: E=Sophos;i="5.87,268,1631602800"; 
   d="scan'208";a="259654569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 23:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,268,1631602800"; 
   d="scan'208";a="675746632"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Nov 2021 23:50:44 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqsTr-0009E5-8C; Sat, 27 Nov 2021 07:50:43 +0000
Date:   Sat, 27 Nov 2021 15:49:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
Message-ID: <202111271507.zYc4AvpT-lkp@intel.com>
References: <20211126093529.31661-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126093529.31661-3-shawn.guo@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shawn-Guo/Add-Qualcomm-MPM-irqchip-driver-support/20211126-174350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 2258a6fc33d56227a981a45069fc651d85a0076f
config: arm64-buildonly-randconfig-r006-20211126 (https://download.01.org/0day-ci/archive/20211127/202111271507.zYc4AvpT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/c6f0c60a2d210e09a08be7a8f6e64d291fc708fd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Shawn-Guo/Add-Qualcomm-MPM-irqchip-driver-support/20211126-174350
        git checkout c6f0c60a2d210e09a08be7a8f6e64d291fc708fd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iio/ drivers/irqchip/ drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/qcom-mpm.c:389:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!mpm_gpio_domain) {
               ^~~~~~~~~~~~~~~~
   drivers/irqchip/qcom-mpm.c:422:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/irqchip/qcom-mpm.c:389:2: note: remove the 'if' if its condition is always false
           if (!mpm_gpio_domain) {
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/qcom-mpm.c:343:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +389 drivers/irqchip/qcom-mpm.c

   333	
   334	static int qcom_mpm_probe(struct platform_device *pdev)
   335	{
   336		struct irq_domain *parent_domain, *mpm_gic_domain, *mpm_gpio_domain;
   337		struct device *dev = &pdev->dev;
   338		struct device_node *np = dev->of_node;
   339		struct device_node *parent = of_irq_find_parent(np);
   340		struct qcom_mpm_priv *priv;
   341		unsigned int pin_num;
   342		int irq;
   343		int ret;
   344	
   345		/* See comments in platform_irqchip_probe() */
   346		if (parent && !irq_find_matching_host(parent, DOMAIN_BUS_ANY))
   347			return -EPROBE_DEFER;
   348	
   349		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   350		if (!priv)
   351			return -ENOMEM;
   352	
   353		priv->data = of_device_get_match_data(dev);
   354		if (!priv->data)
   355			return -ENODEV;
   356	
   357		pin_num = priv->data->pin_num;
   358		priv->pin_to_irq = devm_kcalloc(dev, pin_num, sizeof(*priv->pin_to_irq),
   359						GFP_KERNEL);
   360		if (!priv)
   361			return -ENOMEM;
   362	
   363		priv->reg_stride = DIV_ROUND_UP(pin_num, 32);
   364		spin_lock_init(&priv->lock);
   365	
   366		priv->base = devm_platform_ioremap_resource(pdev, 0);
   367		if (!priv->base)
   368			return PTR_ERR(priv->base);
   369	
   370		irq = platform_get_irq(pdev, 0);
   371		if (irq < 0)
   372			return irq;
   373	
   374		parent_domain = irq_find_host(parent);
   375		if (!parent_domain) {
   376			dev_err(dev, "failed to find MPM parent domain\n");
   377			return -ENXIO;
   378		}
   379	
   380		mpm_gic_domain = irq_domain_create_hierarchy(parent_domain, 0, pin_num,
   381					of_node_to_fwnode(np), &qcom_mpm_gic_ops, priv);
   382		if (!mpm_gic_domain) {
   383			dev_err(dev, "failed to create GIC domain\n");
   384			return -ENOMEM;
   385		}
   386	
   387		mpm_gpio_domain = irq_domain_create_linear(of_node_to_fwnode(np),
   388					pin_num, &qcom_mpm_gpio_ops, priv);
 > 389		if (!mpm_gpio_domain) {
   390			dev_err(dev, "failed to create GPIO domain\n");
   391			goto remove_gic_domain;
   392		}
   393	
   394		irq_domain_update_bus_token(mpm_gpio_domain, DOMAIN_BUS_WAKEUP);
   395	
   396		priv->mbox_client.dev = dev;
   397		priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
   398		if (IS_ERR(priv->mbox_chan)) {
   399			ret = PTR_ERR(priv->mbox_chan);
   400			dev_err(dev, "failed to acquire IPC channel: %d\n", ret);
   401			goto remove_gpio_domain;
   402		}
   403	
   404		ret = devm_request_irq(dev, irq, qcom_mpm_handler,
   405				       IRQF_TRIGGER_RISING | IRQF_NO_SUSPEND,
   406				       "qcom_mpm", priv);
   407		if (ret) {
   408			dev_err(dev, "failed to request irq: %d\n", ret);
   409			goto free_mbox;
   410		}
   411	
   412		dev_set_drvdata(dev, priv);
   413	
   414		return 0;
   415	
   416	free_mbox:
   417		mbox_free_channel(priv->mbox_chan);
   418	remove_gpio_domain:
   419		irq_domain_remove(mpm_gpio_domain);
   420	remove_gic_domain:
   421		irq_domain_remove(mpm_gic_domain);
   422		return ret;
   423	}
   424	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
