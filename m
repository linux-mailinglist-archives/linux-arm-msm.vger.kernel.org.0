Return-Path: <linux-arm-msm+bounces-32170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C43D97E305
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2024 21:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D8951C20B90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2024 19:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05CC405C9;
	Sun, 22 Sep 2024 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GC8Co70i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DA7524C;
	Sun, 22 Sep 2024 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727033834; cv=none; b=P24H6+aPnF1h7Qqi0AnZsW/FoBJkG9n4QmpUWsTQNffTO61UTUbWaNcUKgPE/YtpyKm0f+VBEjbUgwhG7li/pAHj549/OZF2Ac5u0l3XmGLgkcu7D5Vgrbl9EYcgItdFZU49bpfeq9a3RlTAtLaw/YicJ6WslGUuoXAdt4wKbto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727033834; c=relaxed/simple;
	bh=2elvPLDf2iP7pfvWrJF4PIrd717oYH/D7huh/K95R3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuOxMc3uGuhg687nFMrgtblDfwn4WP2Ip80sruOzzwHAJHcqhW8pFalwg3azg3ew5QstalGcf4uuaMCLCPOs7cFYc9Ih8NYiBGlQXwFe+yW03uRh4du1+GM7wWfVqIilg9zHxkyKvkdjz/pg2zfiMVzjHolb1zdn0Pznrh7dpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GC8Co70i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727033833; x=1758569833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2elvPLDf2iP7pfvWrJF4PIrd717oYH/D7huh/K95R3k=;
  b=GC8Co70iFJ5/fzNe9BYe2vffolDrvuaTRbUpMZ5vErbciomtcv3B+woH
   QVDmEzz4d/b8qaOl5IvIeDZlnJXzf9mN3qorU0btwqYXPqm9a71I61oSP
   mOkfKqcyphTaWbRMtyu8csbNmTjX7vwMUH3eGmIQlqY6hDbfDkQFnZnRj
   fzivcxvIlciRpeRE4NRR9r+t63PPcAxR6jUF6lRN2a/cTj3dlXvCnMn3z
   xFG6u++EWrvYl48Rzlj5FNc3lGFTxrDMgwepSlVoUYU5THHZQAj2xmAIM
   mZUMnN1ehrElbG7Xdz/bgrYn5Ht1Ll4HGaWapLTt1j8A7N0lxDNR8K2lY
   Q==;
X-CSE-ConnectionGUID: sFcdq7CzSYqkwWGDsIiVNQ==
X-CSE-MsgGUID: IyFJ40wJTu+RWs9CcamgAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26133423"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26133423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 12:37:12 -0700
X-CSE-ConnectionGUID: 6LQoP8f1Tzq6X/iNwnEpiQ==
X-CSE-MsgGUID: yCSyk3qATPian6mC4I7CBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75407740"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2024 12:37:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssSOI-000GcY-0i;
	Sun, 22 Sep 2024 19:37:06 +0000
Date: Mon, 23 Sep 2024 03:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_bibekkum@quicinc.com
Subject: Re: [PATCH v15 4/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Message-ID: <202409230343.Q8KnYl2w-lkp@intel.com>
References: <20240920155813.3434021-5-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920155813.3434021-5-quic_bibekkum@quicinc.com>

Hi Bibek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on joro-iommu/next v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibek-Kumar-Patro/iommu-arm-smmu-re-enable-context-caching-in-smmu-reset-operation/20240921-000146
base:   linus/master
patch link:    https://lore.kernel.org/r/20240920155813.3434021-5-quic_bibekkum%40quicinc.com
patch subject: [PATCH v15 4/5] iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20240923/202409230343.Q8KnYl2w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230343.Q8KnYl2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230343.Q8KnYl2w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:14:
   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: In function 'qcom_smmu_set_actlr_dev':
>> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:266:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     266 |         arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (u64)match->data);
         |                                                           ^
   drivers/iommu/arm/arm-smmu/arm-smmu.h:533:59: note: in definition of macro 'arm_smmu_cb_write'
     533 |         arm_smmu_writel((s), ARM_SMMU_CB((s), (n)), (o), (v))
         |                                                           ^


vim +266 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c

   254	
   255	static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
   256			const struct of_device_id *client_match)
   257	{
   258		const struct of_device_id *match =
   259				of_match_device(client_match, dev);
   260	
   261		if (!match) {
   262			dev_notice(dev, "no ACTLR settings present\n");
   263			return;
   264		}
   265	
 > 266		arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (u64)match->data);
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

