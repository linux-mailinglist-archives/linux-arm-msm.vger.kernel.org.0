Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076BA771507
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Aug 2023 14:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjHFMbR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Aug 2023 08:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjHFMbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Aug 2023 08:31:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96B6FA;
        Sun,  6 Aug 2023 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691325075; x=1722861075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WG+jMRSs1giuugV7/S2AhBZlclIgxIwrnVuxY1rUKxk=;
  b=gGetMhj4azODuSd6nUbIl0hY+NPTfD2h7CHc73qQL8iE3be/Mykjlc9w
   c1Jk3TqMkpVDWJ+eFls1gYa2FxdQX61xbpb9IM49VKlMBhGAA1AAx+rFZ
   Y9in3v5XQ7BCb99d/0Epi5mRmebXLtU4qIs1WdUUCWhe9Q60CsQzUXiDP
   ecQ+I/+CYCMGXPO3vfj3S8mHPP/l/bPvioW+xaWSiP59wydoYIzB4dB1G
   1Mf2XD/Zbhinm0DqV4TQ/9zP/YvcAGGLpvCrJvgkAQjVo2zVSKPN/ffff
   GPtSHmYSJ2/3V1QXzyChliX1eITpZpLoYkOJwDB9MIuu546o184De4iOC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="434222192"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="434222192"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 05:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="760144574"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="760144574"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Aug 2023 05:31:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qScub-0004Df-34;
        Sun, 06 Aug 2023 12:31:09 +0000
Date:   Sun, 6 Aug 2023 20:30:35 +0800
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
Cc:     oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Message-ID: <202308062017.iKU92hML-lkp@intel.com>
References: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230802-091932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802011845.4176631-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 1/3] drm/display: add transparent bridge helper
config: i386-randconfig-r072-20230806 (https://download.01.org/0day-ci/archive/20230806/202308062017.iKU92hML-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308062017.iKU92hML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308062017.iKU92hML-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_simple_bridge.c:118:25: sparse: sparse: symbol 'drm_simple_bridge_drv' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
