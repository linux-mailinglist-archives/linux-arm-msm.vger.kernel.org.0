Return-Path: <linux-arm-msm+bounces-1715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918E7F619D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 15:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF28CB215B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 14:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A24E24A10;
	Thu, 23 Nov 2023 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QW2rJqd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18769D44;
	Thu, 23 Nov 2023 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sNJOWTUsLcLz6r4tprHVV6qtj+o+qsTlaJpsU+sB5Pw=; b=QW2rJqd5NiwvgiZI6DPw1+5mJ3
	iyymF1DBsw9tjQu7dpwxO4eehB/450IFx+5XP2AqiqL1IiKOQ+aol4hXIyVQh0B+K6qhxQlqGOml/
	KVJN8b0mGSiC2PjSoK+2w9GFfWtF51zUxjq8upnsghavWU1V/V9dVFwCBbCq5n1ZwlPACHAVJbZsg
	5R4E2N8I+cYf5bloe37MFNG7ODxb9fx250XbAantEQd0iXU176qVuRn4kDhp0fWprt9lOTi39kfYk
	3qHBG5WF5yPihU9GvRvlxrp5kfD8ckwzPzYGJMtL0/X3E17ecuceD7W/QVDJm21y/upPNs3303kW/
	15EO1gaw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36562)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r6Anm-0001hW-32;
	Thu, 23 Nov 2023 14:35:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r6Anj-0006Hp-Lf; Thu, 23 Nov 2023 14:35:31 +0000
Date: Thu, 23 Nov 2023 14:35:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
> > Just to be more precise qca807x can operate in 3 different mode:
> > (this is controlled by the MODE_CFG bits)
> 
> > - QSGMII: 5 copper port
> 
> 4 slots over QSGMII, plus the second SERDES is connected to the MAC
> using SGMII/1000BaseX?
> 
> > - PSGMII: 5 copper port
> 
> 5 slots over QSGMII, the second SERDES is idle?
> 
> > - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
> 
> 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
> 
> Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
> can use the second SERDES?

I think what would really help here is if there was an ascii table to
describe the configurations, rather than trying to put it into words.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

