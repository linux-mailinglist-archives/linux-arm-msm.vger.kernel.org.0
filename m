Return-Path: <linux-arm-msm+bounces-57702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA23AB5683
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32875177ACD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 13:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E3F298CD0;
	Tue, 13 May 2025 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FbAAkOOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C11EDA35;
	Tue, 13 May 2025 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144416; cv=none; b=H/zufgB4jW5mGnWyE+yVT4OIjitusAOhs+28IWHJGf0Wgykst5LdIHJBfY9VhGFyzAPFZldNUSHuzq+M46YwTVJDNYXDBl9IxYdi0fl59/WmtzPecl6AfI0u+hG/Hj3nt8UVlrRZCDvbF2ZspwI7uNmGPBUhLTqQZwH52GfnXds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144416; c=relaxed/simple;
	bh=s1FtAkkm+jtfkWP5UB6rIhm9JmY1BYt0iR2jdsZ7O3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iE7E6EgHeQ/UJS5KgZMEdvPa6MNzYf/hEb0C8I0OSXUv9brRYgC33WOsUvy0wO7dvE1WUgXT3t/VxNKKMAdtwSFxRX/S41rsyPp28rCDBV9ChbpzQwl46tY3OFVVtJWs+SbIpfve0kdpXNRXoJRO36XigQhUYvL1UpMxz1MgoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FbAAkOOH; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0991443B08;
	Tue, 13 May 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747144411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvdNMKNfVdO994gBBMv5mj9apu0nbjOHK5Q4DGEIP2k=;
	b=FbAAkOOHb7oofcvEcbkxOSpyVepJcAwlvz1Pxcu0bQYZbAtqd9TUuacDVLKV6g59Gd2W7b
	38mesvsylubAzEuBYo2zPkyrXWtT5E97UlqkLNmseqXabcZbdiFJwIKbE+ZYeiqeonruH+
	IcxC4FvdjJUitD4KSbRf4XcJC8lPEggIyp9PqrlII0zatRNdbFkHIE/o3dmDZdeWeAvDSf
	DGXo+TYbs9hRpYZ+WNmMEDpcJUU9UZ9rVKPh7hfzTG9NCehr4eaO9zq/gInwlBB1JXtyfn
	RVOBpDLdkee8IwcVLha+9uUUBHi3lGrX4tXGHaGQ3rQJKTlQdcuVJTsB9yGQAA==
Date: Tue, 13 May 2025 15:53:25 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
Message-ID: <20250513155325.2f423087@kmaincent-XPS-13-7390>
In-Reply-To: <20250507135331.76021-4-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-4-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudgrmeeiudemjehfkegtmegurgehjeemfeehsggsmegttdejudemiegsvdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdurgemiedumeejfhektgemuggrheejmeefhegssgemtgdtjedumeeisgdvsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpt
 hhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com

On Wed,  7 May 2025 15:53:19 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
>=20
> Introduce a representation of these front-facing ports. The current code
> is minimalistic and only support ports controlled by PHY devices, but
> the plan is to extend that to SFP as well as raw Ethernet MACs that
> don't use PHY devices.
>=20
> This minimal port representation allows describing the media and number
> of lanes of a port. From that information, we can derive the linkmodes
> usable on the port, which can be used to limit the capabilities of an
> interface.
>=20
> For now, the port lanes and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
>=20
> The typical example is 100M ethernet. 100BaseT can work using only 2
> lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> way of detecting that. The "max-speed" DT property can be used, but a
> more accurate representation can be used :
>=20
> mdi {
> 	connector-0 {
> 		media =3D "BaseT";
> 		lanes =3D <2>;
> 	};
> };
>=20
> From that information, we can derive the max speed reachable on the
> port.
>=20
> Another benefit of having that is to avoid vendor-specific DT properties
> (micrel,fiber-mode or ti,fiber-mode).
>=20
> This basic representation is meant to be expanded, by the introduction
> of port ops, userspace listing of ports, and support for multi-port
> devices.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

...

> +	for_each_available_child_of_node_scoped(mdi, port_node) {
> +		port =3D phy_of_parse_port(port_node);
> +		if (IS_ERR(port)) {
> +			err =3D PTR_ERR(port);
> +			goto out_err;
> +		}
> +
> +		port->parent_type =3D PHY_PORT_PHY;
> +		port->phy =3D phydev;
> +		err =3D phy_add_port(phydev, port);
> +		if (err)
> +			goto out_err;

I think of_node_put(port_node) is missing here.

...

> @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
>  void phy_mac_interrupt(struct phy_device *phydev);
>  void phy_start_machine(struct phy_device *phydev);
>  void phy_stop_machine(struct phy_device *phydev);
> +

New empty line here?

> +/**
> + * struct phy_port - A representation of a network device physical inter=
face
> + *
> + * @head: Used by the port's parent to list ports
> + * @parent_type: The type of device this port is directly connected to
> + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> + * @ops: Callback ops implemented by the port controller
> + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> applicable
> + * @mediums: Bitmask of the physical mediums this port provides access to
> + * @supported: The link modes this port can expose, if this port is MDI =
(not
> MII)
> + * @interfaces: The MII interfaces this port supports, if this port is M=
II
> + * @active: Indicates if the port is currently part of the active link.
> + * @is_serdes: Indicates if this port is Serialised MII (Media Independe=
nt
> + *	       Interface), or an MDI (Media Dependent Interface).
> + */
> +struct phy_port {
> +	struct list_head head;
> +	enum phy_port_parent parent_type;
> +	union {
> +		struct phy_device *phy;
> +	};

The union is useless here?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

