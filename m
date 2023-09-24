Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E80657AC73C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Sep 2023 10:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjIXI7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 04:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjIXI7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 04:59:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE63100;
        Sun, 24 Sep 2023 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695545985; x=1727081985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bBFElxUO241xaAvnbHFo2DA22JmPV94Jq2K50cyALrw=;
  b=ZyLBM5Em5lDB13R8oEzhyxd7twTnkLc2EdOfWUt4+YR73tjIJ9wzwbCx
   ytzqvLHg1tkEnl2tET/oTXxXVcDblMh8vqBGpPUW6f8cQHL/sk57Em481
   oCZ1sqB48uF8XMCcYL7c/G/vg2fkbQ2x5TVcOXFBSdUbexqZLRSIjzwI0
   SkdypuhKwLQQeyOgoUERzMrQyP90YPm+TTqGip7GgVjhZlLWu6PxI7DjM
   8tNUgP3wTVbhi19YWMdZ1xe+Y/sS7f6O7jASn7sZvLzlywRnjLVruTgJ8
   6+NNoFpVyWq9zM+BNvDydu3C/lrUum+MlJ6P97VcJjUbcRqixvj5TKjU8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="383842822"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="383842822"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 01:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="741584796"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="741584796"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Sep 2023 01:59:42 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qkKxn-0003Q5-30;
        Sun, 24 Sep 2023 08:59:39 +0000
Date:   Sun, 24 Sep 2023 16:59:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     liuhaoran <liuhaoran14@163.com>, robdclark@gmail.com
Cc:     oe-kbuild-all@lists.linux.dev, liuhaoran <liuhaoran14@163.com>,
        linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp4: Add error handling in
 mdp4_lvds_connector_init()
Message-ID: <202309241619.RHCRkWza-lkp@intel.com>
References: <20230924064159.14739-1-liuhaoran14@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924064159.14739-1-liuhaoran14@163.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi liuhaoran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liuhaoran/drm-msm-mdp4-Add-error-handling-in-mdp4_lvds_connector_init/20230924-144326
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230924064159.14739-1-liuhaoran14%40163.com
patch subject: [PATCH] drm/msm/mdp4: Add error handling in mdp4_lvds_connector_init()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230924/202309241619.RHCRkWza-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241619.RHCRkWza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241619.RHCRkWza-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c: In function 'mdp4_lvds_connector_init':
>> drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c:114:24: warning: returning 'int' from a function with return type 'struct drm_connector *' makes pointer from integer without a cast [-Wint-conversion]
     114 |                 return ret;
         |                        ^~~
   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c:126:24: warning: returning 'int' from a function with return type 'struct drm_connector *' makes pointer from integer without a cast [-Wint-conversion]
     126 |                 return ret;
         |                        ^~~


vim +114 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c

    92	
    93	/* initialize connector */
    94	struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
    95			struct device_node *panel_node, struct drm_encoder *encoder)
    96	{
    97		struct drm_connector *connector = NULL;
    98		struct mdp4_lvds_connector *mdp4_lvds_connector;
    99		int ret;
   100	
   101		mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
   102		if (!mdp4_lvds_connector)
   103			return ERR_PTR(-ENOMEM);
   104	
   105		mdp4_lvds_connector->encoder = encoder;
   106		mdp4_lvds_connector->panel_node = panel_node;
   107	
   108		connector = &mdp4_lvds_connector->base;
   109	
   110		ret = drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
   111					 DRM_MODE_CONNECTOR_LVDS);
   112	
   113		if (ret)
 > 114			return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
