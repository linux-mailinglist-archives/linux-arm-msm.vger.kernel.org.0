Return-Path: <linux-arm-msm+bounces-39974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EF9E0F60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 00:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41DA7282F72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 23:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD76E1DFD82;
	Mon,  2 Dec 2024 23:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MRhaAcqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1EA941;
	Mon,  2 Dec 2024 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733183072; cv=none; b=LJyWGtKAZxGcSRJ2v54WfVrPMSFJKXKxTb0fkUfw0OKpKUBIhSRpeZ3c4RFFQHCWBD8BU1Hfs6JYVvohoe5MfxB+ImaTj43R77v8DKvUGyroNd3jwWGmQB4CWRsPQ7WyamywI644hVNlIEbCc6glfljX9Tw5OYNIo/ZAHqV6/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733183072; c=relaxed/simple;
	bh=ItY7NlR2OdXY/n0CZxgvZuVFc2tv+CZC7uSLjDdSoiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLGxy6HRKxtDHL6QyFIk/xJcFPLt4kTfpUOCGRVcH9bxPn9xsQPh/y2Tk6CeBMvnklJEWh2E4NsejJmTo/4lep0Eoy8/CnnTU+VyVkWz5Ivlc3zdzfQqWhsGsdsSJwy6cqe7CQwRXe5sOpQWyUexgNsTa447XL+WOg4yxKBghvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MRhaAcqQ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QmxNh0nYEKdGUUoXGrSxrCnt6J/Rj48T7e6HKqO1/uM=; b=MRhaAcqQWSGy9UX2FETDtrsPq9
	7OJZyofuu9PD/clwQqMZGu4+A5v4UqUxO9SZLglD5plscdV7pVDyZKDJwRQRg4Itq70Yku//oJ7gp
	ToRNsw394Vo35QCqfihuvOz2kBGXTNofti4X4ZU30ZyS1cgoYCk1UbDekIiFIhoQMWNk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIG58-00F0fw-MU; Tue, 03 Dec 2024 00:43:58 +0100
Date: Tue, 3 Dec 2024 00:43:58 +0100
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, 0x1207@gmail.com,
	fancer.lancer@gmail.com
Subject: Re: [PATCH net-next v7 14/15] net: stmmac: dwmac-s32: add basic NXP
 S32G/S32R glue driver
Message-ID: <b9ad385b-7702-4c71-b14f-64f2714a35a4@lunn.ch>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-14-bc3e1f9f656e@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-14-bc3e1f9f656e@oss.nxp.com>

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

The ordering is a bit odd here. Normally you would test each operation
individually for errors. So:

	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
	if (ret) {
		dev_err(&pdev->dev, "Can't set tx clock\n");
		return ret;
	}
	ret = clk_prepare_enable(gmac->tx_clk);
	if (ret) {
		dev_err(&pdev->dev, "Can't enable tx clock\n");
		return ret;
	}


> +
> +	ret = clk_prepare_enable(gmac->rx_clk);
> +	if (ret) {
> +		clk_disable_unprepare(gmac->tx_clk);
> +		dev_err(&pdev->dev, "Can't set rx clock\n");
> +		return ret;
> +	}

Is there no need to set the TX clock rate?

	Andrew

