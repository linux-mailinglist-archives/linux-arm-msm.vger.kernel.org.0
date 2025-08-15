Return-Path: <linux-arm-msm+bounces-69304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E33B276BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 05:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 215734E51CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 03:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B53B29D260;
	Fri, 15 Aug 2025 03:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJmjePcs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EE274B59;
	Fri, 15 Aug 2025 03:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755228393; cv=none; b=a0bGeka3cyUYnhaU8jGOpsIw4TseSXjjB/zVt+h9J1x0DnYT1oaCItnyli6Pl8vZGjAJLp1eAq/0s+b0yrZvSHfToGlLLaSTqQo7qUeQKCX44tEbur5d7OSdaTzxdaqVq1dY7voIMF/rMgwqglQgaRnaKyPtw7kaP8/+1lHZb8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755228393; c=relaxed/simple;
	bh=5CtCyWuTgP/8clYLR9mQb2RLKdITFXhoF9CEAmqsi5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmrpcg8AKT4RYSae+DCpQnFOpoXdMUT37+RPWWHZ397RtnUtW11WR0YftqZxR/7KvyaSDFAsnteovtpAS5fQT2P3kPnMGjUnXT40QS+tLYxdoqrf1ys2bfre8VPNTdnmPRzAT8zmlW5+thOTmpTCwTH/hWz9fu3LPFMcLWhzInM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJmjePcs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755228392; x=1786764392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CtCyWuTgP/8clYLR9mQb2RLKdITFXhoF9CEAmqsi5s=;
  b=NJmjePcs/mhbFZRKmWBh7g8+FoLPJtrS8FkYtyA9wd+DX4QWC48yV1FD
   tUV6acLkiP+cYNesgvHtdvxRJCYv8NQ7wYK5eMBlnnRUj4qI+XBeV2krt
   TKYryQs4u48H9Cx9oeciMSzo4I5uU3JqVoC0vn+nFfuG2HvK8hch1mUlQ
   GVtufrFaS8lZTlyIvnF92gkhLUD8829hMhERH+/mZuqpcSRQ8W/ODbTVb
   8izH0y5eJcvkE/WecjqIcwzLBfHbWQYWrp4fFctLNSPKeGjOQniZ7Cva3
   sySt/a1F/y/Th77bRg0ycdf6iLS2sDVu2NuIuvTbZY8IEvtobCrAzZ8ku
   g==;
X-CSE-ConnectionGUID: /LwyjmUcSbOSsp7cyaA1gA==
X-CSE-MsgGUID: aZU7XggRS2C8vz+UUBUnSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57465781"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57465781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:26:31 -0700
X-CSE-ConnectionGUID: NPGfBA5+Th+3cPDrRLUODQ==
X-CSE-MsgGUID: oGTsP8FHQlCdwpSczOAxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197916558"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2025 20:26:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uml4v-000BVU-2v;
	Fri, 15 Aug 2025 03:26:10 +0000
Date: Fri, 15 Aug 2025 11:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <202508151058.jqJsn9VB-lkp@intel.com>
References: <20250814135832.174911-9-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135832.174911-9-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250814-221559
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250814135832.174911-9-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP handling for PHY drivers
config: i386-randconfig-013-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151058.jqJsn9VB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151058.jqJsn9VB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151058.jqJsn9VB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:1625:47: warning: variable 'iface' is uninitialized when used here [-Wuninitialized]
    1625 |                 return port->ops->configure_mii(port, true, iface);
         |                                                             ^~~~~
   drivers/net/phy/phy_device.c:1597:2: note: variable 'iface' is declared here
    1597 |         phy_interface_t iface;
         |         ^
   1 warning generated.


vim +/iface +1625 drivers/net/phy/phy_device.c

  1589	
  1590	static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
  1591	{
  1592		struct phy_device *phydev = upstream;
  1593		struct phy_port *port;
  1594	
  1595		__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
  1596		DECLARE_PHY_INTERFACE_MASK(interfaces);
  1597		phy_interface_t iface;
  1598	
  1599		linkmode_zero(sfp_support);
  1600	
  1601		port = phy_get_sfp_port(phydev);
  1602		if (!port)
  1603			return -EINVAL;
  1604	
  1605		sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
  1606	
  1607		if (phydev->n_ports == 1)
  1608			phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
  1609	
  1610		linkmode_and(sfp_support, port->supported, sfp_support);
  1611		linkmode_and(interfaces, interfaces, port->interfaces);
  1612	
  1613		if (linkmode_empty(sfp_support)) {
  1614			dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
  1615			return -EINVAL;
  1616		}
  1617	
  1618		/* Check that this interface is supported */
  1619		if (!test_bit(iface, port->interfaces)) {
  1620			dev_err(&phydev->mdio.dev, "PHY %s does not support the SFP module's requested MII interfaces\n", phydev_name(phydev));
  1621			return -EINVAL;
  1622		}
  1623	
  1624		if (port->ops && port->ops->configure_mii)
> 1625			return port->ops->configure_mii(port, true, iface);
  1626	
  1627		return 0;
  1628	}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

