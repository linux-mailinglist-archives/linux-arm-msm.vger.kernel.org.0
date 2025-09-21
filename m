Return-Path: <linux-arm-msm+bounces-74340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD013B8D687
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 784034412B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44ADF2376FD;
	Sun, 21 Sep 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIBbm+BK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F218BBAE;
	Sun, 21 Sep 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758439887; cv=none; b=Hd1i2ufE3xZUK89ZnjXp4z8ydaAwCWXJ0oaxRTiA0tsbhmS0WEDb3Bd5ppEdwK5jw6PF/4w6p8HeHs0WDOm5EdDvg+sZuV9e+H1I8f3rVqDTwjWQVtq6YoyL8/RA3dDOWukNmc8eLMuy6jWxYsbDz0+P4DvqwhwbHoQyn0yloFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758439887; c=relaxed/simple;
	bh=Zx2s38jOkZMSCTI4ObaRdGYcXjsynTIZirrNLaJlpYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIJMUQa77+8VAEtolC+0OeKRox4qPZI7QQ6xbrPO13iPaWHNEm+QswI370Z3ht/F8YsRJ7/vkL4opqIGbP1EHFZTxfsQdtTnb2jCrzrKHExxOMbA1YrmiF5R2EaMT2rEgRpM+AXjZ6uDGGEqHrg9cwNYhHW6GweHzsUtFtYGbxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIBbm+BK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758439886; x=1789975886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zx2s38jOkZMSCTI4ObaRdGYcXjsynTIZirrNLaJlpYI=;
  b=BIBbm+BKDYCDibTBqNS52ETGSEw4dLR8+3S+GS+xjQefKdB2YEtbA98u
   E48FXnWeEjC0B5tvMkYi8mFG7ltK84zzJ2I3R1Z0qrDOndH+ak7pEDomH
   bqkvwX1wfGB2gIuHdggdfBhRgotGVMlMDRiB+qEb1FPwRaI0fhfiTVHC7
   FBdTKnfxJCG9BzcHboKUYb5q8yasnjGgvv4Bb63MI4hRvZzPL+F36g9uH
   XTD8XF9vUOjB6t8SZtLBTqs0L0Z7L58HpVEQ0kbpFA0MXH2j5fDczWZSX
   4ha4O4Qi6mp5M9CQMpMhyaI/yuFPom7/H9Ug83M8cJ2pimOHRSFFLs4t3
   A==;
X-CSE-ConnectionGUID: T/8vmloFTSm5/ZfnCRRpDw==
X-CSE-MsgGUID: aj9/JyfIQh+0XnpcIr0q8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60622166"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="60622166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 00:31:25 -0700
X-CSE-ConnectionGUID: lWtdmAeGSQO/zSzivUP1iQ==
X-CSE-MsgGUID: yEXdxvB4RzWxZ2t5A3StgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="175814344"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2025 00:31:21 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0EXM-0000YT-1T;
	Sun, 21 Sep 2025 07:31:11 +0000
Date: Sun, 21 Sep 2025 15:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/12] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
Message-ID: <202509211544.9DSw3dBc-lkp@intel.com>
References: <20250921-kvm_rproc_pas-v3-4-458f09647920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-kvm_rproc_pas-v3-4-458f09647920@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 846bd2225ec3cfa8be046655e02b9457ed41973e]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-Add-iommus-property/20250921-041055
base:   846bd2225ec3cfa8be046655e02b9457ed41973e
patch link:    https://lore.kernel.org/r/20250921-kvm_rproc_pas-v3-4-458f09647920%40oss.qualcomm.com
patch subject: [PATCH v3 04/12] soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
config: x86_64-buildonly-randconfig-006-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211544.9DSw3dBc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211544.9DSw3dBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211544.9DSw3dBc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/iris/iris_firmware.c:10:
>> include/linux/soc/qcom/mdt_loader.h:59:5: warning: no previous prototype for 'qcom_mdt_pas_load' [-Wmissing-prototypes]
      59 | int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
         |     ^~~~~~~~~~~~~~~~~


vim +/qcom_mdt_pas_load +59 include/linux/soc/qcom/mdt_loader.h

    58	
  > 59	int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
    60			      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
    61	{
    62		return -ENODEV;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

