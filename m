Return-Path: <linux-arm-msm+bounces-67702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB4B1A3E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B95F18A02A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1860626A1B5;
	Mon,  4 Aug 2025 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NNvi50cl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDCE2561B6;
	Mon,  4 Aug 2025 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754315541; cv=none; b=ad/L5FOGmD/QvbUMTH1RqpDSVxwGvEmA005Sxpo7aFZNUee2d2MMlAVbpPKiufqp8j2WhWpeKZVhXglu8w/lflPuuqcHU5Rt0+1gBtScQ09E3SWoHp4+6BgBA1/0vVgvoISDYGMXu3eK3XZOMTXRuctmmgdt5zkr7slztWkOh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754315541; c=relaxed/simple;
	bh=LSlk7yWinC09D+iL0EDUON0SdTkkB1NWkqmmMCPn2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbDR1aeG5Z1jiwmG6dpDjdKIy8QdzGAD9bc56wqlvPTKP/CQcaNglHbj1EZsDdfxAAjM3OIRT8GplERPz0uhpbK0NVZWxgYLZm68FzjWN3FLAPDNEmes+PggGcZjzy/l3OUqja9FmLsg9QTqmtIA0LNW5YCcOkpr3rcHw/SJHmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NNvi50cl; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98BA34433D;
	Mon,  4 Aug 2025 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DQmSdmS10ku3Mj8ZiIsEojJy5LLBLfwoLeqcne2X2E=;
	b=NNvi50cleUbVOezTY22Oc0ulUhDv6+C4iJsJgpAtogeSW9Y7PjeGSC2iQeoyQzGbOrEyeX
	pO0Gcez42Ohh5eCd3eUBeT9gFDaO6psSUP0ozalh+MAKN4fm2KrtgjD/FUD8mfba+H09ae
	1+xJjRCpOpDevJnU+rVf/UjRVsqEcKeC4ho7PzPVr82NHpDWD0EeGiEgHGpp1oVH4pXyBm
	caaJ9SK4JeJfojBIrnwUM0SsrkOXbAnZKzBUt43pAGNFwoj8yZjaS0r9kAfIcRpB6boEXK
	3lr5PksBGTklxXjt2b7darzuArzhI8PY+HsWCy/dLN5SXRADX8PmoGAmPyESOg==
Date: Mon, 4 Aug 2025 15:52:13 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 09/15] net: phy: marvell: Support SFP
 through phy_port interface
Message-ID: <20250804155213.6bf01bb1@fedora.home>
In-Reply-To: <4be84db1-7999-46a2-8157-68b8039a31cd@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-10-maxime.chevallier@bootlin.com>
	<4be84db1-7999-46a2-8157-68b8039a31cd@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

On Sat, 26 Jul 2025 23:13:02 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > -static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> > +static int mv88e1510_port_configure_serdes(struct phy_port *port, bool enable,  
> 
> The naming convention in this driver is to use m88, not mv88.

Ah yes true... I'm used to Marvell code having mv_ prefixes everywhere.

Thanks,

Maxime

