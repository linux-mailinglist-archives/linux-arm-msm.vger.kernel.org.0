Return-Path: <linux-arm-msm+bounces-47530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9852BA306BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 551DA3A24B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84381F0E5D;
	Tue, 11 Feb 2025 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T7xACDYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D941EF0A9;
	Tue, 11 Feb 2025 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265464; cv=none; b=ERo9iRbeu3kW2UNmTDD8omUFHfkB9ZRHieZzoLz1y7anFYqu7kS/zMvn5dWNrs0S3n2sjitw1aZrfrkP5+4jXDnvI2Nt1CX3do78NAtHsWUbfIubVDmPxjzJqh7LawX1JB1gb0eYZ7+CMnPLS+dLTtVicN6DJx3JICy3A4IbVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265464; c=relaxed/simple;
	bh=q1ph39zTYKj5k8jovBlZb0OmW0D/Cl5sBfBfHNGZ+Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sj2SKqN90VXUsvBQDvoqT6M/yy2K4pK+ydhrrB//S6ljnfhZ2FrEeBq8rlga0mHVhs+MlvxxsDBeU/Ks8hpEnTTtTp8qD8Gp1jGz51a9b312jEUtZLmHlD1MB+1XVRhXwBYERTl4G6xgwxkFLn65vDhdYXV+bgZNErWAiXgzmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T7xACDYR; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27539433D9;
	Tue, 11 Feb 2025 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739265459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T128NbBeShVjgHAQHFQBVXrcbz3LydX8l7wGrFI7ueM=;
	b=T7xACDYRo4ZKNUXI1/0DERPK7oBUD4COOhQeQ03s6RH8EOyByC+6pjBEZ6OzrOskPxeFuS
	bj1x1oMaVubfmt3p26TgQVuUpl2zcK0XoiUC456N7+IGvvckqpqJgCItd7YswXw26TdEOJ
	M91jZud9cbdMfRKvKG0rkxCGpLdYdpRNO1gh9mW3iT33Ge4lrkju+oPKRM6FENGcYAigOS
	AMmT/wHxfjhD2hbhK6CFJZvEZDF1S2DQtqSVDuLGIfB4sw7wuuj4cIXdgh7E5LPVHPgIIh
	G5b8e1G431JQKCpx/CGPenErBzIhdyOHy2eojCn4jjfcomZSr06/ZsDQrE6S7g==
Date: Tue, 11 Feb 2025 10:17:35 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH net-next 11/13] net: phy: Only rely on phy_port for
 PHY-driven SFP
Message-ID: <20250211101735.0af025c4@fedora-1.home>
In-Reply-To: <202502082347.tFufJ529-lkp@intel.com>
References: <20250207223634.600218-12-maxime.chevallier@bootlin.com>
	<202502082347.tFufJ529-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeifeejgeevhffhhfefvdfhgefgudefkeefgeeivdeuveejueeljeekgfffieeihfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptddurdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdquddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtr
 dhnvghtpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi,

On Sun, 9 Feb 2025 00:04:55 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Maxime,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250207223634.600218-12-maxime.chevallier%40bootlin.com
> patch subject: [PATCH net-next 11/13] net: phy: Only rely on phy_port for PHY-driven SFP
> config: i386-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502082347.tFufJ529-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/net/phy/qcom/qca807x.c:698:12: error: use of undeclared identifier 'phy_sfp_attach'; did you mean 'phy_attach'?  
>      698 |         .attach = phy_sfp_attach,
>          |                   ^~~~~~~~~~~~~~
>          |                   phy_attach
>    include/linux/phy.h:1912:20: note: 'phy_attach' declared here
>     1912 | struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
>          |                    ^
> >> drivers/net/phy/qcom/qca807x.c:699:12: error: use of undeclared identifier 'phy_sfp_detach'; did you mean 'phy_detach'?  
>      699 |         .detach = phy_sfp_detach,
>          |                   ^~~~~~~~~~~~~~
>          |                   phy_detach
>    include/linux/phy.h:1924:6: note: 'phy_detach' declared here
>     1924 | void phy_detach(struct phy_device *phydev);
>          |      ^
> >> drivers/net/phy/qcom/qca807x.c:702:17: error: use of undeclared identifier 'phy_sfp_connect_phy'  
>      702 |         .connect_phy = phy_sfp_connect_phy,
>          |                        ^
> >> drivers/net/phy/qcom/qca807x.c:703:20: error: use of undeclared identifier 'phy_sfp_disconnect_phy'  
>      703 |         .disconnect_phy = phy_sfp_disconnect_phy,
>          |                           ^
> >> drivers/net/phy/qcom/qca807x.c:748:9: error: call to undeclared function 'phy_sfp_probe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]  
>      748 |                 ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
>          |                       ^
>    5 errors generated.

Ah damned, I missed that qca807x now also supports SFP. I'll include a
conversion fr that driver too in V2 (and add Robert in CC:)

Thanks,

Maxime

