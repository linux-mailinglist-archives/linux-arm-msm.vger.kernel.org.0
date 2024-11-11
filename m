Return-Path: <linux-arm-msm+bounces-37476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2899C4083
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 15:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23EAFB20B70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008C519E819;
	Mon, 11 Nov 2024 14:17:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF2719CC1C;
	Mon, 11 Nov 2024 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334631; cv=none; b=OKXJ+xFaxeJ2Jly2EU6KC3BareEcB5gTHw20Jzt7daYj8z7EB0fuI44t5s7xhYn2KYA0np8395LbXyyEEYmO4Zh1qjvQKhPbVW7E2Towv9/NkiC3NNxfRYcPcILKiGSslarYYNyjsz/Zk2bUg/09twA+O3ru1V/uKPPUyvnCY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334631; c=relaxed/simple;
	bh=atKj27umbsbkvfy41nhNQunjFCIirqrEGyCUijGtQbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gD4fZ9Dhty/gE33SmpQkebSYT/IEdWkscBo5lwGDw/I+yfeUWunkW8v6x5fB9QPFx+mW/ej1HNhw/EIAaRNRuMP64u9zssFTTNoJl93FifvDeADRQll3vpM2jjrsIJSNIGdDB/WIG2VjieTYNKYPsOG7PrTxp3dw7FtmhvkCqM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7999E1A117E;
	Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CDCC1A1174;
	Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2C4EF2037A;
	Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Date: Mon, 11 Nov 2024 15:08:52 +0100
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <ZzIP9OrIi+X/akgg@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
 <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Oct 29, 2024 at 01:15:52PM +0100, Andrew Lunn wrote:
> > +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> > +#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
> > +#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */
> 
> With the swap to the new helper, i think 25M and 2M5 are no longer
> needed.
> 

Sure, I will fix it in v5.

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
> > +
> > +	ret = clk_prepare_enable(gmac->rx_clk);
> > +	if (ret)
> > +		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
> > +	else
> > +		gmac->rx_clk_enabled = true;
> 
> Why would this fail? And if it does fail, why is it not fatal? Maybe a
> comment here.
> 
> > +static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct s32_priv_data *gmac = priv;
> > +	long tx_clk_rate;
> > +	int ret;
> > +
> > +	if (!gmac->rx_clk_enabled) {
> > +		ret = clk_prepare_enable(gmac->rx_clk);
> > +		if (ret) {
> > +			dev_err(gmac->dev, "Can't set rx clock\n");
> 
> dev_err(), so is failing now fatal, but since this is a void function,
> you cannot report the error up the call stack?
> 

I did a homework and checked the issue which was fixed by that 'lazy' rx
clock enable procedure and got conslusion it is not needed anymore, as I
was not able to reproduce the issue on the same board but with newer
kernel version (6.6.32 versus 5.15.73).

So I will simplify rx clock management in v5.

BR.
/Jan

