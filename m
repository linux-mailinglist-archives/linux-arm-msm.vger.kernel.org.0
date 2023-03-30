Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7976D014B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 12:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjC3Kd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 06:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjC3Kd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 06:33:57 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAFB83DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680172432; x=1711708432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bo52ssnb5zSJY09A/ox7VL3Gjv9ei2ZMX5sqTUzRDSI=;
  b=NLfIesVFRhxMQVrGsnXw+QPnyj0NTfJbFaWPAfFUmUCkvb7iBWymgHFC
   B7OY0Gpc8Uv6+0vamKutE3QAkGs+21cWuf9wOT58PfTKvodUmtmCLL68d
   M4R0Jex+Ko3vOyj/pC/TxvqU81o0KkIUvBFrzCa7j3lIzx2sRGdM5uPqE
   tiKIwysT/55+DLj1EtjkkOKN6IWRRViATNV7Ul+je4yiYgVrWZlqiGwmQ
   qQbOptgguKRzoYEeyQJUzdZgnJKdeZZPpp7FEefVeA+r7cxNVqgv3aFS6
   1ivyBBQJPbLis/YwOSeIL39pbA5+yFHTpjJEW7N6NhLzLcP7eMVXjGk/n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338628800"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338628800"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 03:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795620914"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="795620914"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 03:33:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1phpbH-000KkO-2i;
        Thu, 30 Mar 2023 10:33:47 +0000
Date:   Thu, 30 Mar 2023 18:33:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/msm: Implement fbdev emulation as in-kernel
 client
Message-ID: <202303301856.zSmpwZjj-lkp@intel.com>
References: <20230330074150.7637-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330074150.7637-7-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.3-rc4]
[cannot apply to next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-msm-Clear-aperture-ownership-outside-of-fbdev-code/20230330-154729
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230330074150.7637-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/msm: Implement fbdev emulation as in-kernel client
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303301856.zSmpwZjj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ec39cb11cf72fb01ada6fe51c7c572a31dcc805d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-msm-Clear-aperture-ownership-outside-of-fbdev-code/20230330-154729
        git checkout ec39cb11cf72fb01ada6fe51c7c572a31dcc805d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301856.zSmpwZjj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_io_utils.c: In function '_msm_ioremap':
>> drivers/gpu/drm/msm/msm_io_utils.c:72:15: error: implicit declaration of function 'devm_ioremap'; did you mean '_msm_ioremap'? [-Werror=implicit-function-declaration]
      72 |         ptr = devm_ioremap(&pdev->dev, res->start, size);
         |               ^~~~~~~~~~~~
         |               _msm_ioremap
>> drivers/gpu/drm/msm/msm_io_utils.c:72:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      72 |         ptr = devm_ioremap(&pdev->dev, res->start, size);
         |             ^
   cc1: some warnings being treated as errors


vim +72 drivers/gpu/drm/msm/msm_io_utils.c

d89e5028346bd80 Dmitry Baryshkov 2022-01-20  51  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  52  static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  53  				  bool quiet, phys_addr_t *psize)
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  54  {
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  55  	struct resource *res;
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  56  	unsigned long size;
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  57  	void __iomem *ptr;
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  58  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  59  	if (name)
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  60  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  61  	else
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  62  		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  63  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  64  	if (!res) {
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  65  		if (!quiet)
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  66  			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  67  		return ERR_PTR(-EINVAL);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  68  	}
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  69  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  70  	size = resource_size(res);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  71  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20 @72  	ptr = devm_ioremap(&pdev->dev, res->start, size);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  73  	if (!ptr) {
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  74  		if (!quiet)
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  75  			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  76  		return ERR_PTR(-ENOMEM);
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  77  	}
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  78  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  79  	if (psize)
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  80  		*psize = size;
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  81  
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  82  	return ptr;
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  83  }
d89e5028346bd80 Dmitry Baryshkov 2022-01-20  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
