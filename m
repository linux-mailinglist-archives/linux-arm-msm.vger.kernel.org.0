Return-Path: <linux-arm-msm+bounces-88664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E257D16B0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2805C3009D62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 05:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851902BD00C;
	Tue, 13 Jan 2026 05:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZzaLESU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A62343C0;
	Tue, 13 Jan 2026 05:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768281507; cv=none; b=TZ7cXkdF1tBMSJUti09FS7mulXqZcADZifiXO80OizQnwqdhqVGL2ldCVlUhiHKjp+2E7vHUxYbmWA9xgis77WipPSHRPw0rkC28rlhtAddEU608dYNtYuYacpJ3r2RDJOKzzdi79qqlcpIy8MxHRPctRK4tYTrzTovM/Kltwvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768281507; c=relaxed/simple;
	bh=9iQZnMV3CUdtK45BwWJKiFUt0g3nkqqUh/ffW8zt9kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEdeha23/WiRpN99IMkKWMZU3LZHT1VNGNxMyJNwBuVS1LQZpRwXPwxkFBP57urDjlGxgbPnW7TLQz7s73Uh/xwhlr8BZrxsSkP03MsM313AB7plAxPC9HVSYsuEFPPSajeIbWtAyAhpfzmA+4hXhBYzD47R1I1slZe33eORfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZzaLESU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768281505; x=1799817505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iQZnMV3CUdtK45BwWJKiFUt0g3nkqqUh/ffW8zt9kc=;
  b=MZzaLESUibT8hDLqvFWoU9U9b/bPDE+h0lyGGgGeypTBaIFvt2V3N0gA
   nHdQm4XfIeUUx9LoI9zTe0NMsC/lUmnhERncsDXdO6p9IiTqmIx/HIewd
   6PvrkWnDJPulJtsA9Kd7Eu7iDi6Sv0nnJfpijUBqKQ1k2GNk6AfQqVqvX
   TQw+FxXkgfLLiSUnnXtJaftF1O1GAQ2GG+WjrBBAaAbztpZVIEbvYgYTB
   y8drYxnePvHA3+Tmwo2BlLvSrhLckiF24Ap5aflRP6IqUgpjFee0njp+m
   bNmDlYDiuhHw3EUXBkbB8QTfg+ldIC/VakCL9+v3h+GEsM0zEGX7Mk/GK
   A==;
X-CSE-ConnectionGUID: uVXPQ9qaSrKYm5YaLEXdGA==
X-CSE-MsgGUID: WiznanHSQ0GjMYfelN7nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73414869"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73414869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:18:19 -0800
X-CSE-ConnectionGUID: 1LVxbLv/TOWxQqR2EIejXQ==
X-CSE-MsgGUID: 6cF0U2x3R2+ZEDw6B0G6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208801024"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 21:18:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfWnE-00000000EFc-1LjW;
	Tue, 13 Jan 2026 05:18:12 +0000
Date: Tue, 13 Jan 2026 13:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202601131202.sz9WCQgh-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601131202.sz9WCQgh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131202.sz9WCQgh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131202.sz9WCQgh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:188:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     188 | }
         | ^
   1 warning generated.


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

