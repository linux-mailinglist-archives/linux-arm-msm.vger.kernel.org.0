Return-Path: <linux-arm-msm+bounces-57592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC331AB3248
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 10:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49455189B4B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 08:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D560725A2A6;
	Mon, 12 May 2025 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lBG7UIt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954DF13CF9C;
	Mon, 12 May 2025 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039993; cv=none; b=Bwy5aaDRp7aXp7ISv60jDoifhALf2vP75z+S0lRpGm3t8iIp8ZotIOEfJ5jBl+hH62oF1rofr7ezcWu8JDbhD+MbP3zVI590JrGpdwz8qpvzpbT5oerfVuQATgO0foPAwwNxjBHAdyArZFq6oBqAP34HtMkHTOk/e28Fs+xYrHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039993; c=relaxed/simple;
	bh=fsWgRkwmt6EGHHzL1OY4aktipP2bQAekjWjb0dTW1Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rf5PKk7V2+WfLJV9a4AbQ0UyX45FtAcckx4ZEimoz3p04PhRhT4zUcYbS2p2vI2TZehKXsIc9Gq6YZxe6k/tU6oPpEtxj2CFeAlJPEvrZT+PgE1stQgk3/tfT9Xbia1rb3kIbPeEkOszbfi/GjistL9vCqAsjaod3DGe8HAyUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lBG7UIt5; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CF1242E81;
	Mon, 12 May 2025 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747039983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yA/eTMzqXcqngbyrssJwNvzYOWsbESQyZm6H3kZk8L8=;
	b=lBG7UIt5aAR95XLDJpx4h0groRjbQ7cC+771rNBnHcOs/94nE086dixVYC0fRD1iwxQQFO
	aKCbr63LjBf4d+42WQKBJ5Gj3MBHms52zHhc2SOUVMrBpbN6dRmkbuus/T9frcy7yku00d
	WwbZPqsJNhLb7BFHD0hk+Tm10nL0ggKrppz5eJi6XkpCQAjrfwZorCInO14ffZ7WxRtLAK
	Bhr43r0ybCBFikQcAxyeBt5xtK6yQw5pngSH2juAVhboRKSVaBQmVDJBj1pjYegXzCJPhQ
	UrKmQ0EGeO4zVa6wtEuTSAn8EvJtBhJzJI1hQvz1c6/TV1wgwZBPvZuVayKDWQ==
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
 Re: [PATCH net-next v6 12/14] net: phy: Only rely on phy_port for PHY-driven
 SFP
Date: Mon, 12 May 2025 10:52:55 +0200
Message-ID: <3690479.R56niFO833@fw-rgant>
In-Reply-To: <20250507135331.76021-13-maxime.chevallier@bootlin.com>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <20250507135331.76021-13-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3819238.MHq7AAxBmi";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3819238.MHq7AAxBmi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 May 2025 10:52:55 +0200
Message-ID: <3690479.R56niFO833@fw-rgant>
In-Reply-To: <20250507135331.76021-13-maxime.chevallier@bootlin.com>
MIME-Version: 1.0

On Wednesday, 7 May 2025 15:53:28 CEST Maxime Chevallier wrote:
> Now that all PHY drivers that support downstream SFP have been converted
> to phy_port serdes handling, we can make the generic PHY SFP handling
> mandatory, thus making all phylib sfp helpers static.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/phy_device.c | 28 +++++++++-------------------
>  include/linux/phy.h          |  6 ------
>  2 files changed, 9 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index aca3a47cbb66..7f319526a7fe 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1384,7 +1384,7 @@ static DEVICE_ATTR_RO(phy_standalone);
>   *
>   * Return: 0 on success, otherwise a negative error code.
>   */
> -int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
> +static int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
>  {
>  	struct phy_device *phydev = upstream;
>  	struct net_device *dev = phydev->attached_dev;
> @@ -1394,7 +1394,6 @@ int phy_sfp_connect_phy(void *upstream, struct
> phy_device *phy)
> 
>  	return 0;
>  }
> -EXPORT_SYMBOL(phy_sfp_connect_phy);
> 
>  /**
>   * phy_sfp_disconnect_phy - Disconnect the SFP module's PHY from the
> upstream PHY @@ -1406,7 +1405,7 @@ EXPORT_SYMBOL(phy_sfp_connect_phy);
>   * will be destroyed, re-inserting the same module will add a new phy with
> a * new index.
>   */
> -void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
> +static void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
>  {
>  	struct phy_device *phydev = upstream;
>  	struct net_device *dev = phydev->attached_dev;
> @@ -1414,7 +1413,6 @@ void phy_sfp_disconnect_phy(void *upstream, struct
> phy_device *phy) if (dev)
>  		phy_link_topo_del_phy(dev, phy);
>  }
> -EXPORT_SYMBOL(phy_sfp_disconnect_phy);
> 
>  /**
>   * phy_sfp_attach - attach the SFP bus to the PHY upstream network device
> @@ -1423,7 +1421,7 @@ EXPORT_SYMBOL(phy_sfp_disconnect_phy);
>   *
>   * This is used to fill in the sfp_upstream_ops .attach member.
>   */
> -void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
> +static void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
>  {
>  	struct phy_device *phydev = upstream;
> 
> @@ -1431,7 +1429,6 @@ void phy_sfp_attach(void *upstream, struct sfp_bus
> *bus) phydev->attached_dev->sfp_bus = bus;
>  	phydev->sfp_bus_attached = true;
>  }
> -EXPORT_SYMBOL(phy_sfp_attach);
> 
>  /**
>   * phy_sfp_detach - detach the SFP bus from the PHY upstream network device
> @@ -1440,7 +1437,7 @@ EXPORT_SYMBOL(phy_sfp_attach);
>   *
>   * This is used to fill in the sfp_upstream_ops .detach member.
>   */
> -void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
> +static void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
>  {
>  	struct phy_device *phydev = upstream;
> 
> @@ -1448,7 +1445,6 @@ void phy_sfp_detach(void *upstream, struct sfp_bus
> *bus) phydev->attached_dev->sfp_bus = NULL;
>  	phydev->sfp_bus_attached = false;
>  }
> -EXPORT_SYMBOL(phy_sfp_detach);
> 
>  static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id
> *id) {
> @@ -1591,10 +1587,8 @@ static int phy_setup_sfp_port(struct phy_device
> *phydev) /**
>   * phy_sfp_probe - probe for a SFP cage attached to this PHY device
>   * @phydev: Pointer to phy_device
> - * @ops: SFP's upstream operations
>   */
> -int phy_sfp_probe(struct phy_device *phydev,
> -		  const struct sfp_upstream_ops *ops)
> +static int phy_sfp_probe(struct phy_device *phydev)
>  {
>  	struct sfp_bus *bus;
>  	int ret = 0;
> @@ -1606,7 +1600,7 @@ int phy_sfp_probe(struct phy_device *phydev,
> 
>  		phydev->sfp_bus = bus;
> 
> -		ret = sfp_bus_add_upstream(bus, phydev, ops);
> +		ret = sfp_bus_add_upstream(bus, phydev, &sfp_phydev_ops);
>  		sfp_bus_put(bus);
>  	}
> 
> @@ -1615,7 +1609,6 @@ int phy_sfp_probe(struct phy_device *phydev,
> 
>  	return ret;
>  }
> -EXPORT_SYMBOL(phy_sfp_probe);
> 
>  static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
>  {
> @@ -3432,12 +3425,9 @@ static int phy_setup_ports(struct phy_device *phydev)
> if (ret)
>  		return ret;
> 
> -	/* Use generic SFP probing only if the driver didn't do so already */
> -	if (!phydev->sfp_bus) {

Alright, since you removed this, my earlier review comment about potentially 
making phy_sfp_probe() legacy doesn't apply.

> -		ret = phy_sfp_probe(phydev, &sfp_phydev_ops);
> -		if (ret)
> -			goto out;
> -	}
> +	ret = phy_sfp_probe(phydev);
> +	if (ret)
> +		goto out;
> 
>  	if (phydev->n_ports < phydev->max_n_ports) {
>  		ret = phy_default_setup_single_port(phydev);
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index aef13fab8882..4df1c951dcf2 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1796,12 +1796,6 @@ int phy_suspend(struct phy_device *phydev);
>  int phy_resume(struct phy_device *phydev);
>  int __phy_resume(struct phy_device *phydev);
>  int phy_loopback(struct phy_device *phydev, bool enable, int speed);
> -int phy_sfp_connect_phy(void *upstream, struct phy_device *phy);
> -void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy);
> -void phy_sfp_attach(void *upstream, struct sfp_bus *bus);
> -void phy_sfp_detach(void *upstream, struct sfp_bus *bus);
> -int phy_sfp_probe(struct phy_device *phydev,
> -	          const struct sfp_upstream_ops *ops);
>  struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
>  			      phy_interface_t interface);
>  struct phy_device *phy_find_first(struct mii_bus *bus);

Thanks!

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart3819238.MHq7AAxBmi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmghtugACgkQ3R9U/FLj
286tRA/8CMHL0mlMvcipbO0UAYI2bvd8TqwmNyeTFpqoCUvQneMTWKBZNd/O3ohq
6G7bGjsCfdv5rR6aESx0p0RQHsTrsIOACH0BXGynyAkVW564j2+ZANE2GGQChlGu
09o9ZbRK3GhmvDx4O5PZjfBm9cde5iea9OB1JC+Z5P/qlutvr3YsD1cteOg1qWbL
x7+RNdKUWD6v0aRYVlWrEiEMu7kwiGWW2ehlojG1ogz7nR6O7rtIvdfzdChZthry
B7UZ2C2BII9NOH9LU9JfV4s0bDiwXtfrryOrBoPfWmuPkAZ+V4mBSZvVHPuXVG0n
/J9m3Yhejm4TcmPx58E5ucsW9xuTgkEKH8L+yZK9rByZErqy+XIPmL1FZqPVPMCr
kw1gDCK0mAdKMCYv0CN1EcuTtpZw3R0HmnlTbY/+5vorE0VmY6ZLDswqclDXOiBC
1YrINywTybi8DQHXmuTgyO0M746EKIWDSwCS+Tc5KT/1132iRDGs/7zWmHETpyaa
SdeQ0OZl+CpLzNSlXhH1mHP7tLEo18kic3w4oBVZkkv3Or9vjT2OllsoWw3T+3wg
ZwV3FPvLpPZo3U6pbEyqiM9gCaebuURzgRldP3uvkZVwhmQvOed2+eFfg0j5wJ9K
Hj8U7/tj/pEAU9AX6e5IKaJa+i/Fm4ev4hkjO0qOmBW3LApBVD4=
=KKOr
-----END PGP SIGNATURE-----

--nextPart3819238.MHq7AAxBmi--




