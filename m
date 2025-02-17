Return-Path: <linux-arm-msm+bounces-48157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BDA37E5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 596F97A20DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE158212B29;
	Mon, 17 Feb 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MLFtirCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013EC8FE;
	Mon, 17 Feb 2025 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784371; cv=none; b=Bnmd6Q678BSiAu9lZo3W46WJqf7EguZE/ElxGHDia30qLv3P9RdXA9oWCMZreZ7AbJkCQVUUPLW3anvvudqxk1juB0jexd2pxmvth3TnfJ7e2ak9Wa033IjnnWPeEwEAq70g7C+0Pw7rFL1jBHXzdsTZhzwje0ZuIbKdbiFS4Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784371; c=relaxed/simple;
	bh=IKQs58geIf6VApu4EVnDj+XctVVzkrTjTdBiFfP+2VE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNvwMv+NMefumc08dvl1/6u6fNso4gyh3D0j8s8WoStAaHtqptkoqIm8PXHChHlzpk0DeCXhNljVuhdsb//MNyVZmpmy334AtfUnFVXlKnAvEOLSN7DO3Bw+JBJU6oQp0PJFo9fBPGx9ffttVdqjGezn/pPaTawYih2FaXMrKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MLFtirCx; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E9AC43287;
	Mon, 17 Feb 2025 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739784366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SO8T0nIRKcbdmM4ftj1RFljqcKZxemj3VTPTdtlNmjc=;
	b=MLFtirCxqUcwJLqDAF9h1I3aRDy2RzlA7h1E+0KjutTWO/wcKl9ZvtjtBwdKchSCyaJDgy
	CaxGL5CGTLJplLIvSYEpH8fqOeGchC0bYgBehPZzPyO9swh92IOGDIUs0qVkGVh0w/PUPR
	GSb/6weTO2IvE+PDO2D1gKXCLtUh4My8GR1xgiyB6jhQelAC0Q7rY2Rssv3qrAdgxQvQza
	75Pde7zQE6/rEwCbZHi5hBdDVvXx0dC+impytylGgwEo1bJIxRwex1B7bCTYhtrLJ0974X
	MFGDaYDIiu3DB7bJRxXl6wHIorTetdJCGWA1PB62miaDEYo2BWmhHJpDLsxENQ==
Date: Mon, 17 Feb 2025 10:26:03 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Fedrau Dimitri (LED)" <Dimitri.Fedrau@liebherr.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 "mwojtas@chromium.org" <mwojtas@chromium.org>, Antoine Tenart
 <atenart@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Sean Anderson <seanga2@gmail.com>, "dima.fedrau@gmail.com"
 <dima.fedrau@gmail.com>
Subject: Re: [PATCH net-next v4 04/15] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250217102603.3e9f79c6@fedora.home>
In-Reply-To: <DB8P192MB08386B9F0FB342EB7B0FA785F3F92@DB8P192MB0838.EURP192.PROD.OUTLOOK.COM>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-5-maxime.chevallier@bootlin.com>
	<DB8P192MB08386B9F0FB342EB7B0FA785F3F92@DB8P192MB0838.EURP192.PROD.OUTLOOK.COM>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfefgffgtdfhgffhvdfhhffhteeutdektefghfetveehheejjefgudeiudehudenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopeffihhmihhtrhhirdfhvggurhgruheslhhivggshhgvrhhrrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Dimitri,

On Sat, 15 Feb 2025 11:31:28 +0000
"Fedrau Dimitri (LED)" <Dimitri.Fedrau@liebherr.com> wrote:

> Hi Maxime,
>=20
> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: Maxime Chevallier <maxime.chevallier@bootlin.com>=20
> > Gesendet: Donnerstag, 13. Februar 2025 11:16
> > =20
> [...]
> > =20
> > @@ -781,17 +782,6 @@ static int dp83822_of_init(struct phy_device *phyd=
ev)
> >  	struct device *dev =3D &phydev->mdio.dev;
> >  	const char *of_val;
> > =20
> > -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> > -	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
> > -	 * is strapped otherwise signal detection is disabled for the PHY.
> > -	 */ =20
> Does it make sense to keep the comment ?
>

I think so, this behaviour isn't expected to change with this patchset

> > -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> > -		dp83822->fx_signal_det_low =3D device_property_present(dev,
> > -								     "ti,link-loss-low");
> > -	if (!dp83822->fx_enabled)
> > -		dp83822->fx_enabled =3D device_property_present(dev,
> > -							      "ti,fiber-mode");
> > -
> >  	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
> >  		if (strcmp(of_val, "mac-if") =3D=3D 0) {
> >  			dp83822->gpio2_clk_out =3D DP83822_CLK_SRC_MAC_IF;
> > @@ -884,6 +874,43 @@ static int dp83822_read_straps(struct phy_device *=
phydev)
> >  	return 0;
> >  }
> > =20
> > +static int dp83822_attach_port(struct phy_device *phydev, struct phy_p=
ort *port)
> > +{
> > +	struct dp83822_private *dp83822 =3D phydev->priv;
> > +	int ret;
> > +
> > +	if (port->mediums) {
> > +		if (phy_port_is_fiber(port) ||
> > +		    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
> > +			dp83822->fx_enabled =3D true;
> > +	} else {
> > +		ret =3D dp83822_read_straps(phydev);
> > +		if (ret)
> > +			return ret;
> > +
> > +#ifdef CONFIG_OF_MDIO
> > +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> > +			dp83822->fx_signal_det_low =3D
> > +				device_property_present(dev, "ti,link-loss-low");
> > +		if (!dp83822->fx_enabled)
> > +			dp83822->fx_enabled =3D
> > +				device_property_present(dev, "ti,fiber-mode");
> > +#endif =20
>=20
> I think this is to make it backwards compatible to the dp83822 bindings,
> is it worth mentioning this in a comment ?

Good point yes, I'll mention that.

> > +
> > +		if (dp83822->fx_enabled) {
> > +			port->lanes =3D 1;
> > +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
> > +					BIT(ETHTOOL_LINK_MEDIUM_BASEX);
> > +		} else {
> > +			/* This PHY can only to 100BaseTX max, so on 2 lanes */
> > +			port->lanes =3D 2;
> > +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASET);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int dp8382x_probe(struct phy_device *phydev)
> >  {
> >  	struct dp83822_private *dp83822;
> > @@ -900,25 +927,13 @@ static int dp8382x_probe(struct phy_device *phyde=
v)
> > =20
> >  static int dp83822_probe(struct phy_device *phydev)
> >  {
> > -	struct dp83822_private *dp83822;
> >  	int ret;
> > =20
> >  	ret =3D dp8382x_probe(phydev);
> >  	if (ret)
> >  		return ret;
> > =20
> > -	dp83822 =3D phydev->priv;
> > -
> > -	ret =3D dp83822_read_straps(phydev);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret =3D dp83822_of_init(phydev);
> > -	if (ret)
> > -		return ret;
> > -
> > -	if (dp83822->fx_enabled)
> > -		phydev->port =3D PORT_FIBRE;
> > +	dp83822_of_init(phydev); =20
>=20
> Keep the check of the return value.

Ah yes indeed, the check should indeed stay. Thanks !

> > =20
> >  	return 0;
> >  }
> > @@ -1104,6 +1119,7 @@ static int dp83822_led_hw_control_get(struct phy_=
device *phydev, u8 index,
> >  		.led_hw_is_supported =3D dp83822_led_hw_is_supported,	\
> >  		.led_hw_control_set =3D dp83822_led_hw_control_set,	\
> >  		.led_hw_control_get =3D dp83822_led_hw_control_get,	\
> > +		.attach_port =3D dp83822_attach_port		\
> >  	}
> > =20
> >  #define DP83825_PHY_DRIVER(_id, _name)				\
> > --=20
> > 2.48.1 =20
>=20
> Best regards,
> Dimitri Fedrau

Thanks for reviewing,

Maxime

