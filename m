Return-Path: <linux-arm-msm+bounces-714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C067EC705
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA302813A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086833CDC;
	Wed, 15 Nov 2023 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LFCfuiiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FC2E637;
	Wed, 15 Nov 2023 15:19:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFFBC7;
	Wed, 15 Nov 2023 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=37VjmFcSyaHadPNgbdsqa1mf/2AH59SSvQZU2YKjHvQ=; b=LFCfuiiLezaSYqQa0KbiBlgR0L
	DPbCThNAHL4Pzl5FTX4yOK8w2TXMy097mcKNrsNbc8Zbtf9CKMRmrf0gf+T7npRSZfv+td+Avk7LJ
	txtgdY5vhDn2Qs6weKkQe/XRAXb4MqUKoGSwKFdo3i+8pSgwwbjw2o8NZefzg1kS3tso=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3HfV-000Fop-UB; Wed, 15 Nov 2023 16:19:05 +0100
Date: Wed, 15 Nov 2023 16:19:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 4/9] net: mdio: ipq4019: configure CMN PLL clock for
 ipq5332
Message-ID: <e1fecfd7-3de1-4719-879b-fd486fdc3815@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-5-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115032515.4249-5-quic_luoj@quicinc.com>

> +static void ipq_cmn_clock_config(struct mii_bus *bus)
> +{
> +	u32 reg_val;
> +	const char *cmn_ref_clk;
> +	struct ipq4019_mdio_data *priv = bus->priv;

Reverse christmass tree place.

> +
> +	if (priv && priv->cmn_membase) {

Can priv be NULL? Can cmn_membase be NULL?

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

Not strings, please use u32 values. You can then list the valid values
in the yaml file, and get te tools to verify the DT.

> +				reg_val |= (CMN_PLL_REFCLK_EXTERNAL |
> +					    FIELD_PREP(CMN_PLL_REFCLK_INDEX, 3));
> +			else if (!strcmp(cmn_ref_clk, "external_31250KHz"))
> +				reg_val |= (CMN_PLL_REFCLK_EXTERNAL |
> +					    FIELD_PREP(CMN_PLL_REFCLK_INDEX, 4));
> +			else if (!strcmp(cmn_ref_clk, "external_40MHz"))
> +				reg_val |= (CMN_PLL_REFCLK_EXTERNAL |
> +					    FIELD_PREP(CMN_PLL_REFCLK_INDEX, 6));
> +			else if (!strcmp(cmn_ref_clk, "external_48MHz"))
> +				reg_val |= (CMN_PLL_REFCLK_EXTERNAL |
> +					    FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7));
> +			else if (!strcmp(cmn_ref_clk, "external_50MHz"))
> +				reg_val |= (CMN_PLL_REFCLK_EXTERNAL |
> +					    FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8));
> +			else
> +				reg_val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);

If the value is not valid, return -EINVAL.

   Andrew

