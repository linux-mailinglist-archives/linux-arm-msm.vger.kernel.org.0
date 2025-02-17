Return-Path: <linux-arm-msm+bounces-48234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E33A3865E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F1F3B36CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A13A21D5BD;
	Mon, 17 Feb 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S4t1vLHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EACF21D58E;
	Mon, 17 Feb 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802145; cv=none; b=sHb5E2hVt8J8iDgookPaN8p2mH6ccm6DSusePHDxijHGsJVs9ZpwEYqtksUwsk1lmMwz2O2owFCh+IB+SHPa5huUUmIsK0x2Cofm/bZpmMZF4BBrb4LW8VbYxvwbtFbroh3e53sRtx4jYhY1bYw+hqWPb+OMshyo6ShVOIQpErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802145; c=relaxed/simple;
	bh=mbCXMdlrvkChHBaebNVBUxjlfeVxhqoXVwda21Ivn1E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvvqs9iXiVqfRoICY1vXnHlUVgIqbm1QnlyiV8ufnQSDnar+DXaBl7hagtcLw0bGKcf2dtN3e+Q0eWEoOkRojn6QhBl7jdk4i3FaK+fk7vDkwlomVNHN3uFL/AJh/5u9M3mJfEzHCZTREkNq4Lw9sCaOtNS5VQrXfwE4nbjBURw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S4t1vLHC; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 478D844430;
	Mon, 17 Feb 2025 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739802140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agWMaaEU4vp0cnAil5eV67woVUsr1A/2Ld8pyt7qoFI=;
	b=S4t1vLHCw/Kg2C8kbN3Ak0U48q7PKjHPfh+PurW6NQBhIvLAbuA7cHLbuIku/84RI3Bu8g
	OPo4PqbadCh5mZrs+bLTE2W1Zs4gF1o4mXCI89e51kvaIGHAjlUXTNnBhVrIJgPbxU5cPv
	P8ynGOg5eQUOXQeRpIlrQcSn8mGgJksmJ4hs8sswTyA5YGqIeezGdMzj9Se3kFXtItB31g
	tZX0kgMGR78MftYI5rHq2rwIaPUYWGBd1o0u5N18R5ohzCfCxtEdtNJnlrUmXL1q33IpkE
	iTTCKjdJTbzELpM4HDVjJ5xdsnbJk+hMtWlULGuaHck0mhoyA75iiQG+xC/PDg==
Date: Mon, 17 Feb 2025 15:22:16 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, Jakub Kicinski
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
Message-ID: <20250217152216.5b206284@fedora.home>
In-Reply-To: <5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-6-maxime.chevallier@bootlin.com>
	<Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
	<20250217092911.772da5d0@fedora.home>
	<5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtt
 hhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Andrew,

On Mon, 17 Feb 2025 14:43:00 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > One way to avoid that would be to extract out of phylink/phylib all the
> > functions for linkmode handling that aren't tied to phylink/phylib
> > directly, but are about managing the capabilities of each interface,
> > linkmode, speed, duplex, etc. For phylink, that would be :
> > 
> > phylink_merge_link_mode
> > phylink_get_capabilities
> > phylink_cap_from_speed_duplex
> > phylink_limit_mac_speed
> > phylink_caps_to_linkmodes
> > phylink_interface_max_speed
> > phylink_interface_signal_rate
> > phylink_is_empty_linkmode
> > phylink_an_mode_str
> > phylink_set_port_modes  
> 
> ...
> 
> > These would go into linkmode.c/h for example, and we'd have a shared set
> > of helpers that we can use in phylink, phylib and phy_port.  
> 
> Please be careful with the scope of these. Heiner is going through
> phylib and trying to reduce the scope of some of the functions we
> exporting in include/linux/phy.h to just being available in
> drivers/net/phy. That will help stop MAC drivers abuse them. We should
> do the same here, limit what can actually use these helpers to stop
> abuse.

Can we consider having an header file sitting in drivers/net/phy
directly for this kind of things ?

Maxime

