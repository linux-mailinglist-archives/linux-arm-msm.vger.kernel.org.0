Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA33497F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 13:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239388AbiAXMW0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 07:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbiAXMWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 07:22:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F26C06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 04:22:25 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nByMT-0003Fk-6c; Mon, 24 Jan 2022 13:22:17 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nByMR-001wKp-IO; Mon, 24 Jan 2022 13:22:15 +0100
Message-ID: <56835bba2a746aab15463c38f7a761e4d30c51e4.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] drivers: bus: add driver for initializing the
 SSC bus on (some) qcom SoCs
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     michael.srba@seznam.cz, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Date:   Mon, 24 Jan 2022 13:22:15 +0100
In-Reply-To: <20220124112740.22790-1-michael.srba@seznam.cz>
References: <20220124112740.22790-1-michael.srba@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Michael,

On Mon, 2022-01-24 at 12:27 +0100, michael.srba@seznam.cz wrote:
[...]
> +
> +static int qcom_ssc_block_bus_init(struct device *dev)
> +{
> +	int ret;
> +
> +	struct qcom_ssc_block_bus_data *data = dev_get_drvdata(dev);
> +
> +	clk_prepare_enable(data->xo_clk);
> +	clk_prepare_enable(data->aggre2_clk);
> +
> +	clk_prepare_enable(data->gcc_im_sleep_clk);

Those should be disabled on failure below, otherwise they could
accumulate enable_counts with multiple failed block_bus_init calls.
(Assuming that the reset_control_* can fail in practice.)

> +
> +	reg32_clear_bits(data->reg_mpm_sscaon_config0, BIT(4) | BIT(5));
> +	reg32_clear_bits(data->reg_mpm_sscaon_config1, BIT(31));
> +
> +	clk_disable(data->aggre2_north_clk);

Where was this clock enabled before?

> +
> +	ret = reset_control_deassert(data->ssc_reset);
> +	if (ret) {
> +		dev_err(dev, "error deasserting ssc_reset: %d\n", ret);
> +		return ret;

And leave the aggre2_north_clk disabled? See below.

> +	}
> +
> +	clk_prepare_enable(data->aggre2_north_clk);
> +
> +	ret = reset_control_deassert(data->ssc_bcr);
> +	if (ret) {
> +		dev_err(dev, "error deasserting ssc_bcr: %d\n", ret);
> +		return ret;

And leave the aggre2_north_clk enabled? This needs to be consistent.

> +	}
> +
> +	regmap_write(data->halt_map, data->ssc_axi_halt + AXI_HALTREQ_REG, 0);
> +
> +	clk_prepare_enable(data->ssc_xo_clk);
> +
> +	clk_prepare_enable(data->ssc_ahbs_clk);
> +
> +	return 0;
> +}
> +
> +static int qcom_ssc_block_bus_deinit(struct device *dev)

Why does this return int when its result is never checked?

> +{
> +	int ret;
> +
> +	struct qcom_ssc_block_bus_data *data = dev_get_drvdata(dev);
> +
> +	clk_disable(data->ssc_xo_clk);
> +	clk_disable(data->ssc_ahbs_clk);
> +
> +	ret = reset_control_assert(data->ssc_bcr);
> +	if (ret) {
> +		dev_err(dev, "error asserting ssc_bcr: %d\n", ret);
> +		return ret;

And leave clocks below enabled?

> +	}
> +
> +	regmap_write(data->halt_map, data->ssc_axi_halt + AXI_HALTREQ_REG, 1);
> +
> +	reg32_set_bits(data->reg_mpm_sscaon_config1, BIT(31));
> +	reg32_set_bits(data->reg_mpm_sscaon_config0, BIT(4) | BIT(5));
> +
> +	ret = reset_control_assert(data->ssc_reset);
> +	if (ret) {
> +		dev_err(dev, "error asserting ssc_reset: %d\n", ret);
> +		return ret;

Same as above.

> +	}
> +
> +	clk_disable(data->gcc_im_sleep_clk);
> +
> +	clk_disable(data->aggre2_north_clk);
> +
> +	clk_disable(data->aggre2_clk);
> +	clk_disable(data->xo_clk);
> +
> +	return 0;
> +}
[...]
> +static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
> +{
> +	struct qcom_ssc_block_bus_data *data;
> +	struct device_node *np = pdev->dev.of_node;
> +	struct of_phandle_args halt_args;
> +	struct resource *res;
> +	int ret;
> +
> +	if (np)
> +		of_platform_populate(np, NULL, NULL, &pdev->dev);
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->pd_names = qcom_ssc_block_pd_names;
> +	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
> +
> +	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "error when attaching power domains: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "error when enabling power domains: %d\n", ret);
> +		return ret;
> +	}
> +
> +	// the meaning of the bits in these two registers is sadly not documented,
> +	// the set/clear operations are just copying what qcom does
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
> +	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->reg_mpm_sscaon_config0)) {
> +		ret = PTR_ERR(data->reg_mpm_sscaon_config0);
> +		dev_err(&pdev->dev, "failed to ioremap mpm_sscaon_config0 (err: %d)\n", ret);
> +		return ret;
> +	}
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
> +	data->reg_mpm_sscaon_config1 = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->reg_mpm_sscaon_config1)) {
> +		ret = PTR_ERR(data->reg_mpm_sscaon_config1);
> +		dev_err(&pdev->dev, "failed to ioremap mpm_sscaon_config1 (err: %d)\n", ret);
> +		return ret;
> +	}
> +
> +	data->ssc_bcr = devm_reset_control_get_exclusive(&pdev->dev, "ssc_bcr");
> +	if (IS_ERR(data->ssc_bcr)) {
> +		ret = PTR_ERR(data->ssc_bcr);
> +		dev_err(&pdev->dev, "failed to acquire reset: scc_bcr (err: %d)\n", ret);
> +		return ret;

Why check for -EPROBE_DEFER for the clocks but not here?
You could use dev_err_probe() to simplify all these error returns.

regards
Philipp
