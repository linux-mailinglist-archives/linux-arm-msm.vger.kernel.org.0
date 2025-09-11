Return-Path: <linux-arm-msm+bounces-73030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D7B52541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9BA7480138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD4C1DE4F1;
	Thu, 11 Sep 2025 01:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nb9a94fx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A31519B9;
	Thu, 11 Sep 2025 01:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757552432; cv=none; b=nJEeybBIibZ2JleVY7bOIseaIqVHtjS2gpSKY5vTo0OhM/0BzSZQaHqCnvHbRP7eUz1BgOoUEiAw1s8DkbVrvJU6SleXpHeRHh9+NTWRsxEZ1IbiWZb7Boju9Q2tcMWdIV6KGB1F7P1MFbzv9lDZpZ42/jUdRvQbm6jJCqSmvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757552432; c=relaxed/simple;
	bh=XeSikDz3/rCknydEBrqESWnjjoPx806qZ8IdQkhjSTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDEQdlP9WLgtzwA7MrJdmyX5SX6JIVLMoHMM7QrkjqnZSpmMMkrYbZIVXl98Vfy+/h0Qa8YXHaOiThG9pIZuzVUU3tZXC9jgjZi41OWyeEtOXBFg8fiWfW92cF2Zyk8phYdcDyfsP0YQoDFra2SMvEFT+0V24Mblu93pdRIbCxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nb9a94fx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757552431; x=1789088431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XeSikDz3/rCknydEBrqESWnjjoPx806qZ8IdQkhjSTI=;
  b=Nb9a94fxhKYxVTed5b6Xuyy8mDIO4xmWwjAjnODQq6BNs5EhTV9CN3oW
   vUhmNXSbodYYpRGkWCP4Yc5iBfU7JQltpaN8n6GTZ20egr8nrxKUWp6hR
   nBkfcboiFR4vOe10yNqqClSyHPE13pYbbNS6A/Is1eKj5AySGUL+WIiMS
   7pjZhOvsFBcLND0irbfegoVpxTkU4ZDO4LlkFyeMc3F46VnD+de/Ozr1R
   Ff1P4z87YEEPTcplHhZ4Rkb/aV0N6/jdFAH2MXWsLQoRVFyKvdQATcTKo
   0LHThZKu7ymzEX3GiCEkrK0W4NjxerBzptnCkr8jlSOx8LzND4tCAT3Pw
   A==;
X-CSE-ConnectionGUID: uBYKdiP6RrOUXA2eLQlY1w==
X-CSE-MsgGUID: N36bxgagR82qXQp0yIXWfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85320724"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="85320724"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:00:30 -0700
X-CSE-ConnectionGUID: KgU3xY3NQhWIRsn18xSuHA==
X-CSE-MsgGUID: cHaGfah0QLCNJg8PMluWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173382583"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2025 18:00:23 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwVfg-0006OT-14;
	Thu, 11 Sep 2025 01:00:20 +0000
Date: Thu, 11 Sep 2025 08:59:53 +0800
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
Subject: Re: [PATCH net-next v12 09/18] net: phylink: Move sfp interface
 selection and filtering to phy_caps
Message-ID: <202509110810.9Kjzuszo-lkp@intel.com>
References: <20250909152617.119554-10-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909152617.119554-10-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250909-233858
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250909152617.119554-10-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v12 09/18] net: phylink: Move sfp interface selection and filtering to phy_caps
config: arm-randconfig-001-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110810.9Kjzuszo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110810.9Kjzuszo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110810.9Kjzuszo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_caps_filter_sfp_interfaces" [drivers/net/phy/phylink.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

