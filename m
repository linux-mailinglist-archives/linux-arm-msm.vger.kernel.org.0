Return-Path: <linux-arm-msm+bounces-92136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NyEH7Lmh2leewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:28:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BE107875
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3192830125EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 01:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4763016F5;
	Sun,  8 Feb 2026 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i51G6pAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2D2FE071;
	Sun,  8 Feb 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770514086; cv=none; b=gb0BNBxoII2fSHwrlGvpjM2531UdunnzYUO/84oTSk3kuwJ0WVSco+nX8yn0hxuiu0MOZEBI6tZcuLBFORTgqahbpGsWf1DvSswPFk1zS6WvG9tYwcn+xcyeAbJmzegjosOrnKy2Hfz448EmwyUFg0hiJzcOcshbW2Rf0+7mxuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770514086; c=relaxed/simple;
	bh=00vtT39Jvixfi9ZVfpFlajnoDWPhiFq0HqXBPIp6ZRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVO9c4nnDp3joFYK3MSZANlmvtqrQ3SjYhEenxMZCJDZNwelfpO9P12fHqL8yiEieoHemgO7vO9xrKxZQRBtoYelX1yd70rbC0kbZ7Eyzgb6rf6oiGa8+ZSYCaaEpsa0oR+ws8w6VHeLHMohZCC+2gsz6B5hmA/6qw4YIEF5WLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i51G6pAK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770514086; x=1802050086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=00vtT39Jvixfi9ZVfpFlajnoDWPhiFq0HqXBPIp6ZRs=;
  b=i51G6pAKyuCXaAQ5uyOLw4969y2fdpjKiWN/fUSeYENTZSHvGgh+WXwX
   tPc0ZZtLj5NTjGo9IU6WW4LFTSSTBF4PktLi8itBq1fwd56HFCfQqB7Ay
   imQC3eDZW8vB/NLIVAamu4i3b0BuN/a3m/MmUafUSPrK4COOOlv5sfXrT
   npxToBe2utvpa0ei/E28Oz1+PzScaRu+F56fw5G3fF/JCMUXBqRZafbn0
   0WQoD+Hp5CjB591NTQc9GjdIgj20cpff4VuyNqaug9n+50g0F3YmRokVD
   /5EBKb6HfOu+WyieYGcek49dGpdc96Mi5izn0Yuc4i6v9U2gCHSBQIdiF
   A==;
X-CSE-ConnectionGUID: rpDwlkS8Su6VYhBVyaKt/g==
X-CSE-MsgGUID: +j8L9GSeSRmw1u3Y15X9gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="82407605"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="82407605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 17:28:05 -0800
X-CSE-ConnectionGUID: Z8lL18aARnOxVCVEXE5i8w==
X-CSE-MsgGUID: uY40Je0aRMOw+ecg6shhpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="211037611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2026 17:28:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1votai-00000000m00-0D9Z;
	Sun, 08 Feb 2026 01:28:00 +0000
Date: Sun, 8 Feb 2026 09:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	amit.kucheria@oss.qualcomm.com,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Message-ID: <202602080939.NxUyWMbv-lkp@intel.com>
References: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92136-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.962];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 293BE107875
X-Rspamd-Action: no action

Hi Manaf,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0f8a890c4524d6e4013ff225e70de2aed7e6d726]

url:    https://github.com/intel-lab-lkp/linux/commits/Manaf-Meethalavalappu-Pallikunhi/dt-bindings-hwmon-Add-qcom-bcl-hwmon-yaml-bindings/20260206-051819
base:   0f8a890c4524d6e4013ff225e70de2aed7e6d726
patch link:    https://lore.kernel.org/r/20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1%40oss.qualcomm.com
patch subject: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260208/202602080939.NxUyWMbv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080939.NxUyWMbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080939.NxUyWMbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hwmon/qcom-bcl-hwmon.c:338 function parameter 'mval' not described in 'bcl_convert_milliunit_to_raw'
>> Warning: drivers/hwmon/qcom-bcl-hwmon.c:338 function parameter 'mval' not described in 'bcl_convert_milliunit_to_raw'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

