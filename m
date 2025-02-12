Return-Path: <linux-arm-msm+bounces-47776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5CA32AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A6FB3A3A4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A28C253B49;
	Wed, 12 Feb 2025 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CtyxxtQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72324C689;
	Wed, 12 Feb 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376007; cv=none; b=UJopmKoSqi5QJVsFtM1mjHEZ9PDiWesd2zzCyTOxBWp6uDNb+bLJjKPR8CRnbKH9lKjvUg8DzzDZ/9g307whhVOhtIM3ScYswn/0n+tYS3ebXthRXNsItG2KEqg8ZoM4CL0NtXtZNi+r8k+qQr8HPAss8n+jkVJuF7RFEPUA4V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376007; c=relaxed/simple;
	bh=A4s8XGUWb7zlkOoSQPDJTuTrIelwTXco0/iqa0sjMTw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sL3pokU5xfnleidxg+xvT22/KlKznN/Ccq6bARc8Pe43nySyeNnf1ByejScXEQkUs466pWORm5XKLOEtx30Pp5haRAH5ox3UkAZWvFZeD7xZ25rjkPwsY1EPpSGL9FRXikNQa7CLl+F9n/G3WrNiOJiaxPmD4ObAHRC9fD4MSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CtyxxtQr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D74B4442F8;
	Wed, 12 Feb 2025 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739376003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1eBjozoNuRF1SRfHVlWdXHtFeACQZPvHsgrTM6WN9s=;
	b=CtyxxtQrKkXhLEK27onKf7pLUVHTqU6rJ6GqsIIoOBDdn5+aoiWOqOaGohmUj5wYIWTLmm
	tHISVD92pszINkDKtayJc0i22GXH23j3Xjasdu5e8BU03ckal4CTw5juS4HhsvoYvQGbki
	7K1N+Vy3JW564uFPcoLKnhrsdRMcOtkrRnQfNp8xSDz4bR93HFDD3AvG8xvMvle2VHL6kh
	NuqSJBLKae9r+aEPJ0CzcwWT8aQ0KRPTrFfrgs0oTkGFyczWlX5L5Bjd9yuy5hTpKRzTQi
	GjbstaOz2XFK39C5abxl8aLci/7CSAallJKj7kD9AKOgdA/LkHJAAESMHWAZ6A==
Date: Wed, 12 Feb 2025 16:59:58 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 05/13] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <20250212165958.6baaf294@fedora.home>
In-Reply-To: <20250207223634.600218-6-maxime.chevallier@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250207223634.600218-6-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Fri,  7 Feb 2025 23:36:24 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
> However, the logic to drive the SFP can actually be split to a per-port
> control logic, allowing support for multi-port PHYs, or PHYs that can
> either drive SFPs or Copper.
> 
> To that extent, create a phy_port when registering an SFP bus onto a
> PHY. This port is considered a "serdes" port, in that it can feed data
> to anther entity on the link. The PHY driver needs to specify the
> various PHY_INTERFACE_MODE_XXX that this port supports.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[...]
>  
> +/**
> + * phylink_interfaces_to_linkmodes() - List all possible linkmodes based on a
> + *				       set of supported interfaces, assuming no
> + *				       rate matching.
> + * @linkmodes: the supported linkmodes
> + * @interfaces: Set of interfaces (PHY_INTERFACE_MODE_XXX)
> + *
> + * Compute the exhaustive list of modes that can conceivably be achieved from a
> + * set of MII interfaces. This is derived from the possible speeds and duplex
> + * achievable from these interfaces. This list is likely too exhaustive (there
> + * may not exist any device out there that can convert from an interface to a
> + * linkmode) and it needs further filtering based on real HW capabilities.
> + */
> +void phylink_interfaces_to_linkmodes(unsigned long *linkmodes,
> +				     const unsigned long *interfaces)
> +{
> +	phy_interface_t interface;
> +	unsigned long caps = 0;
> +
> +	linkmode_zero(linkmodes);
> +
> +	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
> +		caps = phylink_get_capabilities(interface,
> +						GENMASK(__fls(MAC_400000FD),
> +							__fls(MAC_10HD)),
> +						RATE_MATCH_NONE);

Shoule be :
		caps |= phylink_get_capabilities(...);

I'll address that in V2, my bad...

Maxime

