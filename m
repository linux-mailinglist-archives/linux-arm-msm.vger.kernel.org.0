Return-Path: <linux-arm-msm+bounces-48612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14999A3D34F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 09:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC35817B29E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89BF1E9B05;
	Thu, 20 Feb 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c0zN2rqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768575223;
	Thu, 20 Feb 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740040559; cv=none; b=C0HXnDoqY7wrVjRYzleVUPXnFhWnyB2fYHV6fIxPOgGjvV/hhlqLqSUVWsduh0p2vF9jopdhSSZO//3uRfuUfriiHRR0My6edlz3mWoJg0OWS6nCYoOSUyNhcbLXW3VSaLFBhm7RRDRy6Okk3cyJQ2vrlda+umFzHPtnNEDDAUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740040559; c=relaxed/simple;
	bh=mTBcKvTKQUEaT4bFGfjSxr4o2+FAH06wQDjUkf7uPsM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvM2sGsfpVX0O5yF46aBjWLOYQ3IPuzEC5VocWq0X5WJel1E81dZrbXJYV5fl2keSwGjwEYV7jWBPQ4HOvlV0fkOfCmdz+PjZCbU/k9A4rEUFoz7fSgeX51oSN6c878DDMrg7Y8iVCk6K4WB/9DvBHsK2SYNzq1nQtdetH7SJG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c0zN2rqC; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9827F44466;
	Thu, 20 Feb 2025 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740040554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyzKqon1JbAJ6mkMIiukBpMAf6qqIZUI0/iiyhHUGis=;
	b=c0zN2rqCeC+rI0FLMsinjEvErTzYmL96OZEJGEI4zeni0feD5W9esdgFjE7dVGu8/B0o6k
	zv1/mw9SK3w19NgU48bsSqY7ribJi6SCo31NIwJeATEkZ0qM2WpW+zlkF+6HYij/QOQWlH
	laYEq2Ux/PzKvEmmeG5YUZ29pTy0lPDNqWRC666P27XkjEnxMSw0xyOSA12j6LIyN1pHiY
	R6TkRZGSxzhKiTNNJBWoINAoToOsDVQ0JpF5PN1GqFeIczpZheiihi9zY/iUzzneIW7+uU
	CFgQHjBACUqX0XwEmY7MfbXdaXOsRLBOmMurm0HQ1YwvuiVT+2tW/ygNHhjusg==
Date: Thu, 20 Feb 2025 09:35:50 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Rob Herring <robh@kernel.org>
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
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>, Dimitri
 Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 15/15] dt-bindings: net: Introduce the
 phy-port description
Message-ID: <20250220093550.55844ab9@device-126.home>
In-Reply-To: <20250219223530.GA3083990-robh@kernel.org>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-16-maxime.chevallier@bootlin.com>
	<20250219223530.GA3083990-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiieejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepuggvvhhitggvqdduvdeirdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Rob,

On Wed, 19 Feb 2025 16:35:30 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, Feb 13, 2025 at 11:16:03AM +0100, Maxime Chevallier wrote:
> > The ability to describe the physical ports of Ethernet devices is useful
> > to describe multi-port devices, as well as to remove any ambiguity with
> > regard to the nature of the port.
> > 
> > Moreover, describing ports allows for a better description of features
> > that are tied to connectors, such as PoE through the PSE-PD devices.
> > 
> > Introduce a binding to allow describing the ports, for now with 2
> > attributes :
> > 
> >  - The number of lanes, which is a quite generic property that allows
> >    differentating between multiple similar technologies such as BaseT1
> >    and "regular" BaseT (which usually means BaseT4).
> > 
> >  - The media that can be used on that port, such as BaseT for Twisted
> >    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
> >    ethernet, etc. This allows defining the nature of the port, and
> >    therefore avoids the need for vendor-specific properties such as
> >    "micrel,fiber-mode" or "ti,fiber-mode".
> > 
> > The port description lives in its own file, as it is intended in the
> > future to allow describing the ports for phy-less devices.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> > V4: no changes
> > 
> >  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
> >  .../bindings/net/ethernet-port.yaml           | 47 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml  
> 
> Seems my comments on v2 were ignored. Those issues remain.

My bad, I apparently completely missed it :/ Let me get back to that :)

Thanks,

Maxime

