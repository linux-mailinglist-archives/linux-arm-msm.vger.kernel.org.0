Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4BB4FC110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 17:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348083AbiDKPlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 11:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240237AbiDKPlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 11:41:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B243E2DEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649691544; x=1681227544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4OuhLMDm2gIHeo2uWhK5RkdHal1Usw5svsUTMNNReMA=;
  b=ea2dIGZ8w0s6wAICc/l/YVRiUeFrD0BIaqNKUyz0v1B4qm2gcFX+8+n/
   cP/xEOwjdOwcUgIibhcFThOCBtppnreEtwHHMrCGm09Peb6mCx0I1p9/E
   LBt6ydv5CfgPVCxYaDzEmPC1cIssr3v7IuVCj87EUUNuVb2RBbRb8OTqy
   /56cMA9+w9eiWqHi44lCpiXP8TNXvfYjC271zkY3dlk20WKggzIETYxLv
   ABmzhrurv9uapv60Ofh6/LBe/ypJlOUoB0Gs6J1S1fmEgzIeRMMufFNTR
   vbDkgQKXbYtwsGXkIenxRZIDs4C3Pl7oLtPYmP+X0gG/51wHDF1wEbd3H
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261890440"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="261890440"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 08:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="611029400"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2022 08:39:01 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndw84-0001wt-Su;
        Mon, 11 Apr 2022 15:39:00 +0000
Date:   Mon, 11 Apr 2022 23:38:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: properly add and remove internal bridges
Message-ID: <202204112350.b4eldlK1-lkp@intel.com>
References: <20220408130623.866092-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408130623.866092-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
[also build test ERROR on v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-properly-add-and-remove-internal-bridges/20220408-210744
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20220411/202204112350.b4eldlK1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fe14b6490aa99b01a424580fb84462519a9a310c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-properly-add-and-remove-internal-bridges/20220408-210744
        git checkout fe14b6490aa99b01a424580fb84462519a9a310c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_bridge_detach" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
