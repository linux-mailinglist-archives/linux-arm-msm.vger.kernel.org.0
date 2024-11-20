Return-Path: <linux-arm-msm+bounces-38483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A4C9D3A18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C170281D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786201A071C;
	Wed, 20 Nov 2024 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NVsic0aq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928111A08D7;
	Wed, 20 Nov 2024 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104004; cv=none; b=BcJVABe8mWFSlvI58tuigiHFwceBitR+ZO+w2T45odN4FDWQpxTj7GOHVZ7HSR5KwyV+RGc+RGFFPiLuWgMNob2Fr4eEnDZwHqQ8GwLgdiER7HeQAD+N01hzorJt8ExQcE4LeSYyMtFcE3MHPm8oJhuWY4s2Y7pL6NI98b1XfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104004; c=relaxed/simple;
	bh=fwJu7oWlw2VUjiuanKnAixM65GU0IscIJTXumFEZEqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wn5g66FnmCqM/ovbYNQ+3aHMsMNVB/jGY3EyhDOkII4qLdpvdz5E5warfplsSNm6IJ7KuHtQJ67UpezrRbU2655ZQq46g3z+6N3RNej4Y8C9z21GO8WcRvwEzDjDTRej4TmBZSgt77szyL+SClEWVik9/BbYFVuvnZorRD6Oo2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=NVsic0aq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1FVnryMM8lSBpu5IKb6YzzE0+p3MecXFHq+tUNyftqs=; b=NVsic0aqBY69L9DWCME2+mmF/b
	CE4nxmsQ1kXVHb5JKokNfJizGvCJAxwUeLKHuSgJIUnKSoo5WjR2BBwPXoIzVRaGj9T8Tmto06gZi
	9ZowFFLJBZsKmYLlQAbYxHdwGDEi4ysIKnKKAUTXn7EORLvSaAMzkBBk5BVcd54GMEsw+1hiTHFDS
	QShu4RArI/MXolXw+KA7bvZ0HaQmfBoJfi34jT6Jodsxt65MtJkUQ77rdn3c76W0HU8heSUJjk/3r
	G79IPnI8kDtH4qxtwKDf3DASryoAWElXEYWarb2vhegkObAumfOXuYvZhnTD6K3G3Vn6dVhN6URjH
	3l44bIeQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56694)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDjMt-0005RK-1U;
	Wed, 20 Nov 2024 11:59:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDjMn-000742-10;
	Wed, 20 Nov 2024 11:59:29 +0000
Date: Wed, 20 Nov 2024 11:59:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v5 00/16] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Message-ID: <Zz3PIROyOIvpzlto@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
 <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 20, 2024 at 12:58:07PM +0100, Jan Petrous wrote:
> On Tue, Nov 19, 2024 at 04:40:26PM +0000, Russell King (Oracle) wrote:
> > Hi,
> > 
> > On Tue, Nov 19, 2024 at 04:00:06PM +0100, Jan Petrous via B4 Relay wrote:
> > > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > > interface over Pinctrl device or the output can be routed
> > > to the embedded SerDes for SGMII connectivity.
> > > 
> > > The provided stmmac glue code implements only basic functionality,
> > > interface support is restricted to RGMII only. More, including
> > > SGMII/SerDes support will come later.
> > > 
> > > This patchset adds stmmac glue driver based on downstream NXP git [0].
> > 
> > A few things for the overall series:
> > 
> > 1. Note that net-next is closed due to the merge window, so patches should
> >    be sent as RFC.
> > 
> > 2. The formatting of the subject line should include the tree to which
> >    you wish the patches to be applied - that being net-next for
> >    development work.
> > 
> > For more information, see:
> > 
> > https://kernel.org/doc/html/v6.12/process/maintainer-netdev.html#netdev-faq
> > 
> 
> Hi Russell,
> 
> thanks for review and hints with series proper targeting. I will
> reformulate series to 'RFC net-next v6 x/y' for v6.

'PATCH RFC net-next v6 x/y' is better.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

