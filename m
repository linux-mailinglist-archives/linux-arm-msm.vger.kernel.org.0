Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AFC280D20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 07:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgJBFnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 01:43:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:26482 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbgJBFnF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 01:43:05 -0400
IronPort-SDR: xbkfglkvbs/NHnKIVqQC1l3E9ih8qTzfKKbysxz4TbreY3DWSXunq6KhRzOqon6HUFdbETi3SE
 dpsWba1oAgmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="160323883"
X-IronPort-AV: E=Sophos;i="5.77,326,1596524400"; 
   d="scan'208";a="160323883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 22:43:04 -0700
IronPort-SDR: AxnjzFZxCJcGCJ01krNjA9yqQ3Hppk2xj3mUyAgZpP5mDuAFvTb/8OjbG0gLu34sSQgyjQ+huk
 f/JH3NWh+Zvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,326,1596524400"; 
   d="scan'208";a="416349376"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2020 22:43:01 -0700
Date:   Fri, 2 Oct 2020 13:39:44 +0800
From:   Philip Li <philip.li@intel.com>
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     kernel test robot <lkp@intel.com>, Andy Gross <agross@kernel.org>,
        kbuild-all@lists.01.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: Add SDM660 GPU Clock Controller (GPUCC)
 driver
Message-ID: <20201002053944.GD30771@intel.com>
References: <20200926130306.13843-5-kholk11@gmail.com>
 <202010010458.1600JqDl-lkp@intel.com>
 <CAK7fi1Yvaj+Emad8GboLHSu6v-E81pX=GmCtmwm=utzQEtu2Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7fi1Yvaj+Emad8GboLHSu6v-E81pX=GmCtmwm=utzQEtu2Cg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 30, 2020 at 11:58:50PM +0200, AngeloGioacchino Del Regno wrote:
> The kernel test robot is wrong: this commit builds fine by
Thanks for the info and sorry for the wrong report. Currently it is
hard to detect the base in this case automatically, if possible, we
recommend to use --base option when git format patch, this provides
extra hint to us when looking for the base.

> merging in the required patch series (464958) named
> "Qualcomm clock fixes and preparation for SDM660"
> https://lore.kernel.org/patchwork/project/lkml/list/?series=464958
> 
> In that series there is a commit that generalizes the MSM8996-only
> gfx3d clock ops and introduces the definition of clk_rcg2_gfx3d.
> 
> Il giorno mer 30 set 2020 alle ore 22:46 kernel test robot
> <lkp@intel.com> ha scritto:
> >
> > Hi,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on clk/clk-next]
> > [also build test ERROR on robh/for-next linux/master linus/master v5.9-rc7 next-20200930]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/kholk11-gmail-com/SDM630-660-Multimedia-and-GPU-clock-controllers/20200926-210437
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> > config: m68k-allmodconfig (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/0551514b1ab723837163a8c4cd84d22831e38019
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review kholk11-gmail-com/SDM630-660-Multimedia-and-GPU-clock-controllers/20200926-210437
> >         git checkout 0551514b1ab723837163a8c4cd84d22831e38019
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/clk/qcom/gpucc-sdm660.c:106:15: error: variable 'gfx3d_clk_src' has initializer but incomplete type
> >      106 | static struct clk_rcg2_gfx3d gfx3d_clk_src = {
> >          |               ^~~~~~~~~~~~~~
> > >> drivers/clk/qcom/gpucc-sdm660.c:107:3: error: 'struct clk_rcg2_gfx3d' has no member named 'div'
> >      107 |  .div = 2,
> >          |   ^~~
> >    drivers/clk/qcom/gpucc-sdm660.c:107:9: warning: excess elements in struct initializer
> >      107 |  .div = 2,
> >          |         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:107:9: note: (near initialization for 'gfx3d_clk_src')
> > >> drivers/clk/qcom/gpucc-sdm660.c:108:3: error: 'struct clk_rcg2_gfx3d' has no member named 'rcg'
> >      108 |  .rcg = {
> >          |   ^~~
> > >> drivers/clk/qcom/gpucc-sdm660.c:108:9: error: extra brace group at end of initializer
> >      108 |  .rcg = {
> >          |         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:108:9: note: (near initialization for 'gfx3d_clk_src')
> >    drivers/clk/qcom/gpucc-sdm660.c:108:9: warning: excess elements in struct initializer
> >    drivers/clk/qcom/gpucc-sdm660.c:108:9: note: (near initialization for 'gfx3d_clk_src')
> > >> drivers/clk/qcom/gpucc-sdm660.c:121:3: error: 'struct clk_rcg2_gfx3d' has no member named 'hws'
> >      121 |  .hws = (struct clk_hw*[]){
> >          |   ^~~
> >    drivers/clk/qcom/gpucc-sdm660.c:121:9: warning: excess elements in struct initializer
> >      121 |  .hws = (struct clk_hw*[]){
> >          |         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:121:9: note: (near initialization for 'gfx3d_clk_src')
> > >> drivers/clk/qcom/gpucc-sdm660.c:139:25: error: invalid use of undefined type 'struct clk_rcg2_gfx3d'
> >      139 |     .hw = &gfx3d_clk_src.rcg.clkr.hw,
> >          |                         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:257:45: error: 'NO_RET_PERIPH' undeclared here (not in a function)
> >      257 |  .flags = CLAMP_IO | SW_RESET | AON_RESET | NO_RET_PERIPH,
> >          |                                             ^~~~~~~~~~~~~
> >    drivers/clk/qcom/gpucc-sdm660.c:277:34: error: invalid use of undefined type 'struct clk_rcg2_gfx3d'
> >      277 |  [GFX3D_CLK_SRC] = &gfx3d_clk_src.rcg.clkr,
> >          |                                  ^
> > >> drivers/clk/qcom/gpucc-sdm660.c:106:30: error: storage size of 'gfx3d_clk_src' isn't known
> >      106 | static struct clk_rcg2_gfx3d gfx3d_clk_src = {
> >          |                              ^~~~~~~~~~~~~
> >
> > vim +/gfx3d_clk_src +106 drivers/clk/qcom/gpucc-sdm660.c
> >
> >    105
> >  > 106  static struct clk_rcg2_gfx3d gfx3d_clk_src = {
> >  > 107          .div = 2,
> >  > 108          .rcg = {
> >    109                  .cmd_rcgr = 0x1070,
> >    110                  .mnd_width = 0,
> >    111                  .hid_width = 5,
> >    112                  .parent_map = gpucc_parent_map_1,
> >    113                  .clkr.hw.init = &(struct clk_init_data){
> >    114                          .name = "gfx3d_clk_src",
> >    115                          .parent_data = gpucc_parent_data_1,
> >    116                          .num_parents = 4,
> >    117                          .ops = &clk_gfx3d_ops,
> >    118                          .flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> >    119                  },
> >    120          },
> >  > 121          .hws = (struct clk_hw*[]){
> >    122                  &gpucc_cxo_clk.clkr.hw,
> >    123                  &gpu_pll0_pll_out_main.clkr.hw,
> >    124                  &gpu_pll1_pll_out_main.clkr.hw,
> >    125          }
> >    126  };
> >    127
> >    128  static struct clk_branch gpucc_gfx3d_clk = {
> >    129          .halt_reg = 0x1098,
> >    130          .halt_check = BRANCH_HALT,
> >    131          .hwcg_reg = 0x1098,
> >    132          .hwcg_bit = 1,
> >    133          .clkr = {
> >    134                  .enable_reg = 0x1098,
> >    135                  .enable_mask = BIT(0),
> >    136                  .hw.init = &(struct clk_init_data){
> >    137                          .name = "gpucc_gfx3d_clk",
> >    138                          .parent_data = &(const struct clk_parent_data){
> >  > 139                                  .hw = &gfx3d_clk_src.rcg.clkr.hw,
> >    140                          },
> >    141                          .num_parents = 1,
> >    142                          .ops = &clk_branch2_ops,
> >    143                          .flags = CLK_SET_RATE_PARENT,
> >    144                  },
> >    145          },
> >    146  };
> >    147
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
