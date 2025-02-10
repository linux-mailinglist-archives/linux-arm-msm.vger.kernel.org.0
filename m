Return-Path: <linux-arm-msm+bounces-47375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911BA2E70E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA2267A1AB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4811C1AB4;
	Mon, 10 Feb 2025 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o95JPqWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC181C07C6;
	Mon, 10 Feb 2025 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177757; cv=none; b=Gi4GRaEVmtSpXMAd0ljLbCftDgSWzUnOUckwDvu3eUdi2YysupErpXo4ey6GPtD5TiZ8ExWt/mfVI70UbeUe5/l5oT+DxPGb09qZVoX1aSa9lRO0I8C30dfczrixmilaEaW2cOCyPCa2nMGvvEOf8KtQtWue8QnFyftAIxp+Hds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177757; c=relaxed/simple;
	bh=s9JN02o5t9RCKpyA40HtclFOmmyHLhidAsVTcAxGwww=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grWkYAQUGRYwSzuusKBnpnm75rZdG5JWceSrL/YZp80WyBTBdk0dNr+TMDsws5LwyJCcD1LqgRRobQBwi4o6d7ozrfq9ZXYhRR402TfpVmQCyEjkZ6IkTFaEkeJtjwPdGaQQ37dtM/ZqKHOWOHmww9ahSUVjpijIgJ5U0Q7lFM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o95JPqWv; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F07B42CCD;
	Mon, 10 Feb 2025 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739177746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1H+Ir3hzjFy5kvh3ZHOggs0A8zRpB/qKteU8q68oXLw=;
	b=o95JPqWvhZ/aFf3L1LdM6mNc5/6sUr8ZjPYQyKCtXkRxeXZI6mG6PsAn2U/P17fRwv3lY8
	fmFVMAz0Xc3xwF2gIrqvokXwtRnKsM4DaXs1UtadUYGahgI1LiQJ2zDI3iUqClbV8yMGDs
	APXlmCSmYxom/m5suGnd/DSXEKCxEtbSHCEymobtQ+/4HpUQTL7xs1Q5NrYcLcmp65NFxV
	47U6Bkk2fjsRh9if58lr4DHo7gJVwsTrMSZQziMuB16BY/dcWADU7RmHSCtdZuJ6fWAox3
	c41sUjfgH1SJ8gj1uIZyC33e+AxKBUZ3t1JWCpZIPfABB0zPVW4ggqm2u2oeqg==
Date: Mon, 10 Feb 2025 09:55:42 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Sean Anderson <seanga2@gmail.com>
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
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port
 representation
Message-ID: <20250210095542.721bf967@fedora-1.home>
In-Reply-To: <8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfelledvtdffvdekudeijeduueevvdevffehudehvdeuudetheekheeigfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdquddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepshgvrghnghgrvdesghhmrghilhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvt
 hguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Sean,

On Fri, 7 Feb 2025 21:14:32 -0500
Sean Anderson <seanga2@gmail.com> wrote:

> Hi Maxime,
> 
> On 2/7/25 17:36, Maxime Chevallier wrote:
> > Hello everyone,
> > 
> > This series follows the 2 RFC that were sent a few weeks ago :
> > RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> > RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/
> > 
> > The goal of this series is to introduce an internal way of representing
> > the "outputs" of ethernet devices, for now only focusing on PHYs.
> > 
> > This allows laying the groundwork for multi-port devices support (both 1
> > PHY 2 ports, or more exotic setups with 2 PHYs in parallel, or MII
> > multiplexers).
> > 
> > Compared to the RFCs, this series tries to properly support SFP,
> > especially PHY-driven SFPs through special phy_ports named "serdes"
> > ports. They have the particularity of outputing a generic interface,
> > that feeds into another component (usually, an SFP cage and therefore an
> > SFP module).
> > 
> > This allows getting a fairly generic PHY-driven SFP support (MAC-driven
> > SFP is handled by phylink).
> > 
> > This series doesn't address PHY-less interfaces (bare MAC devices, MACs
> > with embedded PHYs not driven by phylink, or MAC connected to optical
> > SFPs) to stay within the 15 patches limit, nor does it include the uAPI
> > part that exposes these ports to userspace.
> > 
> > I've kept the cover short, much more details can be found in the RFC
> > covers.
> > 
> > Thanks everyone,
> > 
> > Maxime  
> 
> Forgive me for my ignorance, but why have a new ethtool interface instead of
> extending ethtool_link_settings.port? It's a rather ancient interface, but it
> seems to be tackling the exact same problem as you are trying to address. Older
> NICs used to have several physical connectors (e.g. BNC, MII, twisted-pair) but
> only one could be used at once. This seems directly analogous to a PHY that
> supports multiple "port"s but not all at once. In fact, the only missing
> connector type seems to be PORT_BACKPLANE.
> 
> I can think of a few reasons why you wouldn't use PORT_*:
> 
> - It describes the NIC and not the PHY, and perhaps there is too much impedance
>    mismatch?
> - There is too much legacy in userspace (or in the kernel) to use that API in
>    this way?
> - You need more flexibility?

So there are multiple reasons that make the PORT_* field limited :

 - We can't gracefully handle multi-port PHYs for complex scenarios
where we could say "I'm currently using the Copper port, but does the
Fiber port has link ?"

 - As you mention in your first argument, what I'd like to try to do is
come-up with a "generic" representation of outgoing NIC interfaces. The
final use-cases I'd like to cover are multi-port NICs, allowing
userspace to control which physical interfaces are available, and which
t use. Looking at the hardware, this can be implemented in multiple
ways :

           ___ Copper
          /
 MAC - PHY
          \__ SFP

Here, a single PHY has 2 media-side interfaces, and we'd like to select
the one to use. That's fairly common now, there are quite a number of
PHYs that support this : mv33x3310, VSC8552, mv88x2222 only to name a
few. But there are other, more uncommon topologies that exist :

                           ____ SGMII PHY -- Copper
                          /
 MAC - SGMII/1000BaseX MUX
                          \____ SFP

Here, we also have 2 media-side ports, but they are driver through
different entities : The Copper port sits behind a single-port PHY,
that is itself behind a *MII MUX, that's also connected to an SFP. Here
the port selection is done at the MUX level

Finally, I've been working on supporting devices whith another topology
(actually, what started this whole work) :

            ___ PHY
           /
 MAC --MUX |
           \__ PHY

Here both PHYs are on the same *MII bus, with some physical,
gpio-driven MUX, and we have 2 PORT_TP on the same NIC. That design is
used for link redundancy, if one PHY loses the link, we switch to the
other one (that hopefully has link).

All these cases have different drivers involved in the MUX'ing (phy
driver itself, intermediate MUX in-between...), so the end-goal would
be to expose to userspace info about the media interfaces themselves.

This phy_port object would be what we expose to userspace. One missing
step in this series is adding control on the ports (netlink API,
enabling/disabling logic for ports) but that far exceeds the 15 patches
limitation :)

Sorry if all of that was blurry, I did make so good of a job linking to
all previous discussions on the topic, I'll address that for the next
round.

Thanks,

Maxime

