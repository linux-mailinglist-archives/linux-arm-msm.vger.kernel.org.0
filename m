Return-Path: <linux-arm-msm+bounces-47235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85420A2D6E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 16:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B98D188A795
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 15:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9C2248193;
	Sat,  8 Feb 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gx6cjQGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB313EFE3;
	Sat,  8 Feb 2025 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739028802; cv=none; b=kxqckd0wVzKRc6wujsvlkTvL6CB6jP5OyeC4hX/qcpnPkIMsAnY9a2zGiop+k4EvRdY4UoYe26ar0YI2ClZ/EpZu8E0lhAg3X1NFDuDWk1SPN20ge4slgY6od4AyG24H24z/yHfq5zxbY1aD+VKIHJJqYLbyBa7KqrAbtqUUw58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739028802; c=relaxed/simple;
	bh=4MfKlmgKA16abJaUXilG0XVt+qrQnkw/jnRZF3C8eKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaKfjWgt0g7tYqcUYqx+zl6Cr7vidKNiAaWEq3TwKL5OlfUt96RRlUHJzG78tQCBdoQlG0OLcGRYSDiL0GwMiP0Wzxvs7dwK6Ix/awkGwpd2FqATPjlFGsxdv8TYmkcWzdmO/vcJoOeZBHzdwvOe3yyNkQRGUFozEpz4jZQAofY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gx6cjQGX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739028800; x=1770564800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MfKlmgKA16abJaUXilG0XVt+qrQnkw/jnRZF3C8eKc=;
  b=gx6cjQGXVt9KNr8eZ5xUIDNHA8ItDTlo87fwaxc7gEAWyoV616K2EZN+
   rmAbvKUgkxsZnPhQJk9d8ihztoEVufRXWvlxJ6uhJPFcU4QcpKXci/hB3
   DJqxQVT+VmnLWQnfDNVZvaE7IIVafcFL3KqtiCPBXQ1hr79EdYBbY9lEO
   EglRYRVRyn0+Csq7Rryj/SeemnMhCFXuGueb78YLctVU4z0cFMYoR2NYQ
   kluTnMyFjwWle5R9RI6mw3u9qXjKFdXZe9z9HTr5wPNIcJBZwzAxh2w+t
   Paqd/JYgk8Pmh5hmSxVLMnhiIpP5ppnEo/NCAN8bNxgfD7HFbz63yLveD
   Q==;
X-CSE-ConnectionGUID: yQXZDbhwQv6Sc8OcpbYxkw==
X-CSE-MsgGUID: UJ5qjcq+SyOkw3KakzE97g==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39565335"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39565335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:33:19 -0800
X-CSE-ConnectionGUID: F79XaquyTfmgwlWFQzGcEg==
X-CSE-MsgGUID: ZJmfoK3cRaiIBCKdfEjLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111618617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:33:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmpS-0010C7-2e;
	Sat, 08 Feb 2025 15:33:10 +0000
Date: Sat, 8 Feb 2025 23:32:35 +0800
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
Subject: Re: [PATCH net-next 06/13] net: phy: Intrduce generic SFP handling
 for PHY drivers
Message-ID: <202502082328.PaOrs2Uu-lkp@intel.com>
References: <20250207223634.600218-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-7-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250207223634.600218-7-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 06/13] net: phy: Intrduce generic SFP handling for PHY drivers
config: i386-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082328.PaOrs2Uu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082328.PaOrs2Uu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082328.PaOrs2Uu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:3682: warning: Function parameter or struct member 'phydev' not described in 'phy_get_sfp_port'


vim +3682 drivers/net/phy/phy_device.c

  3677	
  3678	/**
  3679	 * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
  3680	 */
  3681	struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
> 3682	{
  3683		struct phy_port *port;
  3684		list_for_each_entry(port, &phydev->ports, head)
  3685			if (port->active && port->is_serdes)
  3686				return port;
  3687	
  3688		return NULL;
  3689	}
  3690	EXPORT_SYMBOL_GPL(phy_get_sfp_port);
  3691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

