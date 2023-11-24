Return-Path: <linux-arm-msm+bounces-1869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB17F776E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 16:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D883C1C20937
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 15:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5482E827;
	Fri, 24 Nov 2023 15:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1V686gKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560FE19AA;
	Fri, 24 Nov 2023 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iyDJ7GDLCp7RzsNckl8cUetzIxYclIJv5z4zBoq++ZA=; b=1V686gKJOTmYTLJb/BLfWaUq58
	ldH95fUtOZYY5STTxtGQNr2TpecXwQoJL9t6/m3BFt+szDJM+hp3iCozE+mEFBbGSQU6woOgDHckB
	aTtG6E9O9giKHcX3g9BZ6KBPJspbjELOkX6+TvaM4E5S4JlHhcueo5aiL4TXBKOt4PyED2IfNYI6E
	t8+0aYkoc8tXtG+f6jhYRScakm3cFtkbXxX3THbqUJCIW2rsosc95WjU3eKDLU4wGM30B0ZIy5UrZ
	6HboUnbGmnMPML6w0IpYCcIwLe0UOkhDOebccdPXYsleoGVY5VXBaKoQV/rG82QrjTBY3BLFiNTmE
	jVAfqn6w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58932)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r6Xui-00037d-2G;
	Fri, 24 Nov 2023 15:16:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r6Xuf-0007La-5G; Fri, 24 Nov 2023 15:16:13 +0000
Date: Fri, 24 Nov 2023 15:16:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jie Luo <quic_luoj@quicinc.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <ZWC+PbNjir7rT4MK@shell.armlinux.org.uk>
References: <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
 <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
 <655fa905.df0a0220.49d9b.7afd@mx.google.com>
 <367c0aea-b110-4e3f-a161-59d27db11188@quicinc.com>
 <ZWCQv9oaACowJck0@shell.armlinux.org.uk>
 <4d159a99-f602-424e-a3c1-259c52e4d543@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d159a99-f602-424e-a3c1-259c52e4d543@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Nov 24, 2023 at 03:44:20PM +0100, Andrew Lunn wrote:
> > 		First Serdes mode	Second Serdes mode
> > Option 1	PSGMII for copper	Disabled
> > 		ports 0-4
> > Option 2	PSGMII for copper	1000BASE-X / 100BASE-FX
> > 		ports 0-4
> > Option 3	QSGMII for copper	SGMII for
> > 		ports 0-3		copper port 4
> 
> With option 2, can the second SERDES also do SGMII? You are likely to
> need that when a Copper SFP module is inserted into the cage.

The document states "The fiber port supports 1000BASE-X/100BASE-FX".

The same is true of Marvell 88x3310's fiber port - it supports only
fiber not SGMII. This is actually something else that - when the
patches for stacked PHYs mature - will need to be addressed. If we
have a 1G copper SFP plugged into an interface that only supports
1000base-X then we need a way to switch the PHY on the SFP module
to 1000base-X if it's in SGMII mode.

Some copper SFPs come up in 1000base-X mode, and we currently rely
on the 88e1111 driver to switch them to SGMII mode. Others do want
SGMII mode (like Mikrotik RJ01 where the PHY is inaccessible and
thus can't be reconfigured.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

