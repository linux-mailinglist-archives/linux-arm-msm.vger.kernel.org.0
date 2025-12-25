Return-Path: <linux-arm-msm+bounces-86609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38FCDD52C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 05:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 782B53002D7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 04:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF63A17BED0;
	Thu, 25 Dec 2025 04:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJKY3UO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451228D8CC;
	Thu, 25 Dec 2025 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766637044; cv=none; b=X4oob/Qoy82Ua+Sz7mISsZlbmfTGLT7T+WT10gec8SPcTxTG4DtDr/k736586fxQl68N2jWAu3j3aCPyiNqNFrLQSLeP16EY0F7T9fjgT1xnBWNtHWuTdQOT9BF7NW2Sg6nHPNbzlbyfPN2f9esxPeyZiLVVRbfKsh9bdlnLd8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766637044; c=relaxed/simple;
	bh=0jF1HJwFcGPuiL/DoLAg+iWgJoZ/B5TQNXYupJjw4n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ag+8WrMSNvnNrTa6/ZpvecaWwtPLLyewB2zlNSdz0Q8qyK9mPyG8jxn3vw9r/qklgtvDdFJiJRTpQXWKUXTUcZx/kTgcBBC5Gcj4HkarT2+7OMxizhcCM0MYkR9P0VrMo4KIG98UGfTv49dSHHy14aGtUG4Z7cAXKEPvK/D/tW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJKY3UO4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766637041; x=1798173041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jF1HJwFcGPuiL/DoLAg+iWgJoZ/B5TQNXYupJjw4n0=;
  b=lJKY3UO4FYgaXl5zMRobMVoxUirktUPJlIkRgVkTBJVNldSsu6efy+xB
   XNBbDcn3Vr9Rj8EdRpmSmcOBRpY3sk02sBZQE2XnZA0YlDxPqjfQMmQcZ
   8/vPA9sn32G9WmOO3aypA+vYTkRs9XQUTtaNpEXlCxbVlFnS5GfyvTZAS
   Oy0UNnTdYDa7A13/bb5Scn6twQiHT7ZcJmTEJ8MuVWQdcoNDSarHh+Ymx
   HCFfv1ce5UNXF7iNSPvryYj9SY5DAY1x3mzIyFfHlE9UWuCiqKuDALEV/
   u/ry81ukR6smmBvjrv0WxCj+yXdAHG8WHA+AQi/yPlouOCq5ttMDyYgMT
   Q==;
X-CSE-ConnectionGUID: TadSnvdERYqJQyRiWe4psw==
X-CSE-MsgGUID: a76hEBAFTy+9wpnktei18Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79086189"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79086189"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:30:40 -0800
X-CSE-ConnectionGUID: pDRKGQpkRY6j0z/ltvJafg==
X-CSE-MsgGUID: QZM6HknrSNmRzybAjm/6kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200453480"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2025 20:30:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYczj-000000003k9-2jFe;
	Thu, 25 Dec 2025 04:30:35 +0000
Date: Thu, 25 Dec 2025 12:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, adrian.hunter@intel.com,
	quic_asutoshd@quicinc.com, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, ebiggers@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_mdalam@quicinc.com
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
Message-ID: <202512251242.zOsGwwe8-lkp@intel.com>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224101050.3497746-1-quic_mdalam@quicinc.com>

Hi Md,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/mmc-sdhci-msm-Add-quirk-to-disable-CQE-for-ICE-legacy-mode/20251224-181537
base:   linus/master
patch link:    https://lore.kernel.org/r/20251224101050.3497746-1-quic_mdalam%40quicinc.com
patch subject: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy mode
config: arm64-randconfig-004-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251242.zOsGwwe8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251242.zOsGwwe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251242.zOsGwwe8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-msm.c:2121:36: warning: unused variable 'sdhci_msm_cqhci_ops' [-Wunused-const-variable]
    2121 | static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/sdhci_msm_cqhci_ops +2121 drivers/mmc/host/sdhci-msm.c

67b13f3e221ed8 Shaik Sajida Bhanu 2021-07-16  2120  
87a8df0dce6ad0 Ritesh Harjani     2020-01-16 @2121  static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
c93767cf64ebf4 Eric Biggers       2021-01-25  2122  	.enable		= sdhci_msm_cqe_enable,
87a8df0dce6ad0 Ritesh Harjani     2020-01-16  2123  	.disable	= sdhci_msm_cqe_disable,
c93767cf64ebf4 Eric Biggers       2021-01-25  2124  #ifdef CONFIG_MMC_CRYPTO
741521fa273fdd Eric Biggers       2024-12-12  2125  	.uses_custom_crypto_profile = true,
c93767cf64ebf4 Eric Biggers       2021-01-25  2126  #endif
87a8df0dce6ad0 Ritesh Harjani     2020-01-16  2127  };
87a8df0dce6ad0 Ritesh Harjani     2020-01-16  2128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

