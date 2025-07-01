Return-Path: <linux-arm-msm+bounces-63223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D3AEF9BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 15:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A043BEC84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718E2274B53;
	Tue,  1 Jul 2025 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l5winQAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23628274B50;
	Tue,  1 Jul 2025 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375200; cv=none; b=kUPhE/liqmOsFD1IeGZCoRTD21wyD3u5UX1r1HDjN/S1hgIbCcEQ0whw/9YrjBQVu0bLCURNMa4bMOVkMyCkk8mlo6QuRzaK+1TW9kVXBrI6ltSZyoa/4DFGEiwJK3yuW6cOlD4SnLks++CBLsejcAikHG793xMDODYEfnwf2E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375200; c=relaxed/simple;
	bh=b/R85Pa8b8YKsnIA1JXyJ2vMh/TmQal1ZDw62B1Mef4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wjj3MUTDC6gvqObNEid0UIphWRt9CGcHkkbpGzfTkdI/yn+YEzoTegJM6gw9t2+vVab9nvlOb4S3itnrNFSKjpMgv/Nti/TNwW3ZflRAcsuh5SskjWPLlW5XKg6dHj0ahVDAH+Yj3EW4Gxkw8NXhJsaLRWZZlTrgjLyu0ozRARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l5winQAD; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35B0943A14;
	Tue,  1 Jul 2025 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751375195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99KCsRPASfdiAb1s/3gUtMX8boYUlanoI/1WCWeVSw4=;
	b=l5winQADrXz8gIFWK5wKV2JNiNfKaposaPOmuhFtP3RWMLckru+ktlOBDYBYatPk7/pYph
	2O0aK5Rio/Yr2gVKS2nqqqV/LYt8/UGWoroQdnE5LprHQ+SJzv0+eWON2NhLJhUuB64230
	ihJ18E1orVcjGc7LocSS1+ZzCCAcH4SknDldVzVrKTow8mSdmM3Kp0kLILsFfIymZ1RQvX
	/W6wVpMaVh9yVDea/5a84QTl5BP5gubO+PnkTZQ1DdToN6T1Mf7f7J1SIIWJv3oeZ1fXXK
	+FdSklsyEpll2Xiv5BxRjU8EdRVyo8X29XvnpsAAk+mmMQPEFNQAaUpVCPcCEg==
Date: Tue, 1 Jul 2025 15:06:31 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, mwojtas@chromium.org, Antoine Tenart
 <atenart@kernel.org>, devicetree@vger.kernel.org, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>, Dimitri Fedrau
 <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250701150631.0256539b@fedora.home>
In-Reply-To: <20250701130243.GA130037@horms.kernel.org>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
	<20250630143315.250879-5-maxime.chevallier@bootlin.com>
	<20250701130243.GA130037@horms.kernel.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehhohhrmhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

On Tue, 1 Jul 2025 14:02:43 +0100
Simon Horman <horms@kernel.org> wrote:

> On Mon, Jun 30, 2025 at 04:33:03PM +0200, Maxime Chevallier wrote:
> 
> ...
> 
> > +/**
> > + * phy_port_get_type() - get the PORT_* attribut for that port.
> > + * @port: The port we want the information from
> > + *
> > + * Returns: A PORT_XXX value.
> > + */
> > +int phy_port_get_type(struct phy_port *port)
> > +{
> > +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)  
> 
> Hi Maxime,
> 
> Should this be:
> 
> 	if (port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASET))
> 
> Flagged by Smatch (because ETHTOOL_LINK_MEDIUM_BASET is 0,
> so as-is the condition is always false).

You're absolutely correct ! Thanks...

Maxime

