Return-Path: <linux-arm-msm+bounces-40513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33489E5817
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E587289E65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 14:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0808F218AAF;
	Thu,  5 Dec 2024 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRUx6/rv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F021A28D;
	Thu,  5 Dec 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733407392; cv=none; b=Pbqb32qsYTlj8720wvCEHdriOx34HW77zjDnO26tb27VPalrM0MxnoDPHGik2XwhoWGYAIFJ6yS1ZWYspBQwTOrlFl6UAAZAc1BkU/FqAMsC4UDAN9ReeEmG6K+tqTPLVpo441EQoNh20LuNgV1Ccre+Jj132uDuLAOjT2CVDqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733407392; c=relaxed/simple;
	bh=OIckFGTFyrvwTHgdkzBEMtNkFA4+ORG0DJIsmkpwtX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUgHjyTDn75nxm45Rab9Hu3gGwgPeJFo48S/B+w3Kenu1QEd5wdcM9TNNvEyrOL0f5ybaSTx2j5Q8QWTz4NEMRw+r4mFRG3mTVpjFULmmOh8XjfWQfYwH2c4vTlp/Ci5XIptno96q8BBFcRXUUp+zosRI+KDWoEL+VGHO0n28Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRUx6/rv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733407388; x=1764943388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OIckFGTFyrvwTHgdkzBEMtNkFA4+ORG0DJIsmkpwtX8=;
  b=NRUx6/rvJo/BwsQQRh6bEEzVyzIMbDWtXxJWE7ywSiQK/tMGyeKJaiVe
   +1WCAHGYSM4MoK61YgK24nrtOwFH7BZpM/JRRrSxr9HDah/NeR91t3v9E
   aB6VioOKsSUjJW5YZrFfK9XnCZxAoU7M8UR9HA33qfyb8WpnahCyr6FxI
   8r3ZV42qM01RTFIvk6t5/OzAKh3qqbxSt5MhXx1GqdyRGy4iT5xXxX07O
   cvnTQj6UvTVR7N2Id8lJdmp2oM7HSkP7i8mW1NHEuHOhKLYSuhOpRhF9B
   XLHSzgvwryjRHp0Y1CdJLbZZlP/Q+ptCLneS3cyNkjKrQlBCM3zAerOtE
   A==;
X-CSE-ConnectionGUID: 9DaH2bvCSGK7XN0Ol1+8wQ==
X-CSE-MsgGUID: ga9y99FUTBeGWK/0EnbRuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33051201"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33051201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 06:03:07 -0800
X-CSE-ConnectionGUID: iXwf/TSFRg68PmixVnZL7w==
X-CSE-MsgGUID: Jkpzol86RpuhwoMeiFmzgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="125011957"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2024 06:03:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJCRY-00003m-1m;
	Thu, 05 Dec 2024 14:03:00 +0000
Date: Thu, 5 Dec 2024 22:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Jiang <quic_chejiang@quicinc.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
	quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load
 specific nvm and rampatch
Message-ID: <202412052157.4fOQCv3u-lkp@intel.com>
References: <20241205102213.1281865-3-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205102213.1281865-3-quic_chejiang@quicinc.com>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c245a7a79602ccbee780c004c1e4abcda66aec32]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Jiang/dt-bindings-net-bluetooth-qca-Expand-firmware-name-property/20241205-182449
base:   c245a7a79602ccbee780c004c1e4abcda66aec32
patch link:    https://lore.kernel.org/r/20241205102213.1281865-3-quic_chejiang%40quicinc.com
patch subject: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load specific nvm and rampatch
config: arm-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052157.4fOQCv3u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052157.4fOQCv3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052157.4fOQCv3u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btqca.c: In function 'qca_get_nvm_name_by_board':
>> drivers/bluetooth/btqca.c:775:21: warning: variable 'variant' set but not used [-Wunused-but-set-variable]
     775 |         const char *variant;
         |                     ^~~~~~~
   drivers/bluetooth/btqca.c: In function 'qca_get_alt_nvm_path.constprop':
>> drivers/bluetooth/btqca.c:288:45: warning: '.bin' directive output may be truncated writing 4 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
     288 |         snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
         |                                             ^~~~
   drivers/bluetooth/btqca.c:288:9: note: 'snprintf' output between 5 and 68 bytes into a destination of size 64
     288 |         snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btqca.c:288:9: warning: 'snprintf' argument 4 overlaps destination object 'fwname' [-Wrestrict]
   drivers/bluetooth/btqca.c:277:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
     277 |         char fwname[64];
         |              ^~~~~~


vim +/variant +775 drivers/bluetooth/btqca.c

   770	
   771	static void qca_get_nvm_name_by_board(char *fwname, size_t max_size,
   772			const char *firmware_name, struct qca_btsoc_version ver,
   773			enum qca_btsoc_type soc_type, u16 bid)
   774	{
 > 775		const char *variant;
   776	
   777		/* Set the variant to empty by default */
   778		variant = "";
   779		/* hsp gf chip */
   780		if (soc_type == QCA_WCN6855) {
   781			if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
   782				variant = "g";
   783		}
   784	
   785		if (bid == 0x0)
   786			snprintf(fwname, max_size, "qca/%s.bin", firmware_name);
   787		else if (bid & 0xff00)
   788			snprintf(fwname, max_size, "qca/%s.b%x", firmware_name, bid);
   789		else
   790			snprintf(fwname, max_size, "qca/%s.b%02x", firmware_name, bid);
   791	}
   792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

