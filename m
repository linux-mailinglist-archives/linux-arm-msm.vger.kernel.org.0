Return-Path: <linux-arm-msm+bounces-91211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLamBnDVe2klIwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 22:47:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA907B50BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 22:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B5573003BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 21:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBFE36657F;
	Thu, 29 Jan 2026 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f04/yhoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB810362134;
	Thu, 29 Jan 2026 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769723243; cv=none; b=SUl4jNl7vexl9fmD3rhc0SVFp+Pew5WZE4olpO2cIKee2YmKuvd7TRExLEI7gT1JUhAX27v55qVBnoVytw18cTapst/Y/uMR5+9yjS6PjXKHAnNdLwz4GWHygniE3x91Sfq8niqyK8fMqqjlfxE+dFuOWnezMbZ2yz9Cxpanqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769723243; c=relaxed/simple;
	bh=xuEWwxsCnKV1hgUcvG3HkKb3wtP4QNEso9PfcYG5F+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmGq3MrPJeWZW79gbdd4xSqBgV4ZyQITqVbNs/o6S31X401WTue+A5upF0tzjg0Yy1OcAtqzeAwGooCG48CxkRSmE9/++hblIn6jlX+mxNKKP7CItAGZEEvMVz1EOWPcxYlCt6uCq8k4Lj4eXe4tkPf7TY1Zl7PtW4NoietahzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f04/yhoa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769723241; x=1801259241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xuEWwxsCnKV1hgUcvG3HkKb3wtP4QNEso9PfcYG5F+c=;
  b=f04/yhoamEoWJwthRP8GYQ4W6MGGdJUwNDqabNadxcYd5CelKh+/vtPr
   9qlEDM/HkzxopTOovXNx8VeyDBGsKgiAOkYMqWG6a4AXMkNsIRlUgGYQl
   Vwubl4uiYHUoNTQDHWtL/txbhgMDgxETR8d/DQWDCPD1p86nKtBnLymqz
   luRHRRf8wQWwZS8jFNX9s8qtHJNdqifZxccQaX+LndEfrA/9VL4KAIbtc
   G0ROosqFycCkorB5qMMaq/HdMO5xkAZAxifqiYKfS2gJJAnh+bz9ozCP3
   weUswUXS9vow2DGfvZL88ghChT5BfATxVe7c5D0F5CMtgOblzBLKaaLiV
   w==;
X-CSE-ConnectionGUID: 33YBsUrtS7Kz4rBsMZECOg==
X-CSE-MsgGUID: Itmmys3mRQOK3EudLR2xhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74601380"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="74601380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 13:47:21 -0800
X-CSE-ConnectionGUID: yLbJJGB2QGqnFxxCDbzpEg==
X-CSE-MsgGUID: v5zuVwWmR1iHFhcpO5K4vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208481382"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jan 2026 13:47:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlZr8-00000000bvI-2acX;
	Thu, 29 Jan 2026 21:47:14 +0000
Date: Fri, 30 Jan 2026 05:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sumit.garg@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS
 to introduce eMMC support
Message-ID: <202601300550.OQXggWux-lkp@intel.com>
References: <20260129062825.666457-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129062825.666457-3-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91211-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: DA907B50BA
X-Rspamd-Action: no action

Hi Varadarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on fcb70a56f4d81450114034b2c61f48ce7444a0e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/arm64-dts-qcom-ipq9574-Add-gpio-details-for-eMMC/20260129-143219
base:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
patch link:    https://lore.kernel.org/r/20260129062825.666457-3-varadarajan.narayanan%40oss.qualcomm.com
patch subject: [PATCH v3 2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC support
config: arm64-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260130/202601300550.OQXggWux-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300550.OQXggWux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601300550.OQXggWux-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb', needed by 'arch/arm64/boot/dts/qcom/dtbs-list'.
   make[4]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

