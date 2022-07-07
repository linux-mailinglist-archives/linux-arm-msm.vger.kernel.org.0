Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159AF569BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 09:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235101AbiGGHjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 03:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbiGGHip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 03:38:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B1E326F2;
        Thu,  7 Jul 2022 00:38:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CDDC61B0C;
        Thu,  7 Jul 2022 07:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C07C3411E;
        Thu,  7 Jul 2022 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657179515;
        bh=dEH00sPee+QPLnv4vCT0+HRB/HiN2iqpU4CrPolA87A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pr3afQObb2yiXatw9whVzqKy3t1SWArA7c5qdephf6Eu2In0y9jjAc7uJkyHaTtRQ
         RizEOEFsIZ8ZfYclMF/ClpnGUxwRm+FlHbZmOGit74tSA003KaUDCOvUAkd3O7XGi+
         RsUVglrGvjxr/xQcv5WoRFoPH58lxw9lFfmKQ97XAb5XKWTooPHvbV6K9nE3Izel7v
         RnY5El1xSJSDLX6wvLHo0J4wwvFkigGOqHNRrh7mGyxcsLjW7ODwbxoWtWeDX6wzIB
         tFdHv3k1nKrVDxr3vbskQvBXU11LmmL1A9HeiVBPQxHPuuksR9/L7VlVtWl/b9RdLz
         NIikfJJ7HAgvQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o9M5s-0004XB-V3; Thu, 07 Jul 2022 09:38:37 +0200
Date:   Thu, 7 Jul 2022 09:38:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <YsaNfK64RGNp/ZvT@hovoldconsulting.com>
References: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
 <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 20, 2022 at 06:39:56PM +0300, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 55 +++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index a2526068232b..0f31d3255897 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1167,6 +1167,54 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
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
> +	int ret;
> +
> +	clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);

Missing error handling.

> +	clk_data->num = UFS_SYMBOL_CLOCKS;
> +
> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_0_clk_src",

Don't the clock names need to be globally unique and hence either come
from the devicetree or encode the device topology some other way?

We have two UFS PHYs on sc8280xp for example.

> +							   NULL, 0, 0);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	clk_data->hws[0] = hw;
> +
> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_1_clk_src",
> +							   NULL, 0, 0);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	clk_data->hws[1] = hw;
> +
> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_tx_symbol_0_clk_src",
> +							   NULL, 0, 0);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	clk_data->hws[2] = hw;
> +
> +	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		return ret;
> +
> +        /*
> +         * Roll a devm action because the clock provider is the child node, but
> +         * the child node is not actually a device.
> +         */
> +        return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +}

Johan
