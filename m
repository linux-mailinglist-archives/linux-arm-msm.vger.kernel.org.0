Return-Path: <linux-arm-msm+bounces-59853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1AAC895F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FBCD17C7D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 07:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EA921423C;
	Fri, 30 May 2025 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="O/mKfuQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254A213E6D;
	Fri, 30 May 2025 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591198; cv=none; b=fzrDYBiLR4e5ewANl9mGxdmXXWkLgRtj1ImtVKNuhxgAoP2RE08pVDtJiM/w3tmeekmbMOIiKU0eNKyzr/pv/Y1TgDty/LSHDm5aHZTYuwyhdv0wrOUmxAerjR4zEM/cbzrl0pEASCmRDu0xLoURAdlWvUlP5gcDpGhH0FI1eOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591198; c=relaxed/simple;
	bh=C/gy27BDlYkIDsDi2lK2NXljjmhG5IvM8N89F5XHS3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REoS21j7QnCTXl/QT9aZ6FjkyYngocj/tHd9G3l+rtvjx27sj1oQyE7lp2FUE/TcYTXPh/lN2gUxuEK64rH+1bPsY3wfammLAwclYL2r0Paz6Mxvw41IWs7Qz1bQV1wrEWPen0uqtnKHy1l3M/6ziQo4bP95ZeR7Io1wNEsEZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=O/mKfuQB; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ut2tpuuqRAyjo9B+qNNd6yMUFNVjo/29ecFKGIED0ig=; b=O/mKfuQB0BUcNmKRdmWHnd9iSG
	YG+hJVA3Yn5K2Cyf7t9KIzf9KxAnua8o59fak2AfljqKfB8sgaL/fJtW/VJHi+0FT0XD14AO/yh0h
	WBYb4GNg8RPO6rM8zhtWY1VqZe77B8ZTC6DS34hH2Lje4+TY59ss4FN9jqBaXeyHrHMS089dZy7IO
	v6tIHTswLxoPoyt4C75BFzlOtlJqTBYYKJ+BuahW0po4IZOKX596tYectV7YVC0scKjOZXFK9o3uM
	Du8yGWMTEI5Wq0NzmCH2n21bMfmg6tTQ/LbkC/7mjUgqnyIKNEpS0AlTSXjs1pNNCiYYZTfoCFKxs
	d4ZMt7sg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40490)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKuRe-00027t-2K;
	Fri, 30 May 2025 08:46:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKuRX-0004Rl-1d;
	Fri, 30 May 2025 08:46:19 +0100
Date: Fri, 30 May 2025 08:46:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
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
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <aDliS9uMFaLf2lCV@shell.armlinux.org.uk>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <13770694.uLZWGnKmhe@fw-rgant>
 <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
 <6159237.lOV4Wx5bFT@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6159237.lOV4Wx5bFT@fw-rgant>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 30, 2025 at 09:28:11AM +0200, Romain Gantois wrote:
> On Thursday, 29 May 2025 15:23:22 CEST Russell King (Oracle) wrote:
> > On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > > > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > > > PHY_INTERFACE_MODE_1000BASEX).
> > > 
> > > Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes
> > > you're
> > > right.
> > 
> > 1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
> > interface mode because PHYs that use SerDes can connect to the host
> > using SGMII or 1000BASE-X over the serial link.
> > 
> > 1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
> > fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
> > etc where the S, L, E etc are all to do with the properties of the
> > medium that the electrical 1000BASE-X is sent over. It even includes
> > 1000BASE-CX which is over copper cable.
> 
> Ah makes sense, thanks for the explanation. I guess my mistake was assuming 
> that MAC/PHY interface modes were necessarily strictly at the reconciliation 
> sublayer level, and didn't include PCS/PMA functions.

When a serdes protocol such as SGMII, 1000BASE-X, or 10GBASE-R is being
used with a PHY, the IEEE 802.3 setup isn't followed exactly - in
effect there are more layers.

On the SoC:

	MAC
	Reconciliation (RS)
	PCS
	SerDes (part of the PMA layer)

On the PHY side of the SerDes host-to-phy link:

	SerDes
	PCS (which may or may not be exposed in the PHY register set,
	     and is normally managed by the PHY itself)
	(maybe other layers, could include MACs	back-to-back)
	PCS
	PMA
	PMD

Hope that helps explain what's going on a little more.

Another way to look at it is that with SGMII, 1000BASE-X etc between
the PHY and host, the PHY is a media converter.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

