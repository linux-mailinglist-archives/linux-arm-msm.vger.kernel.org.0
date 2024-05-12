Return-Path: <linux-arm-msm+bounces-19771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D349C8C3901
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 00:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3895DB20991
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 22:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AD654FB8;
	Sun, 12 May 2024 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXNYfd9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF550289;
	Sun, 12 May 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715552692; cv=none; b=g7F5Un9x8X9DbhVkkwYVpm+Gz6gl5k0+g8ypIcr5tkIfPEHPi9QwclUkWgRhnD8WAsUElHCZLYrzhDxXw+3aPlTEjsTsQrwh9ijbzdbvmrYy0a+ftwaf6kZH5SQDATQ7NqnA+aHALS2Cr/LPPUEGsDBkqbWl5VSrP94wFVVPArs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715552692; c=relaxed/simple;
	bh=3C4Tsvi8zQ8/WgqGGbU/HP9bh5KBCx36pvVCbqCn/0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu88rXOx6jnzlHevbiJYRa1WDvoEfkuQmFTrg2RLJo2FRK03luXGmQNGNj5MMruNZQRpYhFlnWHUn+7h+z7bQQlJYbsObwn9pfoIYVysvzoLjQroPcWQQxTZATT6HE7K4HmBDzn8/68pHIzz48tgMZDbNoGcheQXITJStFwKBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXNYfd9s; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715552690; x=1747088690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3C4Tsvi8zQ8/WgqGGbU/HP9bh5KBCx36pvVCbqCn/0w=;
  b=iXNYfd9szR6wC9iYsMiXt9fJjmM0e6OJ83iQ3+wF+UayFCuYxFqfLOoJ
   iY0BEPC1rqcru37GJWeKahbd9NqFNoydvhFcylCZWbr/Ru+NKCTxl6BoW
   d6vz7s4AXSRciHY/8VLxzyihM+ZKOKk9ITF2w7hEt2Bj6a6TFtLeVmhoe
   j0r6slEZXe1v5W6G7rrQzLJKqVqqev6mrt6NqmcfblfEttFvfNcDMFne6
   FGnXWg/UxdA8q4XUZVs1wJ/Lwhom9ehqSQFqhTOgC+mMlMPZ4B1tHiVrp
   NoDUjGOI/wMSYg6svVXCQSiDDAKFEFmJH7kA5OumxxaqNFZTTm5qwARwf
   Q==;
X-CSE-ConnectionGUID: aalRYr2WQKa4yFvsYg148Q==
X-CSE-MsgGUID: 2FgEwKZNSaSe7WhYV5Gg4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11328011"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11328011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 15:24:49 -0700
X-CSE-ConnectionGUID: IKZ0fXjETquK9VRyvxP70g==
X-CSE-MsgGUID: v+CBfvrHRqO8IEHv9CUAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30717284"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2024 15:24:46 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6HcZ-0009Fn-29;
	Sun, 12 May 2024 22:24:43 +0000
Date: Mon, 13 May 2024 06:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/a6xx: request memory region
Message-ID: <202405130618.N7QKeg94-lkp@intel.com>
References: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>

Hi Kiarash,

kernel test robot noticed the following build errors:

[auto build test ERROR on cf87f46fd34d6c19283d9625a7822f20d90b64a4]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiarash-Hajian/drm-msm-a6xx-request-memory-region/20240512-135215
base:   cf87f46fd34d6c19283d9625a7822f20d90b64a4
patch link:    https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-2-0a728ad45010%40gmail.com
patch subject: [PATCH v3 2/2] drm/msm/a6xx: request memory region
config: i386-buildonly-randconfig-001-20240513 (https://download.01.org/0day-ci/archive/20240513/202405130618.N7QKeg94-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130618.N7QKeg94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130618.N7QKeg94-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1605:8: error: use of undeclared label 'err_mmio'
    1605 |                 goto err_mmio;
         |                      ^
   1 error generated.


vim +/err_mmio +1605 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

c11fa1204fe940 Akhil P Oommen 2023-01-02  1582  
5a903a44a98471 Konrad Dybcio  2023-06-16  1583  int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
5a903a44a98471 Konrad Dybcio  2023-06-16  1584  {
5a903a44a98471 Konrad Dybcio  2023-06-16  1585  	struct platform_device *pdev = of_find_device_by_node(node);
5a903a44a98471 Konrad Dybcio  2023-06-16  1586  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
5a903a44a98471 Konrad Dybcio  2023-06-16  1587  	int ret;
5a903a44a98471 Konrad Dybcio  2023-06-16  1588  
5a903a44a98471 Konrad Dybcio  2023-06-16  1589  	if (!pdev)
5a903a44a98471 Konrad Dybcio  2023-06-16  1590  		return -ENODEV;
5a903a44a98471 Konrad Dybcio  2023-06-16  1591  
5a903a44a98471 Konrad Dybcio  2023-06-16  1592  	gmu->dev = &pdev->dev;
5a903a44a98471 Konrad Dybcio  2023-06-16  1593  
5a903a44a98471 Konrad Dybcio  2023-06-16  1594  	of_dma_configure(gmu->dev, node, true);
5a903a44a98471 Konrad Dybcio  2023-06-16  1595  
5a903a44a98471 Konrad Dybcio  2023-06-16  1596  	pm_runtime_enable(gmu->dev);
5a903a44a98471 Konrad Dybcio  2023-06-16  1597  
5a903a44a98471 Konrad Dybcio  2023-06-16  1598  	/* Mark legacy for manual SPTPRAC control */
5a903a44a98471 Konrad Dybcio  2023-06-16  1599  	gmu->legacy = true;
5a903a44a98471 Konrad Dybcio  2023-06-16  1600  
5a903a44a98471 Konrad Dybcio  2023-06-16  1601  	/* Map the GMU registers */
5a903a44a98471 Konrad Dybcio  2023-06-16  1602  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
5a903a44a98471 Konrad Dybcio  2023-06-16  1603  	if (IS_ERR(gmu->mmio)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1604  		ret = PTR_ERR(gmu->mmio);
5a903a44a98471 Konrad Dybcio  2023-06-16 @1605  		goto err_mmio;
5a903a44a98471 Konrad Dybcio  2023-06-16  1606  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1607  
5a903a44a98471 Konrad Dybcio  2023-06-16  1608  	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
5a903a44a98471 Konrad Dybcio  2023-06-16  1609  	if (IS_ERR(gmu->cxpd)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1610  		ret = PTR_ERR(gmu->cxpd);
5a903a44a98471 Konrad Dybcio  2023-06-16  1611  		goto err_mmio;
5a903a44a98471 Konrad Dybcio  2023-06-16  1612  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1613  
5a903a44a98471 Konrad Dybcio  2023-06-16  1614  	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1615  		ret = -ENODEV;
5a903a44a98471 Konrad Dybcio  2023-06-16  1616  		goto detach_cxpd;
5a903a44a98471 Konrad Dybcio  2023-06-16  1617  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1618  
5a903a44a98471 Konrad Dybcio  2023-06-16  1619  	init_completion(&gmu->pd_gate);
5a903a44a98471 Konrad Dybcio  2023-06-16  1620  	complete_all(&gmu->pd_gate);
5a903a44a98471 Konrad Dybcio  2023-06-16  1621  	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
5a903a44a98471 Konrad Dybcio  2023-06-16  1622  
5a903a44a98471 Konrad Dybcio  2023-06-16  1623  	/* Get a link to the GX power domain to reset the GPU */
5a903a44a98471 Konrad Dybcio  2023-06-16  1624  	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
5a903a44a98471 Konrad Dybcio  2023-06-16  1625  	if (IS_ERR(gmu->gxpd)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1626  		ret = PTR_ERR(gmu->gxpd);
5a903a44a98471 Konrad Dybcio  2023-06-16  1627  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1628  
5a903a44a98471 Konrad Dybcio  2023-06-16  1629  	gmu->initialized = true;
5a903a44a98471 Konrad Dybcio  2023-06-16  1630  
5a903a44a98471 Konrad Dybcio  2023-06-16  1631  	return 0;
5a903a44a98471 Konrad Dybcio  2023-06-16  1632  
5a903a44a98471 Konrad Dybcio  2023-06-16  1633  detach_cxpd:
5a903a44a98471 Konrad Dybcio  2023-06-16  1634  	dev_pm_domain_detach(gmu->cxpd, false);
5a903a44a98471 Konrad Dybcio  2023-06-16  1635  
5a903a44a98471 Konrad Dybcio  2023-06-16  1636  	/* Drop reference taken in of_find_device_by_node */
5a903a44a98471 Konrad Dybcio  2023-06-16  1637  	put_device(gmu->dev);
5a903a44a98471 Konrad Dybcio  2023-06-16  1638  
5a903a44a98471 Konrad Dybcio  2023-06-16  1639  	return ret;
5a903a44a98471 Konrad Dybcio  2023-06-16  1640  }
5a903a44a98471 Konrad Dybcio  2023-06-16  1641  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

