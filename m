Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3219611330
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 15:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiJ1NmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 09:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiJ1Nln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 09:41:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D40214FD03
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 06:40:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 594F5B82A2E
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 13:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2F0C433D7;
        Fri, 28 Oct 2022 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666964439;
        bh=1TTp4oQ239VWKrke6o3KSy2K4p1TTVxw2l1hI12pgJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S4dRs7vPhZye7M91ex4c8eepK1DtzbEe+ZYLI9FJ6Cr6IZV6Ofol09dgk8NrGSuzf
         wOoyzRS5a2x2GlFsPJuGAm5SVdBwl7a4U9zYHbbY/laznVpNUJgVyUCM4GG1QB5N6n
         hGErxEgcfo3d6JpaeWf0URdW1xPAuEyFRpmn22Nw5OBlLEr5eWFd4hTejLTJce4WJz
         5pfKleBf+5ptLY9WjacWoqhXzCDzl4aB+ZBTFYWUosbzYtxNDXT6vD7+oEWP38KQRE
         9U8L74sOwwuTw2eg33K7FfMrxnQ7h3zZ1HVkUfamtteEtOl1Z3QAahBV0topdLg72V
         OqGxOBqgPyK9g==
Date:   Fri, 28 Oct 2022 08:40:36 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <20221028134036.s3sunt7loa2gcq6s@baldur>
References: <20221028125148.264833-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028125148.264833-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 28, 2022 at 03:51:48PM +0300, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v4:
> - Rebased, dropping merged clk patches
> - Fix whitespace errors
> - Add linebreaks to fit into 100 chars limit
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index e28c45ab74ea..f60e29c68c26 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1067,6 +1067,60 @@ static int qmp_ufs_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
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
> +static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
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

Wouldn't it be desirable to provide a non-zero frequency for these
clocks?

Regards,
Bjorn

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
>  static const struct phy_ops qcom_qmp_ufs_ops = {
>  	.power_on	= qmp_ufs_enable,
>  	.power_off	= qmp_ufs_disable,
> @@ -1232,6 +1286,13 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>  			goto err_node_put;
>  		}
>  
> +		ret = phy_symbols_clk_register(qmp, child);
> +		if (ret) {
> +			dev_err(dev, "failed to create symbol clocks, %d\n",
> +				ret);
> +			goto err_node_put;
> +		}
> +
>  		id++;
>  	}
>  
> -- 
> 2.35.1
> 
