Return-Path: <linux-arm-msm+bounces-40019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CE9E135D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 07:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E4C2825C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 06:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0041487CD;
	Tue,  3 Dec 2024 06:33:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8C2173;
	Tue,  3 Dec 2024 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733207598; cv=none; b=h+cVfOPKPONi8maFrf2Rz1vHsPD7NfneJwHu/JF1W955HT2nsAOf94/TKJGVtYuTvtALViQluwjeYzeI7qwuwPp580rM1A7fgDBbGMDzGt++6AL5xX9McGjI2SpM+SRdPrFF2Pc41f9BxN9tOlBa5IGLYE+AIfKe51/m5bOcs6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733207598; c=relaxed/simple;
	bh=xXzj5lui4mmh8UNRyRnUSzrAo+0fyVSgY5TeYZqjTo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plhMKvES51WxcU9ZHMD5ZMJyE5gORlzVXT53fAyhwCNbzkQGKNPNW+76wy0Z4/avObc9qNk/KfibJnrfKV6oUG3chDaYUDQqh4QxOvtOLgXJezfqHOa5ORJlN/LXElAmBYGVzgPeAO9kfcnY/V5n6HOaMg+GSdoKqZqtWF6XUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 099B91A05B3;
	Tue,  3 Dec 2024 07:33:15 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F00441A05A5;
	Tue,  3 Dec 2024 07:33:14 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 48117202A7;
	Tue,  3 Dec 2024 07:33:14 +0100 (CET)
Date: Tue, 3 Dec 2024 07:33:14 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, 0x1207@gmail.com,
	fancer.lancer@gmail.com
Subject: Re: [PATCH net-next v7 14/15] net: stmmac: dwmac-s32: add basic NXP
 S32G/S32R glue driver
Message-ID: <Z06mKpcvBO23RSx+@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-14-bc3e1f9f656e@oss.nxp.com>
 <b9ad385b-7702-4c71-b14f-64f2714a35a4@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9ad385b-7702-4c71-b14f-64f2714a35a4@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Dec 03, 2024 at 12:43:58AM +0100, Andrew Lunn wrote:
> > +static int s32_gmac_init(struct platform_device *pdev, void *priv)
> > +{
> > +	struct s32_priv_data *gmac = priv;
> > +	int ret;
> > +
> > +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> > +	if (!ret)
> > +		ret = clk_prepare_enable(gmac->tx_clk);
> > +
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Can't set tx clock\n");
> > +		return ret;
> > +	}
> 
> The ordering is a bit odd here. Normally you would test each operation
> individually for errors. So:
> 
> 	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> 	if (ret) {
> 		dev_err(&pdev->dev, "Can't set tx clock\n");
> 		return ret;
> 	}
> 	ret = clk_prepare_enable(gmac->tx_clk);
> 	if (ret) {
> 		dev_err(&pdev->dev, "Can't enable tx clock\n");
> 		return ret;
> 	}
> 

Thanks for it. The ordering is incorrect, agree. I will fix it in v8.

> 
> > +
> > +	ret = clk_prepare_enable(gmac->rx_clk);
> > +	if (ret) {
> > +		clk_disable_unprepare(gmac->tx_clk);
> > +		dev_err(&pdev->dev, "Can't set rx clock\n");
> > +		return ret;
> > +	}
> 
> Is there no need to set the TX clock rate?
> 

Do you mean RX clock, right? Yes, I'll add it in v8 too.

BR.
/Jan

