Return-Path: <linux-arm-msm+bounces-70471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4DB3272A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 09:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A88C1B66764
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 07:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FDF2248A5;
	Sat, 23 Aug 2025 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEiFoNYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6886221736;
	Sat, 23 Aug 2025 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755933111; cv=none; b=dB6oX9p5FUv40TnTlnAcmq9ESMd7Nqh7hrhzk8miLC0j/zI2Ok2at2giVWdzHwiRdoJmufmdtLVlhXH9SJlYerGGXt3xn4iR2aO30P/lqU/wvRNtb0PZvW5Ifg9EoPSI6kHpkeuqVykZKI9lJQahfn4k8sm7mEiA6cF8JS1vKWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755933111; c=relaxed/simple;
	bh=jGVpPERW5NP1rnaGTAcvIEIQaG44vKcBtYOfI1JBcS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8kQ8EXOItOg/q+OT70rTCNS3S69AF6MSfBmnVkGQq3se9PzZHbEySwfcqv9KV4kJVThiNrzHsMkich3R9jQ3zATDAUm02aDzu2uLtKvFAiGwWr/PUVb+f4g60HGvJRK2ZnakTBN0OuSspSWbPkL2oCdNBZ6k5o/zvN5lfZ15XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEiFoNYN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755933110; x=1787469110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGVpPERW5NP1rnaGTAcvIEIQaG44vKcBtYOfI1JBcS8=;
  b=VEiFoNYNsms6JZxGbPqwpjZEaR3NYg5qGfKg7V7C79qSkWswXcvNSiuK
   GF9ySESv2CVirFB9NfMGfn5Dv40qH8S2iwlDAQgC+ToTrLygLq86Jyg2X
   uaZnAAYE9wQcMWSqYUjS9TbyupVSZonZvtqbhQTge/SY9JZLMyUc4bJKq
   pc6TlatOJ1FvtQ0CUK2Zw25uHAFEhDPGHDdzY6O49IiVBTMKWuk29TKCc
   0sO65Ol5H2ysPLMdZX4EKOurhuD3B9YXagth9l8e/I5ovcPhDiHxSc6Ed
   oE7ksWMisg6D9pVogtwKS9I9/MwB3pZN/M6us/VJZvH/uuH+1eb2zlZwU
   A==;
X-CSE-ConnectionGUID: 1jqiIYlhTbKt9J2uYQBOuA==
X-CSE-MsgGUID: 1XVEGI6ESRmHLzDBVX7MCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60858173"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60858173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 00:11:49 -0700
X-CSE-ConnectionGUID: Jubo2rtVTOGHdEnsPCW6Yg==
X-CSE-MsgGUID: BWV5dKzARCmUx6HMiM7IWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199755162"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2025 00:11:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upiPe-000M9n-32;
	Sat, 23 Aug 2025 07:11:42 +0000
Date: Sat, 23 Aug 2025 15:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
	Tao Zhang <quic_taozha@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
Message-ID: <202508231400.bELUAEeq-lkp@intel.com>
References: <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822103008.1029-3-jie.gan@oss.qualcomm.com>

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250822]
[also build test ERROR on v6.17-rc2]
[cannot apply to robh/for-next linus/master v6.17-rc2 v6.17-rc1 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/dt-bindings-arm-document-the-static-TPDM-compatible/20250822-183421
base:   next-20250822
patch link:    https://lore.kernel.org/r/20250822103008.1029-3-jie.gan%40oss.qualcomm.com
patch subject: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
config: arm-randconfig-002-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231400.bELUAEeq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231400.bELUAEeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231400.bELUAEeq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-tpda.c: In function 'tpdm_read_element_size':
>> drivers/hwtracing/coresight/coresight-tpda.c:77:17: error: label 'out' used but not defined
      77 |                 goto out;
         |                 ^~~~


vim +/out +77 drivers/hwtracing/coresight/coresight-tpda.c

    57	
    58	/*
    59	 * Read the element size from the TPDM device. One TPDM must have at least one of the
    60	 * element size property.
    61	 * Returns
    62	 *    0 - The element size property is read
    63	 *    Others - Cannot read the property of the element size
    64	 */
    65	static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
    66					  struct coresight_device *csdev)
    67	{
    68		int rc = -EINVAL;
    69		struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
    70	
    71		if (coresight_is_static_tpdm(csdev)) {
    72			rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    73						      "qcom,dsb-element-bits", &drvdata->dsb_esize);
    74			rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    75						       "qcom,cmb-element-bits", &drvdata->cmb_esize);
    76	
  > 77			goto out;
    78		}
    79	
    80		if (tpdm_data->dsb) {
    81			rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    82					"qcom,dsb-element-bits", &drvdata->dsb_esize);
    83		}
    84	
    85		if (tpdm_data->cmb) {
    86			rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    87					"qcom,cmb-element-bits", &drvdata->cmb_esize);
    88		}
    89	
    90		if (rc)
    91			dev_warn_once(&csdev->dev,
    92				"Failed to read TPDM Element size: %d\n", rc);
    93	
    94		return rc;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

