Return-Path: <linux-arm-msm+bounces-57697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC44AB559D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3C43A3BB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 13:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B916F28DF30;
	Tue, 13 May 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dJB1jUbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C481EA6F;
	Tue, 13 May 2025 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141745; cv=none; b=RuHTxCyUYXsmqnsq0GjQImsyyUigidJU0IXBpKarb0IylGMPJ00gOAOnmRtQ+c0nbfF55310v4PbNLWoq9cMZkPVex3OXjqqAR7cQ9J/bW7Qb70Uhz242rRSgGKVPhZg/aWHlX/E622mlAK73nQ9ds01e/tvaI87sBTg5TymDyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141745; c=relaxed/simple;
	bh=8mRp/db9GQsB9zml3gT1hejcawXdpZSLrcYkeOjydhw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G887FOsJdXbHTzGEbTWjDX+uO/Vmbqm3fkyrbBHg4/Dv8yYlitA8JxRQff6jHQXToo/RAipoppP9N6LZ24CGSrEDdahNLb9q8kVj+Sig5uffIPrlKmy8geRLJrEMtehF7fm4uPRAV0xrdAJcjKFcjWySbuUBy7IOhgfxCRvP1cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dJB1jUbE; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C60943AEF;
	Tue, 13 May 2025 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747141741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8c82sCzN57Xp/rMC2k0R4691SeAEja9vwY487LmRAsM=;
	b=dJB1jUbEdvLLep2ewCeZVcfz7OJQpDg9+pKS4PYIMIr+3THWZZ72Qqv3543e22OZEL94mL
	HhEQ2+/o94zZpDzpMOsGqYcTZYyx0V0UG+DpNMOHkVBLqRJgEwQYbOAfmTsctFlenfpElG
	JduKi/LcDrXkoBiGByDu1YZQLyNTtBW3p81VnlKVFXzAf0s+Sw1+msGeT6owAsoww2kVEP
	y1r4F5JytjbisyeO2EkQPKB8Y3nRvrdlqNGV+UQbchNDLpVvAWV30VBqTXhu6v5qmKXcwX
	jzNyBi6rBykWjxHelUBmthaAe5zkg+LrmC7R9Agfxt3Nx+sF9+ZdpHml7ZMy+w==
Date: Tue, 13 May 2025 15:08:51 +0200
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
Subject: Re: [PATCH net-next v6 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250513150851.5678335e@kmaincent-XPS-13-7390>
In-Reply-To: <20250507135331.76021-2-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-2-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudgrmeeiudemjehfkegtmegurgehjeemfeehsggsmegttdejudemiegsvdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdurgemiedumeejfhektgemuggrheejmeefhegssgemtgdtjedumeeisgdvsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpt
 hhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com

On Wed,  7 May 2025 15:53:17 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
>=20
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
>=20
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
>=20
>  - The number of lanes, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
>=20
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
>=20
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> +description:
> +  An Ethernet Connectr represents the output of a network component such=
 as

Connector

With this typo fixed:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8777,6 +8777,7 @@ R:	Russell King <linux@armlinux.org.uk>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-class-net-phydev
> +F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>  F:	Documentation/devicetree/bindings/net/mdio*
>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml

You will need Russell acked-by for that.=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

