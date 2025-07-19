Return-Path: <linux-arm-msm+bounces-65735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A267B0AF6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 12:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE946188A68A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 10:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9238B221277;
	Sat, 19 Jul 2025 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P4HrsYYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8E33086;
	Sat, 19 Jul 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752922593; cv=none; b=NnwUHfygPPjxIxkTkzMOh43BpvcBsU+yEyl6AAgzUK9tmbKy1J8NCcIYLqAQzTNYCewfEN2UGzsdW+ruRo9aOgPzwQbOfU9zxpsKlfcFa7kPD8h5Xex2fq8Iu51++E9MIhwzj0/5Hr8HM5x+D41vsL30oQvn/d0V7wBHEvTh5ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752922593; c=relaxed/simple;
	bh=8CDwXX3HzreVp6VcPV55yzgMZETSE5j2+/qjBNZKVYU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbMDJJStegxpfMgGKPY99PbjOAgTchS9nSG+fBOAQ2mNztesihdhrUp3oGKF8xxt2S1UrWIsW2S2CoAhJx56UHz4QZh0cidnJMp5EKxUUJffuM6EUzbIFH2d8dCuoX5dcr9U3xm725EgxqGNUKlhhLbIFR5mLYHfU/fS/k2Vwx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P4HrsYYq; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EAF71F68D;
	Sat, 19 Jul 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752922581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+V4okcQg5oev0dJo7W9WyupRbgSuk/hNGg+xMr7j5I=;
	b=P4HrsYYqAhmsXl1kclEkZQG9JsrFGmEV54vH98kLPctV2Q6P14yJc5XQdbugAbDGEtBefU
	2NTFBx17uTgNhAYS8OJVSkgsFIvVErk9re1JfRlxzl3+hD2o8zk2VQP0f3jLaluiueuONu
	UVhOoySTeVWarG+s3JB/khD9TQ8H56+sC4O4tyyBtgflwXHXeD7yHuddsZI3yw1DT5EFJe
	IzQXU1/czG/fPBdnlEg3P0GVQ2T1nxUBq2DhTojmRUGwYVA4DtjYev5rQiCtlgMJWimVu8
	tX9GkfkKqqVB1nR3UuiircLA7AoVjiB5yBitGLYqAUEZU9V/MgefpOvQ0X7nqA==
Date: Sat, 19 Jul 2025 12:56:16 +0200
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
Subject: Re: [PATCH net-next v9 05/15] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250719125616.336ece14@kmaincent-XPS-13-7390>
In-Reply-To: <20250717073020.154010-6-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
	<20250717073020.154010-6-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiieduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduheemfegvgeemtgehtddtmeejtggsvgemiedtieeimeeirgdufhemtggsuggunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduheemfegvgeemtgehtddtmeejtggsvgemiedtieeimeeirgdufhemtggsuggupdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtp
 hhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

Le Thu, 17 Jul 2025 09:30:09 +0200,
Maxime Chevallier <maxime.chevallier@bootlin.com> a =C3=A9crit :

> With the phy_port representation intrduced, we can use .attach_port to

*introduced

As you will have to resend a new version ;)

else
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/dp83822.c | 71 +++++++++++++++++++++++++--------------
>  1 file changed, 45 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
> index 33db21251f2e..2657be2e9034 100644
> --- a/drivers/net/phy/dp83822.c
> +++ b/drivers/net/phy/dp83822.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy.h>
> +#include <linux/phy_port.h>
>  #include <linux/netdevice.h>
>  #include <linux/bitfield.h>
> =20
> @@ -811,17 +812,6 @@ static int dp83822_of_init(struct phy_device *phydev)
>  	int i, ret;
>  	u32 val;
> =20
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if
> FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low =3D device_property_present(dev,
> -
> "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled =3D device_property_present(dev,
> -
> "ti,fiber-mode"); -
>  	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>  		if (strcmp(of_val, "mac-if") =3D=3D 0) {
>  			dp83822->gpio2_clk_out =3D DP83822_CLK_SRC_MAC_IF;
> @@ -950,6 +940,48 @@ static int dp83822_read_straps(struct phy_device *ph=
ydev)
>  	return 0;
>  }
> =20
> +static int dp83822_attach_port(struct phy_device *phydev, struct phy_port
> *port) +{
> +	struct dp83822_private *dp83822 =3D phydev->priv;
> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port))
> +			dp83822->fx_enabled =3D true;
> +	} else {
> +		ret =3D dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#if IS_ENABLED(CONFIG_OF_MDIO)
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =3D
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility,
> but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =3D
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,fiber-mode");
> +#endif /* CONFIG_OF_MDIO */
> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes =3D 1;
> +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASEF);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes
> */
> +			port->lanes =3D 2;
> +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int dp8382x_probe(struct phy_device *phydev)
>  {
>  	struct dp83822_private *dp83822;
> @@ -968,27 +1000,13 @@ static int dp8382x_probe(struct phy_device *phydev)
> =20
>  static int dp83822_probe(struct phy_device *phydev)
>  {
> -	struct dp83822_private *dp83822;
>  	int ret;
> =20
>  	ret =3D dp8382x_probe(phydev);
>  	if (ret)
>  		return ret;
> =20
> -	dp83822 =3D phydev->priv;
> -
> -	ret =3D dp83822_read_straps(phydev);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D dp83822_of_init(phydev);
> -	if (ret)
> -		return ret;
> -
> -	if (dp83822->fx_enabled)
> -		phydev->port =3D PORT_FIBRE;
> -
> -	return 0;
> +	return dp83822_of_init(phydev);
>  }
> =20
>  static int dp83826_probe(struct phy_device *phydev)
> @@ -1172,6 +1190,7 @@ static int dp83822_led_hw_control_get(struct phy_de=
vice
> *phydev, u8 index, .led_hw_is_supported =3D dp83822_led_hw_is_supported,
> \ .led_hw_control_set =3D dp83822_led_hw_control_set,	\
>  		.led_hw_control_get =3D dp83822_led_hw_control_get,	\
> +		.attach_port =3D dp83822_attach_port		\
>  	}
> =20
>  #define DP83825_PHY_DRIVER(_id, _name)				\



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

