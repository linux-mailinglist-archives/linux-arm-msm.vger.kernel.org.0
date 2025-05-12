Return-Path: <linux-arm-msm+bounces-57597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED6AB3317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 11:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F6D17BE0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 09:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A929025B664;
	Mon, 12 May 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="myroYSTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E625A32C;
	Mon, 12 May 2025 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041735; cv=none; b=WIELxG+Wfq4A9l2I6Qk/QtqxYl1i89+My9LCyftgK/d1hgHIS5ZvT7VECKCQ56P8g/JzgSZcB0+kUyHcDh+kdep3Vys6/ivfN8bcCnraE5sOnseisjqP3Ux+KZMlx1FMsZJOpStzpV4mkvMn0MV5PlX/hYm2JgnWCnRAlZcu7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041735; c=relaxed/simple;
	bh=63Xla2q+6hr/2d84/UOsWS1nUsyEbKKfUrI6v0LXHNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsgNeB2WAqBToY7aRekFSwAgJRbOqjV7YI3fPzv3bGo16vL24VcLoiyC8SOTNz4RMM3AhJtHSLeFHPHkT5cic9iHn7A7PpSsXThTZZzD9hTKhu3pgFhL7KPn7aZbplIOShIQNfX2HshZIAgTNJ5tQ6p5cjWzDL6bEZiDcyB7kG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=myroYSTo; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B96A642E7E;
	Mon, 12 May 2025 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747041731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kaiEC+PufeTUFVHYk/7+WnDcWgVB2rCo/IXTSdg1Hds=;
	b=myroYSToz66ns5AWaEKJJvPJUQ2gNhiviSmOpp/J2y/Y8GROMCYAYuwQj8YyoGQq0ioQrw
	I0vja15KBTuai/J5zuSpLfuqRQvQiR3kb2j3hHKZ3BcBsRXrmg2YnmRQwaBSuy+vx6s/pB
	1D83Xhz/+9fcJksBAxbL9E0q4tvY8TteyaYaLEtxufK51sq7VmWbCEC0WvYDFGFBsGYCfS
	36kYPxE4KFGfMPeCaWLFJrogT8glen7n3s2DRBE3lNQkyNFvGFTXHHfKS3QK691LwDekZV
	tRzViTTgIV7ihzkV75uqQhgc0VRSa4JY6wdpJoo/hOJVrOvqkI9jfVbYQFE5RA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: davem@davemloft.net, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?B?Tmljb2zDsg==?= Veronese <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject:
 Re: [PATCH net-next v6 14/14] Documentation: networking: Document the
 phy_port infrastructure
Date: Mon, 12 May 2025 11:22:04 +0200
Message-ID: <873525603.0ifERbkFSE@fw-rgant>
In-Reply-To: <20250507135331.76021-15-maxime.chevallier@bootlin.com>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <20250507135331.76021-15-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5568568.Sb9uPGUboI";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart5568568.Sb9uPGUboI
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 May 2025 11:22:04 +0200
Message-ID: <873525603.0ifERbkFSE@fw-rgant>
In-Reply-To: <20250507135331.76021-15-maxime.chevallier@bootlin.com>
MIME-Version: 1.0

Hi Maxime,

On Wednesday, 7 May 2025 15:53:30 CEST Maxime Chevallier wrote:
> This documentation aims at describing the main goal of the phy_port
> infrastructure.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  Documentation/networking/index.rst    |   1 +
>  Documentation/networking/phy-port.rst | 111 ++++++++++++++++++++++++++
>  MAINTAINERS                           |   1 +
>  3 files changed, 113 insertions(+)
>  create mode 100644 Documentation/networking/phy-port.rst
> 
> diff --git a/Documentation/networking/index.rst
> b/Documentation/networking/index.rst index ac90b82f3ce9..f60acc06e3f7
> 100644
> --- a/Documentation/networking/index.rst
> +++ b/Documentation/networking/index.rst
> @@ -96,6 +96,7 @@ Contents:
>     packet_mmap
>     phonet
>     phy-link-topology
> +   phy-port
>     pktgen
>     plip
>     ppp_generic
> diff --git a/Documentation/networking/phy-port.rst
> b/Documentation/networking/phy-port.rst new file mode 100644
> index 000000000000..6d9d46ebe438
> --- /dev/null
> +++ b/Documentation/networking/phy-port.rst
> @@ -0,0 +1,111 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _phy_port:
> +
> +=================
> +Ethernet ports
> +=================
> +
> +This document is a basic description of the phy_port infrastructure,
> +introduced to represent physical interfaces of Ethernet devices.
> +
> +Without phy_port, we already have quite a lot of information about what the
> +media-facing interface of a NIC can do and looks like, through the

I'd replace "and looks like" by "and what it looks like".

> +:c:type:`struct ethtool_link_ksettings <ethtool_link_ksettings>`
> attributes, +which includes :
> +
> + - What the NIC can do through the :c:member:`supported` field
> + - What the Link Partner advertises through :c:member:`lp_advertising`
> + - Which features we're advertising through :c:member:`advertising`
> +
> +We also have info about the number of lanes and the PORT type. These
> settings +are built by aggregating together information reported by various
> devices that +are sitting on the link :
> +
> +  - The NIC itself, through the :c:member:`get_link_ksettings` callback
> +  - Precise information from the MAC and PCS by using phylink in the MAC
> driver +  - Information reported by the PHY device
> +  - Information reported by an SFP module (which can itself include a PHY)
> +
> +This model however starts showing its limitations when we consider devices
> that +have more than one media interface. In such a case, only information
> about the +actively used interface is reported, and it's not possible to
> know what the +other interfaces can do. In fact, we have very few
> information about whether or +not there are any other media interfaces.

maybe "hints" instead of "information"?

> +
> +The goal of the phy_port representation is to provide a way of representing
> a +physical interface of a NIC, regardless of what is driving the port (NIC
> through +a firmware, SFP module, Ethernet PHY).
> +
> +Multi-port interfaces examples
> +==============================
> +
> +Several cases of multi-interface NICs have been observed so far :
> +
> +Internal MII Mux::
> +
> +  +------------------+
> +  | SoC              |
> +  |          +-----+ |           +-----+
> +  | +-----+  |     |-------------| PHY |
> +  | | MAC |--| Mux | |   +-----+ +-----+
> +  | +-----+  |     |-----| SFP |
> +  |          +-----+ |   +-----+
> +  +------------------+
> +
> +Internal Mux with internal PHY::
> +
> +  +------------------------+
> +  | SoC                    |
> +  |          +-----+ +-----+
> +  | +-----+  |     |-| PHY |
> +  | | MAC |--| Mux | +-----+   +-----+
> +  | +-----+  |     |-----------| SFP |
> +  |          +-----+       |   +-----+
> +  +------------------------+
> +
> +External Mux::
> +
> +  +---------+
> +  | SoC     |  +-----+  +-----+
> +  |         |  |     |--| PHY |
> +  | +-----+ |  |     |  +-----+
> +  | | MAC |----| Mux |  +-----+
> +  | +-----+ |  |     |--| PHY |
> +  |         |  +-----+  +-----+
> +  |         |     |
> +  |    GPIO-------+
> +  +---------+
> +
> +Double-port PHY::
> +
> +  +---------+
> +  | SoC     | +-----+
> +  |         | |     |--- RJ45
> +  | +-----+ | |     |
> +  | | MAC |---| PHY |   +-----+
> +  | +-----+ | |     |---| SFP |
> +  +---------+ +-----+   +-----+
> +
> +phy_port aims at providing a path to support all the above topologies, by
> +representing the media interfaces in a way that's agnostic to what's
> driving +the interface. the struct phy_port object has its own set of

s/the/The

> callback ops, and +will eventually be able to report its own ksettings::
> +
> +             _____      +------+
> +            (     )-----| Port |
> + +-----+   (       )    +------+
> + | MAC |--(   ???   )
> + +-----+   (       )    +------+
> +            (_____)-----| Port |
> +                        +------+
> +
> +Next steps
> +==========
> +
> +As of writing this documentation, only ports controlled by PHY devices are
> +supported. The next steps will be to add the Netlink API to expose these
> +to userspace and add support for raw ports (controlled by some firmware,
> and directly +managed by the NIC driver).
> +
> +Another parallel task is the introduction of a MII muxing framework to

I'd suggest "related" instead of "parallel".

> allow the +control of non-PHY driver multi-port setups.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b155eec69552..211a6ba50166 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8781,6 +8781,7 @@
> F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
> F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>  F:	Documentation/devicetree/bindings/net/mdio*
>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
> +F:	Documentation/networking/phy-port.rst
>  F:	Documentation/networking/phy.rst
>  F:	drivers/net/mdio/
>  F:	drivers/net/mdio/acpi_mdio.c

Thanks!

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5568568.Sb9uPGUboI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmghvbwACgkQ3R9U/FLj
2871DxAAn7+aUBy4seGGJo1GygKlbkXBHGDeR8bvU6xiVEX4iQCpM5/8/fSk413V
VaVRwapjz/rEK7gx0fKzUw2EmEUSBkSSW4SPocPH7bEYREdo5y0f1xgTp7PXD1Yj
osDFFsXo9S3rsDCvCBMDb73s60/EZsDp/gcw+xAdhZPBjDine0wArdRPTmWmJDsc
OJTM9eMwHYxj03b0j+3ZytXWTQ8ku2I3zeT+RD1M/XWTguJ/h0QYJnn9O1OU6kLh
uxgtP8lSrFAz/hPvIRa7u4TG73e4Dfm0/cP4liGgDFJEofnxVSU7BKuFT5K/PDW/
+H3aRHQAPfuNNrzE/j6Ek7KMYfFa3vGbM3kD0lnhMGoKD9s9vhLmOxG/b3+8fiQl
KQX7UMQfKHEfmMz8HyTG3dX5vplbpR4MlQYDoub9Icu3AYJO/uRKw5X6NaJT89yT
aIEeMjzxKTxrTryx7aQ8T8IWzQF58mj9IPao4qHXSm+nP0KWMbZMrNP3KkFvTNSI
RPjPzPlBYD1DT5o7Nt4izr8c+b9GCJQDdFxkAfjmisjvxljVSL1yTaFVvpgcClSe
6FGRHENouJJrH+nadqpZKNmzkLDDoQoi1dfzq4Dx7KAxul3gqwh+lZ6QOBCwH/o0
Hax/Lqkzq0+JXynFI3fTL2/czWHZUzzkoZdkQbxQsS2CSXgHcC4=
=G59j
-----END PGP SIGNATURE-----

--nextPart5568568.Sb9uPGUboI--




