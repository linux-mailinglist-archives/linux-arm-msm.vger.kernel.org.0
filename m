Return-Path: <linux-arm-msm+bounces-68370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5BDB20A05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 15:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933C618A0EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5EC2D77EF;
	Mon, 11 Aug 2025 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PJTZBGOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8421F5820;
	Mon, 11 Aug 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918612; cv=none; b=T9ir5LAfoHl5e6+vcqvvTKAyPMcHifiqltKJYjfod0YdbTKiJOzIiJYLh13S4QrTBpjeNucCJQV6la3MAiHm1rCvU0gM42nnZT9ASiMqeM3oHsH+Cy3SG7qLtANsJP5HBSgBuMK7K8nmpIAq8bOXgDSU4Cxr0o7TKAMM+WLr7Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918612; c=relaxed/simple;
	bh=QOt4nl4gH2rAahpzS5A/CbVGMy7r+RZAUBvLUl62HhU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opZCclJcQffuEyk5iAqVSIr1wFm9ocDfxeAhKwcxMKztnM78pAEMXsAD7fQoV8Imz7xFa5iS2J9tKBHnsSrl8Qt46kv4HG4JRO5odxO5BOldY6uhLMrasON0Q2F96JYf3JqNZTSTCxzeE9inxCATq9IUJtk5grnXuXNHOg33opo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PJTZBGOc; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30B8443A03;
	Mon, 11 Aug 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gUI1uF0yA+eVneoGws46GefU9bZoq7cd2UXxP673XV8=;
	b=PJTZBGOc2I/0iLGm3hKvx46Ro41UxERqinu4KYAduJzMrW2ja3GzFgCUvsRFt+drRSEmhU
	RrDNVgP6/ShOWhZL5Fee+o1wZwzskhZ4V1Pq82j7kOt+yWZeFEWVH6+EmGZCrMklfbAHPv
	2ilgJXpI6B+ve6w63rmYZu2G5ljTRWT8d3ElshTtEB/5qIMHE4MgEemgVStHNVEH8r886F
	7Pamc/MBsCKaS2c0Fwjdk4SJIl+C7d2txQKGMZNwectTI9XrdvoHFqi6ML7420uGmsBsiz
	hCdBihh9Sj/ZkO8irotjUgSgkHARw9Z8hJ5ffBq029QyNEvgPwOlQYv8Yjw+DQ==
Date: Mon, 11 Aug 2025 15:23:23 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 11/15] net: phy: at803x: Support SFP
 through phy_port interface
Message-ID: <20250811152323.24012309@fedora.home>
In-Reply-To: <67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-12-maxime.chevallier@bootlin.com>
	<67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleehgeevfeejgfduledtlefhlefgveelkeefffeuiedtteejheduueegiedvveehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvs
 ehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Russell, Andrew,

On Sat, 26 Jul 2025 23:24:36 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > -	if (iface == PHY_INTERFACE_MODE_SGMII)
> > -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");  
> 
> I think we need to keep this warning. I don't remember the details,
> but i think this is the kernel saying the hardware is broken, this
> might not work, we will give it a go, but don't blame me if it does
> not work. We need to keep this disclaimer.

As I'm preparing for the next iteration, I was wondering if this could
be something we could move into the core.

The series generalizes most of the SFP handling for PHYs, and I
actually don't have a nice spot in at803x to put the warning anymore :)

However what's being said by this warning has nothing specific to
at803x, it applies to any PHY driver (or even, any SFP upstream) that
supports 1000BaseX but does not support SGMII.

The idea is that some modules with a built-in PHY will work when using
1000BaseX as the MII (with of course the limitation that 10/100M won't
ever work), so instead of bailing out when we have an SGMII module on a
1000BaseX SFP cage, we give it a try with a very loud warning that this
is "best effort, probably won't work, don't blame the kernel".

This has been discussed a bit originally here [1]

Is it OK for you if we move that warning into core code ?

Maxime

[1] : https://lore.kernel.org/netdev/20210701231253.GM22278@shell.armlinux.org.uk/

