Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7225762C215
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 16:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbiKPPQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 10:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbiKPPQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 10:16:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C304FF8D;
        Wed, 16 Nov 2022 07:16:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63C0561E8A;
        Wed, 16 Nov 2022 15:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B84C433D7;
        Wed, 16 Nov 2022 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668611788;
        bh=jKQagBl3R/KyglvVGmZThplHX13NVZHVD0eA64HEDv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NnwLFx90LSeoBcxta8H7gv+Sanbem74/0z1L+R5yOZ3Ow40dhoOj1w9FNYs05lW8P
         y/XJnO0/gu8Yu7ThFSadP2H8GGxELu5+A6dOSfaCVqOr9QVD7eOM5XU3mKA9io06U4
         vkn35h4qk5LESmJTfrUT8Dm/8k1ZcGDY31vMVw2nhYQ0yWpYZTqgGgiQ6UF3iVzjQq
         XyCt59n20IiDCK4Zu0HItTf6myPL3Wiyxe2vmY5gfHBYYurJKGiE57LB0fUU1FUfUO
         rf/GWHW5NOWjK1EhdWUBomOT6Mt992KrlckGZNIsXvD+aM9vxvjASu99Y2GvwjC4VB
         QV7ATgyjlMuXQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ovK8s-0003i4-IV; Wed, 16 Nov 2022 16:15:59 +0100
Date:   Wed, 16 Nov 2022 16:15:58 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/4] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <Y3T+rj1hACqSBrC4@hovoldconsulting.com>
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
 <20221110151748.795767-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110151748.795767-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 10, 2022 at 06:17:46PM +0300, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I was not CCed on this revision of this series either.

>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 64 +++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 189103d1bd18..78d7daf34667 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1023,6 +1023,66 @@ static int qmp_ufs_clk_init(struct qmp_ufs *qmp)
>  	return devm_clk_bulk_get(dev, num, qmp->clks);
>  }
>  
> +static void phy_clk_release_provider(void *res)
> +{
> +	of_clk_del_provider(res);
> +}
> +
> +#define UFS_SYMBOL_CLOCKS 3
> +
> +static int phy_symbols_clk_register(struct qmp_ufs *qmp, struct device_node *np)

Since you're adding a new function, please use the common prefix and
reordering the terms and dropping the redundant "symbols" should make it
more readable:

	qmp_ufs_register_clocks()

> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct clk_hw *hw;
> +	char name[64];
> +	int ret;
> +
> +	clk_data = devm_kzalloc(qmp->dev,
> +				struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = UFS_SYMBOL_CLOCKS;
> +
> +	snprintf(name, sizeof(name), "%s::rx_symbol_0", dev_name(qmp->dev));
> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	clk_data->hws[0] = hw;
> +
> +	snprintf(name, sizeof(name), "%s::rx_symbol_1", dev_name(qmp->dev));
> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	clk_data->hws[1] = hw;
> +
> +	snprintf(name, sizeof(name), "%s::tx_symbol_0", dev_name(qmp->dev));
> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	clk_data->hws[2] = hw;
> +
> +	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Roll a devm action because the clock provider is the child node, but
> +	 * the child node is not actually a device.
> +	 */

I know you just copied this from one of the other drivers, but perhaps
rephrase as "can be a child node". You can just drop the second clause
(no node *is* a device).

> +	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +}
> +
> +static const struct phy_ops qcom_qmp_ufs_ops = {
> +	.power_on	= qmp_ufs_enable,
> +	.power_off	= qmp_ufs_disable,
> +	.owner		= THIS_MODULE,
> +};

As I've already pointed out once, the above phy_ops struct hunk does not
belong in this patch and is just some left over after you rebased on
phy-next that must be removed.

>  static int qmp_ufs_parse_dt_legacy(struct qmp_ufs *qmp, struct device_node *np)
>  {
>  	struct platform_device *pdev = to_platform_device(qmp->dev);
> @@ -1135,6 +1195,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> +	ret = phy_symbols_clk_register(qmp, np);
> +	if (ret)
> +		goto err_node_put;
> +
>  	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
>  	if (IS_ERR(qmp->phy)) {
>  		ret = PTR_ERR(qmp->phy);

Johan
