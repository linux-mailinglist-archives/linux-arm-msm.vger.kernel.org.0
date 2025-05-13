Return-Path: <linux-arm-msm+bounces-57703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF3AB56A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DDE3A6AE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD3E1531E1;
	Tue, 13 May 2025 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OkIM9Vko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D745BE3;
	Tue, 13 May 2025 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144839; cv=none; b=QWGQPJ2ky7CzgTgv9t2FP7H7LP5QOHZki72rAy9DO3QwEl1gOiynDJOCz+xhfJQ43G0K4EMzYFF/yvadzH/N/HvjKYIqNKrI6ZhiwUArOQ46ZsFZotS9U44WUF53K2LYraAEucthYjBEznsAkVc/qOi4y8I38n8CGruuG8VOzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144839; c=relaxed/simple;
	bh=2V3RJMoSdH5GN6pzpuraWftQOkguKespuzVKhIClrls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzejwLTtW/MWeasoODTOpBrzESwTZDKyogXbRLoQGn6qUz8cNFUhxW/4kaGLka0YtiN3/SOYEl21p0qY7yjD0iuVOYSfviY1OD1SdeIMk4pbmiPezAX8oJuZVDgMLLKE3Yn45xvlSYal1mhH63liz6jDX8turRgUUddQAGUsP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OkIM9Vko; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA5FF1FCEB;
	Tue, 13 May 2025 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747144829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOCvs6S0yB1k4/Je2C7sy7pn1hJL4NhQpJPWsxB0p0s=;
	b=OkIM9VkoWq05ApH3uJJ9wnlsWXx+ZJyx43JU/8tkdn4ITLtXlec4X0PbuOnOzVw+dDRCDM
	JaMsu4mBipS7YaOCpJOfRFtKd5Koi16gx2B2wwGL/D0jnhPYSMrf/mIZrv8wQLhlpsWlwX
	j0Gq07O7OKeKONpvDIWR5JbXrVvOLpkgNg9synD7W5if226RZQ5xfQXZ2/kqW/iq/S5AW+
	v84s0t47wCgugU/S+eVdAGw2KQibsaLKiLMGhSL6nVJDoWvXB5jTt4LlHAPwozZDs/MwPC
	QBgxdywjSeHZfLJbL3qRhs353JxQ+jVgIthgxtLa1zuylKN68Pl1Zy2mxzaSGg==
Date: Tue, 13 May 2025 16:00:15 +0200
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
Subject: Re: [PATCH net-next v6 04/14] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250513155957.700c1a05@kmaincent-XPS-13-7390>
In-Reply-To: <20250507135331.76021-5-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-5-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudgrmeeiudemjehfkegtmegurgehjeemfeehsggsmegttdejudemiegsvdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdurgemiedumeejfhektgemuggrheejmeefhegssgemtgdtjedumeeisgdvsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpt
 hhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com

On Wed,  7 May 2025 15:53:20 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> With the phy_port representation intrduced, we can use .attach_port to
> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

...
 =20
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
> +#ifdef CONFIG_OF_MDIO

if IS_ENABLED(CONFIG_OF_MDIO) seems to be more used than ifdef

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

