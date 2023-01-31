Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F7E68364E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 20:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjAaTUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 14:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjAaTUe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 14:20:34 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE2517140;
        Tue, 31 Jan 2023 11:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675192825; x=1706728825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4eEAXkCsMiRzEm5Yn2joG4NPrqKqRgO+NgUHqn/u2ak=;
  b=RiPh6MuR1OaohiANvArVfZNUsN1BTonq2es2iZSxIfMx0h0ahuuuTRth
   a8kzEBzOg4Lo8KThR4LlD7JOKTjY4EVYYUaWPCK1jlYcV1JHKN/z+Zrw5
   r/tWUGRcMUXBIAbMkJy//GDaTzZqDcx/unQi85Fj9EDKCdF7abHaI6gkq
   6QmmQio0p2sMLrzHxEU2DYb2B3A1lNGj4xmrJ0lzr1EI6hkgN2yxUG2kT
   ol62qTZ8vEhL9YG+mF2Ub6qWd0Rf1FyA2M+jo2dFbQfb/zClxMkyNHAJe
   by6LyaRjsXjDTh9XilAjGMn4FXDOs268Z0BcxcS5+p2AmUBkJ94Ind5Ma
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308276530"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="308276530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 11:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="658011492"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="658011492"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2023 11:20:22 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMwB3-0004eY-1T;
        Tue, 31 Jan 2023 19:20:21 +0000
Date:   Wed, 1 Feb 2023 03:19:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being
 programmed for CX GDSC
Message-ID: <202302010346.2R8hxnlM-lkp@intel.com>
References: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131092432.122711-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-gpucc-sdm845-fix-clk_dis_wait-being-programmed-for-CX-GDSC/20230131-172656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230131092432.122711-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
config: arm-randconfig-r046-20230130 (https://download.01.org/0day-ci/archive/20230201/202302010346.2R8hxnlM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8222d81144cbdf9b51ffe1ffc61e16b471456329
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/clk-qcom-gpucc-sdm845-fix-clk_dis_wait-being-programmed-for-CX-GDSC/20230131-172656
        git checkout 8222d81144cbdf9b51ffe1ffc61e16b471456329
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/gpucc-sdm845.c:122:10: error: 'struct gdsc' has no member named 'clk_dis_wait'; did you mean 'clk_dis_wait_val'?
     122 |         .clk_dis_wait = 0x8,
         |          ^~~~~~~~~~~~
         |          clk_dis_wait_val


vim +122 drivers/clk/qcom/gpucc-sdm845.c

   118	
   119	static struct gdsc gpu_cx_gdsc = {
   120		.gdscr = 0x106c,
   121		.gds_hw_ctrl = 0x1540,
 > 122		.clk_dis_wait = 0x8,
   123		.pd = {
   124			.name = "gpu_cx_gdsc",
   125		},
   126		.pwrsts = PWRSTS_OFF_ON,
   127		.flags = VOTABLE,
   128	};
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
