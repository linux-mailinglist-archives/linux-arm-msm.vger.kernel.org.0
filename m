Return-Path: <linux-arm-msm+bounces-49915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897DA4AD7B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 20:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A6B3A8B75
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 19:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B871E5B72;
	Sat,  1 Mar 2025 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nevdjcf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFAA1DF965;
	Sat,  1 Mar 2025 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740856345; cv=none; b=GRv5OFt5oUNFcvsCZoBGdvLRr8eWtgG6WiM295Vn/GAJL19SASU0D+vMUSgzIFSZcIOxAaPd5foWC+2FzTlqIMuyuBLNef55TMm6TKlCjcZAG5CMJApWNSXCrIqMoB9i+9Pox6b1Z1PEuXLcEA+t+uyJjDhcECZ3C4B+tjbCGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740856345; c=relaxed/simple;
	bh=DyVqMDTjFOtdYjGsdKm+c9WKb6UulDm2pWWftGGsFWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZSqbh/8TMrRx1n3RhRKbBBSlr7JXHy0g9QTFxFRD46weU6QDP+GorMOUpPE57MCWOvTx2Tx+fGhmTADIiIYAqRPpKHF0qKAJSWhKdKRk7PWb2a5jhOOhSRJRWz5L2eKDfGpfyMb7HzTSvu4hbM9mUuNJOHT8UIDK/isHhAdc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nevdjcf9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740856344; x=1772392344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyVqMDTjFOtdYjGsdKm+c9WKb6UulDm2pWWftGGsFWw=;
  b=nevdjcf9Nj3vePBP5CmTeLdVsGQ4s3MGgnYIxdQPX5sjc1es10uyKAyd
   E5VXFHNKXOjNwdWWTUBoqMPRBZ114QQtaTpM9oOINRuWfIjIQ6Lj/c+NC
   CD45thQWRqHuicbToobJDALiFglXiuhEAnGqK+fY47HMJ5T39BsrUynjB
   ELdm6Pi0niMhJGjF6RtkbivgWb+DA2a+Pk33pKP+33HUu/RN3mpvkc492
   k3yb/NPxT8YCZY54CUhegN7a+P075AwO381432qpL18xZFCGf0lDoiqxI
   sHORcZdJkfBCwR6t3XhLIMS586MXcJmoB3rtZO9eKLrXgDKRVS3y4mCUn
   w==;
X-CSE-ConnectionGUID: AE7i2x5kRQmkbop/ItHrTw==
X-CSE-MsgGUID: ZEGlDFGvTBmlSWk2/3UPLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59312166"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59312166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:12:23 -0800
X-CSE-ConnectionGUID: ZKwj2oENQ26kcnYX2VV9KA==
X-CSE-MsgGUID: GIqMLBn7SBWjMx3cSMshMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117494432"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2025 11:12:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSFo-000Gb8-0a;
	Sat, 01 Mar 2025 19:12:06 +0000
Date: Sun, 2 Mar 2025 03:10:48 +0800
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
Message-ID: <202503020223.C2TbkgPv-lkp@intel.com>
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
config: arc-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020223.C2TbkgPv-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020223.C2TbkgPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020223.C2TbkgPv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/bcm54140.c: In function 'bcm54140_base_read_rdb':
>> drivers/net/phy/bcm54140.c:436:15: error: implicit declaration of function '__phy_package_write'; did you mean '__phy_package_write_mmd'? [-Werror=implicit-function-declaration]
     436 |         ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~~
         |               __phy_package_write_mmd
>> drivers/net/phy/bcm54140.c:441:15: error: implicit declaration of function '__phy_package_read'; did you mean '__phy_package_read_mmd'? [-Werror=implicit-function-declaration]
     441 |         ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~
         |               __phy_package_read_mmd
   cc1: some warnings being treated as errors


vim +436 drivers/net/phy/bcm54140.c

4406d36dfdf1fb Michael Walle     2020-04-20  430  
6937602ed3f9eb Michael Walle     2020-04-20  431  static int bcm54140_base_read_rdb(struct phy_device *phydev, u16 rdb)
6937602ed3f9eb Michael Walle     2020-04-20  432  {
6937602ed3f9eb Michael Walle     2020-04-20  433  	int ret;
6937602ed3f9eb Michael Walle     2020-04-20  434  
dc9989f173289f Michael Walle     2020-05-06  435  	phy_lock_mdio_bus(phydev);
9eea577eb1155f Christian Marangi 2023-12-15 @436  	ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
9eea577eb1155f Christian Marangi 2023-12-15  437  				  MII_BCM54XX_RDB_ADDR, rdb);
6937602ed3f9eb Michael Walle     2020-04-20  438  	if (ret < 0)
6937602ed3f9eb Michael Walle     2020-04-20  439  		goto out;
6937602ed3f9eb Michael Walle     2020-04-20  440  
9eea577eb1155f Christian Marangi 2023-12-15 @441  	ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
9eea577eb1155f Christian Marangi 2023-12-15  442  				 MII_BCM54XX_RDB_DATA);
6937602ed3f9eb Michael Walle     2020-04-20  443  
6937602ed3f9eb Michael Walle     2020-04-20  444  out:
dc9989f173289f Michael Walle     2020-05-06  445  	phy_unlock_mdio_bus(phydev);
6937602ed3f9eb Michael Walle     2020-04-20  446  	return ret;
6937602ed3f9eb Michael Walle     2020-04-20  447  }
6937602ed3f9eb Michael Walle     2020-04-20  448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

