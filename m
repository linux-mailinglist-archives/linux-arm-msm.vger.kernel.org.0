Return-Path: <linux-arm-msm+bounces-57694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD969AB54A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E48A19E2BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2F828DB68;
	Tue, 13 May 2025 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IHJkIko3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0A128D8EE;
	Tue, 13 May 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139131; cv=none; b=IZzdzu9VdinRQUJqXY6GMhlAHbCf4ijoxUrqcSrm/TLpZZwbyZB3MSJyWMXWoK568mNi9QtKO57YPK1Z7DtN+yQxe2AFzTriw4k4g9J1F24EIdeJttgZnB1DnBx0JRdnF1/MrKsHEVfytNDrIxw9JA9qg4HEkePltISwzecNAdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139131; c=relaxed/simple;
	bh=nBwuhlStxBwkCxyJkMnugFYKNeLjwc5gQBpatTNN0K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBcICoCSlclJ30jSITWlWKIHOcQJbgjtQpS6XiGTKSGlUX/6vHD7083QjSZWxDTkrVanEXgg54xfST3p2T76qOhMYrLwEgJ2n9PSKrtsu2QS14ZU64E0Ah9r17hdgVzgAezrlkL8SfvWduecXU7mDPZy1zRpwBKWnaM0pyreXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IHJkIko3; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A251D1FCF1;
	Tue, 13 May 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747139126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O62I4pFc3JnVqx9L8an5wgvbSqIo9PimfybTZS4SMIw=;
	b=IHJkIko3+qalmEz8B4hLfVjusGl44dZ59bGzjjqjVhrQFXY+txhj9bLFMSXaze5sw2eK5h
	NBLMAsLniDK/yGv+bi5y1aE05NqCF22O07Uu++x1HspcYgAZD952b/uQH1LbiYDe1QnkN+
	5XSx5EdkpI5TtUIKj+qZcVPnMEE1kFkTosjy/gNKQKT9gNq/wj7ZqO3ma3VLc+p3y6sfjC
	+6ZF0SAAZ6xodv9wx5RvtLY7lVqtFmcxp1HDq0EKo/uQNi8usMAo8FnnOlXgucYM5xYQKn
	AK31XYK5/Xz8j459TG6lPe0OKr2ZEGpa52c4ZG0wG7mOgahF3Rmmhdc8VuceyA==
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
 Re: [PATCH net-next v6 05/14] net: phy: Create a phy_port for PHY-driven SFPs
Date: Tue, 13 May 2025 14:25:18 +0200
Message-ID: <5411380.WoAhosY9oF@fw-rgant>
In-Reply-To: <20250507135331.76021-6-maxime.chevallier@bootlin.com>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <20250507135331.76021-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4316204.q3hVSFHU5c";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart4316204.q3hVSFHU5c
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 13 May 2025 14:25:18 +0200
Message-ID: <5411380.WoAhosY9oF@fw-rgant>
In-Reply-To: <20250507135331.76021-6-maxime.chevallier@bootlin.com>
MIME-Version: 1.0

Hi Maxime,

On Wednesday, 7 May 2025 15:53:21 CEST Maxime Chevallier wrote:
> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
...
>   *
> @@ -149,6 +151,21 @@ void phy_port_update_supported(struct phy_port *port)
>  		ethtool_medium_get_supported(supported, i, port->lanes);
>  		linkmode_or(port->supported, port->supported, supported);
>  	}
> +
> +	/* Serdes ports supported may through SFP may not have any medium set,
> +	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, 
derive
> +	 * the supported list based on these interfaces
> +	 */
> +	if (port->is_serdes && linkmode_empty(supported)) {

The "supported" bitmap needs to be zeroed out before this check. If the port 
has no mediums, then the bitmap won't be initialized at this point.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart4316204.q3hVSFHU5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgjOi4ACgkQ3R9U/FLj
287DUhAAngbhJUwLCvBnV5PWgoxzylrH4wZtZlKTuz1naWUfoB3fHZM+QTzrNVsB
0+/GfPFTYYVb/3zeAbvC13AGxQIgZzCA/Xcmw4kDgzNV49gmyoGrxCkgug1BhMmS
EXMueGmXF7bFuJ4L54czImHNdOa7olxl0F+v1XiSy46wmjD+39CDaEJhcby+hdC/
LtzODlMPJiYd3nXRda64cERU+maoEHWw3ISNuoyv0uYFle9svUK/XJnLYHMzbSKS
O69wa+Q1ESB8z3hNEI1gJn7QKleb01DIqY90pK91O2Lc5D9ZZSsBR50wxRW16lzd
4tRHtX1r32BhS5A2YqrT3UsVQhh4gegJqqSnRBnNVp7+1FNWKS7d/1Y8kpehPxVC
3JBoEK87/ULYiWYXpSbd/ZO0Wb+HwQIW+rY3YhyaGJIPNY6xZt+EcY+h0H5jmhM7
Lcv+48vReuIOkgiQOWEmeCKCpWG818kQXuXGjNy4gh7eSTYVD3g603tLfGJUczT3
B9cBN83/o72XNqJqjLUSbYWRx02/8teT7uje1lydlnHwApD6bEXVr3xv8vNOxcgo
bCqgZQpnFbLu/auEs/8j1Wgn4Ajc98CYnu7s8+gtBr+rfFkiMh3IPc7RLklDiG/e
DGI0Q5r4LD4dN/nsA5bSg5mpu3llpwS63eb59BQNueO6hiWpX9k=
=Wa24
-----END PGP SIGNATURE-----

--nextPart4316204.q3hVSFHU5c--




