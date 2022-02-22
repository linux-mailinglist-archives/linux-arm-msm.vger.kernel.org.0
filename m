Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019AD4C04A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 23:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbiBVWah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 17:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbiBVWag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 17:30:36 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9757A107A80;
        Tue, 22 Feb 2022 14:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645569010; x=1677105010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xNrJu+yqd7ua9/SEuv5UXQMlKTb2A3rhgHibGD43eDA=;
  b=fwFbKn2EdqS4n+FSU3xwEEEWMu6Ss65sEKQ13ZUMXLDq8Q+sn2rG+iWi
   HjjHPszovfFdetBosQnPf0IAG2ZtrlMEKzSCMAjSQ70Su1ivqVmDZaTdt
   vpLANBKXaMhttM0hK2ZMH+7LCwmxjMC59u1ojB0YAZP5TyaTf8tKT6LyK
   hzRlNrNNmNX24lGsNFOZ3C9j0RZU6fnump7w2zQbMfRIMPFwYc/gFXU+K
   Rw/ryqjY0QP1sqYIo4M9NMhE5ACGCunsNmtd92bDuLeH7V1IFKvMNSKCm
   RfJ2uH3mlXeX4g7c5k7MNIxamLYXazZPhpGfpdX97rz3Jmj1Ha2CjLkIP
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="252017977"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="252017977"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 14:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="505699824"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Feb 2022 14:30:06 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMdfZ-0000gI-9L; Tue, 22 Feb 2022 22:30:05 +0000
Date:   Wed, 23 Feb 2022 06:29:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     michael.srba@seznam.cz, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH v8 4/5] drivers: bus: add driver for initializing the SSC
 bus on (some) qcom SoCs
Message-ID: <202202230613.3K7X7na5-lkp@intel.com>
References: <20220220212034.9152-4-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220212034.9152-4-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on clk/clk-next linus/master v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/michael-srba-seznam-cz/dt-bindings-clock-gcc-msm8998-Add-definitions-of-SSC-related-clocks/20220221-052431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20220223/202202230613.3K7X7na5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/33b907599d7992605f1cdd439529acd9bb8a8e2b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review michael-srba-seznam-cz/dt-bindings-clock-gcc-msm8998-Add-definitions-of-SSC-related-clocks/20220221-052431
        git checkout 33b907599d7992605f1cdd439529acd9bb8a8e2b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x122): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0x230): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0x69c): undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x7a): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x4f4): undefined reference to `iounmap'
   s390-linux-ld: drivers/bus/qcom-ssc-block-bus.o: in function `qcom_ssc_block_bus_remove':
>> qcom-ssc-block-bus.c:(.text+0x1ac): undefined reference to `iounmap'
>> s390-linux-ld: qcom-ssc-block-bus.c:(.text+0x1c2): undefined reference to `iounmap'
   s390-linux-ld: drivers/clk/clk-fixed-mmio.o: in function `fixed_mmio_clk_setup':
   clk-fixed-mmio.c:(.text+0x90): undefined reference to `of_iomap'
   s390-linux-ld: clk-fixed-mmio.c:(.text+0xcc): undefined reference to `iounmap'
   s390-linux-ld: drivers/clk/clk-lan966x.o: in function `lan966x_clk_probe':
   clk-lan966x.c:(.text+0x5d4): undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: clk-lan966x.c:(.text+0x748): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_init':
   timer-of.c:(.init.text+0x152): undefined reference to `of_iomap'
   s390-linux-ld: timer-of.c:(.init.text+0x77e): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cleanup':
   timer-of.c:(.init.text+0x968): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-microchip-pit64b.o: in function `mchp_pit64b_dt_init_timer':
   timer-microchip-pit64b.c:(.init.text+0x6a6): undefined reference to `of_iomap'
   s390-linux-ld: timer-microchip-pit64b.c:(.init.text+0xd04): undefined reference to `iounmap'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
