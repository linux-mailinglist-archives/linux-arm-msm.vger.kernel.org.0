Return-Path: <linux-arm-msm+bounces-47592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC1A30D2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64B91649FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF412236EB;
	Tue, 11 Feb 2025 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ECCqwy/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138CB1E98FF;
	Tue, 11 Feb 2025 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281370; cv=none; b=U1E9iMeY7r4WXiGO2qtb1WLUPJgKjgG2R0ABACoAKBhnCk+A0/YHhymSQwatRiXiSwEy/vAmXUFIEUSsyESyLUh9zxo7MDMNdeelgHotsQTCLDrqmcOf/0ZQFUUc/37tevSB1Dezu21P+n9izXUQzogOmoxc/fCcy/nSjPIHV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281370; c=relaxed/simple;
	bh=oHuDO3N4q9UjuMcLC43ArFeLt76GZz0x5DN1qES+05g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSGv53TD8Q7ZVmV0GNIEi3fN4o4vf3xTTZ1sCl3RBoMeJI3jDsNZKmIY5Xuf53LlDQ5xo7Sqm2ZtGoUC7A63DPmJF/Tr49pu27ZZZ/Oh2ZwzWlUsZXLwwF7M3jolb9aTFzmPMLzrZF5V/huAp6rZV3NBtRVjeqU+Ppptl78gjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ECCqwy/D; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 822C24440A;
	Tue, 11 Feb 2025 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739281366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrHnzHJAMdU5BZfDvmzt4qs+iwkv60fAwvb2ZrcJS+c=;
	b=ECCqwy/DNUw3wcnf/Ivjx9007nU9yaQ0WJZuo/r4u9qXasAmhpDTVk8FWK4ekbY3ZFeko8
	1F0I+za35DHHF6XKtEypOL++WIhG6inzSPILNeBZE9JI07WNd22zMQkj/Uw2IGfApKBUxa
	OPgBV1bA6ArIdtkVLjOxI0segWvn+UzdsMvH2XN0CgnLjogzbFNsj33K63CeqU5C9K0chv
	3Y1uVBZrCg//xsO43mjMcuG5cfEx2bgB3bIMYISm2fZwrBb+qUrEDeNZ5QKzGzkquDzeX9
	Hgp+DbzFCsjlKcRT1uIe5Q7FhF+cZfNLIxLSDQhvfcl1Jp1WPI7aCUJszsYOrQ==
Date: Tue, 11 Feb 2025 14:42:43 +0100
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
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 03/13] net: phy: Introduce PHY ports
 representation
Message-ID: <20250211144243.6190005a@fedora.home>
In-Reply-To: <20250211143209.74f84a10@kmaincent-XPS-13-7390>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250207223634.600218-4-maxime.chevallier@bootlin.com>
	<20250211143209.74f84a10@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfefgffgtdfhgffhvdfhhffhteeutdektefghfetveehheejjefgudeiudehudenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi K=C3=B6ry,

On Tue, 11 Feb 2025 14:32:09 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Fri,  7 Feb 2025 23:36:22 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
>=20
> > Ethernet provides a wide variety of layer 1 protocols and standards for
> > data transmission. The front-facing ports of an interface have their own
> > complexity and configurability.
> >=20
> > Introduce a representation of these front-facing ports. The current code
> > is minimalistic and only support ports controlled by PHY devices, but
> > the plan is to extend that to SFP as well as raw Ethernet MACs that
> > don't use PHY devices.
> >=20
> > This minimal port representation allows describing the media and number
> > of lanes of a port. From that information, we can derive the linkmodes
> > usable on the port, which can be used to limit the capabilities of an
> > interface.
> >=20
> > For now, the port lanes and medium is derived from devicetree, defined
> > by the PHY driver, or populated with default values (as we assume that
> > all PHYs expose at least one port).
> >=20
> > The typical example is 100M ethernet. 100BaseT can work using only 2
> > lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> > capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> > way of detecting that. The "max-speed" DT property can be used, but a
> > more accurate representation can be used :
> >=20
> > mdi {
> > 	port@0 {
> > 		media =3D "BaseT";
> > 		lanes =3D <2>;
> > 	};
> > };
> >=20
> > From that information, we can derive the max speed reachable on the
> > port.
> >=20
> > Another benefit of having that is to avoid vendor-specific DT properties
> > (micrel,fiber-mode or ti,fiber-mode).
> >=20
> > This basic representation is meant to be expanded, by the introduction
> > of port ops, userspace listing of ports, and support for multi-port
> > devices. =20
>=20
> This patch is tackling the support of ports only for the PHY API. Keeping=
 in
> mind that this port abstraction support will also be of interest to the N=
ICs.
> Isn't it preferable to handle port in a standalone API?

The way I see it, nothing prevents from using the port definition in
ethernet-port.yml in DSA/raw nics.

> With net drivers having PHY managed by the firmware or DSA, there is no l=
inux
> description of their PHYs. On that case, if we want to use port abstracti=
on,
> what is the best? Register a virtual phy_device to use the abstraction po=
rt or
> use the port abstraction API directly which meant that it is not related =
to any
> PHY?

I think the next steps will be to have net_device have a list of ports
(maintained in the phy_link_topology) that aggregates ports from all
its PHYs/SFPs/raw interfaces. in that case net_device will be the
direct parent. I haven't worked on the bindings for that though,
especially for DSA :'(

I don't think the virtual phydev is going to be helpful. I'm hitting
the 15 patches limit, but a possible extension is to make so that
phylink also creates a port when it finds an SFP (hence, when upstream
is a MAC).

This is why phy_port has these fields :


enum phy_port_parent {
	PHY_PORT_PHY,
};

struct phy_port {
	...
	enum phy_port_parent parent_type;
	union {
		struct phy_device *phy;
	};

};

The parent type may (will) be extended with PORT_PHY_MAC, and that's
also why the parent pointer is in a union :)

I'm trying hard to make so that phy_port doesn't depend on phylib
(altough, phylib depends on phy_port). There's a dependency on some
core stuff (converting from medium =3D> linkmodes) and phylink
(converting the interfaces list to linkmodes), but we can extract these
fairly easily.

You're correct in that for now, the integration is with phylib only
though, but let's make sure this will also work for phy-less devices.

Thanks a lot for your input,

Maxime

