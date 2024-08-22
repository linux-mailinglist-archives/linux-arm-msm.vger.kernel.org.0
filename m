Return-Path: <linux-arm-msm+bounces-29315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB595C0F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 00:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8376E28303C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 22:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E776E1D04AC;
	Thu, 22 Aug 2024 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ano/wpe2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A333981;
	Thu, 22 Aug 2024 22:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366291; cv=none; b=am50gGGmm4Ascbm+LtDylKuLQhS3kvk8OKYltPlBcY1qDi7MjIvm3IcynOicJL5s/6QXYxc1JYiHj1fYInwyy0a61KN1+8IrAs9EwxWGl9WqyvWy6iQEN65pr8mzOvqm15e4bg4gRXiY3Su8ZmRz1NuHDSrZU6onZLnAthPHHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366291; c=relaxed/simple;
	bh=R5+tyKdhLqm7bUYRqH8VIN30gUI0eUJDNaHQgyQlJwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imQsVsZQbAvvmRDrte+/5yYs1Ox6kh9Q9u5no+RLKIItkgvKBu6iTIuC55rXbhwY8Uo5KgHsdPpgpnIF2eJNUJouCbOIbT4Wdy9k58ibpnyC2NZgKcIKrlB8kZKIGlI7gtiNbWyzqVPvfgEC3ZS+ShMix8qGyX7peUGGiGDdY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ano/wpe2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724366290; x=1755902290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R5+tyKdhLqm7bUYRqH8VIN30gUI0eUJDNaHQgyQlJwk=;
  b=ano/wpe2qrTwxbHj1kCsyQ1nn3VX8Flc6QHggtOetoOZufBF5kj7sq2b
   IRxSR0/veLn4ue76xHOGqJ0qzV6FETtMKbmIWz9C7ocKxzDIi8TjDV3Js
   Qi3IjG3Q0h1SycnN2qpU9nqKPphD6SaFUytDpfVn/CpZ4eXbDEcGzJqzI
   skvapmwwIvUw3GkjLXjfS57ER4wk75001Uf2yypgBmcOmwUXbN/aSlcWE
   JREkNCT9LxKXhs/YFCeTvvsi+o1P3R0zUrcU4f2dAYZgBOZZdltxXbFTa
   vGRMIdo938ieB/HBneYqaocs2AQkuHQYl4QO6Yp/9IrhelPPtGCXEwLTu
   w==;
X-CSE-ConnectionGUID: mY1CTcCMSXuinaaTS3576A==
X-CSE-MsgGUID: Ovxx6qf2TFeWfCCxABPYwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40277857"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="40277857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 15:38:09 -0700
X-CSE-ConnectionGUID: 3UGFgZGARuWZkTU3DA5QOA==
X-CSE-MsgGUID: 3CP1Z0QwRmeZPHvmWHc21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="66430604"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2024 15:38:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shGRP-000DFY-2a;
	Thu, 22 Aug 2024 22:38:03 +0000
Date: Fri, 23 Aug 2024 06:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: Re: [PATCH v14 6/6] iommu/arm-smmu: add support for PRR bit setup
Message-ID: <202408230612.1DU9cuSx-lkp@intel.com>
References: <20240816174259.2056829-7-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816174259.2056829-7-quic_bibekkum@quicinc.com>

Hi Bibek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on joro-iommu/next]
[also build test WARNING on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibek-Kumar-Patro/iommu-arm-smmu-re-enable-context-caching-in-smmu-reset-operation/20240817-014609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
patch link:    https://lore.kernel.org/r/20240816174259.2056829-7-quic_bibekkum%40quicinc.com
patch subject: [PATCH v14 6/6] iommu/arm-smmu: add support for PRR bit setup
config: arm-randconfig-r071-20240823 (https://download.01.org/0day-ci/archive/20240823/202408230612.1DU9cuSx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230612.1DU9cuSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230612.1DU9cuSx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/iommu.h:10,
                    from include/linux/io-pgtable.h:6,
                    from include/linux/adreno-smmu-priv.h:9,
                    from drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:7:
   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: In function 'qcom_adreno_smmu_set_prr_addr':
>> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:266:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     266 |                                         (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_LADDR);
         |                                         ^
   arch/arm/include/asm/io.h:282:75: note: in definition of macro 'writel_relaxed'
     282 | #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                           ^
   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:269:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     269 |                                         (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_UADDR);
         |                                         ^
   arch/arm/include/asm/io.h:282:75: note: in definition of macro 'writel_relaxed'
     282 | #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
         |                                                                           ^


vim +266 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c

   256	
   257	static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
   258	{
   259		struct arm_smmu_domain *smmu_domain = (void *)cookie;
   260		struct arm_smmu_device *smmu = smmu_domain->smmu;
   261		const struct device_node *np = smmu->dev->of_node;
   262	
   263		if (of_device_is_compatible(np, "qcom,smmu-500") &&
   264				of_device_is_compatible(np, "qcom,adreno-smmu")) {
   265			writel_relaxed(lower_32_bits(page_addr),
 > 266						(void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_LADDR);
   267	
   268			writel_relaxed(upper_32_bits(page_addr),
   269						(void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_UADDR);
   270		}
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

