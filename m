Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5878B46E06D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 02:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbhLIByi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 20:54:38 -0500
Received: from mga18.intel.com ([134.134.136.126]:51646 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233346AbhLIByi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 20:54:38 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="224863196"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="224863196"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 17:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="612325895"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2021 17:51:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mv8aM-0001JT-47; Thu, 09 Dec 2021 01:51:02 +0000
Date:   Thu, 9 Dec 2021 09:50:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        agross@kernel.org
Cc:     kbuild-all@lists.01.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        shawn.guo@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: Add display clock controller driver for
 QCM2290
Message-ID: <202112090948.3tbho958-lkp@intel.com>
References: <1638983841-23773-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638983841-23773-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Loic-Poulain/clk-qcom-Add-display-clock-controller-driver-for-QCM2290/20211209-010708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20211209/202112090948.3tbho958-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/132fa9b498019a624b89dec6e53e34b480eb4be2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Loic-Poulain/clk-qcom-Add-display-clock-controller-driver-for-QCM2290/20211209-010708
        git checkout 132fa9b498019a624b89dec6e53e34b480eb4be2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/dispcc-qcm2290.c:16:10: fatal error: dt-bindings/clock/qcom,dispcc-qcm2290.h: No such file or directory
      16 | #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +16 drivers/clk/qcom/dispcc-qcm2290.c

    15	
  > 16	#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
    17	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
