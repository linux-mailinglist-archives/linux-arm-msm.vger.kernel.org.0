Return-Path: <linux-arm-msm+bounces-83654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87CC8FDAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55E943A86F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6351B2EF65C;
	Thu, 27 Nov 2025 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gvrmCN0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86F62405ED;
	Thu, 27 Nov 2025 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266569; cv=none; b=EMfO7+EKkQ2iXtNgV19vXV0ARtNHEp59AeUK9ZIdzuRX4UhrmTIZwsSXNAi5O8uS0S6WidpZ05lZ4iOhJaMC0gQkMPGnt/QEps6upUL/iqCjlxAnZ0z3ZurYILU7JX9D5d7BaB3z1D2fXYlq34j5gyMkk7hTiVR83ioyqM2xyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266569; c=relaxed/simple;
	bh=WvAyNrlGE2aXLm4k+iVAjckeSn6Xr1pOSWuhhB4dnEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYuiKOkFSW3Y5R1sZyljUEYuBWkQx+ZFU0LOU436SnTDcNEjN/3Vp0CEvYpxTlCCivD//18kawN4dOfnVqceS4+Fqq6kgqOwyjXtRz130De9qIW1X5Pg5iIVX4vvcByqQ1WRygOCrDPeA3xxAyNWSTyW1Wbl23/AuhBr/UcTtrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gvrmCN0Z; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yVdDa+AOG7bxWU39wPpsETVv0gcMopDlgo6rv4+/GLk=; b=gvrmCN0Zi73LvKtmWnZsdXwbhE
	VipcmGRjHq0XseALF1uILbX2uMIKqrWTRWnrNc9qcJWUKoAUHIjtVpIkBIkmi8t4LeptiTKkWrxtM
	+dctiqLiZUtvmEkHwbQeoBMFFE+Ocz+TnechLPiolnGtBfMzRXbFNrlQg45T6rjMEx8mE1I7JVTJU
	SFISvjY8LzPKivCBFAgsP+hqJiitfWl3JQKv9U2puBiDBuxCLsH/DT33udPcpZxDVe+R/alQd3H6K
	yA75fj55BGkUmYcI8yavLJ4DTLatLEplEVjk5hqfzfntWnr6BDiVJQjR6s1qO9GTVrmGfdIezJdw+
	mI1+nC1Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50158)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOgKB-000000005at-0qZB;
	Thu, 27 Nov 2025 18:02:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOgK5-000000002rM-06I7;
	Thu, 27 Nov 2025 18:02:29 +0000
Date: Thu, 27 Nov 2025 18:02:28 +0000
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v20 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <aSiSNA1PaM5Md8ju@shell.armlinux.org.uk>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127171800.171330-3-maxime.chevallier@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 27, 2025 at 06:17:45PM +0100, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ pairs (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed
> 
>  Other example :
> 
> 10000 Base K X 4
>            | | \_ lanes (4)
>            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
>            \_____ Medium (K is backplane ethernet)
> 
> In the case of representing a physical port, only the medium and number
> of pairs should be relevant. One exception would be 1000BaseX, which is
> currently also used as a medium in what appears to be any of
> 1000BaseSX, 1000BaseCX and 1000BaseLX. This was reflected in the mediums
> associated with the 1000BaseX linkmode.

There's more than just those three for 1000BASE-X:
	SX
	LX
	CX
	EX
	BX10 - single fibre strand, single mode, 1310nm and 1490nm over
		10km.

to name a few more. SFP modules don't have a way to indicate EX, but do
have a way to indicate 1000BASE-BX10 (BaseBX10 bit set with the rate
indicating 1000M.)

Also note that 100BASE-T encompasses 100BASE-TX (what we generally see
as fast ethernet), 100BASE-T4, etc. Should we be getting these
descriptions correct as we're introducing this level of detail?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

