Return-Path: <linux-arm-msm+bounces-93041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGR/KzbTk2nb8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 03:32:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA61487FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 03:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43928301AB91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 02:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DE823D7F5;
	Tue, 17 Feb 2026 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InBaYtTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51414E2F2;
	Tue, 17 Feb 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771295533; cv=none; b=AUhq7ex9cMUZtNkFPr9nrqxnLcb7V+DxtOzFGP+D1HkEw8n+M4Hw+J2FqaQYEV4E9yCf3qnIMvdr1hjTc8SIjyo95NT3xYDCXZBdiaMd+5++OQJW+Z4WhJwV5Jt0mpzvxHMacNF0REd6AAlvCehydwW7dpI1S+Wwkrf+3qoGr2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771295533; c=relaxed/simple;
	bh=60Mtu3801euuEVyLTws5S6ILnbLCKXr50OfZCwz+7iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i05kpw7sTytMbbmLV5yRuvlWlBF6ymQ4LBa0d2jN3MWSUryi6sK7qV7EnQ1gTr1pES5brI9QJIRzFGAOLreyvAcC7L78KYRHKSThqptrF94Fx134r7F170oAM7Ux9i4a2XZw34FFaRBoW4uKgmW75hs7QjW4Ue9XvgM/YtVBTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InBaYtTN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771295533; x=1802831533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=60Mtu3801euuEVyLTws5S6ILnbLCKXr50OfZCwz+7iU=;
  b=InBaYtTNdaZhZ/+xERWqp1JGsV4I9z5EyMl4sgni9YmwBNiLCWNeIAyR
   z1CU4LVWLnMX34m/C95x7ugqdWDe8+jxHpq/ReF+ma262At8V9Csq8uB3
   1rhL1zPlYK5kGyGOsKo3AjevClrP7kIMPOrZk/fGCvUrTiOzqRoRhOVR0
   efHR9j/+wNvGDpnHEL2ffqNZKab9Xu6zzO0Ig1CG7waOcOZIRWb0IWQtk
   4QtIe7yn2/PVUEOkBvAHgJtEBEgWq101kzLI00QzgM82nVseFdPH0GE6R
   hQWUpkIA1/f5TYWZE28QX2LchTLAJARQ0ChN4+7nzDhFG6pEwJo6T1SEi
   A==;
X-CSE-ConnectionGUID: wT6pqqFKRASqoV0Sl31Vrw==
X-CSE-MsgGUID: ZuxQZhNKRxGPM4DMEINNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89780116"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="89780116"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:32:13 -0800
X-CSE-ConnectionGUID: fj8G2+EHTbm4+sKfh/g9rw==
X-CSE-MsgGUID: kgQtRD/CQ3CwxTRtdTVTxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218747290"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2026 18:32:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsAsg-000000010Xg-17Lm;
	Tue, 17 Feb 2026 02:32:06 +0000
Date: Tue, 17 Feb 2026 10:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <202602171002.SP54PXRC-lkp@intel.com>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-93041-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 56FA61487FC
X-Rspamd-Action: no action

Hi Abel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 635c467cc14ebdffab3f77610217c1dacaf88e8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260216-215148
base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
patch link:    https://lore.kernel.org/r/20260216-eliza-clocks-v3-6-8afc5a7e3a98%40oss.qualcomm.com
patch subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171002.SP54PXRC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/tcsrcc-eliza.c:126:3: error: use of undeclared identifier 'TCSR_HDMI_CLKREF_EN'
     126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
         |          ^
>> drivers/clk/qcom/tcsrcc-eliza.c:128:3: error: use of undeclared identifier 'TCSR_PCIE_1_CLKREF_EN'
     128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
         |          ^
>> drivers/clk/qcom/tcsrcc-eliza.c:145:14: error: invalid application of 'sizeof' to an incomplete type 'struct clk_regmap *[]'
     145 |         .num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   3 errors generated.


vim +/TCSR_HDMI_CLKREF_EN +126 drivers/clk/qcom/tcsrcc-eliza.c

   124	
   125	static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
 > 126		[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
   127		[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
 > 128		[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
   129		[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
   130		[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
   131		[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
   132	};
   133	
   134	static const struct regmap_config tcsr_cc_eliza_regmap_config = {
   135		.reg_bits = 32,
   136		.reg_stride = 4,
   137		.val_bits = 32,
   138		.max_register = 0x1c,
   139		.fast_io = true,
   140	};
   141	
   142	static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
   143		.config = &tcsr_cc_eliza_regmap_config,
   144		.clks = tcsr_cc_eliza_clocks,
 > 145		.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
   146	};
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

