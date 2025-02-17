Return-Path: <linux-arm-msm+bounces-48153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B1A37D32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 09:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81AD517120E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B3A1A0731;
	Mon, 17 Feb 2025 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LnBzlFkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A419F115;
	Mon, 17 Feb 2025 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780968; cv=none; b=UgLhFDn9/5EEKGViZW88KkzmXHhJoMCV+EncpkZwsXvlykcjj0k8sL+ddR2mv2HKwfXwd1vQMxwLnfvYtxiWYuddSfIG+fFBvMvlrnRV9x9x3ZhELtMzqkn7fohh9cuyqW5FXMo3idjV1CK4WuGWT/TlK70YjyvTh5QWStEOfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780968; c=relaxed/simple;
	bh=NgVWQqvEGgkg3GF7x4d8/TavathxvBCSBC50VSh54eI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSCdKAFAEcVfBxLDLfCP9QzDY1CivwidKHKjjFGzr0qzT1LwCojo1xsUFO6GVVGBFvYG6nJ21AJK5JLbJ4r3CObqSRaQVMC+VRNIr1f1MVET6ur3kIW7xr+X/iV07fjEslc2eJlOt/WymGJJTAZXeqyMT4xxHcnT9bW0X3cY5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LnBzlFkc; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E51C0442AA;
	Mon, 17 Feb 2025 08:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739780956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5AnTb28mQKtjEHDL/Wk7VuZHdL8LuplyEfPirr+QDY=;
	b=LnBzlFkcgZdoEtjFLY3rmc7Fv9NnY81cKg9mYY/HiYt9UxhsWLnGxsV9cIF4Abzd17XhGe
	4kneXCqLG+QzaJNapTEBQyXVi3//cC7NdpLsTv0XhY9/D58ZsnH3ydpdOf2L7ccHO7XJ8A
	wKjo7XpWTprsPoUai+IAO8+AXYJFX2vDlszT6+M+C2Hjp+jxk07z3k+uFp2DJslPVfeZKo
	a3UI3mIZfkEjWMjNCMu+3dqfBqnc0acxFIPL5CS7+yDfws9QkU2fQGYfs5GFu9Y7Sfivrv
	5khQc4Kx7WRi6T55WBGbKgEjBGPRn15o176YQsxsQvxbgJWTtOJraFEVzc5kNA==
Date: Mon, 17 Feb 2025 09:29:11 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson
 <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <20250217092911.772da5d0@fedora.home>
In-Reply-To: <Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-6-maxime.chevallier@bootlin.com>
	<Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehjeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Russell,

On Sat, 15 Feb 2025 18:57:01 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, Feb 13, 2025 at 11:15:53AM +0100, Maxime Chevallier wrote:
> > Some PHY devices may be used as media-converters to drive SFP ports (for
> > example, to allow using SFP when the SoC can only output RGMII). This is
> > already supported to some extend by allowing PHY drivers to registers
> > themselves as being SFP upstream.
> > 
> > However, the logic to drive the SFP can actually be split to a per-port
> > control logic, allowing support for multi-port PHYs, or PHYs that can
> > either drive SFPs or Copper.
> > 
> > To that extent, create a phy_port when registering an SFP bus onto a
> > PHY. This port is considered a "serdes" port, in that it can feed data
> > to anther entity on the link. The PHY driver needs to specify the
> > various PHY_INTERFACE_MODE_XXX that this port supports.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> With this change, using phy_port requires phylink to also be built in
> an appropriate manner. Currently, phylink depends on phylib. phy_port
> becomes part of phylib. This patch makes phylib depend on phylink,
> thereby creating a circular dependency when modular.
> 
> I think a different approach is needed here.

That's true.

One way to avoid that would be to extract out of phylink/phylib all the
functions for linkmode handling that aren't tied to phylink/phylib
directly, but are about managing the capabilities of each interface,
linkmode, speed, duplex, etc. For phylink, that would be :

phylink_merge_link_mode
phylink_get_capabilities
phylink_cap_from_speed_duplex
phylink_limit_mac_speed
phylink_caps_to_linkmodes
phylink_interface_max_speed
phylink_interface_signal_rate
phylink_is_empty_linkmode
phylink_an_mode_str
phylink_set_port_modes

For now all these are phylink internal and that makes sense, but if we want
phy-driven SFP support, stackable PHYs and so on, we'll need some ways for
the PHY to expose its media-side capabilities, and we'd reuse these.

These would go into linkmode.c/h for example, and we'd have a shared set
of helpers that we can use in phylink, phylib and phy_port.

Before I go around and rearrange that, are you OK with this approach ?

Maxime

