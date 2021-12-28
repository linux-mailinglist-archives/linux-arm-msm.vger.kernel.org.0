Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6F74809CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 15:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhL1OAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 09:00:10 -0500
Received: from mga03.intel.com ([134.134.136.65]:29734 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230477AbhL1OAK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 09:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640700010; x=1672236010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQO7BYOZldJkPRdIMtnTnMhArKnvAqURyNkBwAwY9Vg=;
  b=MGS/7aonAK3MtUGumg0yxOGpiGNyYevsCLvROD6mO19uNHDbdXeTEguy
   OOUh5qOfjhFQ9gz8SXrE92sDC1pIZEU0bTw4cJNVhXvGZhtFRlLjrwMtm
   WBI8bMRaX6K9lnxH3PHpfFCHArVGd0rQ+OJL5WpgDSmOBLAlcT1Y6KfAs
   E4nRdXgtbMid3tFh/hAqBoZFOuI2i/vnQRHdHokXBYALCQ1WaEiJkVGTb
   2Jvgb5jCQSolZUaVop/uQktg7Oswcinmlav9JwJvdJL0M0Ml0gnyQhsHH
   4ldZsNMPgGNsTFzJooisrpYbYv1RcbtbZHQsdrcS0wKSFe+pnMohNRfDJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="241320762"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="241320762"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 06:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="615651315"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2021 06:00:05 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n2D1J-0007bo-6B; Tue, 28 Dec 2021 14:00:05 +0000
Date:   Tue, 28 Dec 2021 21:59:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     kbuild-all@lists.01.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] phy: qcom-qmp: Register typec mux and orientation
 switch
Message-ID: <202112282120.JleedcIB-lkp@intel.com>
References: <20211228052116.1748443-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228052116.1748443-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on robh/for-next driver-core/driver-core-testing linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/typec-mux-Introduce-support-for-multiple-TypeC-muxes/20211228-132045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: arc-randconfig-r043-20211228 (https://download.01.org/0day-ci/archive/20211228/202112282120.JleedcIB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/db0b002b5b2e1055b2df7b430438335a75dc1557
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bjorn-Andersson/typec-mux-Introduce-support-for-multiple-TypeC-muxes/20211228-132045
        git checkout db0b002b5b2e1055b2df7b430438335a75dc1557
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_remove':
>> phy-qcom-qmp.c:(.text+0x37e): undefined reference to `typec_mux_unregister'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x37e): undefined reference to `typec_mux_unregister'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x384): undefined reference to `typec_switch_unregister'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x384): undefined reference to `typec_switch_unregister'
   arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_probe':
>> phy-qcom-qmp.c:(.text+0x14bc): undefined reference to `typec_switch_register'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14bc): undefined reference to `typec_switch_register'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14e2): undefined reference to `typec_mux_register'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14e2): undefined reference to `typec_mux_register'
   arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14f6): undefined reference to `typec_switch_unregister'
   arceb-elf-ld: phy-qcom-qmp.c:(.text+0x14f6): undefined reference to `typec_switch_unregister'
   arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_typec_switch_set':
>> phy-qcom-qmp.c:(.text+0x18f0): undefined reference to `typec_switch_get_drvdata'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x18f0): undefined reference to `typec_switch_get_drvdata'
   arceb-elf-ld: drivers/phy/qualcomm/phy-qcom-qmp.o: in function `qcom_qmp_phy_typec_mux_set':
>> phy-qcom-qmp.c:(.text+0x1962): undefined reference to `typec_mux_get_drvdata'
>> arceb-elf-ld: phy-qcom-qmp.c:(.text+0x1962): undefined reference to `typec_mux_get_drvdata'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
