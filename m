Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9075F768318
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjG3BIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3BIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:08:37 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2D32701;
        Sat, 29 Jul 2023 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690679315; x=1722215315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pn2YJCGXkyEQ1oZ3DmDf8JjbyCx2Q0Jd+FIiyB3IIoM=;
  b=KXMKvmid/Sc5MwAcL+IN+oOc04bAUvfHPswxvYrIehxJuTThcosVAUjt
   pRiTPtfM7i7US4iHuPeL8H3xLE2HHM1OsQjEzyIBZLr9xztUb0aW/wmvm
   Robc6KtNPBOKSikUQoglLHoIzOZKw/eIVXXevDBWDuMzt281NlGaFblin
   ZqmRMUN/WBJDRZW0x9MRIPYEZcxIBBCv3uD8PXy1rgteM9Inn/BFgL2Ql
   guvWldt7mIfBKKvh/+FmHWALQZa7krkfguf51H+fEMAOyRRrLHVuUV49l
   8+aVXNUa/3V0MX7h+3pen++NSX15YRmg3gQGq+DtG2FN+iuczg6x2/rZu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="349100552"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="349100552"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 18:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="762954221"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="762954221"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2023 18:08:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPuv7-0004Mj-3D;
        Sun, 30 Jul 2023 01:08:30 +0000
Date:   Sun, 30 Jul 2023 09:08:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
Message-ID: <202307300803.N6tLICrD-lkp@intel.com>
References: <20230729204307.268587-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729204307.268587-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc3 next-20230728]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230730-044510
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230729204307.268587-4-dmitry.baryshkov%40linaro.org
patch subject: [PATCH 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
config: i386-buildonly-randconfig-r006-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300803.N6tLICrD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300803.N6tLICrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300803.N6tLICrD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_simple_bridge.c:104:15: error: no member named 'of_node' in 'struct drm_bridge'
           data->bridge.of_node = data->dev->of_node;
           ~~~~~~~~~~~~ ^
   1 error generated.
--
>> drivers/gpu/drm/bridge/simple-bridge.c:212:18: error: no member named 'of_node' in 'struct drm_bridge'
           sbridge->bridge.of_node = pdev->dev.of_node;
           ~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +104 drivers/gpu/drm/display/drm_simple_bridge.c

cd1c726976d298 Dmitry Baryshkov 2023-07-29   87  
cd1c726976d298 Dmitry Baryshkov 2023-07-29   88  static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
cd1c726976d298 Dmitry Baryshkov 2023-07-29   89  				   const struct auxiliary_device_id *id)
cd1c726976d298 Dmitry Baryshkov 2023-07-29   90  {
cd1c726976d298 Dmitry Baryshkov 2023-07-29   91  	struct drm_simple_bridge_data *data;
cd1c726976d298 Dmitry Baryshkov 2023-07-29   92  
cd1c726976d298 Dmitry Baryshkov 2023-07-29   93  	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
cd1c726976d298 Dmitry Baryshkov 2023-07-29   94  	if (!data)
cd1c726976d298 Dmitry Baryshkov 2023-07-29   95  		return -ENOMEM;
cd1c726976d298 Dmitry Baryshkov 2023-07-29   96  
cd1c726976d298 Dmitry Baryshkov 2023-07-29   97  	data->dev = &auxdev->dev;
cd1c726976d298 Dmitry Baryshkov 2023-07-29   98  	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
cd1c726976d298 Dmitry Baryshkov 2023-07-29   99  	if (IS_ERR(data->next_bridge))
cd1c726976d298 Dmitry Baryshkov 2023-07-29  100  		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
cd1c726976d298 Dmitry Baryshkov 2023-07-29  101  				     "failed to acquire drm_bridge\n");
cd1c726976d298 Dmitry Baryshkov 2023-07-29  102  
cd1c726976d298 Dmitry Baryshkov 2023-07-29  103  	data->bridge.funcs = &drm_simple_bridge_funcs;
cd1c726976d298 Dmitry Baryshkov 2023-07-29 @104  	data->bridge.of_node = data->dev->of_node;
cd1c726976d298 Dmitry Baryshkov 2023-07-29  105  
cd1c726976d298 Dmitry Baryshkov 2023-07-29  106  	return devm_drm_bridge_add(data->dev, &data->bridge);
cd1c726976d298 Dmitry Baryshkov 2023-07-29  107  }
cd1c726976d298 Dmitry Baryshkov 2023-07-29  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
