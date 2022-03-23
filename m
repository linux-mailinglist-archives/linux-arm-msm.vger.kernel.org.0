Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B10B4E5351
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 14:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244338AbiCWNlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 09:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236734AbiCWNlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 09:41:04 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F33710C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648042774; x=1679578774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b67L/NnWXK6zdMJnGoBPKI8l38ipkirGLoJ+NGWOHGo=;
  b=k44EIrCTG1AJVx6VBUNbxB5+zjiyWzYN8g5jOKMxqrnZhSej6U4ZbPfM
   GS7/7Dks3CgW0agXVKqFxK5kqivfiLYBnskAnczh1eoNNbSpRcr1SVvLD
   uHKFyGOU4iUoX1ZoGeMgYM6WGwg8ausLqeRhH2kZweCQYCIcZm/SmDpgm
   e3HUAwX1aqiRqjY1mUEIdxtgSUKpqAuZXK2GtVKLTkw27XfDuIhEOSKrl
   +1BCfKTDoS7Ej1lVwoP0EjAbtW2LkOhtJIbkGNPZqX7yf5Y6WfT0Qgh7b
   BpRmauU1+8byzBbciZGBpjH6vH/nEK/TMTmkR26HuHHzevWgWvtdV/JkX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="258063774"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="258063774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 06:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="515780269"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2022 06:39:30 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nX1D0-000K5o-4u; Wed, 23 Mar 2022 13:39:30 +0000
Date:   Wed, 23 Mar 2022 21:39:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 3/6] drm/msm: split the main platform driver
Message-ID: <202203232120.4EJF1VFq-lkp@intel.com>
References: <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[cannot apply to v5.17 next-20220323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Baryshkov/drm-msm-rework-MDSS-drivers/20220323-172654
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: nios2-randconfig-p002-20220323 (https://download.01.org/0day-ci/archive/20220323/202203232120.4EJF1VFq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5484d7bfa709bbe2cd2cbb3b9959190d7a025c16
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-rework-MDSS-drivers/20220323-172654
        git checkout 5484d7bfa709bbe2cd2cbb3b9959190d7a025c16
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:15,
                    from include/linux/irqchip.h:14,
                    from drivers/gpu/drm/msm/msm_mdss.c:8:
>> drivers/gpu/drm/msm/msm_mdss.c:403:25: error: 'dt_match' undeclared here (not in a function); did you mean 'dr_match_t'?
     403 | MODULE_DEVICE_TABLE(of, dt_match);
         |                         ^~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__dt_match_device_table' aliased to undefined symbol 'dt_match'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/gpu/drm/msm/msm_mdss.c:403:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     403 | MODULE_DEVICE_TABLE(of, dt_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +403 drivers/gpu/drm/msm/msm_mdss.c

   390	
   391	static const struct of_device_id mdss_dt_match[] = {
   392		{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
   393		{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
   394		{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
   395		{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
   396		{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
   397		{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
   398		{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
   399		{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
   400		{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
   401		{}
   402	};
 > 403	MODULE_DEVICE_TABLE(of, dt_match);
   404	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
