Return-Path: <linux-arm-msm+bounces-71478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC00B3F3D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F1B1881B23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3092676C9;
	Tue,  2 Sep 2025 04:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhEEdg5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0A35962;
	Tue,  2 Sep 2025 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788580; cv=none; b=r11w0r6Id7Z258ipt5YQh0hxtxGmVScRuyishjX/spRo2RweDQjQeG/eOm2JNSCtJWMGYU1QL4Zfi81wHLs/N2INTATnufr+TZNbbaZfYPEZJQzq6hO6ZvOM55dLrLQJzD8Bg3tOSHFsfsGUn0LHYsMZmXgitASoVhsSHpp8pyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788580; c=relaxed/simple;
	bh=co5/+M2x17Vp4JI0Nnsgv8KfR8isXh2gWlTdZsU5Wmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGodFr4gjMSu5iimaWPN5SnMs+fzbhRo30Xugfql3Kzig7aL89Rb0eUESTKWNXH1dt7SVZHj55SlZu+Mulp9R5sZ4U5EHDiFAWOoVaD5RzJvYdZ2aCjPFKfc004vxpxszuFWAeleT/aR+lqZBjRwzNciQxfRiDhDG4BOQJOv9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhEEdg5+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756788579; x=1788324579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=co5/+M2x17Vp4JI0Nnsgv8KfR8isXh2gWlTdZsU5Wmk=;
  b=KhEEdg5+z7dB+XToWhCcvn1x7lEiGb7Ycn9Uqpvgt+oqhgBbRjblI8ah
   VCXruBuDiVqPD5WANpGhXBV7Af9Ct/6OXDHJIQIpmXZ2v96pbMRWIIFhU
   vE8fDMrNeeS7lL27aHpwqTZQnP0dRcFN9tFWyGitihqO4ZbNdf+45Y2Wy
   Y3+SXxRtdNGFISjfgnM/SMBcpYoLfiwdLtk+shtHWxoAJ194xpppy7jvt
   oD377MPg2cGzJcjTz4y8ClbxEe7k1uriAhhNo2aMWv/s8G1WzGtxs+W2s
   DlzqHbMoCPYhDXSetnFq+fwpS1pEnACdmRQT1sShwskbYMhFLnVsWV/Sa
   g==;
X-CSE-ConnectionGUID: /J1RX24/Rn2bosr/fx7+Vg==
X-CSE-MsgGUID: fTUtqvbzT6WZQv6B03WWmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70474622"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70474622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 21:49:38 -0700
X-CSE-ConnectionGUID: J0pPkm4aSAyao86W6u2e1w==
X-CSE-MsgGUID: F7mg/D50T5Oas6FREGmd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202094696"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2025 21:49:34 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utIxX-0001RL-1G;
	Tue, 02 Sep 2025 04:49:31 +0000
Date: Tue, 2 Sep 2025 12:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V4 3/4] ufs: pltfrm: Allow limiting HS gear and rate via
 DT
Message-ID: <202509021257.jIDXzoS6-lkp@intel.com>
References: <20250901155801.26988-4-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901155801.26988-4-quic_rdwivedi@quicinc.com>

Hi Ram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next robh/for-next linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ram-Kumar-Dwivedi/ufs-dt-bindings-Document-gear-and-rate-limit-properties/20250902-000038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250901155801.26988-4-quic_rdwivedi%40quicinc.com
patch subject: [PATCH V4 3/4] ufs: pltfrm: Allow limiting HS gear and rate via DT
config: arc-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021257.jIDXzoS6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021257.jIDXzoS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021257.jIDXzoS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/ufs/host/ufshcd-pltfrm.c:13:
   drivers/ufs/host/ufshcd-pltfrm.c: In function 'ufshcd_parse_limits':
>> drivers/ufs/host/ufshcd-pltfrm.c:464:23: warning: too many arguments for format [-Wformat-extra-args]
     464 |    dev_warn(hba->dev, "Invalid limit-rate value\n", hs_rate);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                ^~~
   include/linux/dev_printk.h:156:54: note: in expansion of macro 'dev_fmt'
     156 |  dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                      ^~~~~~~
   drivers/ufs/host/ufshcd-pltfrm.c:464:4: note: in expansion of macro 'dev_warn'
     464 |    dev_warn(hba->dev, "Invalid limit-rate value\n", hs_rate);
         |    ^~~~~~~~


vim +464 drivers/ufs/host/ufshcd-pltfrm.c

   432	
   433	/**
   434	 * ufshcd_parse_limits - Parse DT-based gear and rate limits for UFS
   435	 * @hba: Pointer to UFS host bus adapter instance
   436	 * @host_params: Pointer to UFS host parameters structure to be updated
   437	 *
   438	 * This function reads optional device tree properties to apply
   439	 * platform-specific constraints.
   440	 *
   441	 * "limit-hs-gear": Specifies the max HS gear.
   442	 * "limit-rate": Specifies the max High-Speed rate.
   443	 */
   444	void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params *host_params)
   445	{
   446		struct device_node *np = hba->dev->of_node;
   447		u32 hs_gear;
   448		const char *hs_rate;
   449	
   450		if (!np)
   451			return;
   452	
   453		if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
   454			host_params->hs_tx_gear = hs_gear;
   455			host_params->hs_rx_gear = hs_gear;
   456		}
   457	
   458		if (!of_property_read_string(np, "limit-rate", &hs_rate)) {
   459			if (!strcmp(hs_rate, "Rate-A"))
   460				host_params->hs_rate = PA_HS_MODE_A;
   461			else if (!strcmp(hs_rate, "Rate-B"))
   462				host_params->hs_rate = PA_HS_MODE_B;
   463			else
 > 464				dev_warn(hba->dev, "Invalid limit-rate value\n", hs_rate);
   465		}
   466	}
   467	EXPORT_SYMBOL_GPL(ufshcd_parse_limits);
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

