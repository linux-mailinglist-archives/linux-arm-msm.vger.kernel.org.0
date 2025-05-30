Return-Path: <linux-arm-msm+bounces-59843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03EAC88ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07CD1BA3E41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 07:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6378320D506;
	Fri, 30 May 2025 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DOYOTYnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079E2AE6F;
	Fri, 30 May 2025 07:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590105; cv=none; b=AdbJXd3s5GhvghO5u2qGAmto3IGVw77MR7sAT4DdRpRaLGxMYBCgO4eoerx1GRlBfkUcMyeW64L24yGBaALTDnv+TT6/crxywCj06XJrz/S2H25Qirkd++KHp/1VVgSe21FNtkg4ujR81+Nm3y9mZuljDix3peSGdNx7rR7sGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590105; c=relaxed/simple;
	bh=rFTdzueErqW7ZWtBYGbftECWppJ7FYrToB22dGQAmMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VT6iE5o8cCv1qoBh2LMrbaMOK9obnhB+TF86MpmfjQxo/PvNTxYr2NObUI6jHfR+bQtp4f9tB912qXFgJfnxnI7PS5n0dIVHp4ZjfYxgcX9316AXFht6EK8BqAshr9Of3a1YO57p5jf9UCEhG1s4oZWi5PWhgW6Lgg3JlmEz7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DOYOTYnG; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D35A843A63;
	Fri, 30 May 2025 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748590094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WxJKQnlngqPKzQgieYcZOedSyyuKtQwXRQsJDRHek1A=;
	b=DOYOTYnGlX46ngRBabnkMLB8PdI8LP7g+Z5auY7q2nXgqXll22UC4qv4S0hL6ZfQJOgtNM
	NKMQhvbkS59CKkdfZFzdB//Y3EBgwzYZ0EFs13gCjWvnyxikQnj8Arnt5z85fzr0cBeCYQ
	yyD/lVKi3UbGBtdTNIwC8qcr59aQJ95z1BfkX7T9aE0pbgb4n7KxzBZsqebQd/MiBOR0xA
	N9kuQOfPbkcdZdpMJE12LyG0SwsG2NM7E7t15jtg3kECxFz46ImvC4DoBxPnKpO+V/fW1B
	vZjrsrW3t0ArlrUk/ozCHZbVdoVWgsDh8W42aKpNLzgkZBrpyljE8oW6QFZ3hQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
 Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP handling for
 PHY drivers
Date: Fri, 30 May 2025 09:28:11 +0200
Message-ID: <6159237.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <13770694.uLZWGnKmhe@fw-rgant> <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5012516.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeegudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart5012516.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Fri, 30 May 2025 09:28:11 +0200
Message-ID: <6159237.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
MIME-Version: 1.0

On Thursday, 29 May 2025 15:23:22 CEST Russell King (Oracle) wrote:
> On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > > PHY_INTERFACE_MODE_1000BASEX).
> > 
> > Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes
> > you're
> > right.
> 
> 1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
> interface mode because PHYs that use SerDes can connect to the host
> using SGMII or 1000BASE-X over the serial link.
> 
> 1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
> fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
> etc where the S, L, E etc are all to do with the properties of the
> medium that the electrical 1000BASE-X is sent over. It even includes
> 1000BASE-CX which is over copper cable.

Ah makes sense, thanks for the explanation. I guess my mistake was assuming 
that MAC/PHY interface modes were necessarily strictly at the reconciliation 
sublayer level, and didn't include PCS/PMA functions.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5012516.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg5XgsACgkQ3R9U/FLj
286GbBAAmB3Nz5sjbXmWSvq8T+BWKMW6/ADtfZoynbL1liHfm02INS3KBq6v80Ev
V9bV7+DHe2VPHiWTQdVDfKXwsdlHRtzknR5d9paXM2l+EdaXgi4g1WI6tPjCNcdA
HGCxoRnc0xEAWpVO7cCQWkq+77Z7LVt1QY19KFQiWMjvrerTynW4aKiCC3Y1TyEV
/qFbXLC4cweZM0KYY4bkBezlWMEkSM74nNZ2Wd2NyZTX9PvtrhIrJJk+PEufYtcl
N/boaRq6clQ3fMPzmRBRLdW7a4OyFQo5ua7FN5rfTPjvLwGWs3R50CnITGdjmZab
sj7Gz44GSIjCW180sr9LBxCxyghqwOPaDAVu+hzw3zWGOr49upOdvKXwfPx/W50h
d8coBTgF1dfcMipO7QVwzvDOsFu27IsOCJ8YQs3UwnjUX3i1zIWwmwy5JVehMoJX
Y2RH3AJdTvcoiEE8dMn6iDh1ytPWiZuCTBT/1wUQ6BgG1Nzkv/ZWE/OZVupszzph
vYDgNRdKMUlh6p/rT/PX7b5CjY30O7i3d1qd3kEihJD6ilFBRrcp9GDoiBH3QcFR
CzXnQ+v8JSe3d/M/Z8tbiTakjyb5138Jms/AriV+/JXluotuoWm0f8QI32PJURpC
x+1WTrHPNlRPBQfj15Z3h5191R0pskPp4Q219ZJB8pYPrEJ9Z2w=
=aVaE
-----END PGP SIGNATURE-----

--nextPart5012516.31r3eYUQgx--




