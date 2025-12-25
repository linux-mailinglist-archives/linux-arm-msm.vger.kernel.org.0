Return-Path: <linux-arm-msm+bounces-86605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F345ECDD3DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 04:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04BAE3016DD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 03:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05442264B8;
	Thu, 25 Dec 2025 03:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7fRJWZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD9C1990C7;
	Thu, 25 Dec 2025 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632711; cv=none; b=F9pASVRkHGrmDfHJrXbLtxD3PGaGrq3BVOEkJlHLLb/SFRfd00bBIXYtvEor3UfTCeeIv93AoUYTmEwex6F2AUi77rt2cSsVtcM61IzCKMCWNGGBfhW+Qi/zNSHJ3psPh6dVjdGqq+qg4mmhdmfx2B4wOGAOrQC/RljrBm1FHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632711; c=relaxed/simple;
	bh=AZL2lgPTNfnwSfgewGSkAbjlrTijPZr90r/aXsY7tYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCl/Vw3d2442qmW44aCM126v1Kb0fimiZRxtBJIU5NNqeImTlpRObXKpy+UmHBcsuUEuiiE1wRFSfzRmNoVY0FeJCNFm05VbxtAbgyTGkhNou3U9Mbq+tyhxDXyx/05c0bEaj2rs+rfw1ZmZ6v5B+1AlXd1ohFeV+neDoa6g7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7fRJWZG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766632710; x=1798168710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZL2lgPTNfnwSfgewGSkAbjlrTijPZr90r/aXsY7tYQ=;
  b=X7fRJWZGindJUN0QiVtlDQDB179nVewEkn2X/QAV3BvEdfbWYwJPlAL4
   JQwKmel0MoH6YSAnFbxV0yi5xgA0f66fQFT2x1Flkbugj7OENevyJRdKy
   4GzmtcgNvlycpRKosteg1f4Tfl3et4N5AXrJ/UpNkvn/MBHdNtMW7JwlV
   ohrmiQ/VcOThDht33JYc1QBjVcau+XVxJQzsVvkSGXZPblgselOjRrtdt
   xONOx6nUxmtCot293g0tImS2R0+NAPt8ZeMQHSXh8WEya/EibpoC33X74
   4Zjniz5oARkEsABPTjSh0UwL8vXhJgEdqaciKdijzmov75j5gQD/xbUHB
   A==;
X-CSE-ConnectionGUID: OuBZm/h0RsGKq7R7nwxUgQ==
X-CSE-MsgGUID: Bx2mJNFTR3elEB+a30eU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78755736"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="78755736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 19:18:29 -0800
X-CSE-ConnectionGUID: Y9xQVFbHSEytpJORjCYWeA==
X-CSE-MsgGUID: c4QSPJ4sSDS43gnBY+b7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200165301"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2025 19:18:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbrs-000000003gr-3UtX;
	Thu, 25 Dec 2025 03:18:24 +0000
Date: Thu, 25 Dec 2025 11:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, adrian.hunter@intel.com,
	quic_asutoshd@quicinc.com, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, ebiggers@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_mdalam@quicinc.com
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
Message-ID: <202512251043.unAN2IJ5-lkp@intel.com>
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
config: arc-randconfig-002-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251043.unAN2IJ5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251043.unAN2IJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251043.unAN2IJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-msm.c:2121:36: warning: 'sdhci_msm_cqhci_ops' defined but not used [-Wunused-const-variable=]
    2121 | static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~


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

