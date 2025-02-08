Return-Path: <linux-arm-msm+bounces-47237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE1AA2D72C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 17:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D26EF1674DA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 16:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3B22500D8;
	Sat,  8 Feb 2025 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZ7SFyxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E6187346;
	Sat,  8 Feb 2025 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739031330; cv=none; b=R1Me03qI4FWdpNUz7YjjTRrDBvNC8/Mn203JZCGacpchvYcJZkn+mX9C1PCmE7JwuMIHZBjXDkCa2QrWBsvkoTVZlG5UBD2c8yvLZk8rwzq5KkkBFb3epV1IZiwvM4SiaFOaauhyqzJqjyNruuoKiTkvTqJY2Zre6GjNcGGCF1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739031330; c=relaxed/simple;
	bh=qjV1wjKjlXBB7aJHZrNgaXYHC6q7WnBZJMd9PbbzIxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL1sWqxOxjt54Sj0pEoS/kENp+Z2KP8Kt3fgc7f7na9elD9/ejZHoVGPAYk1X5HDwYOmewouFBaBipv0ld3/D+f+0qZ+EWq6IUmCQgJH8QWDPH5ySodwCXcHEfRZ6Sh+AcTEU5eY6Hs5d+G/4Z6n+QImoMJdjuZJgY5OXToGZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZ7SFyxt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739031329; x=1770567329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjV1wjKjlXBB7aJHZrNgaXYHC6q7WnBZJMd9PbbzIxQ=;
  b=dZ7SFyxtPoC5PoA3YHIu2nfk5BBS6hhBnDwjPj8CnoFkIwsk7lhfgmkK
   CPWz/az1EgjqpHH6vOfPR9VucOWo3ot5zWya1p4Q+JCgZZek61phqxl/d
   RmfiJ7dBK95H0Q9pt7MuADgiL/qwa7cSV6/XDjDcuntRwfiTiTp/2vJ6F
   kCUz+KEh06sDEwxErk4dTYK1O5EspBgbRbYm6yFZBXdfXlJ6mu9CRnuCi
   /1MXAflKmaMbAnumpVl36gDuie3C2LwwvdBmuhUkdyO28BZgY7IyKkzFH
   CAjkU+RUH4X7UTttfgnjXfmJx5VDs1hua2pyvIurN2xGDvDvx5Zx9Uz1U
   A==;
X-CSE-ConnectionGUID: yUELN7ooQw2/ipxzaEBHqg==
X-CSE-MsgGUID: wxI248r6Sfy1EP6d5DB0Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27266057"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27266057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:15:28 -0800
X-CSE-ConnectionGUID: u7esEy1ORdW8L+jgc21u/A==
X-CSE-MsgGUID: 7p6bmWiyR/eQipD6rm+wmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142673942"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Feb 2025 08:15:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnUF-0010J1-1s;
	Sat, 08 Feb 2025 16:15:19 +0000
Date: Sun, 9 Feb 2025 00:15:18 +0800
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
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 12/13] net: phy: dp83822: Add SFP support
 through the phy_port interface
Message-ID: <202502090056.jTCOvIPk-lkp@intel.com>
References: <20250207223634.600218-13-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-13-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250207223634.600218-13-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 12/13] net: phy: dp83822: Add SFP support through the phy_port interface
config: i386-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090056.jTCOvIPk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090056.jTCOvIPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090056.jTCOvIPk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
>> drivers/net/phy/dp83822.c:916:13: error: use of undeclared identifier 'PHY_INTERFACE_MODE_100BASEFX'; did you mean 'PHY_INTERFACE_MODE_100BASEX'?
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           PHY_INTERFACE_MODE_100BASEX
   include/linux/bitops.h:54:48: note: expanded from macro '__set_bit'
      54 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                                           ^
   include/linux/bitops.h:44:25: note: expanded from macro 'bitop'
      44 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^
   include/linux/phy.h:140:2: note: 'PHY_INTERFACE_MODE_100BASEX' declared here
     140 |         PHY_INTERFACE_MODE_100BASEX,
         |         ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
   drivers/net/phy/dp83822.c:916:13: error: use of undeclared identifier 'PHY_INTERFACE_MODE_100BASEFX'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                           ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
   drivers/net/phy/dp83822.c:916:13: error: use of undeclared identifier 'PHY_INTERFACE_MODE_100BASEFX'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                           ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
   8 errors generated.


vim +/interfaces +916 drivers/net/phy/dp83822.c

   899	
   900			if (dp83822->fx_enabled) {
   901				port->lanes = 1;
   902				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
   903						BIT(ETHTOOL_LINK_MEDIUM_BASEX);
   904			} else {
   905				/* This PHY can only to 100BaseTX max, so on 2 lanes */
   906				port->lanes = 2;
   907				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
   908			}
   909		}
   910	
   911		/* If attached from SFP, is_serdes is set, but not the mediums. */
   912		if (port->is_serdes)
   913			dp83822->fx_enabled = true;
   914	
   915		if (dp83822->fx_enabled)
 > 916			__set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
   917	
   918		return 0;
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

