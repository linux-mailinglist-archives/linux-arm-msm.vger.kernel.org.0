Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456016121AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 11:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJ2JDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 05:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJ2JDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 05:03:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC855DF2A
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 02:03:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 948A9B80B0F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 09:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3407EC433D6;
        Sat, 29 Oct 2022 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667034189;
        bh=KOp4149gFTxhvWHD2Z7vtNmIcuGs+lR9FJExOgj9UJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B3VSmmqRad1T4DE55WKpzqg32vDqllSdyYHyb/TPDi7zpjvEEfqo1pQS3ZR/akJQY
         g47dqCwlP6yK/wQGFkazX7jmnJR6gGhTfuRw/OtmbzTHCldbjmcY4wWTzbdqVexmY9
         2kujJrVD/bJvPI0wwUcAExR/Y4O3jSLn5xygmx2wk1i5e7eJhSsayjEtrxSxRe+tBs
         UtAgVCsxoCnwaAQhmjYAm8JhrrBz9WNCnPLFlCnx+PRExyaUEixRA5H4qCWe6731nB
         dslQmqx+4Nrbc69Q4Ccl5tnF0gUM/CQrMR7zeoGQJq4zctPllzaxBxHcqCS8xsszjQ
         iSXCoCZF1uj8w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oohk0-0000JY-JQ; Sat, 29 Oct 2022 11:02:56 +0200
Date:   Sat, 29 Oct 2022 11:02:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <Y1zsQN33joDlJRAP@hovoldconsulting.com>
References: <20221028164847.485874-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028164847.485874-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 28, 2022 at 07:48:47PM +0300, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v5:
> - Rebased on top of phy/next
> 
> Changes since v4:
> - Rebased, dropping merged clk patches
> - Fixed whitespace errors
> - Added linebreaks to fit into 100 chars limit
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 67 +++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 189103d1bd18..c1c9c6e7949d 100644
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
> +	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +}
> +
> +static const struct phy_ops qcom_qmp_ufs_ops = {
> +	.power_on	= qmp_ufs_enable,
> +	.power_off	= qmp_ufs_disable,
> +	.owner		= THIS_MODULE,
> +};

This phy_ops addition looks an artefact of the rebase and should not be
here.

>  static int qmp_ufs_parse_dt_legacy(struct qmp_ufs *qmp, struct device_node *np)
>  {
>  	struct platform_device *pdev = to_platform_device(qmp->dev);
> @@ -1135,6 +1195,13 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> +	ret = phy_symbols_clk_register(qmp, np);

Looks like this should go in probe() instead, or was there a reason for
not registering these clocks when using the new bindings?

And don't they need to be described in both the old and new bindings
first either way?

> +	if (ret) {
> +		dev_err(dev, "failed to create symbol clocks, %d\n",
> +			ret);

Please use the "...: %d\n" form for consistency.

But you can probably just drop this error message instead.

> +		goto err_node_put;
> +	}
> +
>  	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
>  	if (IS_ERR(qmp->phy)) {
>  		ret = PTR_ERR(qmp->phy);

Johan
