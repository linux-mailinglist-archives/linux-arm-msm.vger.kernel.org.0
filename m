Return-Path: <linux-arm-msm+bounces-67697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3FDB1A3AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748DF3B5212
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E326C389;
	Mon,  4 Aug 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jHS+AlRT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BAC26A1D9;
	Mon,  4 Aug 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314928; cv=none; b=F7wq0vrDLhBkEg/qxUTDJb+X+3pG2XsNmTaNxnh4FIqt0H6kgeMaNkjVTLHO5FtiSL9Lj4otTFzw7DMQt3QFkijxWsctc4aydlEtb1/OBFY8Fd6tLQkwMrxm72XTR1z1Vk9Tind1CUHJP4/s6Br0s7zuVaLzFEfV7wD6WVMyqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314928; c=relaxed/simple;
	bh=YXhfRhvXtFxI01iM0EMERkjNZ9aZv9R0KMlEu97i4Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UThEotTaSFv7mTvJD6YfZbyezWR7bENueGyw59kQ1b/8xcKQop6L9/AKcmSESdRbtVVVEJaPO0480o8kJ4PcQJnwmhOA1g/emUG4I+E/vaA61KuTb+fYxQOUs09/9qMnz/AE2oHXA+ccWyMpxuD+vnUAk67VY7FZiZ790JqizCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jHS+AlRT; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D956D438D4;
	Mon,  4 Aug 2025 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754314923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTIRINgYoitHnaoAkXeOGbYRP3hdr9fcn0B1qbh2HyA=;
	b=jHS+AlRT/xivxi8w6KVC4d7BOyw0a0dgZsgX3ZEe5gw7MPT2JoePgpFlx0mGhXRGGYjeJD
	4V4WLk5m72CK5Cv96Bptp7YlKCve5UXkU/rF2uGZDPK3iOssi05yeSQClcUf9bT4SOF5I5
	XhXXCTyjjM+NmxiEO/lFFQAmSousbTuoSTdq180BpubARulbWw3Tdd3jECazDhwhPuYxnH
	C9OKxqDYfvwYOXdwxPl581LpcZuiW3U0RMabjsT8rNoB5IGHmisAxjZGfKcgGvj3DpCE2Y
	g0uy/fOhfgVu5uirI/IQu6XMZoiTRzIXvmYwIzYx6i1ED/gltjuDRUja3ftPGA==
Date: Mon, 4 Aug 2025 15:41:57 +0200
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
Subject: Re: [PATCH net-next v10 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250804154157.4c507cf9@fedora.home>
In-Reply-To: <bec1b52f-d33d-4088-9d88-3345ecd0fa69@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-5-maxime.chevallier@bootlin.com>
	<bec1b52f-d33d-4088-9d88-3345ecd0fa69@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

On Sat, 26 Jul 2025 22:38:32 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static int phy_default_setup_single_port(struct phy_device *phydev)
> > +{
> > +	struct phy_port *port = phy_port_alloc();
> > +
> > +	if (!port)
> > +		return -ENOMEM;
> > +
> > +	port->parent_type = PHY_PORT_PHY;
> > +	port->phy = phydev;
> > +
> > +	/* Let the PHY driver know that this port was never described anywhere.
> > +	 * This is the usual case, where we assume single-port PHY devices with
> > +	 * no SFP. In that case, the port supports exactly the same thing as
> > +	 * the PHY itself.  
> 
> I wounder if you should hook into __set_phy_supported() so that DT
> max-speed, and the MAC driver calling phy_set_max_speed() are covered?

This code runs after of_set_phy_supported(), so any speed limitation
enforced through the max-speed DT property will also apply to the
ports's supported field. Hopefully, now that we have a port
representation in DT we can get rid of some of the max-speed use-cases,
such as a 1G PHY connected to a Fast Ethernet port :)

For phy_set_max_speed(), the phy device's supported field will be
update, but not the port's. So indeed, I think we should update the
port's supported upon calling phy_set_max_speed(), I'll add and test
that for the next iteration.

Thanks,

Maxime

