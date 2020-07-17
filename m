Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B962234D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 08:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGQGl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 02:41:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:40730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbgGQGl2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 02:41:28 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64DE720704;
        Fri, 17 Jul 2020 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594968087;
        bh=CCf0Dgy3JelCV/wbdLInfXfM0DvC272eOkOnHmw//No=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugSvroZ9kraqs4Uzlgzp+ByBqo4w2Yx9dpTytqE/UWm3nQS5hmHjj+hSx7p8NKQWs
         uy/vj1plcUbm6ZUxf59C1h3JbUP2ROMca6+UxEAe7IqE1qjeWB0saI/fEiw5YAbSvy
         SZTvazzfNA5vY6qOfA8ZpnkhXONvty1YZB1fqQh4=
Date:   Fri, 17 Jul 2020 12:11:23 +0530
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
Subject: Re: [PATCH v9 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy driver
Message-ID: <20200717064123.GI82923@vkoul-mobl>
References: <20200716115547.11903-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716115547.11903-1-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-07-20, 13:55, Ansuel Smith wrote:

> +static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
> +{
> +	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
> +	int ret;
> +	u32 data;
> +
> +	ret = clk_prepare_enable(phy_dwc3->xo_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(phy_dwc3->ref_clk);
> +	if (ret) {
> +		clk_disable_unprepare(phy_dwc3->xo_clk);
> +		return ret;
> +	}
> +
> +	/* reset phy */
> +	data = readl(phy_dwc3->base + SSUSB_PHY_CTRL_REG);
> +	writel(data | SSUSB_CTRL_SS_PHY_RESET,
> +	       phy_dwc3->base + SSUSB_PHY_CTRL_REG);
> +	usleep_range(2000, 2200);
> +	writel(data, phy_dwc3->base + SSUSB_PHY_CTRL_REG);
> +
> +	/* clear REF_PAD if we don't have XO clk */
> +	if (!phy_dwc3->xo_clk)
> +		data &= ~SSUSB_CTRL_REF_USE_PAD;
> +	else
> +		data |= SSUSB_CTRL_REF_USE_PAD;
> +
> +	writel(data, phy_dwc3->base + SSUSB_PHY_CTRL_REG);
> +
> +	/* wait for ref clk to become stable, this can take up to 30ms */
> +	msleep(30);
> +
> +	data |= SSUSB_CTRL_SS_PHY_EN | SSUSB_CTRL_LANE0_PWR_PRESENT;
> +	writel(data, phy_dwc3->base + SSUSB_PHY_CTRL_REG);
> +
> +	/*
> +	 * WORKAROUND: There is SSPHY suspend bug due to which USB enumerates
> +	 * in HS mode instead of SS mode. Workaround it by asserting
> +	 * LANE0.TX_ALT_BLOCK.EN_ALT_BUS to enable TX to use alt bus mode
> +	 */
> +	ret = usb_ss_read_phycreg(phy_dwc3, 0x102D, &data);
> +	if (ret)
> +		goto err_phy_trans;
> +
> +	data |= (1 << 7);
> +	ret = usb_ss_write_phycreg(phy_dwc3, 0x102D, data);
> +	if (ret)
> +		goto err_phy_trans;
> +
> +	ret = usb_ss_read_phycreg(phy_dwc3, 0x1010, &data);
> +	if (ret)
> +		goto err_phy_trans;
> +
> +	data &= ~0xff0;
> +	data |= 0x20;
> +	ret = usb_ss_write_phycreg(phy_dwc3, 0x1010, data);
> +	if (ret)
> +		goto err_phy_trans;
> +
> +	/*
> +	 * Fix RX Equalization setting as follows
> +	 * LANE0.RX_OVRD_IN_HI. RX_EQ_EN set to 0
> +	 * LANE0.RX_OVRD_IN_HI.RX_EQ_EN_OVRD set to 1
> +	 * LANE0.RX_OVRD_IN_HI.RX_EQ set based on SoC version
> +	 * LANE0.RX_OVRD_IN_HI.RX_EQ_OVRD set to 1
> +	 */
> +	ret = usb_ss_read_phycreg(phy_dwc3,
> +				  SSPHY_CTRL_RX_OVRD_IN_HI(0), &data);

nit: I think this would fit in single line and make a better read :)

> +static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	resource_size_t size;
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

you don't need the match node anymore and can use
of_device_get_match_data() my original question on this :)

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
> +	if (device_property_read_u32(&pdev->dev, "qcom,rx-eq",
> +				     &phy_dwc3->rx_eq))
> +		phy_dwc3->rx_eq = SSPHY_RX_EQ_VALUE;
> +
> +	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp_3_5db",
> +				     &phy_dwc3->tx_deamp_3_5db))
> +		phy_dwc3->rx_eq = SSPHY_TX_DEEMPH_3_5DB;
> +
> +	if (device_property_read_u32(&pdev->dev, "qcom,mpll", &phy_dwc3->mpll))
> +		phy_dwc3->mpll = SSPHY_MPLL_VALUE;
> +
> +	generic_phy = devm_phy_create(phy_dwc3->dev, pdev->dev.of_node,
> +				      &data->ops);

nitpick, this could be single line as well
-- 
~Vinod
