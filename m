Return-Path: <linux-arm-msm+bounces-49916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3B3A4AD81
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 20:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B3E916AB96
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E121E47B0;
	Sat,  1 Mar 2025 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBAv/ABw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC91C5D7D;
	Sat,  1 Mar 2025 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740857171; cv=none; b=uCh7LaGPNmucmmsAWSJaaz/qpdu8uBQedVJtXzQjCIwjAxVa6uIgLtmFin4D+iPG2BnxilXBCp+nU42XpR0PeL1pJQni7+DMObgD5h6cdF9914QOc5WRNa3Rf4m64e5zUfHkqBE56LYCY1E/kspO0HRNUgmXsDvDmp7im9DnKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740857171; c=relaxed/simple;
	bh=Kgh0c47meoZDWfMVUZjQEqtme+w+1HSPoNcT4ynJ/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJVqfDPQjdE+aLVVrWGDh7PxLraG+euyftX4nwhROxKLlKWm7Dp/vYI9MVYOCUAihgPzaijwzcqSs+06iRdSQaBvTIjbVXONx/UB/vRZMR6u+oJgZUAprmjjBYXLLG7A8ElQYKTvLeJ1v8aM09yuShtcBlepjBaAANb5bAMeDlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBAv/ABw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740857170; x=1772393170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kgh0c47meoZDWfMVUZjQEqtme+w+1HSPoNcT4ynJ/ro=;
  b=DBAv/ABwi/Cmh6tRXWqvBaJ4GN9ep+ukLWzUajSH06KqLgcCsRdGN7No
   M4dEtynqd547LF3dO6Sso2VSnXPvxcEZ3X9mvMZIBhAuVVEsKkXEGmfOd
   fHgl+xVqWx2XrjCPXmtFwnBu0yRRG8c3vLqfIyxSdr3VZ9ZD18bQ/L9rw
   6wJrvh4iQ8vc5Xh2oWt572IWYqJ0QxU5D+6rpxpoz2d1rqIghQj1609Zx
   LOrMh1nKeVXZABo6av6uUh2AfjsMvMItKAlxsfIakWolz0wXPEgkTctWE
   IgU+4tvblzMncyg479aJrTxUycINGSTZVa5hd3bTfmVssy424fTioD3A4
   A==;
X-CSE-ConnectionGUID: M0nvj3AdS7C6Z1FbSkkNxw==
X-CSE-MsgGUID: nD2fotOJT0mOsBfV7Ua3PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41958874"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41958874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:26:09 -0800
X-CSE-ConnectionGUID: 6zm7FR3RQv2VBKgpt9eVSQ==
X-CSE-MsgGUID: ArHqyzkEQbubIfiIdkWtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154800058"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Mar 2025 11:26:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSSF-000GbW-2V;
	Sat, 01 Mar 2025 19:25:07 +0000
Date: Sun, 2 Mar 2025 03:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH net-next v2 7/8] net: phy: move PHY package related code
 from phy.h to phy_package.c
Message-ID: <202503020328.FJG7PJon-lkp@intel.com>
References: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/net-phy-move-PHY-package-code-from-phy_device-c-to-own-source-file/20250301-055302
base:   net-next/main
patch link:    https://lore.kernel.org/r/edba99c5-0f95-40bd-8398-98d811068369%40gmail.com
patch subject: [PATCH net-next v2 7/8] net: phy: move PHY package related code from phy.h to phy_package.c
config: loongarch-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020328.FJG7PJon-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020328.FJG7PJon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020328.FJG7PJon-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/bcm54140.c: In function 'bcm54140_base_read_rdb':
   drivers/net/phy/bcm54140.c:436:15: error: implicit declaration of function '__phy_package_write'; did you mean '__phy_package_write_mmd'? [-Wimplicit-function-declaration]
     436 |         ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~~
         |               __phy_package_write_mmd
   drivers/net/phy/bcm54140.c:441:15: error: implicit declaration of function '__phy_package_read'; did you mean '__phy_package_read_mmd'? [-Wimplicit-function-declaration]
     441 |         ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~
         |               __phy_package_read_mmd
   drivers/net/phy/bcm54140.c: In function 'bcm54140_probe':
>> drivers/net/phy/bcm54140.c:599:13: error: implicit declaration of function 'phy_package_init_once'; did you mean 'phy_package_write_mmd'? [-Wimplicit-function-declaration]
     599 |         if (phy_package_init_once(phydev)) {
         |             ^~~~~~~~~~~~~~~~~~~~~
         |             phy_package_write_mmd


vim +599 drivers/net/phy/bcm54140.c

6937602ed3f9ebd Michael Walle 2020-04-20  578  
6937602ed3f9ebd Michael Walle 2020-04-20  579  static int bcm54140_probe(struct phy_device *phydev)
6937602ed3f9ebd Michael Walle 2020-04-20  580  {
6937602ed3f9ebd Michael Walle 2020-04-20  581  	struct bcm54140_priv *priv;
6937602ed3f9ebd Michael Walle 2020-04-20  582  	int ret;
6937602ed3f9ebd Michael Walle 2020-04-20  583  
6937602ed3f9ebd Michael Walle 2020-04-20  584  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
6937602ed3f9ebd Michael Walle 2020-04-20  585  	if (!priv)
6937602ed3f9ebd Michael Walle 2020-04-20  586  		return -ENOMEM;
6937602ed3f9ebd Michael Walle 2020-04-20  587  
6937602ed3f9ebd Michael Walle 2020-04-20  588  	phydev->priv = priv;
6937602ed3f9ebd Michael Walle 2020-04-20  589  
6937602ed3f9ebd Michael Walle 2020-04-20  590  	ret = bcm54140_get_base_addr_and_port(phydev);
6937602ed3f9ebd Michael Walle 2020-04-20  591  	if (ret)
6937602ed3f9ebd Michael Walle 2020-04-20  592  		return ret;
6937602ed3f9ebd Michael Walle 2020-04-20  593  
dc9989f173289f3 Michael Walle 2020-05-06  594  	devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
dc9989f173289f3 Michael Walle 2020-05-06  595  
4406d36dfdf1fbd Michael Walle 2020-04-20  596  #if IS_ENABLED(CONFIG_HWMON)
4406d36dfdf1fbd Michael Walle 2020-04-20  597  	mutex_init(&priv->alarm_lock);
4406d36dfdf1fbd Michael Walle 2020-04-20  598  
dc9989f173289f3 Michael Walle 2020-05-06 @599  	if (phy_package_init_once(phydev)) {
4406d36dfdf1fbd Michael Walle 2020-04-20  600  		ret = bcm54140_probe_once(phydev);
4406d36dfdf1fbd Michael Walle 2020-04-20  601  		if (ret)
4406d36dfdf1fbd Michael Walle 2020-04-20  602  			return ret;
4406d36dfdf1fbd Michael Walle 2020-04-20  603  	}
4406d36dfdf1fbd Michael Walle 2020-04-20  604  #endif
4406d36dfdf1fbd Michael Walle 2020-04-20  605  
6937602ed3f9ebd Michael Walle 2020-04-20  606  	phydev_dbg(phydev, "probed (port %d, base PHY address %d)\n",
6937602ed3f9ebd Michael Walle 2020-04-20  607  		   priv->port, priv->base_addr);
6937602ed3f9ebd Michael Walle 2020-04-20  608  
6937602ed3f9ebd Michael Walle 2020-04-20  609  	return 0;
6937602ed3f9ebd Michael Walle 2020-04-20  610  }
6937602ed3f9ebd Michael Walle 2020-04-20  611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

