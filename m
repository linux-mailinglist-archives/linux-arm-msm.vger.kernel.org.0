Return-Path: <linux-arm-msm+bounces-36297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A86239B496B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 602591F2230B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2C205158;
	Tue, 29 Oct 2024 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DwRKOyWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA7B2022CF;
	Tue, 29 Oct 2024 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204186; cv=none; b=NnW0fu8n8skwVlGd8aV24I2OQ9mX5Zo0BHUBdYnrCtn2VRfrX7387IKEtqakkTFKElhYl41UyrXRQdZ+bIt4Dpuj4YkObFFnEVlwUXstOoP9pHK7N3gtdlbuobDmtYlyGMCGOEvPtMwWVsk3IT+BpWtBzyhG5lQoJ5ENvprZ6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204186; c=relaxed/simple;
	bh=jSPXt4IdTIPM8/J12G6b+aHXIYj46FsGSKCEXyjnKCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZbiF/WRD4VYawUEIz0CKXyAdjOP+oNjZc2TSFpgTsCY1nQaQa8YdopKuzWHqcecp33wZJ32f2/GmBaud45V2bPrQ2znaHWixQRYf/51UGfg5ZM+jpruHV915Htd/W7xZ1tki4wHufWIB7VsPLIUulN8Y446mZQoJADE1Mbv0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DwRKOyWG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=crdT/4LE3Ch8R4sVRW6FF4fO9QpC+e/qUd0YNDPGHR8=; b=DwRKOyWGbuOvzXY8/pNS9G3gvj
	akLbPChN8d3H10IX00VkcqIZZ9ZsEZP2UQRRPtDgJiZAV1oNgKNhuQiObASqE11+uCVuW/8TbdOLp
	OO+eBC/HmmfYh1YaTLzqOFg3iThMgQmkVGv7aFwkKCm9CLLv1QrQzavaUuzYPZ/y6ZjI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5l8a-00BZPw-Vp; Tue, 29 Oct 2024 13:15:52 +0100
Date: Tue, 29 Oct 2024 13:15:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
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
Message-ID: <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>

> +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> +#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
> +#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */

With the swap to the new helper, i think 25M and 2M5 are no longer
needed.

> +static int s32_gmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct s32_priv_data *gmac = priv;
> +	int ret;
> +
> +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> +	if (!ret)
> +		ret = clk_prepare_enable(gmac->tx_clk);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't set tx clock\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(gmac->rx_clk);
> +	if (ret)
> +		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
> +	else
> +		gmac->rx_clk_enabled = true;

Why would this fail? And if it does fail, why is it not fatal? Maybe a
comment here.

> +static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct s32_priv_data *gmac = priv;
> +	long tx_clk_rate;
> +	int ret;
> +
> +	if (!gmac->rx_clk_enabled) {
> +		ret = clk_prepare_enable(gmac->rx_clk);
> +		if (ret) {
> +			dev_err(gmac->dev, "Can't set rx clock\n");

dev_err(), so is failing now fatal, but since this is a void function,
you cannot report the error up the call stack?

	Andrew

