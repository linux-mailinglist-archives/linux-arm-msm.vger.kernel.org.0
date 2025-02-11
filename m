Return-Path: <linux-arm-msm+bounces-47589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E474A30CF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70D8165DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229181FAC4A;
	Tue, 11 Feb 2025 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JeCc7Nq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69721B85FD;
	Tue, 11 Feb 2025 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280737; cv=none; b=t0DvVBMVfH6pDcVe0X2dTZ1mHBQDbpwgZdvpXZPC7Q5bBgzjmBS34TvM3BUXr4KoEIL5Sh9I60A5xT20p9s66hUNgRLHeNd7E8Ax5JTNOrZs62OD/eH5ri0zFTA0J03qOhsE9TZ2uCUPe5I+7SFf+WXFMxw9RKhzZR/XK530lWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280737; c=relaxed/simple;
	bh=pYTicEKav+wFq62fntSHoX3BaH1+s625FcTaodjBKDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fX7oJkf5rWqG5mOrGr6oXkAgNYMta7TCHqeT7aPQZD/ZjejD0rYi5XXGI2EYPv7FzTcxKuvtYc8TctGwaSf2vT9PMBNd30fSs3Pm38aySKM/OTdIVwpGwJD7kc9Uxy6VHozfy9e6iHvhS3VAbMsxvplNDon+SaKS5ewyEBrMbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JeCc7Nq7; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41D31440EE;
	Tue, 11 Feb 2025 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739280732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAvjdSvXA4nQGDvB1wQA7K1O0Rt2MZsbOsi/M4ix9QA=;
	b=JeCc7Nq7QuZVANkyQtlKreTbbPTgWPvh3d2L7WcR3zrTNO8AFNoaw8YTSkIvHtfle0JW3s
	AfmIQ0YizrhVqkDC+DIFvzKGxvfVPItYcmNtMEgTQgeZE0tUNf02nZ3DE8BLD7ewzh2wnK
	DuY4HokoyCWirbuc7CNi1tK8m8OB4yrwoJgGTO+hz+3W8IRBPLPwgSLiuBd8HRQ4j0erbt
	4n+482ULdQ09OUx6V7OTPvU/x6sSN+8OJ2fAwoArgVf/JJamnZMd5mffkN+v7kFUowk0fH
	TWDjxARD8fqceclDh5MQFpXd8zV8tC+rjRyel8DdOjZmwhyRl4G0k0Vsn89eqQ==
Date: Tue, 11 Feb 2025 14:32:09 +0100
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
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 03/13] net: phy: Introduce PHY ports
 representation
Message-ID: <20250211143209.74f84a10@kmaincent-XPS-13-7390>
In-Reply-To: <20250207223634.600218-4-maxime.chevallier@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
 <20250207223634.600218-4-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

On Fri,  7 Feb 2025 23:36:22 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
>=20
> Introduce a representation of these front-facing ports. The current code
> is minimalistic and only support ports controlled by PHY devices, but
> the plan is to extend that to SFP as well as raw Ethernet MACs that
> don't use PHY devices.
>=20
> This minimal port representation allows describing the media and number
> of lanes of a port. From that information, we can derive the linkmodes
> usable on the port, which can be used to limit the capabilities of an
> interface.
>=20
> For now, the port lanes and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
>=20
> The typical example is 100M ethernet. 100BaseT can work using only 2
> lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> way of detecting that. The "max-speed" DT property can be used, but a
> more accurate representation can be used :
>=20
> mdi {
> 	port@0 {
> 		media =3D "BaseT";
> 		lanes =3D <2>;
> 	};
> };
>=20
> From that information, we can derive the max speed reachable on the
> port.
>=20
> Another benefit of having that is to avoid vendor-specific DT properties
> (micrel,fiber-mode or ti,fiber-mode).
>=20
> This basic representation is meant to be expanded, by the introduction
> of port ops, userspace listing of ports, and support for multi-port
> devices.

This patch is tackling the support of ports only for the PHY API. Keeping in
mind that this port abstraction support will also be of interest to the NIC=
s.
Isn't it preferable to handle port in a standalone API?

With net drivers having PHY managed by the firmware or DSA, there is no lin=
ux
description of their PHYs. On that case, if we want to use port abstraction,
what is the best? Register a virtual phy_device to use the abstraction port=
 or
use the port abstraction API directly which meant that it is not related to=
 any
PHY?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

