Return-Path: <linux-arm-msm+bounces-38356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4A9D2B2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8974F1F23CFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEED1CC161;
	Tue, 19 Nov 2024 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="R5Nj+u5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ADD3C463;
	Tue, 19 Nov 2024 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732034458; cv=none; b=TzliHpLVJfdmc2KhGYf67fpQ45BDkQZsRjoUwg+wPq/k4wh2JZv3kxARuexU+8dFLEh9lFqthDSvs0DkVXdmFEDxxmEUVdVTn+NqvXHBfgl1YJfBN25xmQaXWniDPnM7gTfe6d4nNey62mxu29Z77NXSNvYtEa/kQnKEt4akXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732034458; c=relaxed/simple;
	bh=j1/6FQk/qy6hQOe6RfVOumDoiSUzyNK1cZxsXALSKHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogGzV/kCxLVO6RKskdYOm/IFg9epKJVi/j5ZdCu3gIbA395ykIKgQCZdISrzqtziq8kFy6/vHy3oSpNNFEdV2Wd1cjMnf4cYPoyqEYhWQSsw5JalOfcXpBvBP3QjbcQl+gwMc98ApKbEsBPps6unTKmBTypfplpmVqgixti/5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=R5Nj+u5n; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RE/g2BNPpwI1+a7jDa6h1P65+UIOuMSmxiyn5r5LFgY=; b=R5Nj+u5n583xxlPvuIqY6vEv/3
	QrXbQf1Q+5wcWzK/eW92V3vdRkaPZpiQ2SdkejIf8AjQa3FC/oqndCB1+nn8IwFabm9XNx50NIIcr
	IrRPfreD5ACHeUNtzzCA6/9K7InB8L8YtkFqt9FsBmiYLTwezNGvV7UfcVVKUd3VOFscYlclaxPbO
	VWF4i9LT0cJhLAUEIyxpbxwzTzB2coHGYXC1ThECu2DVtuaJSt/2foGi785yJk5XRrCs4BXlvt4YJ
	6qZL7mrOVLtWzPlTePznvU1//hKm0GCeAmdGcu1nhyEtA54Ke64YETCFurga62m98u8MOH2HOtIm7
	rMRh0GcA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41294)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDRHC-0003wB-2y;
	Tue, 19 Nov 2024 16:40:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDRH8-0006Ck-2F;
	Tue, 19 Nov 2024 16:40:26 +0000
Date: Tue, 19 Nov 2024 16:40:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
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
Message-ID: <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

On Tue, Nov 19, 2024 at 04:00:06PM +0100, Jan Petrous via B4 Relay wrote:
> The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> interface over Pinctrl device or the output can be routed
> to the embedded SerDes for SGMII connectivity.
> 
> The provided stmmac glue code implements only basic functionality,
> interface support is restricted to RGMII only. More, including
> SGMII/SerDes support will come later.
> 
> This patchset adds stmmac glue driver based on downstream NXP git [0].

A few things for the overall series:

1. Note that net-next is closed due to the merge window, so patches should
   be sent as RFC.

2. The formatting of the subject line should include the tree to which
   you wish the patches to be applied - that being net-next for
   development work.

For more information, see:

https://kernel.org/doc/html/v6.12/process/maintainer-netdev.html#netdev-faq

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

