Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1103E553A9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 21:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353478AbiFUTcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 15:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236913AbiFUTcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 15:32:24 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B632CDE2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 12:32:22 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id g18so14415624qvn.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3srfLFxYG7qfDVEhrAKtCq0hN10jlAvu2WRTV989x8g=;
        b=GHkVMrebgfvnerev2S8Dko8BoUQ/WAd1+7MHrFaKplmZGhnuEc5eijtoVZJhD/KLrL
         QI2WHO1jHuheIxGip/PQ2YvjcuEVsEB2T4qid1z3y4WekPUlqYjFTpoAqLM1ek4jtLCT
         NkFLiQLJVqDrggRJ2v6CUa0DUUS6Kww4TjX4Y/8/hnLSAjg8gLVqit/86dG6hxQAS8Cx
         9H3IQaVcGdIZ5z7UKKY7iFjfkGORF9swcrMoTQwttfLYjLsACFkE0j57KSPJVIxLCxRA
         HqpoRy/t/HsTRSVXC834JSQbiMb50dm4A/8TNFZq8KVWzf/r499HlxHyYmTcW7I7jL0+
         cSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3srfLFxYG7qfDVEhrAKtCq0hN10jlAvu2WRTV989x8g=;
        b=Su5nSAKiAeWFkbqIpwboNxqpIOsGOziWORiTZ47JvezfJz7KcZGDzypgNahL3FJNAw
         sCUlW7wSALPEMhq7ETbtUXftUvaIqsNhzcHQB4cDPP+do1pbVYa4dRJLDcpky750MXQu
         81pLa3j1uTI0UHROrEfovEeG9XSdzLfv3Al0WlaO/XfIzNhVm9d685r3rXYm2mUFAj6i
         KLrbLq/0w7lOTVH0+QPPNP0t1SzZrTRAAPHGKOqRAroFHZu0ErUjYGBKTvIFHDJLOtQ+
         oGRF4N/bxOs0oUO46rSOyI8ACZHev9CzOKVwOFI62p/s4JdVENN4DOOA1nQJE7dwNlBt
         buZw==
X-Gm-Message-State: AJIora+lTM+Cl34cyVn2h7OsQ3FPFhkGRMKsObPHCfApp08nJJQQfV9T
        mF3uhvPQmkGe4K8qJKGZisIb5nz0EPvvMcs5lQQ4lvuv2yYcxw==
X-Google-Smtp-Source: AGRyM1t4IEveB4UfUxLGaX48vbbsWsqCyvXeGQnnC+lvMBQdKywxsl7HLiRfW0mEXQDTfkTUEY6XBxnMbsN2tWpF6r0=
X-Received: by 2002:a05:622a:1351:b0:305:2e58:939 with SMTP id
 w17-20020a05622a135100b003052e580939mr25141476qtk.295.1655839941451; Tue, 21
 Jun 2022 12:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220621193020.1630180-1-robimarko@gmail.com>
In-Reply-To: <20220621193020.1630180-1-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 22:32:10 +0300
Message-ID: <CAA8EJppTRitQujoXEXkS0t9p7RF3dOOi9KzaA+or53xQbNWEBw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] phy: qcom-qmp-pcie: make pipe clock rate configurable
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 22:30, Robert Marko <robimarko@gmail.com> wrote:
>
> IPQ8074 Gen3 PCIe PHY uses 250MHz as the pipe clock rate instead of 125MHz
> like every other PCIe QMP PHY does, so make it configurable as part of the
> qmp_phy_cfg.
>
> Set all of the current configs to use 125MHz as currently done.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index b2cd0cf965d8..4dc4d4f8547e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -1284,6 +1284,9 @@ struct qmp_phy_cfg {
>
>         /* true, if PHY has secondary tx/rx lanes to be configured */
>         bool is_dual_lane_phy;
> +
> +       /* QMP PHY pipe clock interface rate */
> +       unsigned long pipe_clock_rate;
>  };
>
>  /**
> @@ -1419,6 +1422,8 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,

Ugh. I'd say, let's make this a default.

>  };
>
>  static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
> @@ -1447,6 +1452,8 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
> @@ -1478,6 +1485,8 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
> @@ -1507,6 +1516,8 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
> @@ -1546,6 +1557,8 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
> @@ -1586,6 +1599,8 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
> @@ -1611,6 +1626,8 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
>         .start_ctrl             = SERDES_START | PCS_START,
>         .pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
>         .phy_status             = PHYSTATUS,
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
> @@ -1641,6 +1658,8 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
> @@ -1673,6 +1692,8 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
> @@ -1704,6 +1725,8 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
> @@ -1736,6 +1759,8 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
>         .has_pwrdn_delay        = true,
>         .pwrdn_delay_min        = 995,          /* us */
>         .pwrdn_delay_max        = 1005,         /* us */
> +
> +       .pipe_clock_rate        = 125000000,
>  };
>
>  static void qcom_qmp_phy_pcie_configure_lane(void __iomem *base,
> @@ -2121,8 +2146,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
>
>         init.ops = &clk_fixed_rate_ops;
>
> -       /* controllers using QMP phys use 125MHz pipe clock interface */
> -       fixed->fixed_rate = 125000000;
> +       fixed->fixed_rate = qmp->phys[0]->cfg->pipe_clock_rate;
>         fixed->hw.init = &init;
>
>         ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
