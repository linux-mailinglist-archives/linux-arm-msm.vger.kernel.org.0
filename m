Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA257CD871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 11:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjJRJnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 05:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjJRJng (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 05:43:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEECBB0;
        Wed, 18 Oct 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697622214; x=1729158214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lUn6JpAPKKSIZ1ASBuCSirxJ4jfSQf5dEj038QniKAs=;
  b=UQji0hUwtoFO3XYfaHWxjo2Y8wqWr5l3/Pl6X1+lRWPwzJXA9Gz9xqeo
   xkePDN+ApDVabaSYH+IHWrj9kB2iWldO1RoftrGTYXG9VqEGc10nfvP5h
   DtwpAAwZuTRU640BXTk4llyWVeqLAAUQMrbffCK/kymroa/68y8+CRrwI
   PGrlWU1gf/YRh2tpMMylfFWFz2kusgJ+UpLS6eyh4WGBTsbXwBlCDHEBS
   +T3FvijBMjDr6B2PDP+1hDP7PK+f09TtLgz8xGmrYowJhucQ64iEaxcgG
   pbCOAQf5/osRhJj7ZOvdc8ytOXoB06d7iLSUJfpMMp1uvYlGyKfvt2gYd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="371041688"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="371041688"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 02:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791560139"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="791560139"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 02:43:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qt35M-0000CS-0X;
        Wed, 18 Oct 2023 09:43:28 +0000
Date:   Wed, 18 Oct 2023 17:43:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        robdclark@gmail.com
Cc:     oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        sean@poorly.run, Abaci Robot <abaci@linux.alibaba.com>,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org
Subject: Re: [PATCH] drm/msm/a6xx: Remove some unused functions
Message-ID: <202310181742.3qvtq78e-lkp@intel.com>
References: <20231012024421.102832-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012024421.102832-1-jiapeng.chong@linux.alibaba.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jiapeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231016]
[cannot apply to drm-misc/drm-misc-next v6.6-rc6 v6.6-rc5 v6.6-rc4 linus/master v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/drm-msm-a6xx-Remove-some-unused-functions/20231017-102229
base:   next-20231016
patch link:    https://lore.kernel.org/r/20231012024421.102832-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] drm/msm/a6xx: Remove some unused functions
config: loongarch-randconfig-001-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181742.3qvtq78e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181742.3qvtq78e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181742.3qvtq78e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:8:
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h:348:18: warning: 'a7xx_gbif_registers' defined but not used [-Wunused-const-variable=]
     348 | static const u32 a7xx_gbif_registers[] = {
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h:341:18: warning: 'a7xx_ahb_registers' defined but not used [-Wunused-const-variable=]
     341 | static const u32 a7xx_ahb_registers[] = {
         |                  ^~~~~~~~~~~~~~~~~~


vim +/a7xx_gbif_registers +348 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h

1707add815519d Jordan Crouse  2018-11-02  334  
a5ab31767c7782 Sharat Masetty 2019-12-03  335  static const struct a6xx_registers a6xx_vbif_reglist =
a5ab31767c7782 Sharat Masetty 2019-12-03  336  			REGS(a6xx_vbif_registers, 0, 0);
a5ab31767c7782 Sharat Masetty 2019-12-03  337  
a5ab31767c7782 Sharat Masetty 2019-12-03  338  static const struct a6xx_registers a6xx_gbif_reglist =
a5ab31767c7782 Sharat Masetty 2019-12-03  339  			REGS(a6xx_gbif_registers, 0, 0);
a5ab31767c7782 Sharat Masetty 2019-12-03  340  
e997ae5f45caf7 Konrad Dybcio  2023-09-25 @341  static const u32 a7xx_ahb_registers[] = {
e997ae5f45caf7 Konrad Dybcio  2023-09-25  342  	/* RBBM_STATUS */
e997ae5f45caf7 Konrad Dybcio  2023-09-25  343  	0x210, 0x210,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  344  	/* RBBM_STATUS2-3 */
e997ae5f45caf7 Konrad Dybcio  2023-09-25  345  	0x212, 0x213,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  346  };
e997ae5f45caf7 Konrad Dybcio  2023-09-25  347  
e997ae5f45caf7 Konrad Dybcio  2023-09-25 @348  static const u32 a7xx_gbif_registers[] = {
e997ae5f45caf7 Konrad Dybcio  2023-09-25  349  	0x3c00, 0x3c0b,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  350  	0x3c40, 0x3c42,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  351  	0x3c45, 0x3c47,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  352  	0x3c49, 0x3c4a,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  353  	0x3cc0, 0x3cd1,
e997ae5f45caf7 Konrad Dybcio  2023-09-25  354  };
e997ae5f45caf7 Konrad Dybcio  2023-09-25  355  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
