Return-Path: <linux-arm-msm+bounces-62858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04373AEBE23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F5B1793A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E1A2EA162;
	Fri, 27 Jun 2025 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AMbfTvl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB617A306;
	Fri, 27 Jun 2025 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043973; cv=none; b=JZHQZPP5AyDyQqUScP5PqKivjAi5hGuNa0hhey7GdDc1TFTUaY1jfUgyGhjM2PFjB7p7dIJ9U1HCFfmpjuKGKHOmINIpCkXRL8ZKs2LSL0sdTc1AHXaQKS7qeNecekI5kyBw/ETrCXrtAaxDimbGPrKqdOGRWyKBeq1tAdw+Uww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043973; c=relaxed/simple;
	bh=96dbarAyWezw0p0WMi8ET4SRfCWhwqQdBjqTu/rDNYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QE9MM4vIL+LwoZmCUjYz7VjnF94iwBf8Tqrl74kpXZIqm5s1cmePfyrAEysKGsXcOXq2QY0iKJ66mNg84AF5P/nyM4uP++HscVzb0MHImYp6juiNrx6jC2dLbMLTcHS/EpqUijoqjjtXs2k3smUg5NHbl7H6vnRED6I/Ov7XXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AMbfTvl/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 753581FCF0;
	Fri, 27 Jun 2025 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751043967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=si55ankKHNNRv5mBFYVG1jZceZrxfv3xYH4f1i34vWI=;
	b=AMbfTvl/x0o7heiDRKemtWabh5ADPBUU55jyeOs0bFOtgEXgnaQxWnrmUUGI30m1n0D3Iq
	LrD39fFIZn3fiz7yjxTF7KasLbEhp03yHB09605r3NU+QJBi16MiSfggcANtnVnmPip/85
	PKBYH/MqK9/sJIHUeCmuIoeSS7aE0ymSrcOwD5KZdl9cuD3s7Loc2a75zmPhWZORwLp/wt
	x2oIZvI9PMiybTXrZjt4Bo2L3duyNYcx3o/HJcp0Vm7iXrEyjPPymaOAE4yxiS43C9UNFP
	ssOBv8rJUpGZDcX9mdk1gx6EL16mtnALf9wqqnfYgAvutoWQP62rt6UBra1kow==
Date: Fri, 27 Jun 2025 19:06:04 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
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
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Daniel Golle
 <daniel@makrotopia.org>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 05/14] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <20250627190604.41b26ead@fedora>
In-Reply-To: <5411380.WoAhosY9oF@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-6-maxime.chevallier@bootlin.com>
	<5411380.WoAhosY9oF@fw-rgant>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Romain,

On Tue, 13 May 2025 14:25:18 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Maxime,
> 
> On Wednesday, 7 May 2025 15:53:21 CEST Maxime Chevallier wrote:
> > Some PHY devices may be used as media-converters to drive SFP ports (for
> > example, to allow using SFP when the SoC can only output RGMII). This is
> > already supported to some extend by allowing PHY drivers to registers
> > themselves as being SFP upstream.
> >   
> ...
> >   *
> > @@ -149,6 +151,21 @@ void phy_port_update_supported(struct phy_port *port)
> >  		ethtool_medium_get_supported(supported, i, port->lanes);
> >  		linkmode_or(port->supported, port->supported, supported);
> >  	}
> > +
> > +	/* Serdes ports supported may through SFP may not have any medium set,
> > +	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case,   
> derive
> > +	 * the supported list based on these interfaces
> > +	 */
> > +	if (port->is_serdes && linkmode_empty(supported)) {  
> 
> The "supported" bitmap needs to be zeroed out before this check. If the port 
> has no mediums, then the bitmap won't be initialized at this point.

Ah true, thanks !

Maxime


