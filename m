Return-Path: <linux-arm-msm+bounces-1590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EADD7F518A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243F328127C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2674C617;
	Wed, 22 Nov 2023 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trJZ9rCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AE19A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:24:29 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c8790474d5so2391831fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700684668; x=1701289468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pa4PSx1bqwHUNtr2jOQTdwbCw2lGoLr2aW9SF4QV68E=;
        b=trJZ9rCtBBkRyoW5ItepmGgU4L9zF4BIn6Jin5AdJegD6zRDhSheOjEmmOBTGnwvct
         lbIB4p0pYlxttSLzDTBxw1YahC1CsTQok0XRB3mGcOKT60/z5Hjas28wV5fY6AOqoR5H
         NYdwlwGyltCWdTn7ANOjAP3YCA8rwmpEBeAA6iHuyhKhYCcGigvhaP1Ws9nmVWk11iKB
         UBF+tPS9moJRHWhpYaH54zSfk2vS9xlZw+v7qQSFKcZLsVCqheChyBndgv1dCFyDv4ew
         ZSeV8pFFlghK2AnvOIsFm+GurSSeVe+Bi+3u59vXVjW9NsjUdcIsI52pXGR4sxU6J3kq
         qjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700684668; x=1701289468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pa4PSx1bqwHUNtr2jOQTdwbCw2lGoLr2aW9SF4QV68E=;
        b=WtYfTIWx768OLhNqndBU0a8zRH9jWMUU0gzWcgbpPrrnZZVE2KZrNBf9HSoIC/xlvZ
         Ww2RXHJ7Pi+hulsRf+K8iuuLGz3HSDyDRxGfhHWj6Eu3JMSAAUWWEJCQWe4iel8RnaIQ
         C8eTjITCMlctVilVYMzpRFKpmfr5ydz3XdpIpDhM6XzSqvnkL8+UaA/gUuPYS/ejUu0k
         szIaggyZam/kxh2G+c+0/qM8BsoeVhKqjTKwbBcojy0HHSQGMON3OZGaSHmGU7er4D+u
         VIio7vrGcLnr/ehg0+XDl5klLGnf6BIlZnDnHj/g3GGHbYX7FFR2iI/DhqzxvtGm5bkL
         SE5g==
X-Gm-Message-State: AOJu0YxluspqnFpH+NXvqgf+E0lPkX5I3Sw/ESZ8bgocBjC2QcsLt2eA
	mE00doAqKQ9JE9T3tSqinb4lLwX685B/wU/5OFjMwovA
X-Google-Smtp-Source: AGHT+IHCqJnqmqruquEzZmPUrGzbkNt3QnbrS5s9HB1QFQs8oQy4JStcei9zVZVifxLEVasGTNqeiw==
X-Received: by 2002:a2e:920b:0:b0:2c5:23e3:ed11 with SMTP id k11-20020a2e920b000000b002c523e3ed11mr2713058ljg.30.1700684667938;
        Wed, 22 Nov 2023 12:24:27 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f27-20020a2eb5bb000000b002b9f03729e2sm42821ljn.36.2023.11.22.12.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:24:27 -0800 (PST)
Message-ID: <f18b6552-bf8d-4826-969a-a0de60bd0ad3@linaro.org>
Date: Wed, 22 Nov 2023 21:24:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] net: mdio: ipq4019: configure CMN PLL clock for
 ipq5332
Content-Language: en-US
To: Luo Jie <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, robert.marko@sartura.hr
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-5-quic_luoj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231115032515.4249-5-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/15/23 04:25, Luo Jie wrote:
> The reference clock of CMN PLL block is selectable, the internal
> 48MHZ is used by default.
> 
> The output clock of CMN PLL block is for providing the clock
> source of ethernet device(such as qca8084), there are 1 X 25MHZ
> and 3 x 50MHZ output clocks available.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>   drivers/net/mdio/mdio-ipq4019.c | 81 ++++++++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
> index 93ae4684de31..ca9cda98d1f8 100644
> --- a/drivers/net/mdio/mdio-ipq4019.c
> +++ b/drivers/net/mdio/mdio-ipq4019.c
> @@ -43,6 +43,13 @@
>   /* Maximum SOC PCS(uniphy) number on IPQ platform */
>   #define ETH_LDO_RDY_CNT				3
>   
> +#define CMN_PLL_REFERENCE_CLOCK			0x784
> +#define CMN_PLL_REFCLK_INDEX			GENMASK(3, 0)
> +#define CMN_PLL_REFCLK_EXTERNAL			BIT(9)
> +
> +#define CMN_PLL_POWER_ON_AND_RESET		0x780
> +#define CMN_ANA_EN_SW_RSTN			BIT(6)
> +
>   enum mdio_clk_id {
>   	MDIO_CLK_MDIO_AHB,
>   	MDIO_CLK_UNIPHY0_AHB,
> @@ -54,6 +61,7 @@ enum mdio_clk_id {
>   
>   struct ipq4019_mdio_data {
>   	void __iomem *membase;
> +	void __iomem *cmn_membase;
>   	void __iomem *eth_ldo_rdy[ETH_LDO_RDY_CNT];
>   	struct clk *clk[MDIO_CLK_CNT];
>   	struct gpio_descs *reset_gpios;
> @@ -227,12 +235,73 @@ static int ipq4019_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
>   	return 0;
>   }
>   
> +/* For the CMN PLL block, the reference clock can be configured according to
> + * the device tree property "cmn_ref_clk", the internal 48MHZ is used by default
> + * on the ipq533 platform.
> + *
> + * The output clock of CMN PLL block is provided to the MDIO slave devices,
> + * threre are 4 CMN PLL output clocks (1x25MHZ + 3x50MHZ) enabled by default.
> + *
> + * such as the output 50M clock for the qca8084 PHY.
> + */
> +static void ipq_cmn_clock_config(struct mii_bus *bus)
> +{
> +	u32 reg_val;
> +	const char *cmn_ref_clk;
> +	struct ipq4019_mdio_data *priv = bus->priv;
> +
> +	if (priv && priv->cmn_membase) {
> +		reg_val = readl(priv->cmn_membase + CMN_PLL_REFERENCE_CLOCK);
> +		reg_val &= ~(CMN_PLL_REFCLK_EXTERNAL | CMN_PLL_REFCLK_INDEX);
> +
> +		/* Select reference clock source */
> +		cmn_ref_clk = of_get_property(bus->parent->of_node, "cmn_ref_clk", NULL);
> +		if (!cmn_ref_clk) {
> +			/* Internal 48MHZ selected by default */
> +			reg_val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> +		} else {
> +			if (!strcmp(cmn_ref_clk, "external_25MHz"))
As pointed out by others, such string properties won't go through

Konrad

