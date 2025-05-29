Return-Path: <linux-arm-msm+bounces-59821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E535AC7EA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 15:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11AB51BC4CEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 13:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0771D225A3B;
	Thu, 29 May 2025 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HV2UtNB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4B647;
	Thu, 29 May 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525020; cv=none; b=nhNSyTGLnihuDhh1xwTQ8o4ShJMN6KMpToTsYhd3AWikJngSCqeByj+Td8VBfWweYs1QPOiuWBDcBRn7wJrCfvkDS8taUbbUqArcLNDT6l96x6ZwyK9VOeBHuTLZ95nUGBhPDf2414Y9aCJNlPAFK5Y8Dsn2xiQvCMDwEzf6Lnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525020; c=relaxed/simple;
	bh=dDGVAlh58IXITtv4zoQJHm8V6+hjmVhqg6ZkAI+a+ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxQZ9cLFgEdM5EM7COzIy4G7tcf2x52b4i/w0+b1LZEK64Bb0YqTSQbjgiMYVJiCSkYGxOkZIct5rQKqpUkd7fiqpKSW3WjPBG+pFPb7e2lIVlKOJYeVoSs71D/Xt0AxKwf9dUuOc2ArSswwPXSAihDM+2x/JN1fMzTuyWbTEpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HV2UtNB2; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zBTL/STJmtvp2VqDgiDgK4iklSQ0paUUUgoWg/0K4tc=; b=HV2UtNB2S1YdQPm65D3plaVeJJ
	rS8dbZCmEBE8hNa2SKqutR8/LSMMDcPJCzrBeKp7x9VeDvjUE8kZAiefsXQgFAYOyPLvpbJLscpb7
	hsUlRtD+mvZ7xh5a58YHxqMIL0Edd26bJ513M5L6iHeoHzpJdmLiktSVODuAfOXtH6Yoj7aKBP9rf
	bpFmXHijHgT4dfAYYFX+T1wiE+fxLo12DRGJOZJFDCAt//iquqt3pEiLLE4JnuwQkNeVIS1tJRC+K
	ZaGnGtO/q++vAZWrS88u3tU0udE6CGIc+ctokgqA56J/0xF3HrI3DYNHi8u4kDZzY/9jIx5DhK9l5
	UxuuEzjg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43512)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKdEG-0001Qi-0z;
	Thu, 29 May 2025 14:23:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKdEA-0003Ti-1O;
	Thu, 29 May 2025 14:23:22 +0100
Date: Thu, 29 May 2025 14:23:22 +0100
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
Message-ID: <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <23936783.6Emhk5qWAg@fw-rgant>
 <20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
 <13770694.uLZWGnKmhe@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13770694.uLZWGnKmhe@fw-rgant>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > PHY_INTERFACE_MODE_1000BASEX).
> > 
> 
> Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes you're 
> right.

1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
interface mode because PHYs that use SerDes can connect to the host
using SGMII or 1000BASE-X over the serial link.

1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
etc where the S, L, E etc are all to do with the properties of the
medium that the electrical 1000BASE-X is sent over. It even includes
1000BASE-CX which is over copper cable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

