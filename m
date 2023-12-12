Return-Path: <linux-arm-msm+bounces-4406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D980EC98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D10A31C20974
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 12:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB92B60ECF;
	Tue, 12 Dec 2023 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MQuO2Peu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931FDEE;
	Tue, 12 Dec 2023 04:54:21 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDDDBE0005;
	Tue, 12 Dec 2023 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702385660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUAQ6qv2aDc1m39TxOBaleeDpMHPGrbRMQ0hbDXfaoc=;
	b=MQuO2Peu2llqSqRR1/YYvEdJdNUf+iPUYijiG0G0ljrK6Kxmy5nmYPEfdiPlRgp5Nl+aGn
	DkK6lPCLNdX4jgZZZQH50s1pYP0QCtcZXZCdaT5siIkf+oEH8r/YkowVTv+RUjUITj6llU
	xFKF0rdyfMxCs4Af+4k8/onZDL3nntonTknSTqNyVw45zj09tGmXemDqw1P5mF+f/joSte
	i7wXbG9l8DMdGVMqvstAh0uHspm9hJ7LiNmEEHGMceFCiQHRomZobD25BIJsFxVwhibl7w
	NWtyT4VPqO/OLs7Yp7GNfTPGYT08lOiNCAMtiPrJ30UMjr3CyzR2lepTxaeEzQ==
Date: Tue, 12 Dec 2023 13:54:17 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
Subject: Re: [PATCH v2 3/5] net: mdio: ipq4019: configure CMN PLL clock for
 ipq5332
Message-ID: <20231212135417.67ece4d0@device.home>
In-Reply-To: <20231212115151.20016-4-quic_luoj@quicinc.com>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
	<20231212115151.20016-4-quic_luoj@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello,

I have some more minor comments for yoi :)

On Tue, 12 Dec 2023 19:51:48 +0800
Luo Jie <quic_luoj@quicinc.com> wrote:

> The reference clock of CMN PLL block is selectable, the internal
> 48MHZ is used by default.
> 
> The output clock of CMN PLL block is for providing the clock
> source of ethernet device(such as qca8084), there are 1 * 25MHZ
> and 3 * 50MHZ output clocks available for the ethernet devices.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

[...]

> +/* For the CMN PLL block, the reference clock can be configured according to
> + * the device tree property "cmn-reference-clock", the internal 48MHZ is used
> + * by default on the ipq533 platform.
> + *
> + * The output clock of CMN PLL block is provided to the ethernet devices,
> + * threre are 4 CMN PLL output clocks (1*25MHZ + 3*50MHZ) enabled by default.
> + *
> + * Such as the output 50M clock for the qca8084 ethernet PHY.
> + */
> +static int ipq_cmn_clock_config(struct mii_bus *bus)
> +{
> +	int ret;
> +	u32 reg_val, src_sel, ref_clk;
> +	struct ipq4019_mdio_data *priv;

Here you should also use reverse christmas-tree notation

[...]

> @@ -317,6 +441,17 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* The CMN block resource is for providing clock source to ethernet,
> +	 * which can be optionally configured on the platform ipq9574 and
> +	 * ipq5332.
> +	 */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cmn_blk");
> +	if (res) {
> +		priv->cmn_membase = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(priv->cmn_membase))
> +			return PTR_ERR(priv->cmn_membase);
> +	}
> +

And here you can simplify a bit by using
devm_platform_ioremap_resource_byname()

Thanks,

Maxime


