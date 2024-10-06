Return-Path: <linux-arm-msm+bounces-33217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C380991CEE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 09:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF9D282DF4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A516D15C145;
	Sun,  6 Oct 2024 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRifEotl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C8166F1B;
	Sun,  6 Oct 2024 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728198895; cv=none; b=aEpHjIkXHSKrj6j8LI9oaYFsGs21Z2otx/D5bp2Y/vsF1zaTEd6UhhWqRcdijXnKkyUCs7+ODT0K0piA7sgK0PX+8cPGysPPqG+wDMmbWmhWL+WupWM0gRe16AOLMxQ1V5nPJdyy/RgaqJSEIZzIljrEt2wkgKmvDoxHV4QQdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728198895; c=relaxed/simple;
	bh=rvBFnAwLGKxozKlGoPYKyeuWTXKglv6GHMyqYvXmTAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBY32ich/FonX40M9dXXqRKuvAbvSybrWza+TngTDa11MNBTLf6DtKHU7hG38dFdARRdOcKdr9lJVrtnhoZlU7f8nDoMToHRtfoSFmx3Fea80WRkJx14AOVOIMx+dRVOHzf4F0Yjnr0+ScdNwCRTmJIZWAv8Ac42rU0nb0N3Jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRifEotl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728198894; x=1759734894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvBFnAwLGKxozKlGoPYKyeuWTXKglv6GHMyqYvXmTAg=;
  b=WRifEotlUYaaHdv234qPtPFO/sH57Fdj97BfXm0h5/OYu1zS6QEw4ZDu
   4gaw/joIAAr9Nzhrjx0/G70nuOhG+cA3ZaTvIbATJ2bVtMgQmybWAk+7K
   ynxqBvXRyeSzdpTu8HNRgnRUvWTUTqURCdbuzv8gVjZ68BOLjmehNspmr
   QupnCDy+zNC8GpRov4wbsmXCsVRD9Xn0+5xUcBhpIf1Ma/NB9CPJ9zRJs
   s501NDdB0GnxH/PYVNxxjTOmkl0Fr8mNLqgTKVJg0QXDuc2TGp0owu8U2
   TpLUE0+JrOMDgVcZ/g3ueRRcPO0xFcZrKrZiuUpEeq1S4jk7250xoHE+n
   w==;
X-CSE-ConnectionGUID: yh7FBRAxRjuuAS5ZglAlhQ==
X-CSE-MsgGUID: rT9dlfyRRrOPzw6BXc4dew==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="49900363"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="49900363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 00:14:54 -0700
X-CSE-ConnectionGUID: 4jEnGfSCRBi8baZ2Vcujzg==
X-CSE-MsgGUID: YBfKsRVZSwyGvh2jqoitbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75484927"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Oct 2024 00:14:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxLTa-0003g4-1Q;
	Sun, 06 Oct 2024 07:14:46 +0000
Date: Sun, 6 Oct 2024 15:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
	manivannan.sadhasivam@linaro.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com, agross@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_narepall@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rdwivedi@quicinc.com,
	Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support for multiple ICE
 algorithms
Message-ID: <202410061425.FamovVLB-lkp@intel.com>
References: <20241005064307.18972-4-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005064307.18972-4-quic_rdwivedi@quicinc.com>

Hi Ram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Kumar-Dwivedi/dt-bindings-ufs-qcom-Document-ice-configuration-table/20241005-144559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241005064307.18972-4-quic_rdwivedi%40quicinc.com
patch subject: [PATCH V1 3/3] scsi: ufs: qcom: Add support for multiple ICE algorithms
config: arm-randconfig-001-20241006 (https://download.01.org/0day-ci/archive/20241006/202410061425.FamovVLB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061425.FamovVLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061425.FamovVLB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufs-qcom.c:126: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Refer struct ice_alg2_config


vim +126 drivers/ufs/host/ufs-qcom.c

   124	
   125	/**
 > 126	 * Refer struct ice_alg2_config
   127	 */
   128	static inline void __get_alg2_grp_params(unsigned int *val, int *c, int *t)
   129	{
   130		*c = ((val[0] << 8) | val[1] | (1 << 31));
   131		*t = ((val[2] << 24) | (val[3] << 16) | (val[4] << 8) | val[5]);
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

