Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C22A687F8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbjBBOJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBBOJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:09:55 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EB389F84;
        Thu,  2 Feb 2023 06:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675346994; x=1706882994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+PmYJAt+gLm3nMqcE/gerTYxQtrGS9tvLkR1pRwWLI=;
  b=Outo3eMJpog4tnoIJqJ7w9xs9qaKZyQhq/7TzgMxDbgBS598vDJz8kur
   5eQwvdw+37mw+pMxqtMG+iRHKTcsfK35mj+Q4F3aCMOVsaexYJuG9E9Cm
   +olBKcXdXrTJocrwZm8JGAKcSHfC1TIqxwuZK7tqMzChsczsZns4e2aCE
   QwN3wliLEkpWF4e7wHdT3GDH/DA9C0vlzUABA5BEnJVeFmyDDDbx+PXcM
   mKSJ732u8CCzXp97c/9LWceAG161PjR9NP9rtRU2UOfxmT9/wfXnppWHF
   WUBPUakAxB6T6thN9A2hVRWROVQzxB765UchaC1IirOtTTAQIEzjECpgr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355793865"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="355793865"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 06:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733949410"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="733949410"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 06:09:39 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNaHN-0006Zo-2I;
        Thu, 02 Feb 2023 14:09:33 +0000
Date:   Thu, 2 Feb 2023 22:08:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Subject: Re: [v1 3/3] drm/msm/disp/dpu1: reserve the resources on topology
 change
Message-ID: <202302022254.37XyfGnR-lkp@intel.com>
References: <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kalyan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalyan-Thota/drm-msm-disp-dpu1-clear-dspp-reservations-in-rm-release/20230130-232224
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1675092092-26412-4-git-send-email-quic_kalyant%40quicinc.com
patch subject: [v1 3/3] drm/msm/disp/dpu1: reserve the resources on topology change
config: arm64-randconfig-r034-20230129 (https://download.01.org/0day-ci/archive/20230202/202302022254.37XyfGnR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c49c3233fc18f3b746a96b5ff4ce5008da3bfec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kalyan-Thota/drm-msm-disp-dpu1-clear-dspp-reservations-in-rm-release/20230130-232224
        git checkout 4c49c3233fc18f3b746a96b5ff4ce5008da3bfec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2091:6: error: conflicting types for 'dpu_encoder_prepare_commit'; have 'void(struct drm_encoder *)'
    2091 | void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:19,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:29:
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h:155:6: note: previous declaration of 'dpu_encoder_prepare_commit' with type 'void(struct drm_encoder *, struct drm_crtc_state *)'
     155 | void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_prepare_commit':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:443:25: error: too few arguments to function 'dpu_encoder_prepare_commit'
     443 |                         dpu_encoder_prepare_commit(encoder);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:30:
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h:155:6: note: declared here
     155 | void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2091 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

ae4d721ce10057 Abhinav Kumar     2022-04-26  2090  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @2091  void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2092  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2093  	struct dpu_encoder_virt *dpu_enc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2094  	struct dpu_encoder_phys *phys;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2095  	int i;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2096  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2097  	if (!drm_enc) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2098  		DPU_ERROR("invalid encoder\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2099  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2100  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2101  	dpu_enc = to_dpu_encoder_virt(drm_enc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2102  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2103  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2104  		phys = dpu_enc->phys_encs[i];
b6fadcade62704 Drew Davenport    2019-12-06  2105  		if (phys->ops.prepare_commit)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2106  			phys->ops.prepare_commit(phys);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2107  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2108  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  2109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
