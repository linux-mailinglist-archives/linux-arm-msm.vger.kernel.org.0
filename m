Return-Path: <linux-arm-msm+bounces-88657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DAED16902
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 04:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F15133009D62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 03:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB5F309DCF;
	Tue, 13 Jan 2026 03:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKfcxiAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF681301001;
	Tue, 13 Jan 2026 03:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768276419; cv=none; b=LKZqloR86qwaMxtWnAr0jGcJNgNxC4+T1KCOcgELiG35vUH8XEUgTL9Un+TqdzOQ+aRlwAXLNXHvB8usOkwk/fFID1KEn7vjUwPgueTJaMnH24tTkNT+GDFq9n/NQyJ8RqiG90IqVqOuIr/FLc6yb8Nu9awuVe9sYTu+ETwQNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768276419; c=relaxed/simple;
	bh=/IRlg/HZqaWarHkvItRChuZKhbeASWJFIkTvLPcavzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlPJR/Ozokku7y7X0O8+fNlkmjhBSbzU8saSeuQkJZ9jD+k5esyZdoX5vYm8WDLGB/gnfONlHF2108wvrNrlnHuqeHkkCmdMeukcgnS3E6Y0D1M2ibAP8Ytxb8F3UO+PseHCDz0FczczOT7fx81vGG052SI0Lma/sB/959/8SsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKfcxiAt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768276418; x=1799812418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/IRlg/HZqaWarHkvItRChuZKhbeASWJFIkTvLPcavzU=;
  b=eKfcxiAtWlC8rWX7aNs0zATyd1sWWCkgHr/HcFShCsumXy5qmLWfKms6
   LgK2qOWTZdJLArtK0zjsu2hcvIT9gxq/qE8J0yveG9dzkfq2kBtuBDOdH
   0Cmuk+bwG9FRiWQcTcAe5LIjgDubhZXBrkGjbiKAMoekDbSS+DCNMmL9I
   hQBX2DHnoRY7Ds+n9qR8OOlYSTi22Pi7XrB/pFM0d6z7juJDHwvS+941h
   LyGV4Jxra8JpQmi1ZA1PWJsOBCEM2fmNLDeuDXr7qXfoYfNz/1rjpH+YE
   GrNgfJHduN2EW3sMtrj++P9JqJcnOMBIflG6wNM6jF5RO9eTi0zDjL0nV
   w==;
X-CSE-ConnectionGUID: m7ArWosKRDCZQEuXQPWWaA==
X-CSE-MsgGUID: FeLEXhiRRgux2JXpDCuGpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69613557"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69613557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:53:37 -0800
X-CSE-ConnectionGUID: ZcgYCdDKQQa6FHqWUrNpng==
X-CSE-MsgGUID: mlgWcsnIQTGOQJ6oXCw5Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227496203"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 19:53:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVTH-00000000EBU-1ImV;
	Tue, 13 Jan 2026 03:53:31 +0000
Date: Tue, 13 Jan 2026 11:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
Message-ID: <202601131106.zgy17BPH-lkp@intel.com>
References: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260113-061245
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vfMO1-00000002kJF-33UK%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260113/202601131106.zgy17BPH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131106.zgy17BPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131106.zgy17BPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c: In function 'ethqos_set_clk_tx_rate':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:188:1: warning: control reaches end of non-void function [-Wreturn-type]
     188 | }
         | ^


vim +188 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

a7c30e62d4b895 Vinod Koul            2019-01-21  175  
a69650e88a5551 Russell King (Oracle  2026-01-12  176) static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
a69650e88a5551 Russell King (Oracle  2026-01-12  177) 				  phy_interface_t interface, int speed)
a7c30e62d4b895 Vinod Koul            2019-01-21  178  {
a69650e88a5551 Russell King (Oracle  2026-01-12  179) 	struct qcom_ethqos *ethqos = bsp_priv;
98f9928843331f Russell King (Oracle  2025-02-21  180) 	long rate;
98f9928843331f Russell King (Oracle  2025-02-21  181) 
a69650e88a5551 Russell King (Oracle  2026-01-12  182) 	if (!phy_interface_mode_is_rgmii(interface))
a69650e88a5551 Russell King (Oracle  2026-01-12  183) 		return 0;
26311cd112d05a Sarosh Hasan          2024-02-26  184  
98f9928843331f Russell King (Oracle  2025-02-21  185) 	rate = rgmii_clock(speed);
98f9928843331f Russell King (Oracle  2025-02-21  186) 	if (rate > 0)
a69650e88a5551 Russell King (Oracle  2026-01-12  187) 		clk_set_rate(ethqos->link_clk, rate * 2);
a7c30e62d4b895 Vinod Koul            2019-01-21 @188  }
a7c30e62d4b895 Vinod Koul            2019-01-21  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

