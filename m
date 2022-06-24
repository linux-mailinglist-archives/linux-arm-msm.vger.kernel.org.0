Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9775B558CA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 03:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiFXBJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 21:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiFXBJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 21:09:32 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D472F522EA
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 18:09:30 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1048b8a38bbso1736669fac.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 18:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OCHZxokmpPS3ghyjxdWAlsOmOJoJ7RkmN7lu9vpq/qc=;
        b=mgmCgBe5WxBpH89yuOr301hjK5lL5qvKpX+q0WY3Kvk8Uct1ju85U3VL84gbnUbFGm
         umtfp93y0TObeGA/vX0kAbt5pmZnBdQTd3LOEemB+ztk752fsZT48g2k4qF4gTuG3BxW
         yMWg66ompzCQcsliNLhBFppZ8A6TCE7euehNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OCHZxokmpPS3ghyjxdWAlsOmOJoJ7RkmN7lu9vpq/qc=;
        b=6hAsAZlI2W/eYCSUXtvAN0ucohirPzDAcHYyTITdJGUV5i9bnGqXg6pC1oX6tqjY/I
         PG/G6o7QRCqZygoluWTG8kGxnA4On2ysT2tNGanu8PDpsX0IDGMjG8GZwqlNYlwHJiT7
         h0l09NjL+j4TSNdW/5w/7peqKElsKCoeBg4ZzAaAlDlS82TVfp5MO8fQiUrG/i7/TLC0
         9tfxz8iMfbOf0op+8aTGoKFgTP4VuYHt/GQpB1a3NWNXVrM0+slbSqBfMNpxuDExgTxd
         dy43+emLQ0SaaR0DGPCN4PMd/R++isRCDhkuqTDEvMCYc3ytCis3xgcPF80qlUCQVJrB
         H2ow==
X-Gm-Message-State: AJIora9sg5tpLnGdZqWSzZp3V2Rt+TfsJ2zVClokxSvcfSVY0Nv0Bg97
        CNgTJuwa67u8WqcfjZLu50WiL0vffxH0xUruXfR11g==
X-Google-Smtp-Source: AGRyM1tXirInAlabjW2wEws7IJSezLdoi0NAHbcTGFYyFOOwxy2J/0t4iXkfHnq/bVhSuIcagOvo549caWEkIJTT/0w=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr481377oab.193.1656032970163; Thu, 23
 Jun 2022 18:09:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 18:09:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
References: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org> <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 23 Jun 2022 18:09:29 -0700
Message-ID: <CAE-0n50P1sre19Vn76m2JuyNV1dLsBt7dOA30rnGPS_z3=aVjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-ufs: provide symbol clocks
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-20 08:39:56)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index a2526068232b..0f31d3255897 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1167,6 +1167,54 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
>         return devm_clk_bulk_get(dev, num, qmp->clks);
>  }
>
> +static void phy_clk_release_provider(void *res)
> +{
> +       of_clk_del_provider(res);
> +}
> +
> +#define UFS_SYMBOL_CLOCKS 3
> +
> +static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       struct clk_hw *hw;
> +       int ret;
> +
> +       clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);
> +       clk_data->num = UFS_SYMBOL_CLOCKS;
> +
> +       hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_0_clk_src",
> +                                                          NULL, 0, 0);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk_data->hws[0] = hw;
> +
> +       hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_1_clk_src",
> +                                                          NULL, 0, 0);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk_data->hws[1] = hw;
> +
> +       hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_tx_symbol_0_clk_src",
> +                                                          NULL, 0, 0);

This line should be aligned with the opening parenthesis. Same for the
above other two.

> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk_data->hws[2] = hw;
> +
> +       ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
> +       if (ret)
> +               return ret;
> +
> +        /*

This is tabbed weird. It doesn't align with the if above.


> +         * Roll a devm action because the clock provider is the child node, but
> +         * the child node is not actually a device.
> +         */
> +        return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +}
> +
>  static const struct phy_ops qcom_qmp_ufs_ops = {
>         .power_on       = qcom_qmp_phy_ufs_enable,
>         .power_off      = qcom_qmp_phy_ufs_disable,
