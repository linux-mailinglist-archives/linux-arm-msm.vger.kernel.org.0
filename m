Return-Path: <linux-arm-msm+bounces-65707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE32B0A9A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994333AC941
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248262E764B;
	Fri, 18 Jul 2025 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CVdRvKlI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DEC156678;
	Fri, 18 Jul 2025 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860435; cv=none; b=GrB33lmUKdeePFRF1dt2hg0F4wNZetDQiEaplHutuTqX/g3IpD4whRpoy0aIJnwpvGIDUhuO2JReknQenlsy+4MbUVEv2TO6xZ8JkVz/JeZwt4/cVFBTDCR4WmxBRxAN5QkmupMn3lMRkmR9XlK+VZBESuBr7VLvc3N452tD91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860435; c=relaxed/simple;
	bh=mQMolIgpTH7FjE+3w+cIHxeevW8RkXD0lhrk1Zqnq1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4O/+O6Sr/SwKfuJUYlZnJN4mUnzTo/GZQtaiq63ZZxSwYCWEVgd9LWVjLE5B1J/aJqxbU3W55tXJNC8FPrWX45XSFTsvaioOIO3PqrTEFAHvk5dGGz8zrsYOcnjuTzkg4Srj3ONPVOgxf/PEBb5Odjad204KIj6bxU4vddNlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CVdRvKlI; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FD8E443B3;
	Fri, 18 Jul 2025 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752860425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fQqUsJ+Qb6MnonChra2CtKhIIlviGmLlJPe1nhDRgAA=;
	b=CVdRvKlIHFHsWfAgRCHtzqd+wMzGyGeJV7woFCUMSefTHo6gS4gAbmWGFLMC+KtyhK8Sep
	7mSo0vOFEg1xkQv2/aKJ8M1I+NOfJbKxBXNwO/iXiopx9mRRBngl1EYJMtucYoz3/Ckc3e
	qGdMo6s7sj/FPzERN7FrV5S5pNO//q3meaQqQ4YyAf0x/K3K4I2X4TjryooGndNCD1CXog
	wSAvnuP9QxJZ5z/3+UOpSAyL8PV7vbx23Nn7aboo5j8HvfRiFRj1M3/zSF92soI9YTFFo8
	msJwRCY5Tbz/C9eqdCnQPrhN76K1qnNze4lKNr1tJe5RxthKM4S6M5wfXQE4jw==
Date: Fri, 18 Jul 2025 19:40:22 +0200
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
Subject: Re: [PATCH net-next v9 02/15] net: ethtool: common: Indicate that
 BaseT works on up to 4 lanes
Message-ID: <20250718194022.4d01088e@kmaincent-XPS-13-7390>
In-Reply-To: <20250717073020.154010-3-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
	<20250717073020.154010-3-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeigedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduheemfegvgeemtgehtddtmeekvddttgemiegvtddumeejkegrtgemvdgtugefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduheemfegvgeemtgehtddtmeekvddttgemiegvtddumeejkegrtgemvdgtugefpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtp
 hhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

Le Thu, 17 Jul 2025 09:30:06 +0200,
Maxime Chevallier <maxime.chevallier@bootlin.com> a =C3=A9crit :

> The way BaseT modes (Ethernet over twisted copper pairs) are represented
> in the kernel are through the following modes :
>=20
>   ETHTOOL_LINK_MODE_10baseT_Half
>   ETHTOOL_LINK_MODE_10baseT_Full
>   ETHTOOL_LINK_MODE_100baseT_Half
>   ETHTOOL_LINK_MODE_100baseT_Full
>   ETHTOOL_LINK_MODE_1000baseT_Half
>   ETHTOOL_LINK_MODE_1000baseT_Full
>   ETHTOOL_LINK_MODE_2500baseT_Full
>   ETHTOOL_LINK_MODE_5000baseT_Full
>   ETHTOOL_LINK_MODE_10000baseT_Full
>   ETHTOOL_LINK_MODE_100baseT1_Full
>   ETHTOOL_LINK_MODE_1000baseT1_Full
>   ETHTOOL_LINK_MODE_10baseT1L_Full
>   ETHTOOL_LINK_MODE_10baseT1S_Full
>   ETHTOOL_LINK_MODE_10baseT1S_Half
>   ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half
>   ETHTOOL_LINK_MODE_10baseT1BRR_Full
>=20
> The baseT1* modes explicitly specify that they work on a single,
> unshielded twister copper pair.
>=20
> However, the other modes do not state the number of pairs that are used
> to carry the link. 10 and 100BaseT use 2 twisted copper pairs, while
> 1GBaseT and higher use 4 pairs.
>=20
> although 10 and 100BaseT use 2 pairs, they can work on a Cat3/4/5+
> cables that contain 4 pairs.
>=20
> Change the number of pairs associated to BaseT modes to indicate the
> allowable number of pairs for BaseT. Further commits will then refine
> the minimum number of pairs required for the linkmode to work.
>=20
> BaseT1 modes aren't affected by this commit.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

