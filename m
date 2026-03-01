Return-Path: <linux-arm-msm+bounces-94651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xPb2MSKEo2kIFwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 01:11:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 555E41C9C9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 01:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6405D300D4D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 00:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D828A22339;
	Sun,  1 Mar 2026 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaeIrr92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A531D555;
	Sun,  1 Mar 2026 00:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772323870; cv=none; b=KKPiPZ6v/N44KA5dYH8XNEBV1TtO2Cbx8yYzFOGUJAmh2QPwjBh5xNhaMmiMyGAKLLEUCgIJwGLTTsJGkqR7Fri8yU4g/KbKKiKwDfBQ1PtESHR4JGcM4CNdxdXgxqimHOjW00aqRyfz75kkO13WAWpYm6Rs0pD+FM/JyeIbFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772323870; c=relaxed/simple;
	bh=cbg2/R1oVcjwzm4KdWINBjjxdIz99tDIJCocr9vEaUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHmaMc6KQZxA/YDvJvpgINkZgXhzCyUF7mOe1uDEh4QeRkElmT9Vd5Rhf1C0KpPV3RIcMUaSwe4JjLIk1kseeYnaTkEJGUi0rEQ1vYm+YJvIC3YMPaF6YMCQeTCApjixgkRrWo14xTuXSR+QesVLCpQNsH8T56UC0mlgGZ8PO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaeIrr92; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772323868; x=1803859868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbg2/R1oVcjwzm4KdWINBjjxdIz99tDIJCocr9vEaUw=;
  b=WaeIrr92CB37DVW3+ubdWeA994G3hDWZEFxmZ22UmBNaRfHxQeIxDbYx
   eJI1vXoePrUadMg28RkJGrN6d+J8FcsqAXJUHvx3Zbp2spyICGkqnF1tp
   XbknW33cnhmDoJeWo0x72yopvazxLZ8kn+yH9oTtvz1kPWLHCdaYUSDWJ
   V3z8oajcccPVJNHW/RWoo75qpCkyVJv/O83lpju5e2ibvuvCKfv8c9D14
   TK98/fMSsERyaJSkyAEnx78fYbtMLfJE3y328zY0qfugvUuxyMTbIC9Cn
   40EiG80EKpDDIWDVSg9BsupQT7hYlD2uvc9MreJTUeAY80ETfEPF6waIQ
   g==;
X-CSE-ConnectionGUID: 13yIeTU4TQO+M0o1dtKYeg==
X-CSE-MsgGUID: e18Gcb3XTrizGMIhVnNc2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73559848"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73559848"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 16:11:07 -0800
X-CSE-ConnectionGUID: qsReXaFfQcyFy3Lmlpt7JQ==
X-CSE-MsgGUID: rcZKqE0YTtOv9QKrvyR1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="215345491"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Feb 2026 16:11:05 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwUOl-000000000Fd-0h5s;
	Sun, 01 Mar 2026 00:11:03 +0000
Date: Sun, 1 Mar 2026 08:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <202603010855.ObqylIRA-lkp@intel.com>
References: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-94651-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 555E41C9C9A
X-Rspamd-Action: no action

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/soc-qcom-ubwc-disable-bank-swizzling-for-Glymur-platform/20260301-040744
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7%40oss.qualcomm.com
patch subject: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur platform
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260301/202603010855.ObqylIRA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010855.ObqylIRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010855.ObqylIRA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:234:26: error: expected '}' before ';' token
     234 |         .ubwc_swizzle = 0;
         |                          ^
   drivers/soc/qcom/ubwc_config.c:231:54: note: to match this '{'
     231 | static const struct qcom_ubwc_cfg_data glymur_data = {
         |                                                      ^


vim +234 drivers/soc/qcom/ubwc_config.c

   230	
   231	static const struct qcom_ubwc_cfg_data glymur_data = {
   232		.ubwc_enc_version = UBWC_5_0,
   233		.ubwc_dec_version = UBWC_5_0,
 > 234		.ubwc_swizzle = 0;
   235		.ubwc_bank_spread = true,
   236		/* TODO: highest_bank_bit = 15 for LP_DDR4 */
   237		.highest_bank_bit = 16,
   238		.macrotile_mode = true,
   239	};
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

