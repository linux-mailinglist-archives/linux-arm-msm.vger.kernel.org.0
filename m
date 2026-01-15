Return-Path: <linux-arm-msm+bounces-89198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065CD23DA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAC7C3009F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C713935EDA1;
	Thu, 15 Jan 2026 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA5ZbP/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D0357A25;
	Thu, 15 Jan 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471926; cv=none; b=hrMb+uHq13fYITSbdc7/7EX8xIUG4pCsfbltKQUP9H3gHf0rCCbKlvB/x3cweqYDpfAr0GQcLQc1yE+Z57JfGouHGRkLA7z9b0lCxV7mv4gjHpja9B9aCkORjERJx45pBBWcePJQL0QPmmejY6jT4qwLphpJYxGUO6oKo1G/2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471926; c=relaxed/simple;
	bh=tx5ox7cf+WJOeQAnUn6eddrERLDC/s/3WemE93oK43A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX3IMVMhMTtUaDwudkfUM403kzFFOisUbYtjuc7v9WblxwRYKbbEv1otuLwoy+AftwrZJoEv/LjpvZwkLvCSp20+aqQUsZJOsMlCHu5Xbr7koSmvUpauMDK8dFkHiezPnadvHgAjmuKbSKIy3cRyJes7itgn06i7UB8YtZeIveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA5ZbP/v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768471925; x=1800007925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tx5ox7cf+WJOeQAnUn6eddrERLDC/s/3WemE93oK43A=;
  b=hA5ZbP/vr9Nw20IvoiAugazAAp4LvgX6gyHtSzQnhxMM+vChJN7D4OtH
   KT6ybz24esLtdOyPyErPs+4IAKlPZ85GO8dg2V+KTdsSKW4FZS5KLKhA7
   xpfgOvKKgzH7C85BxUHA8P+3NbAjtKOb1GMetbmFbYrPV1JVFv5x+u5OP
   ku5UvKwsroO5uFlv+bGJpVRaCNA1b94poxCffePp32AQkWDFoW8h6Ua+D
   zQKYy2ulDp79YZpJ5f4UD2+yVB2Ry41C3r0VlIV6ngigXP1RggFSS8F+r
   UFecM0mDx1daVpdrDJWxQj2vRLXf044sM+kvziBEsPEPofVWAw00SiIN1
   g==;
X-CSE-ConnectionGUID: NWAdZUBQSvGtuw5Q1IYiOA==
X-CSE-MsgGUID: l/nDkJudStWJINSspSS9Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95253465"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="95253465"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:12:02 -0800
X-CSE-ConnectionGUID: pTIX+ck0SgKrV1X6qCteVg==
X-CSE-MsgGUID: bH39DakyT76AUG+yMF9u4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235630095"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 02:11:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKKY-00000000HpY-2zGP;
	Thu, 15 Jan 2026 10:11:54 +0000
Date: Thu, 15 Jan 2026 18:11:39 +0800
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
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <202601151714.J1BAilHy-lkp@intel.com>
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
config: microblaze-randconfig-r073-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151714.J1BAilHy-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151714.J1BAilHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151714.J1BAilHy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-sgmii-eth.c: In function 'qcom_dwmac_sgmii_phy_speed':
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:24: error: 'PHY_INTERFACE_MODE_SGMII' undeclared (first use in this function)
     294 |         if (submode == PHY_INTERFACE_MODE_SGMII ||
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:24: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:295:24: error: 'PHY_INTERFACE_MODE_1000BASEX' undeclared (first use in this function)
     295 |             submode == PHY_INTERFACE_MODE_1000BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:298:24: error: 'PHY_INTERFACE_MODE_2500BASEX' undeclared (first use in this function)
     298 |         if (submode == PHY_INTERFACE_MODE_2500BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

