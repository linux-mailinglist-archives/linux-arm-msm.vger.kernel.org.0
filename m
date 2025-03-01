Return-Path: <linux-arm-msm+bounces-49917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47EA4ADCC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 21:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5529D1892E36
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 20:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B65A1E493C;
	Sat,  1 Mar 2025 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApgyKAAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E139B1B414F;
	Sat,  1 Mar 2025 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740860433; cv=none; b=E98zZ3HGjwSHM95vPGI+vocWvj2LPPCQVTEpJEd7rmfMz0Jz1RUAo11gQQaz0HnEoYEiw/pzh2TQAmkjebeklp1SknoPzPDfoN5idIF284o/Kv+/q4859F6Zl7+3j1oKnUgWIjD6P9VexYVUDU7yiHkZ6bL1rqo4OYQhW3KHqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740860433; c=relaxed/simple;
	bh=rrQ//fnypHMrN3fd4zsduRE3QZa4hstc4Z87aOa0Lpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqUNZzEOlRjTMAopSdFaaXFaielDTAliDVIv8BIMeeXQEWVjtVHkT2vnTFLxCbsQjgn0ucciPMzJ9lPzA5jV0s41doPxp3ryTTkORpM7AxlQipKeGMCayfAkUOQ3p9UG023u/c46etirfZqjeGPr0kvDw7a0faUhsVTEAuu8HLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApgyKAAk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740860432; x=1772396432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrQ//fnypHMrN3fd4zsduRE3QZa4hstc4Z87aOa0Lpo=;
  b=ApgyKAAkZ7pfHEANNffFgrj7ZnGAWxXnIL1VwYXYAIfwsA0zgAESsLdM
   2v6KmEO4NK9820gHXVCv27pO9r2K3PhPMvuH1Gt3PZePWrgAeUzRYeUJI
   qIm0zzXl3IRhk0cu5V2h5UCt2OzeSvHwTCkqaXBa2gJKqitRf79OTOLa6
   LZMX9w5I/OpODZacL5xH7915NCZpuUFO4Yi5dPKPX1WHa351TPEmBlMNL
   O4eaI5ojnGyxy/YxTAPIIzX823wLDxp4qu1M7eP4xRODR5cwKhv78Y1mA
   NPm2H0CYIiBpTv2vJ7h0tZ8PwShUqcnzJTH3y9J5qlIcFbiQz1caiJis+
   g==;
X-CSE-ConnectionGUID: AUCDU4c4Syqvf4hTdX7cVw==
X-CSE-MsgGUID: su1bXrVQTcC6p38KBWGAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52411952"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52411952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:20:31 -0800
X-CSE-ConnectionGUID: xuVHpwFRQROXxCZ9NKWMIg==
X-CSE-MsgGUID: 2Mf5tN2yQliX1ZcvqY3OdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117501197"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2025 12:20:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTJs-000GfD-1E;
	Sat, 01 Mar 2025 20:20:22 +0000
Date: Sun, 2 Mar 2025 04:19:55 +0800
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
Subject: Re: [PATCH net-next v2 8/8] net: phy: remove remaining PHY package
 related definitions from phy.h
Message-ID: <202503020420.v2TkGxj1-lkp@intel.com>
References: <6ad490fa-61ad-48b8-9660-bb525f756f41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad490fa-61ad-48b8-9660-bb525f756f41@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/net-phy-move-PHY-package-code-from-phy_device-c-to-own-source-file/20250301-055302
base:   net-next/main
patch link:    https://lore.kernel.org/r/6ad490fa-61ad-48b8-9660-bb525f756f41%40gmail.com
patch subject: [PATCH net-next v2 8/8] net: phy: remove remaining PHY package related definitions from phy.h
config: arc-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020420.v2TkGxj1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020420.v2TkGxj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020420.v2TkGxj1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/bcm54140.c: In function 'bcm54140_base_read_rdb':
   drivers/net/phy/bcm54140.c:436:15: error: implicit declaration of function '__phy_package_write'; did you mean '__phy_package_write_mmd'? [-Werror=implicit-function-declaration]
     436 |         ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~~
         |               __phy_package_write_mmd
   drivers/net/phy/bcm54140.c:441:15: error: implicit declaration of function '__phy_package_read'; did you mean '__phy_package_read_mmd'? [-Werror=implicit-function-declaration]
     441 |         ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~
         |               __phy_package_read_mmd
   drivers/net/phy/bcm54140.c: In function 'bcm54140_probe':
>> drivers/net/phy/bcm54140.c:594:9: error: implicit declaration of function 'devm_phy_package_join' [-Werror=implicit-function-declaration]
     594 |         devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_phy_package_join +594 drivers/net/phy/bcm54140.c

6937602ed3f9eb Michael Walle 2020-04-20  578  
6937602ed3f9eb Michael Walle 2020-04-20  579  static int bcm54140_probe(struct phy_device *phydev)
6937602ed3f9eb Michael Walle 2020-04-20  580  {
6937602ed3f9eb Michael Walle 2020-04-20  581  	struct bcm54140_priv *priv;
6937602ed3f9eb Michael Walle 2020-04-20  582  	int ret;
6937602ed3f9eb Michael Walle 2020-04-20  583  
6937602ed3f9eb Michael Walle 2020-04-20  584  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
6937602ed3f9eb Michael Walle 2020-04-20  585  	if (!priv)
6937602ed3f9eb Michael Walle 2020-04-20  586  		return -ENOMEM;
6937602ed3f9eb Michael Walle 2020-04-20  587  
6937602ed3f9eb Michael Walle 2020-04-20  588  	phydev->priv = priv;
6937602ed3f9eb Michael Walle 2020-04-20  589  
6937602ed3f9eb Michael Walle 2020-04-20  590  	ret = bcm54140_get_base_addr_and_port(phydev);
6937602ed3f9eb Michael Walle 2020-04-20  591  	if (ret)
6937602ed3f9eb Michael Walle 2020-04-20  592  		return ret;
6937602ed3f9eb Michael Walle 2020-04-20  593  
dc9989f173289f Michael Walle 2020-05-06 @594  	devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
dc9989f173289f Michael Walle 2020-05-06  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

