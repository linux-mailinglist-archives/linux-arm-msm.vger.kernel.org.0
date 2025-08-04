Return-Path: <linux-arm-msm+bounces-67692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C0B1A369
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C0A188E987
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A33D26CE2F;
	Mon,  4 Aug 2025 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JAUh1LIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7926058D;
	Mon,  4 Aug 2025 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314446; cv=none; b=mcCsm5hne73ncQEV/yKFSq/spzyN9iT90fBh6B+1cBhRAYxcnNfRfgXCMOhxlBYOWoTb33IfrMwQEqAH/5bdgtTitmP3yDqXHdJvo25CaCJB9SUXpS8YjQOZBqtTzRTvzlgFLuKel9yEGJ+CLRZVsAfU/MJVvB7+1ADaZ0YuVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314446; c=relaxed/simple;
	bh=11wdTRrZtYzeH6eb9PhpkmebUR1B+lmtQaeXm6DqDbA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UaJYGn9PJkpmNzTSWOzAklbbVsodSsPRp28WKtbyobF9+bL5kNAF+60RQSzAFNl7gR5sz9k+nda/dPpu60ldKyMLlf4pLbVUalWox+QfFFuRMSZoGYpjjqgyqrzehooul9befIQ/I93SmgQSLYodJWYQ2XaXXnRwMa8ZPCzZsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JAUh1LIj; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23EB744278;
	Mon,  4 Aug 2025 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754314440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3F19ni0D0rMQE6sBKRDx0Kq08dUhlD3d42RuDyW7RI=;
	b=JAUh1LIjf6sGsOeF1M+6HCgaexWuinu/lk6NSlxbE3jGH4S88jLQU9gZfO1w8D7RWs93fj
	jzkTPbtsGSWQFf+egVqwudIj/F6hANfSBIkTqtPA2GOgPtmgUI0veeF4GKl46le5yeQ5Do
	9AI4hsZQ32HS/pnkncf9m5AVEUsbCgMDN5GONSwawocMO/mzk6MN9NoZ7nniKjF79jJr2n
	OJru1HkcpnIeQKmRk5MEfzHpHUhuYJB7vP5sGLTMyY88+gyMibvYYhNjfEf1eQlGc9n/d8
	C+xRQDPkZS34u4RTd1cvKmmRPIZ/lr+FvXzFH56cE/NT4824/vShpuFXkyWD+A==
Date: Mon, 4 Aug 2025 15:33:53 +0200
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
Message-ID: <20250804153353.1d83f8ab@fedora.home>
In-Reply-To: <a915e167-1490-4a20-98a8-35b4e5c6c23c@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-5-maxime.chevallier@bootlin.com>
	<a915e167-1490-4a20-98a8-35b4e5c6c23c@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

On Sat, 26 Jul 2025 22:33:33 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +
> > +/**
> > + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
> > + * @supported: After this call, contains all possible linkmodes on a given medium,
> > + *	       and with the given number of lanes.  
> 
> Maybe nit picking, but maybe append:
> 
> , or less.
> 
> > +		/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
> > +		 * on 2 lanes but are compatible with 4 lanes mediums
> > +		 */
> > +		if (link_mode_params[i].mediums & BIT(medium) &&
> > +		    link_mode_params[i].lanes >= lanes &&
> > +		    link_mode_params[i].min_lanes <= lanes) {  
> 
> We should only care about min_lanes here. I don't think the
> link_mode_params[i].lanes >= lanes is needed.
> 
> Maybe you can add a BUILD_BUG_ON() into the macro to ensure
> min_lanes <= lanes?
> 
> > +struct phy_port *phy_of_parse_port(struct device_node *dn)
> > +{
> > +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> > +	enum ethtool_link_medium medium;
> > +	struct phy_port *port;
> > +	const char *med_str;
> > +	u32 lanes, mediums = 0;
> > +	int ret;
> > +
> > +	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
> > +	if (ret)
> > +		lanes = 0;  
> 
> The DT binding says that both properties are required. So i think this
> should be:
> 
> 		return ret;

Ah true indeed, let me fix that then :)

> 
> > + * phy_port_get_type() - get the PORT_* attribut for that port.  
> 
> attribut_e_
> 
> > +	 * If the port isn't initialized, the port->mediums and port->lanes
> > +	 * fields must be set, possibly according to stapping information.  
> 
> st_r_apping
> 
> 	Andrew

Sorry for all the typos, it's a weak excuse but lately my laptop's
keayboard has been acting up, and it either misses strokes or gets the
letters stuck in repeat-mode. Russell has similar issues, so I'm still
unsure if this is a hardware or software thing... I'll install and pass
spellcheck for the next iteration to avoid that :)

Maxime

