Return-Path: <linux-arm-msm+bounces-89208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32026D23EBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5302A3003FD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6C8362152;
	Thu, 15 Jan 2026 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kmlj0lOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016229ACC6;
	Thu, 15 Jan 2026 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472644; cv=none; b=mS2U/UtCSaUf1Twa93nuKfSh2/NeK/nJK+x6cWTBlcjZKkaToHCeme4a6/YPY0lHdDC3KiHuVX5fwSy/PTgmxt/ZNu6HyuCwCxLEK+2GTxvtQ3ekkAaFS1tIDsWqMpO1p+fty4YPsvCi8LbJT5nVDC0lVt73JaTvbHP8DG836hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472644; c=relaxed/simple;
	bh=p9miV0nNryyvHyd1FyrzdZUkZX6TLv1ioe/BqF8c1NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/+AwyuXT4/lhT/eDxTCAAnXzATzsiq+9o3FQb1DP/2gbepFfTS5ILNJAmrTGZI4jhHKyJBsv0r0P0cS7HUfmlt+SwgIzo0qLjTpBNRfjxfr/tIEYHfUXshmoAS5GdGit78QNQpi9ziEG+lmgduAapPufclStwWD+JoMPNJp0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kmlj0lOz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768472643; x=1800008643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p9miV0nNryyvHyd1FyrzdZUkZX6TLv1ioe/BqF8c1NU=;
  b=Kmlj0lOzGinqGxTu0tYFUzETOdLTYnG4+IgnyMx0qvBH8kP/5A+v62Uj
   uuTnuDmcBTIDoRNR/9w5Sq4YASJ88/4m0+NwIEMrSj0a5wzrdyJTKpLVI
   i4OPM994ifh6vWv0hQiIHssLGPmDpKmkgJ48TlvD33iFFK4KzRQ9n300I
   FMxaHQ6cvYyPp5OdKkVfWHvGcOajneqAUXmGLC6JeojTnxhIlF6wIl7GS
   rNcMr6qR9f63rxhi64GH/AhY0vr1Nrx1Lf3p7OsaP7OpfkMDdTZuZhPOO
   gYrO/yhHYbwSMAD9+fst9LcwbR1ibANIxK27gflZkEFMmvSKYBRxg72px
   g==;
X-CSE-ConnectionGUID: epEfAh0+R5Wtwcq3Up1ymA==
X-CSE-MsgGUID: j68KwAV7RJuyvcO6pMd8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68787898"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="68787898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:24:02 -0800
X-CSE-ConnectionGUID: 1DP/q8OUSOaiDbgrzWpjsw==
X-CSE-MsgGUID: +4l+nVOsSCmGCnreoNkZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209393799"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 02:23:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKWB-00000000HqG-0nOs;
	Thu, 15 Jan 2026 10:23:55 +0000
Date: Thu, 15 Jan 2026 18:23:48 +0800
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
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <202601151700.IjgxseKd-lkp@intel.com>
References: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260115-054728
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vg4vs-00000003SFt-1Fje%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
config: powerpc-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151700.IjgxseKd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151700.IjgxseKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151700.IjgxseKd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_SGMII'
     294 |         if (submode == PHY_INTERFACE_MODE_SGMII ||
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:295:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_1000BASEX'
     295 |             submode == PHY_INTERFACE_MODE_1000BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:298:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_2500BASEX'
     298 |         if (submode == PHY_INTERFACE_MODE_2500BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/PHY_INTERFACE_MODE_SGMII +294 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

   288	
   289	static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
   290	{
   291		if (mode != PHY_MODE_ETHERNET)
   292			return -EINVAL;
   293	
 > 294		if (submode == PHY_INTERFACE_MODE_SGMII ||
 > 295		    submode == PHY_INTERFACE_MODE_1000BASEX)
   296			return SPEED_1000;
   297	
 > 298		if (submode == PHY_INTERFACE_MODE_2500BASEX)
   299			return SPEED_2500;
   300	
   301		return -EINVAL;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

