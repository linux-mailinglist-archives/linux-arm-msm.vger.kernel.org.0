Return-Path: <linux-arm-msm+bounces-2864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351888007EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 11:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96506B210A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433411C6A9;
	Fri,  1 Dec 2023 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J44a0mOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BD384;
	Fri,  1 Dec 2023 02:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701425379; x=1732961379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=girjUnjQyiTvSrN9wz2D2bp+2sMZV3KcMTRgUm6aORo=;
  b=J44a0mOVhpSaBHclYh8TmDENZKmInXY/lZHlzRHBH9dhZCeWRvYldDCI
   +hfwC3BY1BM8K+TrKQhrp8JPqEGYizUg/GG9l5+aUVGFzT6rbNRJgXPRP
   Xpwo5e2fAd68mO0+8+z/VxTTXlVlfqRuZjyEUA4tm+y5Sl1M19RuPwfNM
   RXcCQKaTfdZc2cUi5DhFcLp2t2OBksLNfe/ZTEugVh21cdaX/3AdgKDHD
   q6jNWBQ0Pjda+yN4uWQRfvYZ594An16MTqLcTVEMspkxZtF95rEOZPJCI
   SHrdatYqYBkyufpTldkOADnEgef/EfF4lraZCsJ2eMHvABmVAcpHG93sc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="397364667"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="397364667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 02:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="11107011"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2023 02:09:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r90Sg-0003TS-0w;
	Fri, 01 Dec 2023 10:09:30 +0000
Date: Fri, 1 Dec 2023 18:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, dmitry.baryshkov@linaro.org,
	a39.skl@gmail.com, konrad.dybcio@linaro.org,
	quic_bjorande@quicinc.com, mani@kernel.org,
	quic_eberman@quicinc.com, robdclark@chromium.org,
	u.kleine-koenig@pengutronix.de, robh@kernel.org,
	vladimir.oltean@nxp.com, quic_pkondeti@quicinc.com,
	quic_molvera@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	qipl.kernel.upstream@quicinc.com,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: Re: [PATCH v3 1/4] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Message-ID: <202312011750.Pwca3TWE-lkp@intel.com>
References: <20231127145412.3981-2-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127145412.3981-2-quic_bibekkum@quicinc.com>

Hi Bibek,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7-rc3]
[also build test ERROR on linus/master next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibek-Kumar-Patro/iommu-arm-smmu-add-ACTLR-data-and-support-for-SM8550/20231127-235746
base:   v6.7-rc3
patch link:    https://lore.kernel.org/r/20231127145412.3981-2-quic_bibekkum%40quicinc.com
patch subject: [PATCH v3 1/4] iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231201/202312011750.Pwca3TWE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312011750.Pwca3TWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312011750.Pwca3TWE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c:25:16: error: no member named 'cfg' in 'struct qcom_smmu'
      25 |                 cfg = qsmmu->cfg;
         |                       ~~~~~  ^
   1 error generated.


vim +25 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c

b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  12  
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  13  void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  14  {
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  15  	int ret;
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  16  	u32 tbu_pwr_status, sync_inv_ack, sync_inv_progress;
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  17  	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  18  	const struct qcom_smmu_config *cfg;
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  19  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  20  				      DEFAULT_RATELIMIT_BURST);
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  21  
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  22  	if (__ratelimit(&rs)) {
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  23  		dev_err(smmu->dev, "TLB sync timed out -- SMMU may be deadlocked\n");
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08  24  
b9b721d117e9d3 Sai Prakash Ranjan 2022-07-08 @25  		cfg = qsmmu->cfg;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

