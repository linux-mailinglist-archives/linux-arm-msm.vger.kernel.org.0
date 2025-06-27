Return-Path: <linux-arm-msm+bounces-62856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A86AEBE0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7EF3AC760
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1A92EA162;
	Fri, 27 Jun 2025 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fCcRrGSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D329E115;
	Fri, 27 Jun 2025 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043787; cv=none; b=WBfCVi70Wu9Oe92Syz6/Qrick4mhqMabUapTJEB+d4ofL9haP+IzlozobSWCtgzePO8NTgAiT9trtR/RhvODOgXof83BplNKcwXb3rPXoYVn4b9Sr8haq9+qNpp+tq/cSa926/v6SnJifCh0SFcYmjEc3oFyKcE4Cj6FvOOMMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043787; c=relaxed/simple;
	bh=Gn00Ied9mkn/AcZlIyGTQP64hKJHtvhp70miiHH8N1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLeH7hRrjwBRwn1vAKSGaZMG3uVsJNMagZ5hPie37UawSkQMVQMMs6pnUGYJdXXyRB8+HvVU1Kbu0JnRizgTU4x3WkxhHXsFFKmGbcEVNzTVSPDj+6gRy8W8ZUD66MzQIsGps92voq3A+q5yf7HanFqO10c3F4DNIR5SxGSC9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fCcRrGSN; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1DA744350;
	Fri, 27 Jun 2025 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751043777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAnce52V/7SwBr3WQruM3/+NAZWkJnhagjSqlHXqpIA=;
	b=fCcRrGSN3as1/zQoH2mX7cN5ay6JkjjHj6uY+Su6E4xXpDAJxmy8rmKCgxRjG4rK+Kl3hw
	7ibhJeoW3YJBaf+bOw5lL9rb2hNcY4CVBZ0aVD3RQwyZyHn7+g5j4PyMJlOLEPuiP12vSJ
	+s509tkTytzi8jhvwLGK9gUX6/Zz0f5IUI4s3YzbJhVzh4gXlMWHKQsYsfqGkNGCGR+KiK
	KYO8vNCLDeqg3OPBjehqor0XhVidsSO0rOqkSvPum195Wzzn8pODgQ6hUL4G3gF8LVPrmJ
	2ON27Whj3Rj4YElvP6C0NrY7/gHK71xrCnkmB2VX7au7GtDFAb1pjHt2eQCeEQ==
Date: Fri, 27 Jun 2025 19:02:50 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <20250627190250.63a1848a@fedora>
In-Reply-To: <20250513155325.2f423087@kmaincent-XPS-13-7390>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-4-maxime.chevallier@bootlin.com>
	<20250513155325.2f423087@kmaincent-XPS-13-7390>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Kory,

On Tue, 13 May 2025 15:53:25 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Wed,  7 May 2025 15:53:19 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > Ethernet provides a wide variety of layer 1 protocols and standards for
> > data transmission. The front-facing ports of an interface have their own
> > complexity and configurability.
> > 
> > Introduce a representation of these front-facing ports. The current code
> > is minimalistic and only support ports controlled by PHY devices, but
> > the plan is to extend that to SFP as well as raw Ethernet MACs that
> > don't use PHY devices.
> > 
> > This minimal port representation allows describing the media and number
> > of lanes of a port. From that information, we can derive the linkmodes
> > usable on the port, which can be used to limit the capabilities of an
> > interface.
> > 
> > For now, the port lanes and medium is derived from devicetree, defined
> > by the PHY driver, or populated with default values (as we assume that
> > all PHYs expose at least one port).
> > 
> > The typical example is 100M ethernet. 100BaseT can work using only 2
> > lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> > capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> > way of detecting that. The "max-speed" DT property can be used, but a
> > more accurate representation can be used :
> > 
> > mdi {
> > 	connector-0 {
> > 		media = "BaseT";
> > 		lanes = <2>;
> > 	};
> > };
> > 
> > From that information, we can derive the max speed reachable on the
> > port.
> > 
> > Another benefit of having that is to avoid vendor-specific DT properties
> > (micrel,fiber-mode or ti,fiber-mode).
> > 
> > This basic representation is meant to be expanded, by the introduction
> > of port ops, userspace listing of ports, and support for multi-port
> > devices.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> ...
> 
> > +	for_each_available_child_of_node_scoped(mdi, port_node) {
> > +		port = phy_of_parse_port(port_node);
> > +		if (IS_ERR(port)) {
> > +			err = PTR_ERR(port);
> > +			goto out_err;
> > +		}
> > +
> > +		port->parent_type = PHY_PORT_PHY;
> > +		port->phy = phydev;
> > +		err = phy_add_port(phydev, port);
> > +		if (err)
> > +			goto out_err;  
> 
> I think of_node_put(port_node) is missing here.

I don't think so, this is the _scoped variant so it takes care of
that for us.

> 
> ...
> 
> > @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
> >  void phy_mac_interrupt(struct phy_device *phydev);
> >  void phy_start_machine(struct phy_device *phydev);
> >  void phy_stop_machine(struct phy_device *phydev);
> > +  
> 
> New empty line here?

Oops, this will be removed

> > +/**
> > + * struct phy_port - A representation of a network device physical interface
> > + *
> > + * @head: Used by the port's parent to list ports
> > + * @parent_type: The type of device this port is directly connected to
> > + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> > + * @ops: Callback ops implemented by the port controller
> > + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> > applicable
> > + * @mediums: Bitmask of the physical mediums this port provides access to
> > + * @supported: The link modes this port can expose, if this port is MDI (not
> > MII)
> > + * @interfaces: The MII interfaces this port supports, if this port is MII
> > + * @active: Indicates if the port is currently part of the active link.
> > + * @is_serdes: Indicates if this port is Serialised MII (Media Independent
> > + *	       Interface), or an MDI (Media Dependent Interface).
> > + */
> > +struct phy_port {
> > +	struct list_head head;
> > +	enum phy_port_parent parent_type;
> > +	union {
> > +		struct phy_device *phy;
> > +	};  
> 
> The union is useless here?

For now yes :( But this will change when adding support for
non-phy-driver ports.

Maxime

> 
> Regards,


