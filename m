Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDEB774CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 23:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbjHHVUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 17:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbjHHVUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 17:20:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E23FF838B;
        Tue,  8 Aug 2023 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691522219; x=1723058219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g2nPMWJVqJSdxvBU7K5NZtxMaqmdJgy/2x1pLE1f54o=;
  b=DrD/v9O1C2QCtnofNHII9SCm3O55urGoOvc7rq3RrDuHoNUtGTTtxNks
   zn3RuAh7y5XlRci8eD5iozAGseNlNRyZwz9p27VuzqtPq+FgRcmF/NeA0
   vJeLrldAjEflU9jbxYd5CsIchPoSFcy57CejlrFlCWivPucEJ02Vlo2Zl
   YroLPcJY0UVPHABh7RvFK9BSKHmlBOhdaum0mWQtEjMlLakWckGJ66IBm
   B4aTf40115vk/imOjhwvcIHRZclnDiMKlDBim5kA8wJygkuTMOj4UeW3C
   pbcNhfitrmnkoRGWodgx6vK0qy8fu1LCSMQ8wZmt4FhN9WaDQifbFKgOg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373710777"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="373710777"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 12:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801445416"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="801445416"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 12:16:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qTSBd-0005Yk-3C;
        Tue, 08 Aug 2023 19:16:09 +0000
Date:   Wed, 9 Aug 2023 03:15:46 +0800
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
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 3/3] usb: typec: nb7vpq904m: switch to
 DRM_SIMPLE_BRIDGE
Message-ID: <202308090347.sZtwmCUB-lkp@intel.com>
References: <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc5 next-20230808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230802-091932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802011845.4176631-4-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
config: s390-randconfig-r033-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090347.sZtwmCUB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090347.sZtwmCUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090347.sZtwmCUB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/simple-bridge.c:212:18: error: no member named 'of_node' in 'struct drm_bridge'
           sbridge->bridge.of_node = pdev->dev.of_node;
           ~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +212 drivers/gpu/drm/bridge/simple-bridge.c

56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  168  
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  169  static int simple_bridge_probe(struct platform_device *pdev)
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  170  {
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  171  	struct simple_bridge *sbridge;
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  172  	struct device_node *remote;
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  173  
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  174  	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  175  	if (!sbridge)
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  176  		return -ENOMEM;
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  177  	platform_set_drvdata(pdev, sbridge);
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  178  
272378ec0eb972 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  179  	sbridge->info = of_device_get_match_data(&pdev->dev);
272378ec0eb972 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  180  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  181  	/* Get the next bridge in the pipeline. */
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  182  	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  183  	if (!remote)
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  184  		return -EINVAL;
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  185  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  186  	sbridge->next_bridge = of_drm_find_bridge(remote);
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  187  	of_node_put(remote);
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  188  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  189  	if (!sbridge->next_bridge) {
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  190  		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  191  		return -EPROBE_DEFER;
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  192  	}
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  193  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  194  	/* Get the regulator and GPIO resources. */
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  195  	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  196  	if (IS_ERR(sbridge->vdd)) {
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  197  		int ret = PTR_ERR(sbridge->vdd);
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  198  		if (ret == -EPROBE_DEFER)
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  199  			return -EPROBE_DEFER;
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  200  		sbridge->vdd = NULL;
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  201  		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  202  	}
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  203  
2df6428e290a61 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  204  	sbridge->enable = devm_gpiod_get_optional(&pdev->dev, "enable",
2df6428e290a61 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  205  						  GPIOD_OUT_LOW);
db8496d0b50519 drivers/gpu/drm/bridge/simple-bridge.c Ye Xingchen      2023-03-22  206  	if (IS_ERR(sbridge->enable))
db8496d0b50519 drivers/gpu/drm/bridge/simple-bridge.c Ye Xingchen      2023-03-22  207  		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
db8496d0b50519 drivers/gpu/drm/bridge/simple-bridge.c Ye Xingchen      2023-03-22  208  				     "Unable to retrieve enable GPIO\n");
2df6428e290a61 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  209  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  210  	/* Register the bridge. */
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  211  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26 @212  	sbridge->bridge.of_node = pdev->dev.of_node;
272378ec0eb972 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  213  	sbridge->bridge.timings = sbridge->info->timings;
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  214  
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  215  	drm_bridge_add(&sbridge->bridge);
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  216  
47e34278549ca4 drivers/gpu/drm/bridge/dumb-vga-dac.c  Inki Dae         2017-07-03  217  	return 0;
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  218  }
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
