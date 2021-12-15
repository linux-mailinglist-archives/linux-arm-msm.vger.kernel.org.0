Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1780475595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241378AbhLOJz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:55:59 -0500
Received: from mga12.intel.com ([192.55.52.136]:44332 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241373AbhLOJz6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:55:58 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219207381"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="219207381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 01:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="567876247"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Dec 2021 01:55:56 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxR0t-0001a9-B5; Wed, 15 Dec 2021 09:55:55 +0000
Date:   Wed, 15 Dec 2021 17:55:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     kbuild-all@lists.01.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 01/15] clk: qcom: gpucc-sdm660: fix two clocks with
 parent_names
Message-ID: <202112151703.HPWFiC3t-lkp@intel.com>
References: <20211215005423.2114261-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-2-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v5.16-rc5 next-20211214]
[cannot apply to agross-msm/qcom/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Baryshkov/clk-qcom-another-round-of-clock-drivers-cleanup/20211215-085637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: nios2-buildonly-randconfig-r005-20211214 (https://download.01.org/0day-ci/archive/20211215/202112151703.HPWFiC3t-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a93be2f54e6825699913bbe0aab77dd7e4837fde
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/clk-qcom-another-round-of-clock-drivers-cleanup/20211215-085637
        git checkout a93be2f54e6825699913bbe0aab77dd7e4837fde
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/gpucc-sdm660.c:208:52: error: 'struct clk_rcg2' has no member named 'clr'; did you mean 'clkr'?
     208 |                                 &rbbmtimer_clk_src.clr.hw,
         |                                                    ^~~
         |                                                    clkr


vim +208 drivers/clk/qcom/gpucc-sdm660.c

   198	
   199	static struct clk_branch gpucc_rbbmtimer_clk = {
   200		.halt_reg = 0x10d0,
   201		.halt_check = BRANCH_HALT,
   202		.clkr = {
   203			.enable_reg = 0x10d0,
   204			.enable_mask = BIT(0),
   205			.hw.init = &(struct clk_init_data){
   206				.name = "gpucc_rbbmtimer_clk",
   207				.parent_hws = (const struct clk_hw*[]){
 > 208					&rbbmtimer_clk_src.clr.hw,
   209				},
   210				.num_parents = 1,
   211				.flags = CLK_SET_RATE_PARENT,
   212				.ops = &clk_branch2_ops,
   213			},
   214		},
   215	};
   216	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
