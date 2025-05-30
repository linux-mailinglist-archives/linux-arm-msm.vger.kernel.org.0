Return-Path: <linux-arm-msm+bounces-59863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE367AC8A75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81141BC29F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED3821C19B;
	Fri, 30 May 2025 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZB1U/Pdf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D91EB5D8;
	Fri, 30 May 2025 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596134; cv=none; b=U9XQdV9YYkAgBBWSWwV/f25KFGrKgMHyo3oZQF5oA7HVrTEFS79SW2swJKSYGbaCV0rI3ADubUsaN+lrSa23dNNgEAaVFPntMEfFmp2wQM6z7kxCtLpwaGFHIRpZjzzS5su5S7eMpJ+M7LDzU1/VdGL/olGBTBOC0B9ElRYiRUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596134; c=relaxed/simple;
	bh=kyXdt8s0xKz4LjroE2u3gSZ0qK9QnI9kcAdnHQnzJj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UpT09/elycHJ4rE5KgttTEhX+isDEivw5H1K+MZFqg7K+ISSIKJVGQdu/DHdZfqhgCcHaLxXM8mbkqCYo94qYBHZGnuLnVOWshCk1PWgXRNzF831Xbfh9HaNrsSR9RK5ds3gJrmi5WrUf9OQuZVXOQl8WFNF6e+ZemD9w2yWsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZB1U/Pdf; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D06D643349;
	Fri, 30 May 2025 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748596129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDcQoFFC4NqCXcyobvRRuP1Ua4ytiuIE7XjIkD34fbk=;
	b=ZB1U/Pdfi7HtDnqYB1OWNlxulO3P8Fzu1T1afPYQ754WfHDNuOCqhr37hUY6ZczMdot6mN
	iKfgB57p8ne86qqiVAZL4T0zsuD2oXjkNi9Lx3+FRbgiijwLmb9ZSxZ3KK2eC8Xqd9CioZ
	yzOYPApcG7YNnNy58ZNYVwhc7L78+lx/W8BrCXo2NEU35lMAFE1SSpZx26hyQJVZ3Nrnmb
	w6+mG5x8R8W7GNQ2s81ezwluiyStYudEhpPnKiYruUKX3GhapRbICKk4/l3DWhZDNjo9ME
	QUFFW58toUQT05s34GNXa92rPdx7Bu+JwK3kC06Yh9cWmK4T9/7lyc5QvFJqLA==
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
Date: Fri, 30 May 2025 11:08:41 +0200
Message-ID: <12687918.O9o76ZdvQC@fw-rgant>
In-Reply-To: <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <6159237.lOV4Wx5bFT@fw-rgant> <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5904461.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeeiudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart5904461.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Fri, 30 May 2025 11:08:41 +0200
Message-ID: <12687918.O9o76ZdvQC@fw-rgant>
In-Reply-To: <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
MIME-Version: 1.0

On Friday, 30 May 2025 09:46:19 CEST Russell King (Oracle) wrote:
> On Fri, May 30, 2025 at 09:28:11AM +0200, Romain Gantois wrote:
> > On Thursday, 29 May 2025 15:23:22 CEST Russell King (Oracle) wrote:
> > > On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > > > > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > > > > PHY_INTERFACE_MODE_1000BASEX).
> > > > 
> > > > Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes
> > > > you're
> > > > right.
> > > 
> > > 1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
> > > interface mode because PHYs that use SerDes can connect to the host
> > > using SGMII or 1000BASE-X over the serial link.
> > > 
> > > 1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
> > > fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
> > > etc where the S, L, E etc are all to do with the properties of the
> > > medium that the electrical 1000BASE-X is sent over. It even includes
> > > 1000BASE-CX which is over copper cable.
> > 
> > Ah makes sense, thanks for the explanation. I guess my mistake was
> > assuming
> > that MAC/PHY interface modes were necessarily strictly at the
> > reconciliation sublayer level, and didn't include PCS/PMA functions.
> 
> When a serdes protocol such as SGMII, 1000BASE-X, or 10GBASE-R is being
> used with a PHY, the IEEE 802.3 setup isn't followed exactly - in
> effect there are more layers.
> 
> On the SoC:
> 
> 	MAC
> 	Reconciliation (RS)
> 	PCS
> 	SerDes (part of the PMA layer)
> 
> On the PHY side of the SerDes host-to-phy link:
> 
> 	SerDes
> 	PCS (which may or may not be exposed in the PHY register set,
> 	     and is normally managed by the PHY itself)
> 	(maybe other layers, could include MACs	back-to-back)
> 	PCS
> 	PMA
> 	PMD
> 
> Hope that helps explain what's going on a little more.

Definitely helps a lot, thanks.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5904461.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg5dZkACgkQ3R9U/FLj
285M0g/+Nz1A6obdeKee0RLc6MA2gBvM/EmqYPQ6ZduN6VFL2D6J4NATyQRqu/VW
u4d0pjD2ZOe44w6eAeRcWHsC0LJYfnHPPMhxekF2l+qqggkvZDGp9BmWJZd5UUe0
dDxur4qI6XF2WlWDXyf9auZ3iGvqOUnWYK7VsLu/1hMYeC8M0Q+5dwy72//aAGnH
9lyBU77a7sd3Qhlnd5Flg5f9ZuQmfqcD7Hyjp0OXdSJr7TlXLPJ+4FffNTivOQMK
WonmDnfUOSPfxukMd0ozR7Z2BdvUeKPrlQq6yvcC5aS+9WZvVWCZzLOLrlBylu50
wtEnYLpXd8QVehLsZGfE8mB4u+IuJICnEKhhrQ7YSLdjmXkj4VHCZHjl28WrI5rP
wMCczhfYk4tDM83L2TBDVX5DTvcIcBawWlGxwzOdZ8WbipSVt5LZMtAkICE9TZzz
j0oJ6+4xxi8mXGVduWD7kztOgXFl+UAx9GG8RsWoSPE0+t1f2nO0YV55UTW5RhEA
/hNR+P1Z8pB9SHjHM9TskW6LC4Z/NEIBnI0N98BacAdjSc/KX4uHSH01ANVHRyEs
wD5PJQKAj705h81tvNA4RzUkqC+UAa9bjtE3gtqj0KnusZhSiPBtIRe55sJ3W9aU
uYNbFO3CW8dD+WMqYm9fQrWtbqX/tOWRCOzdM5KMSNpbVyBWNDs=
=r0Tf
-----END PGP SIGNATURE-----

--nextPart5904461.DvuYhMxLoT--




