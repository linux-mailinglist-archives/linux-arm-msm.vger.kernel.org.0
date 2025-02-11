Return-Path: <linux-arm-msm+bounces-47598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F35A30E05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 044F87A28DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB8322FF5A;
	Tue, 11 Feb 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XoZpnJdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A521CFF7;
	Tue, 11 Feb 2025 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283452; cv=none; b=bKiRfl/dL2cyhS7u/fjdx6q30RCo7oii3tpRpKxCn/Qb8a76/B2xzmqEtoGA6uv5M/RDpuneUPMOX+Nn6Sr8/UzZYDXmAlZ16+JgWkEjibffKDCTxrf/uSu6CK2dma+nr3siz/4RTbQ8VrfAiV2bkoSdLRbNjGZxWCx8ENXYhQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283452; c=relaxed/simple;
	bh=SmwVOJacQQIK0j96xWuWDgRYwecrtkIrxPxHtNzHsyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YRPnFWQNQnn4vDdDqc0NS1OeFz7wTS1iRpdfd2Cwl2zRam6W691nwJyqxj9YEkpwb9nPiHcX/S6VFBlV796l3DznUM55nrHDxiztyIfrDSl8qNYN7Eqh528cQ/kdpPdISl3IIdWWFuupvizUj44cI6dSA8hvcN+NRJG7DMIgKng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XoZpnJdO; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 905ED442DD;
	Tue, 11 Feb 2025 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739283448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3cEbMgdG/cSxsTwGIcw+aHcYtjO45AnThYLCWBr9Ns=;
	b=XoZpnJdO7lsGL2P7mxYF0Ti8Rm8DTDdofRUkWH2Us/cNi+tQS5ZzA+7McFDisNb5hzLthn
	wqnDYt2Qknn18l8DHvezjeshVUY3CXY67Ih3TCJ/GJz059KBTHEZzsDkiyqKikCvto87fk
	6p+vtyeajKRhneYboAvf/wzuVe2ZR8RmoyKfIXI2mVbugt36sqnzBTP+m7UgowoJL/FGZl
	IC8fmP58UwVuEoyBqIRinlb55pYW0ZSmeNbHYVwBJI126Hb3diE7uJOdAddzwV4v8d36vm
	zYfp4NG8AWH2UBwM+mqmrmoj2HGe3UObW9+F7mBQJiuMKuv7gPnU99vcbzKvlg==
Date: Tue, 11 Feb 2025 15:17:23 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kory Maincent <kory.maincent@bootlin.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, Jakub Kicinski
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
Message-ID: <20250211151723.22a922b0@fedora.home>
In-Reply-To: <0ae41811-e16b-4e64-9fc4-9cb4ea1da697@lunn.ch>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<20250207223634.600218-4-maxime.chevallier@bootlin.com>
	<20250211143209.74f84a10@kmaincent-XPS-13-7390>
	<0ae41811-e16b-4e64-9fc4-9cb4ea1da697@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdpr
 hgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Tue, 11 Feb 2025 15:04:27 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > With net drivers having PHY managed by the firmware or DSA, there is no linux
> > description of their PHYs.  
> 
> DSA should not be special, Linux is driving the PHY so it has to exist
> as a linux device.
> 
> Firmware is a different case. If the firmware has decided to hide the
> PHY, the MAC driver is using a higher level API, generally just
> ksetting_set etc. It would be up to the MAC driver to export its PHY
> topology and provide whatever other firmware calls are needed. We
> should keep this in mind when designing the kAPI, but don't need to
> actually implement it. The kAPI should not directly reference a
> phydev/phylink instance, but an abstract object which represents a
> PHY.

That's fine by me for the port representation, and I'm on the same page
here. In the end, the ways for a NIC to register its interfaces would
be :

 - phylib, as done in this series. The port is controlled by the PHY,
the phy_port_ops are implemented in the PHY driver + phylib, we
discover the ports based on what the PHY reports, the new port binding
and the presence of an SFP phandle under the PHY.

 - phylink, and what I mean by phylink is actually SFP (phylink is the
SFP upstream in PHY-less SFP setups, so it would create the phy_port,
nothing more). what we cover here are MACs that are connected directly
to an SFP cage. This is simply because phylink parses the sfp phandle,
so it's an easy spot to make sure we create the NIC's port without
rewriting all drivers.

 - NIC drivers themselves, for drivers that don't use phylink/phylib.

For now this series only has the "phy_add_port" kAPI, which only really
covers case 1. But netdev_add_port() can clearly be implemented as well.

I'm having a hard time splitting that work in digestable chunks :(
I've focused on PHY as a reference use for ports, but the end-goal
clearly is a generic way to expose what interfaces a netdev has, either
through PHY, SFP or firmware.

Thanks,

Maxime

