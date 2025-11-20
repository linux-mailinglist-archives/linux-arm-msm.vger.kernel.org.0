Return-Path: <linux-arm-msm+bounces-82735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10CC761F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 20:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 70E0828E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 19:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED88F3019B6;
	Thu, 20 Nov 2025 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cq3oxgqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380CF15A86D;
	Thu, 20 Nov 2025 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763668159; cv=none; b=jk1Zd5TaYjAXjoEFx0XCfgieULJEwWKbksHM8OPUINMS9fB8MRJG+rKEn56rc5mlVqwseiogTsPc0XeHGv4uzdjrf6rfnqRzsGL5gSPMDzAUotv4HFSVhw5jakChwl5Q1U8VeYRrEJC39ykmc01aMxF2vzrJhMqX0YigPH4xzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763668159; c=relaxed/simple;
	bh=lyeBpt+cvGIhcc68Nah0hMFJyBVsonJpHyKIen4I70k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd3BrEQ2ic1hkB1GM2nb67aIdBabXmU3VUXa5oLcEpZ0BQ3YG7tveX6mF0wGJln0QRDDHuuTzmZNYfqbIjhjmvoidwjSalcbq/vYuKB+wRKWFEDM8U+zTxtSwhi4yzzpyIOaol0svC9rAu/QnbQCsC4c7DbnWgj+r6yc4+1wpng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cq3oxgqg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763668158; x=1795204158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lyeBpt+cvGIhcc68Nah0hMFJyBVsonJpHyKIen4I70k=;
  b=cq3oxgqg9tDQs4izvTF87Y2JG5hxuA2tdemBBWFbfR/QEqB0szD8d2cv
   uUeDsWWCtPRmfS59yN5+j2CKcXGOOtxYsZxqXC++SdJpFN92Lo6GubGDo
   UdZQtDllZevufxHsMLx6llWJ74F2zhQFSeA2jy3dhVzvCSFFrSp0062Eu
   FHaEIWMxxupSkUADYj+H7aLm0WA0CVhsAh/tPdP5U8Yb8HmkA7ZCk0tsp
   4DQWnVexbiuzEUKVlLADR1Und2HPwFNOGOow7WacqEC6mmoMQeT8Mt0eE
   tXYP3I1lOTRiji1PrT8raF8h9YjcyJ6TEjfQ+3kyPUU3FxDVhj2frogwZ
   g==;
X-CSE-ConnectionGUID: DR+1WHGgRpmlUjVlc0CSYQ==
X-CSE-MsgGUID: D/J/f5w0QoSQl1SR6zqH4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65841762"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65841762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 11:49:17 -0800
X-CSE-ConnectionGUID: +4YBvdTzTLGDfuiKK3FNpw==
X-CSE-MsgGUID: u0BX3zHXTuSv/S92bd4IzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191281630"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 11:49:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMAeS-0004Vz-0v;
	Thu, 20 Nov 2025 19:49:08 +0000
Date: Fri, 21 Nov 2025 03:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev,
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
Subject: Re: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <202511210333.9rtKR1ph-lkp@intel.com>
References: <20251119195920.442860-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119195920.442860-4-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20251120-041558
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251119195920.442860-4-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports representation
config: powerpc64-randconfig-r133-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210333.9rtKR1ph-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210333.9rtKR1ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210333.9rtKR1ph-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ethtool/common.c:463:12: sparse: sparse: symbol 'ethtool_link_medium_names' was not declared. Should it be static?

vim +/ethtool_link_medium_names +463 net/ethtool/common.c

   462	
 > 463	const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
   464		[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
   465		[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
   466		[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
   467		[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
   468		[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
   469		[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
   470		[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
   471		[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
   472		[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
   473		[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
   474		[ETHTOOL_LINK_MEDIUM_NONE] = "None",
   475	};
   476	static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

