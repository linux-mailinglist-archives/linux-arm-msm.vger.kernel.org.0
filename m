Return-Path: <linux-arm-msm+bounces-47236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E759A2D722
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 17:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E71165A7B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 16:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8252500AC;
	Sat,  8 Feb 2025 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7Iw6IwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56B153BD7;
	Sat,  8 Feb 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739030727; cv=none; b=UzpxRKqqjCBpb7AeXUSVyS5z5pbXVYTCBL/XNM5pbwdEVQbVxiMG4Uk/7PY0MgPRXzF2my/qb7nskXwP3DGNJ9QgXJ2DLTCSpUL8L8Kgh118VHq6IMJQLR2BEp8J2pubgEKWOce/GpAzmmrnAA9kifOwIYPySDeEk+kNXufzdOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739030727; c=relaxed/simple;
	bh=+Up3R3tTo0WF2tM25OhGWnezyR3uKz7Ir9pL8p4zHP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCk0LJ6WpTgpE6TFoZai5Um0Ccds/8px+H1DxK69EhJthWOzkoyXSGTVxitjk9uh+JbXWV/JJE8BiSgUopozS826MRO+x2fhDNigPB1WBVKP+ys1J3kQh14mzr3Tee9isPD3HWVRjeMm85qTPLxFGgkNftKAm7PKVha6nAxyzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7Iw6IwP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739030726; x=1770566726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Up3R3tTo0WF2tM25OhGWnezyR3uKz7Ir9pL8p4zHP4=;
  b=i7Iw6IwPygp8bU4zQf7fuge6Km8nEIHmIv3onIMos+Ub57FtMyJd6o/C
   C/j6XjFIxBuGDU8P3Az/pjIyRDmJ5Hm4XBsSwd7bvJfAT0W7QObWZdYJX
   nDiA2EqvQ47uAm4WqtB2XXAIRVljUerlVcxKMGM7R3vYkBHJsE86yku38
   lasX2I5R8Ym4u6wcrZhTCOmPKc+Wk27Gz+38JJRPt6Gc1P2CdrdDGaztM
   YoSur3NyUivQkmdoOB6yaFh1RW31kNe9RihUMv1tAd1wzoSJuzd7j29mn
   nbeoZ+IpY55ByUTHVS2En8Vbv2HorlGulNg50D0Q1r5OoaOC1gm4E7wZk
   w==;
X-CSE-ConnectionGUID: Cwl5FRFWSiSJtuDGIvW7NQ==
X-CSE-MsgGUID: X3rAnDkgTqSE1DkvpoAWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27265508"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27265508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:05:25 -0800
X-CSE-ConnectionGUID: xxm7HiRqT8OWewmMmaOfAg==
X-CSE-MsgGUID: p65siFknQdO+3gJ8w+uhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142672695"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Feb 2025 08:05:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnKW-0010Gh-0j;
	Sat, 08 Feb 2025 16:05:16 +0000
Date: Sun, 9 Feb 2025 00:04:55 +0800
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
Subject: Re: [PATCH net-next 11/13] net: phy: Only rely on phy_port for
 PHY-driven SFP
Message-ID: <202502082347.tFufJ529-lkp@intel.com>
References: <20250207223634.600218-12-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-12-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250207223634.600218-12-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 11/13] net: phy: Only rely on phy_port for PHY-driven SFP
config: i386-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082347.tFufJ529-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/qcom/qca807x.c:698:12: error: use of undeclared identifier 'phy_sfp_attach'; did you mean 'phy_attach'?
     698 |         .attach = phy_sfp_attach,
         |                   ^~~~~~~~~~~~~~
         |                   phy_attach
   include/linux/phy.h:1912:20: note: 'phy_attach' declared here
    1912 | struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
         |                    ^
>> drivers/net/phy/qcom/qca807x.c:699:12: error: use of undeclared identifier 'phy_sfp_detach'; did you mean 'phy_detach'?
     699 |         .detach = phy_sfp_detach,
         |                   ^~~~~~~~~~~~~~
         |                   phy_detach
   include/linux/phy.h:1924:6: note: 'phy_detach' declared here
    1924 | void phy_detach(struct phy_device *phydev);
         |      ^
>> drivers/net/phy/qcom/qca807x.c:702:17: error: use of undeclared identifier 'phy_sfp_connect_phy'
     702 |         .connect_phy = phy_sfp_connect_phy,
         |                        ^
>> drivers/net/phy/qcom/qca807x.c:703:20: error: use of undeclared identifier 'phy_sfp_disconnect_phy'
     703 |         .disconnect_phy = phy_sfp_disconnect_phy,
         |                           ^
>> drivers/net/phy/qcom/qca807x.c:748:9: error: call to undeclared function 'phy_sfp_probe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     748 |                 ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
         |                       ^
   5 errors generated.


vim +698 drivers/net/phy/qcom/qca807x.c

d1cb613efbd3cd Robert Marko      2024-02-06  696  
d1cb613efbd3cd Robert Marko      2024-02-06  697  static const struct sfp_upstream_ops qca807x_sfp_ops = {
d1cb613efbd3cd Robert Marko      2024-02-06 @698  	.attach = phy_sfp_attach,
d1cb613efbd3cd Robert Marko      2024-02-06 @699  	.detach = phy_sfp_detach,
d1cb613efbd3cd Robert Marko      2024-02-06  700  	.module_insert = qca807x_sfp_insert,
d1cb613efbd3cd Robert Marko      2024-02-06  701  	.module_remove = qca807x_sfp_remove,
b2db6f4ace72e7 Maxime Chevallier 2024-08-21 @702  	.connect_phy = phy_sfp_connect_phy,
b2db6f4ace72e7 Maxime Chevallier 2024-08-21 @703  	.disconnect_phy = phy_sfp_disconnect_phy,
d1cb613efbd3cd Robert Marko      2024-02-06  704  };
d1cb613efbd3cd Robert Marko      2024-02-06  705  
d1cb613efbd3cd Robert Marko      2024-02-06  706  static int qca807x_probe(struct phy_device *phydev)
d1cb613efbd3cd Robert Marko      2024-02-06  707  {
d1cb613efbd3cd Robert Marko      2024-02-06  708  	struct device_node *node = phydev->mdio.dev.of_node;
d1cb613efbd3cd Robert Marko      2024-02-06  709  	struct qca807x_shared_priv *shared_priv;
d1cb613efbd3cd Robert Marko      2024-02-06  710  	struct device *dev = &phydev->mdio.dev;
d1cb613efbd3cd Robert Marko      2024-02-06  711  	struct phy_package_shared *shared;
d1cb613efbd3cd Robert Marko      2024-02-06  712  	struct qca807x_priv *priv;
d1cb613efbd3cd Robert Marko      2024-02-06  713  	int ret;
d1cb613efbd3cd Robert Marko      2024-02-06  714  
d1cb613efbd3cd Robert Marko      2024-02-06  715  	ret = devm_of_phy_package_join(dev, phydev, sizeof(*shared_priv));
d1cb613efbd3cd Robert Marko      2024-02-06  716  	if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  717  		return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  718  
d1cb613efbd3cd Robert Marko      2024-02-06  719  	if (phy_package_probe_once(phydev)) {
d1cb613efbd3cd Robert Marko      2024-02-06  720  		ret = qca807x_phy_package_probe_once(phydev);
d1cb613efbd3cd Robert Marko      2024-02-06  721  		if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  722  			return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  723  	}
d1cb613efbd3cd Robert Marko      2024-02-06  724  
d1cb613efbd3cd Robert Marko      2024-02-06  725  	shared = phydev->shared;
d1cb613efbd3cd Robert Marko      2024-02-06  726  	shared_priv = shared->priv;
d1cb613efbd3cd Robert Marko      2024-02-06  727  
d1cb613efbd3cd Robert Marko      2024-02-06  728  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
d1cb613efbd3cd Robert Marko      2024-02-06  729  	if (!priv)
d1cb613efbd3cd Robert Marko      2024-02-06  730  		return -ENOMEM;
d1cb613efbd3cd Robert Marko      2024-02-06  731  
d1cb613efbd3cd Robert Marko      2024-02-06  732  	priv->dac_full_amplitude = of_property_read_bool(node, "qcom,dac-full-amplitude");
d1cb613efbd3cd Robert Marko      2024-02-06  733  	priv->dac_full_bias_current = of_property_read_bool(node, "qcom,dac-full-bias-current");
d1cb613efbd3cd Robert Marko      2024-02-06  734  	priv->dac_disable_bias_current_tweak = of_property_read_bool(node,
d1cb613efbd3cd Robert Marko      2024-02-06  735  								     "qcom,dac-disable-bias-current-tweak");
d1cb613efbd3cd Robert Marko      2024-02-06  736  
1677293ed89166 Robert Marko      2024-03-05  737  #if IS_ENABLED(CONFIG_GPIOLIB)
d1cb613efbd3cd Robert Marko      2024-02-06  738  	/* Do not register a GPIO controller unless flagged for it */
d1cb613efbd3cd Robert Marko      2024-02-06  739  	if (of_property_read_bool(node, "gpio-controller")) {
d1cb613efbd3cd Robert Marko      2024-02-06  740  		ret = qca807x_gpio(phydev);
d1cb613efbd3cd Robert Marko      2024-02-06  741  		if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  742  			return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  743  	}
1677293ed89166 Robert Marko      2024-03-05  744  #endif
d1cb613efbd3cd Robert Marko      2024-02-06  745  
d1cb613efbd3cd Robert Marko      2024-02-06  746  	/* Attach SFP bus on combo port*/
d1cb613efbd3cd Robert Marko      2024-02-06  747  	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
d1cb613efbd3cd Robert Marko      2024-02-06 @748  		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
d1cb613efbd3cd Robert Marko      2024-02-06  749  		if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  750  			return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  751  		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
d1cb613efbd3cd Robert Marko      2024-02-06  752  		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
d1cb613efbd3cd Robert Marko      2024-02-06  753  	}
d1cb613efbd3cd Robert Marko      2024-02-06  754  
d1cb613efbd3cd Robert Marko      2024-02-06  755  	phydev->priv = priv;
d1cb613efbd3cd Robert Marko      2024-02-06  756  
d1cb613efbd3cd Robert Marko      2024-02-06  757  	return 0;
d1cb613efbd3cd Robert Marko      2024-02-06  758  }
d1cb613efbd3cd Robert Marko      2024-02-06  759  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

