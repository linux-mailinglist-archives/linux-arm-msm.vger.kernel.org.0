Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8008427F4B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 23:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731437AbgI3V7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 17:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731525AbgI3V7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 17:59:03 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D255C0613D1;
        Wed, 30 Sep 2020 14:59:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so3407063wrx.7;
        Wed, 30 Sep 2020 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uqE6Mh2sYfo4tgUmRr6sl/PAIoTS+UVdNxwJsWBXCU4=;
        b=NvPRKn3dA6l5RXbq3WkESW1+d5iP4vGq17jekovdpqMe+QrbYVpt6WmoZ8hIBN+FxA
         q1NcObA43tepNKn55MilClNznaVqsjp7ObayNJlmEQsWBnDyZ+QiuBZzHIgb0vnWH1bi
         igZKyyLIoXVmgBxkmmtxzMsTtZBeURJRvNQDaiw9vWI68jmN4SAo7nfkksRAucT8O85D
         HqXfHQe8/7nca0lL+62hMaW73yw8wMBl9NuGsPQ342Lpu69bHkUUbU2jcguWU2YHApwm
         ApcrFhO6oPSrA1A9D9FiJ6xlxkGkuNdXQU8b5MlJnj8MZ/TlNvw9cQyJQF9azXlrwYll
         jm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uqE6Mh2sYfo4tgUmRr6sl/PAIoTS+UVdNxwJsWBXCU4=;
        b=qTBGPAmeFjpPYq6AQsXbMic7ChMTJD8e5/xaiclfT3pBQK6xcmGQRIHb0RQN9Pd3Hn
         Edypc5YqHtBq/+NIkSm7D0gchH2mPZzXVFSs+ETDNxpopPtBdBaQILv36xV1lc9KO9rK
         1XpLJAWFtL1Snlh9fjXKH3gZf2o6auFEr0GTmOp0tcrwwpS6WEzdIxMGLRE6FPbX6t1v
         Jx/lsS47oxPEbeh3S0myGfHMajkdqGRcFiw5lOgkM2mi74dUBqCzp2A1skmFrwxdCnnf
         mHEwCRn5+q6Nyf7Vc0mYvQnK7Yzg9gnRlcUy2k5vu6h+BhfUxVciab+v/DEr4Jg1tALS
         jy/A==
X-Gm-Message-State: AOAM531zc59F3TQe/PSanXHmk9iin2eX+0/qG75OVrjL+01ffdH7f9dX
        yEuwuI52DL2SXayxIgNCPsu2+7vEAmyw6UKUWCs=
X-Google-Smtp-Source: ABdhPJxGOJ9Mo51pAxsUuGGzPRDK0ZK+E5vDcUhEuPDOJE1I5nQKZVq7jb50KzcoIVBZIqqPpakJuCTdZ7GXgw7Z3wY=
X-Received: by 2002:adf:eb86:: with SMTP id t6mr5163555wrn.411.1601503141172;
 Wed, 30 Sep 2020 14:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200926130306.13843-5-kholk11@gmail.com> <202010010458.1600JqDl-lkp@intel.com>
In-Reply-To: <202010010458.1600JqDl-lkp@intel.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Wed, 30 Sep 2020 23:58:50 +0200
Message-ID: <CAK7fi1Yvaj+Emad8GboLHSu6v-E81pX=GmCtmwm=utzQEtu2Cg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Gross <agross@kernel.org>, kbuild-all@lists.01.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The kernel test robot is wrong: this commit builds fine by
merging in the required patch series (464958) named
"Qualcomm clock fixes and preparation for SDM660"
https://lore.kernel.org/patchwork/project/lkml/list/?series=464958

In that series there is a commit that generalizes the MSM8996-only
gfx3d clock ops and introduces the definition of clk_rcg2_gfx3d.

Il giorno mer 30 set 2020 alle ore 22:46 kernel test robot
<lkp@intel.com> ha scritto:
>
> Hi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next linux/master linus/master v5.9-rc7 next-20200930]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/kholk11-gmail-com/SDM630-660-Multimedia-and-GPU-clock-controllers/20200926-210437
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/0551514b1ab723837163a8c4cd84d22831e38019
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review kholk11-gmail-com/SDM630-660-Multimedia-and-GPU-clock-controllers/20200926-210437
>         git checkout 0551514b1ab723837163a8c4cd84d22831e38019
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/clk/qcom/gpucc-sdm660.c:106:15: error: variable 'gfx3d_clk_src' has initializer but incomplete type
>      106 | static struct clk_rcg2_gfx3d gfx3d_clk_src = {
>          |               ^~~~~~~~~~~~~~
> >> drivers/clk/qcom/gpucc-sdm660.c:107:3: error: 'struct clk_rcg2_gfx3d' has no member named 'div'
>      107 |  .div = 2,
>          |   ^~~
>    drivers/clk/qcom/gpucc-sdm660.c:107:9: warning: excess elements in struct initializer
>      107 |  .div = 2,
>          |         ^
>    drivers/clk/qcom/gpucc-sdm660.c:107:9: note: (near initialization for 'gfx3d_clk_src')
> >> drivers/clk/qcom/gpucc-sdm660.c:108:3: error: 'struct clk_rcg2_gfx3d' has no member named 'rcg'
>      108 |  .rcg = {
>          |   ^~~
> >> drivers/clk/qcom/gpucc-sdm660.c:108:9: error: extra brace group at end of initializer
>      108 |  .rcg = {
>          |         ^
>    drivers/clk/qcom/gpucc-sdm660.c:108:9: note: (near initialization for 'gfx3d_clk_src')
>    drivers/clk/qcom/gpucc-sdm660.c:108:9: warning: excess elements in struct initializer
>    drivers/clk/qcom/gpucc-sdm660.c:108:9: note: (near initialization for 'gfx3d_clk_src')
> >> drivers/clk/qcom/gpucc-sdm660.c:121:3: error: 'struct clk_rcg2_gfx3d' has no member named 'hws'
>      121 |  .hws = (struct clk_hw*[]){
>          |   ^~~
>    drivers/clk/qcom/gpucc-sdm660.c:121:9: warning: excess elements in struct initializer
>      121 |  .hws = (struct clk_hw*[]){
>          |         ^
>    drivers/clk/qcom/gpucc-sdm660.c:121:9: note: (near initialization for 'gfx3d_clk_src')
> >> drivers/clk/qcom/gpucc-sdm660.c:139:25: error: invalid use of undefined type 'struct clk_rcg2_gfx3d'
>      139 |     .hw = &gfx3d_clk_src.rcg.clkr.hw,
>          |                         ^
>    drivers/clk/qcom/gpucc-sdm660.c:257:45: error: 'NO_RET_PERIPH' undeclared here (not in a function)
>      257 |  .flags = CLAMP_IO | SW_RESET | AON_RESET | NO_RET_PERIPH,
>          |                                             ^~~~~~~~~~~~~
>    drivers/clk/qcom/gpucc-sdm660.c:277:34: error: invalid use of undefined type 'struct clk_rcg2_gfx3d'
>      277 |  [GFX3D_CLK_SRC] = &gfx3d_clk_src.rcg.clkr,
>          |                                  ^
> >> drivers/clk/qcom/gpucc-sdm660.c:106:30: error: storage size of 'gfx3d_clk_src' isn't known
>      106 | static struct clk_rcg2_gfx3d gfx3d_clk_src = {
>          |                              ^~~~~~~~~~~~~
>
> vim +/gfx3d_clk_src +106 drivers/clk/qcom/gpucc-sdm660.c
>
>    105
>  > 106  static struct clk_rcg2_gfx3d gfx3d_clk_src = {
>  > 107          .div = 2,
>  > 108          .rcg = {
>    109                  .cmd_rcgr = 0x1070,
>    110                  .mnd_width = 0,
>    111                  .hid_width = 5,
>    112                  .parent_map = gpucc_parent_map_1,
>    113                  .clkr.hw.init = &(struct clk_init_data){
>    114                          .name = "gfx3d_clk_src",
>    115                          .parent_data = gpucc_parent_data_1,
>    116                          .num_parents = 4,
>    117                          .ops = &clk_gfx3d_ops,
>    118                          .flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>    119                  },
>    120          },
>  > 121          .hws = (struct clk_hw*[]){
>    122                  &gpucc_cxo_clk.clkr.hw,
>    123                  &gpu_pll0_pll_out_main.clkr.hw,
>    124                  &gpu_pll1_pll_out_main.clkr.hw,
>    125          }
>    126  };
>    127
>    128  static struct clk_branch gpucc_gfx3d_clk = {
>    129          .halt_reg = 0x1098,
>    130          .halt_check = BRANCH_HALT,
>    131          .hwcg_reg = 0x1098,
>    132          .hwcg_bit = 1,
>    133          .clkr = {
>    134                  .enable_reg = 0x1098,
>    135                  .enable_mask = BIT(0),
>    136                  .hw.init = &(struct clk_init_data){
>    137                          .name = "gpucc_gfx3d_clk",
>    138                          .parent_data = &(const struct clk_parent_data){
>  > 139                                  .hw = &gfx3d_clk_src.rcg.clkr.hw,
>    140                          },
>    141                          .num_parents = 1,
>    142                          .ops = &clk_branch2_ops,
>    143                          .flags = CLK_SET_RATE_PARENT,
>    144                  },
>    145          },
>    146  };
>    147
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
