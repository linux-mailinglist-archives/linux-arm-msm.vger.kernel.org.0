Return-Path: <linux-arm-msm+bounces-37855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775F9C7F22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 01:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92552846C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 00:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E5CA32;
	Thu, 14 Nov 2024 00:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lug0RFjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5B817;
	Thu, 14 Nov 2024 00:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542762; cv=none; b=YJHfbqCPo0SmS1SqULIwWKHEO6PYKR9PC1DxcCZedw3Ho2WLor8l9Q7eQoxJwhxyUbuhUcBxiGHQRW5dbn2YoAbTsCSIY/ENQnQIbquPGJLAo4CZS5f2LkpDp6IjBvijbwDGU9BN2weXevAJi9MaiO4cRDVuIthXVkTYHGXIOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542762; c=relaxed/simple;
	bh=QCU4sOzgkeIKbdmKlY+8wD3dNS2f394YpPWJGiZp+Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+OGIePkKXVDYBTpvrfmH9wufhHi/UCHxL4E1aky8fKiaqFGjhiZ8bEmlg/QxSZ2eJM8sUyWxMo0okWgwjZe20zOBgGfuPhGqM7YpwXlP9DVnfK61nMVOF6PVnhRwtsYIrI8pwWU+UStpnP8LLQxqZo7sOlTuvk3D1DBIqKXHpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lug0RFjI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731542761; x=1763078761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCU4sOzgkeIKbdmKlY+8wD3dNS2f394YpPWJGiZp+Bs=;
  b=lug0RFjIX2ObywmTcd7rAEW9iHSsL4Ev412nUu9MTr7K2tNuF/EsnEJm
   2C7f8E2g2fNHjMEXgL0/WzdjqljUHf0tsComZMKeWGX3QIHbA6xgvIvzc
   MZSP3iC7khSSWFOZci96Ls2vVIzeBl+KeG2LmJZXhjHpE6lHZ3U7GLHoZ
   LtJMSYogyk7UPyI25Idksg7r4+aTyWaULblJtm/WaMayvDom9rOYGdEZ2
   CTLDVoPxWH2yYNeClMWHtp4woUhoKhmMOzc63ZM7fK7tU9ngtRX7rvmqx
   gBwlZsoh7WtbiNZ75hucGodUwNpgpni983rywu+RxF9Vjq03ThAwBgjB7
   Q==;
X-CSE-ConnectionGUID: pCXihiLKST+VgAUUiL9cqQ==
X-CSE-MsgGUID: iEjrxb8LT2O8pDcXRne8tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42073488"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42073488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:05:57 -0800
X-CSE-ConnectionGUID: KKYYy0w6RvCAL6KZ1+vJGA==
X-CSE-MsgGUID: MXJRmlm9RzmXYn9RqXolmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="111341296"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2024 16:05:54 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBNMt-0000uR-20;
	Thu, 14 Nov 2024 00:05:51 +0000
Date: Thu, 14 Nov 2024 08:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_bibekkum@quicinc.com
Subject: Re: [PATCH v17 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <202411140748.6mcFdJdO-lkp@intel.com>
References: <20241112165454.2698269-2-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112165454.2698269-2-quic_bibekkum@quicinc.com>

Hi Bibek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on joro-iommu/next v6.12-rc7 next-20241113]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibek-Kumar-Patro/iommu-arm-smmu-re-enable-context-caching-in-smmu-reset-operation/20241113-042646
base:   linus/master
patch link:    https://lore.kernel.org/r/20241112165454.2698269-2-quic_bibekkum%40quicinc.com
patch subject: [PATCH v17 1/5] iommu/arm-smmu: re-enable context caching in smmu reset operation
config: powerpc64-randconfig-r064-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140748.6mcFdJdO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu-impl.c:10:
   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.h:18:
   In file included from include/linux/io-64-nonatomic-hi-lo.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/arm/arm-smmu/arm-smmu-impl.c:113:6: warning: unused variable 'i' [-Wunused-variable]
     113 |         int i;
         |             ^
   2 warnings generated.


vim +/i +113 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c

62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  109  
759aaa10c76cba drivers/iommu/arm-smmu-impl.c Vivek Gautam 2019-09-20  110  int arm_mmu500_reset(struct arm_smmu_device *smmu)
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  111  {
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  112  	u32 reg, major;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15 @113  	int i;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  114  	/*
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  115  	 * On MMU-500 r2p0 onwards we need to clear ACR.CACHE_LOCK before
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  116  	 * writes to the context bank ACTLRs will stick. And we just hope that
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  117  	 * Secure has also cleared SACR.CACHE_LOCK for this to take effect...
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  118  	 */
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  119  	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_ID7);
fba6e960772b7b drivers/iommu/arm-smmu-impl.c Will Deacon  2020-01-10  120  	major = FIELD_GET(ARM_SMMU_ID7_MAJOR, reg);
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  121  	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sACR);
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  122  	if (major >= 2)
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  123  		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  124  	/*
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  125  	 * Allow unmatched Stream IDs to allocate bypass
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  126  	 * TLB entries for reduced latency.
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  127  	 */
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  128  	reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  129  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sACR, reg);
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

