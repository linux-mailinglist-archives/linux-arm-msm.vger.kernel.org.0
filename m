Return-Path: <linux-arm-msm+bounces-35980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0349B1337
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 01:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E890B21C74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 23:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E3B1DD0D7;
	Fri, 25 Oct 2024 23:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfJVPIs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8C1957F9;
	Fri, 25 Oct 2024 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899105; cv=none; b=N0i8e5d8WbF323rP/RXmOWA1I3QBz3UT4obBQAz3RwLHDEeeEjJymlaz24QdeJ9mNNcdlPeU4Gaf46qhzMPo4On6t5YddNbNv9FQsa1ulvoTdk165F5XSzGXWG803RLCJDQKKDiBBLOomih4sFgLdVzWkMIu72/E3jsa7DbfCms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899105; c=relaxed/simple;
	bh=WdGE8rRJ8ooRbPNbKNU3Hoy1T8K2+Fph3zMZRkda4SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYevjqHjotrykcDMRkYgyBeS7xE+Uc86s+r55gE1ChPfHgX5IaWr8KwyX5hr05DvMxanSlM9mWrw9dbGltYCAfEXy06tGEaJxMelIgmdF+/K8ywm+hX3MAwTY96v6SzXTEZa7voac5os48ckfOWIJ5ZCenWU5QjAPXcVKkxXSYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfJVPIs9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729899103; x=1761435103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WdGE8rRJ8ooRbPNbKNU3Hoy1T8K2+Fph3zMZRkda4SE=;
  b=hfJVPIs96p7IUIseZYg2eZy1RtTNZNHqSiZ0gr25ZzpA/sKoVlOT7vNi
   4u21wytblR6l0Egl6tLQr2MKHXVwW4Jr7dzsEE7zmvOuV7G/07EoStwRC
   kq+mgQZNOWRRgt/ZVBvM7CNeqtwvSBbTlaNoHoncNrvGggsZuTCCdaK4W
   MkCt392LLoeXw9S6ZXUn6ZkRbeUI52wq2oNfU6bE0rNp1LEEJWfCLz0Fc
   MdhLce8sv5IvbYw5Cf6lX49jU3+bDApS1/vy80PrjFq+wLN2ETlrDIHmi
   /WMVREJAMiN1iNjfRlQpOpw/gJGnFVceFsGfNL9eCieh9pZ4bN1jGBHwo
   w==;
X-CSE-ConnectionGUID: /GFpBrLmR3Wd3Vz+3/G9LA==
X-CSE-MsgGUID: W02pxr38RGyRmXG3XgZhhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33278337"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33278337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:31:43 -0700
X-CSE-ConnectionGUID: OLMACmv+TaOtuhdFaVR3Rw==
X-CSE-MsgGUID: v4s9Hx64SkGsJKoNY5ASbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="111871703"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 16:31:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4TmI-000Z1g-0k;
	Fri, 25 Oct 2024 23:31:34 +0000
Date: Sat, 26 Oct 2024 07:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
	richardcochran@gmail.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com, quic_anusha@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
Message-ID: <202410260742.a9vvkaEz-lkp@intel.com>
References: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>

Hi Manikanta,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/clk-qcom-clk-alpha-pll-Add-NSS-HUAYRA-ALPHA-PLL-support-for-ipq9574/20241025-121244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241025035520.1841792-7-quic_mmanikan%40quicinc.com
patch subject: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260742.a9vvkaEz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/ipq9574.dtsi:766.16-17 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

