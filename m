Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D76221C4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 08:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgGPGFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 02:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbgGPGFJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 02:05:09 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F167120578;
        Thu, 16 Jul 2020 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594879508;
        bh=8P2zKP9fwTAESRcSXu8PidqEv90XXPnh3+R3n6iZJwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ETyy3TeDfhRQFQtPrFIhGv+A00ZcHddCwE8EzxqgKfBY1/SZpl9tr+ar58K0oEOnv
         3xoRC4GVghh+vSBw5MHJ+OWjd35oMAKyfy1xL1RO/NBMPQYIGEaPCNngU1AiFHzwdh
         7TnS/i7HrrT0UZ4441RG7cHELhWtBspgtYApeMbg=
Date:   Thu, 16 Jul 2020 11:35:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@codeaurora.org>,
        Jonathan McDowell <noodles@earth.li>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy driver
Message-ID: <20200716060504.GF55478@vkoul-mobl>
References: <20200713132309.14353-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713132309.14353-1-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-07-20, 15:23, Ansuel Smith wrote:

> +static inline void usb_phy_write_readback(struct usb_phy *phy_dwc3,
> +					  u32 offset,
> +					  const u32 mask, u32 val)
> +{
> +	u32 write_val, tmp = readl(phy_dwc3->base + offset);
> +
> +	tmp &= ~mask;		/* retain other bits */
> +	write_val = tmp | val;
> +
> +	writel(write_val, phy_dwc3->base + offset);
> +
> +	/* Read back to see if val was written */
> +	tmp = readl(phy_dwc3->base + offset);
> +	tmp &= mask;		/* clear other bits */
> +
> +	if (tmp != val)
> +		dev_err(phy_dwc3->dev, "write: %x to QSCRATCH: %x FAILED\n",
> +			val, offset);

lets use single line for these, it looks much better that way. Btw we
can extend to 100 chars now :)

> +static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	resource_size_t size;
> +	struct device_node *np;
> +	struct phy *generic_phy;
> +	struct usb_phy *phy_dwc3;
> +	const struct phy_drvdata *data;
> +	const struct of_device_id *match;
> +	struct phy_provider *phy_provider;
> +
> +	phy_dwc3 = devm_kzalloc(&pdev->dev, sizeof(*phy_dwc3), GFP_KERNEL);
> +	if (!phy_dwc3)
> +		return -ENOMEM;
> +
> +	match = of_match_node(qcom_ipq806x_usb_phy_table, pdev->dev.of_node);
> +	data = match->data;
> +
> +	phy_dwc3->dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
> +	size = resource_size(res);
> +	phy_dwc3->base = devm_ioremap(phy_dwc3->dev, res->start, size);
> +
> +	if (IS_ERR(phy_dwc3->base)) {
> +		dev_err(phy_dwc3->dev, "failed to map reg\n");
> +		return PTR_ERR(phy_dwc3->base);
> +	}
> +
> +	phy_dwc3->ref_clk = devm_clk_get(phy_dwc3->dev, "ref");
> +	if (IS_ERR(phy_dwc3->ref_clk)) {
> +		dev_dbg(phy_dwc3->dev, "cannot get reference clock\n");
> +		return PTR_ERR(phy_dwc3->ref_clk);
> +	}
> +
> +	clk_set_rate(phy_dwc3->ref_clk, data->clk_rate);
> +
> +	phy_dwc3->xo_clk = devm_clk_get(phy_dwc3->dev, "xo");
> +	if (IS_ERR(phy_dwc3->xo_clk)) {
> +		dev_dbg(phy_dwc3->dev, "cannot get TCXO clock\n");
> +		phy_dwc3->xo_clk = NULL;
> +	}
> +
> +	/* Parse device node to probe HSIO settings */
> +	np = of_node_get(pdev->dev.of_node);
> +	if (!of_compat_cmp(match->compatible, "qcom,ipq806x-usb-phy-ss",
> +			   strlen(match->compatible))) {

aha, why are we doing this? If you want to do this for only phy-ss then
you can read these optionally and set them if found..


> +		if (of_property_read_u32(np, "qcom,rx-eq", &phy_dwc3->rx_eq) ||
> +		    of_property_read_u32(np, "qcom,tx-deamp_3_5db",
> +					 &phy_dwc3->tx_deamp_3_5db) ||
> +		    of_property_read_u32(np, "qcom,mpll", &phy_dwc3->mpll)) {
> +			dev_err(phy_dwc3->dev, "cannot get HSIO settings from device node, using default values\n");
> +
> +			/* Default HSIO settings */
> +			phy_dwc3->rx_eq = SSPHY_RX_EQ_VALUE;
> +			phy_dwc3->tx_deamp_3_5db = SSPHY_TX_DEEMPH_3_5DB;
> +			phy_dwc3->mpll = SSPHY_MPLL_VALUE;
> +		}
> +	}
> +
> +	generic_phy = devm_phy_create(phy_dwc3->dev, pdev->dev.of_node,
> +				      &data->ops);
> +
> +	if (IS_ERR(generic_phy))
> +		return PTR_ERR(generic_phy);
> +
> +	phy_set_drvdata(generic_phy, phy_dwc3);
> +	platform_set_drvdata(pdev, phy_dwc3);
> +
> +	phy_provider = devm_of_phy_provider_register(phy_dwc3->dev,
> +						     of_phy_simple_xlate);
> +
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +
> +	return 0;
> +}

-- 
~Vinod
