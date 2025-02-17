Return-Path: <linux-arm-msm+bounces-48233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CEA38645
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885061628FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E20225388;
	Mon, 17 Feb 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TNNthJYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92662179BC;
	Mon, 17 Feb 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802101; cv=none; b=XHXIjvNn2C7fWz5ekN2E9bJEsrxLSPAqM6/z+HoxgiJL9beHhd/sZ54C2/KVX5VKLKd5EBsx3OA1AbKRWqCpeEzRTEI8MiZC1cSLY/7HQ2Jw764C/i8qcUdL0y57bAA9RtQ7bkobz1Cydpdhq8NcWts7WqujTwgXYvB5PrpAVnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802101; c=relaxed/simple;
	bh=BJglNCLgDoRehZkHvYuLehjrYWHHpDkp1i8i+gd9c34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbuUQ/QUxYSDXBAVxS8oLqppsgMAzzKX9dTuvYaMZ0Mg1e+S/7NaOAcddXHf5pH812brmKGjj0BoD20BQ5i3W28VOfCKV2baBHZro5IOfJZMpCy2ynGxbt6d8Y3S7kFuz6VeJ1ywfW70LzOgYJCRpVpvcm4sfxkzojevxh5tfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=TNNthJYg; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2m1Fn2cs47esDRZLqZGoIEgYTLep9xsmVfAdq3qlyCs=; b=TNNthJYgcXpz/nfrJyCILETGwQ
	rwYd+O4HWS9Wz2Hx0R2/UB7Zc5pp7aFjK0L0RIKIQPZvFGURXiAiCrPE4443CBWM0ghjrYNdXlBW7
	ula/FZXItczt+kvnzMLFpG+pyZFKLt4LLlydYktUYCTacN41yN/uy5ubtFk2R3/TUo+l94TY2Wx89
	oQs2teE7o/Dth/kCDTq5EGlww4MzUT5xuVsh2/L8gZjaER0FPr6vJQcSHL8MlxfpBSNT/qwv6sotg
	jHFFSFAwR/TkqbX4rP9f7m+bOdrAiRvcwmx2ueqM83+BbHWknD+lmSSPuxB+h3xCoKHRT5Fsa8ivB
	ozJ2Xulg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42956)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tk205-0006sW-2T;
	Mon, 17 Feb 2025 14:21:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tk201-0006Hd-1e;
	Mon, 17 Feb 2025 14:21:29 +0000
Date: Mon, 17 Feb 2025 14:21:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <Z7NF6ciz4RHMaGo6@shell.armlinux.org.uk>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
 <Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
 <20250217092911.772da5d0@fedora.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217092911.772da5d0@fedora.home>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Feb 17, 2025 at 09:29:11AM +0100, Maxime Chevallier wrote:
> Hello Russell,
> 
> On Sat, 15 Feb 2025 18:57:01 +0000
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Thu, Feb 13, 2025 at 11:15:53AM +0100, Maxime Chevallier wrote:
> > > Some PHY devices may be used as media-converters to drive SFP ports (for
> > > example, to allow using SFP when the SoC can only output RGMII). This is
> > > already supported to some extend by allowing PHY drivers to registers
> > > themselves as being SFP upstream.
> > > 
> > > However, the logic to drive the SFP can actually be split to a per-port
> > > control logic, allowing support for multi-port PHYs, or PHYs that can
> > > either drive SFPs or Copper.
> > > 
> > > To that extent, create a phy_port when registering an SFP bus onto a
> > > PHY. This port is considered a "serdes" port, in that it can feed data
> > > to anther entity on the link. The PHY driver needs to specify the
> > > various PHY_INTERFACE_MODE_XXX that this port supports.
> > > 
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> > 
> > With this change, using phy_port requires phylink to also be built in
> > an appropriate manner. Currently, phylink depends on phylib. phy_port
> > becomes part of phylib. This patch makes phylib depend on phylink,
> > thereby creating a circular dependency when modular.
> > 
> > I think a different approach is needed here.
> 
> That's true.
> 
> One way to avoid that would be to extract out of phylink/phylib all the
> functions for linkmode handling that aren't tied to phylink/phylib
> directly, but are about managing the capabilities of each interface,
> linkmode, speed, duplex, etc. For phylink, that would be :
> 
> phylink_merge_link_mode
> phylink_get_capabilities
> phylink_cap_from_speed_duplex
> phylink_limit_mac_speed
> phylink_caps_to_linkmodes
> phylink_interface_max_speed
> phylink_interface_signal_rate
> phylink_is_empty_linkmode
> phylink_an_mode_str
> phylink_set_port_modes
> 
> For now all these are phylink internal and that makes sense, but if we want
> phy-driven SFP support, stackable PHYs and so on, we'll need some ways for
> the PHY to expose its media-side capabilities, and we'd reuse these.
> 
> These would go into linkmode.c/h for example, and we'd have a shared set
> of helpers that we can use in phylink, phylib and phy_port.
> 
> Before I go around and rearrange that, are you OK with this approach ?

I'm not convinced. If you're thinking of that level of re-use, you're
probably going to miss out on a lot of logic that's in phylink. Maybe
there should be a way to re-use phylink in its entirety between the
PHY and SFP.

Some of the above (that deal only with linkmodes) would make sense
to move out though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

