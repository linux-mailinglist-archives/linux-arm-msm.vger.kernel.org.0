Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78687E210B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 13:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjKFMOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 07:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbjKFMOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 07:14:00 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398EBDB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 04:13:56 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5b31c5143a0so52338927b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699272835; x=1699877635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F3Zbr/7wNikMm8fVZo9O7MEbsokzhS7zeLCZ4OYDYRk=;
        b=sXuIBiWdu7zRVYBlXAqLybne0wmgPMOlKZ/Suw4zefMLMeCW7Brt3OkfLqXnCYUe1v
         IMOVcy9T8Wy7gwryLiDLI9P6hciT3i+RpJTHHpIyEPQFfKdJ8X/kCV58WlcgTFBQtktc
         8vz0VtnRlQSM29nlyCm7rOVD4+2j5QTwumSXSM0tvKsvQQGUz6FpdJ6yj6PxC+bNoVR2
         npPkmU/gDXbCvnvh7FUaPpRgiS91m5SBdEsUzU11cYrLHJeTwVoKuhD4Orksxn4moddq
         ksXej7euDWikgrLIva6iVaz1kHvpupaIVj+0TOY88Lv0eU5pBgxfBvAGCIuSYa9FPJFn
         4Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699272835; x=1699877635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3Zbr/7wNikMm8fVZo9O7MEbsokzhS7zeLCZ4OYDYRk=;
        b=NIoiapUBYiKCQr5tAxGeXOJsnvMFcmFdKe8N877H8orrdofRVr+FkDwybWYWjWIaat
         /6Pj+o8fZor/HzfWxDmlw9j2FKnbKkZT1viyBxXB4xt298NjXqeSnRajd6aoRKPV/8OI
         y9Wqqgq4JMHBJZKsMPGVJ0Epef86FrRyMHfzl0VjeKRoLcFdYbzWRDfgn7mBRKW8x9PM
         SBJgzZgvxIujBIcWUayVY9vVA+6431T+5cbl1V4AGuDYejFsyi9hrfzbbWRDCzvK1zC3
         Nw+UPYcizQnHR0y8tQ1aKDQv8e5dbrNjTQOHJM8bX4XLZTuLHUF4wRo8vEOOdBOMTL9y
         OIbw==
X-Gm-Message-State: AOJu0YyTlVL3yBk7hAZv1Bn02Vxjcg9vSEsywcrkj/gUz2P/2nD42p+k
        pvvB5/b2CKJo2s5IzD+bpTRGxuEThD6jEtW6KRfa4/VpZS+QQp34sOQ=
X-Google-Smtp-Source: AGHT+IGGM3UIDY+b5l1UooC9gUNrzrvkGoCUCgdNg/5181q+F7Rutpj6JhdZVJm/bP30cG66zRn32AVniYfDFGzb1eo=
X-Received: by 2002:a05:690c:6:b0:5a1:d352:9fe1 with SMTP id
 bc6-20020a05690c000600b005a1d3529fe1mr12063192ywb.42.1699272835361; Mon, 06
 Nov 2023 04:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20231106-refclk_always_on-v1-0-17a7fd8b532b@quicinc.com> <20231106-refclk_always_on-v1-2-17a7fd8b532b@quicinc.com>
In-Reply-To: <20231106-refclk_always_on-v1-2-17a7fd8b532b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Nov 2023 14:13:43 +0200
Message-ID: <CAA8EJpq9azRC5msZfS1V8NK4EmPN+jxh+99yGEyQ+EWkk1gROQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-pcie: Add support for keeping refclk
 always on
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_vpernami@quicinc.com, quic_parass@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Nov 2023 at 13:53, Krishna chaitanya chundru
<quic_krichai@quicinc.com> wrote:
>
> In PCIe low power states like L1.1 or L1.2 the phy will stop
> supplying refclk to endpoint. If endpoint asserts clkreq to bring
> back link L0, then RC needs to provide refclk to endpoint.
>
> If there is some issues in platform with clkreq signal propagation
> to host and due to that host will not send refclk which results PCIe link
> down. For those platforms  phy needs to provide refclk even in low power
> states.
>
> Add a flag which indicates refclk is always supplied to endpoint.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index a63ca7424974..d7e377a7d96e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -43,6 +43,8 @@
>  /* QPHY_PCS_STATUS bit */
>  #define PHYSTATUS                              BIT(6)
>  #define PHYSTATUS_4_20                         BIT(7)
> +/* PCS_PCIE_ENDPOINT_REFCLK_CNTRL */
> +#define EPCLK_ALWAYS_ON_EN                     BIT(6)


>
>  #define PHY_INIT_COMPLETE_TIMEOUT              10000
>
> @@ -77,6 +79,7 @@ enum qphy_reg_layout {
>         QPHY_START_CTRL,
>         QPHY_PCS_STATUS,
>         QPHY_PCS_POWER_DOWN_CONTROL,
> +       QPHY_PCS_ENDPOINT_REFCLK_CNTRL,
>         /* Keep last to ensure regs_layout arrays are properly initialized */
>         QPHY_LAYOUT_SIZE
>  };
> @@ -103,10 +106,11 @@ static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  };
>
>  static const unsigned int pciephy_v4_regs_layout[QPHY_LAYOUT_SIZE] = {
> -       [QPHY_SW_RESET]                 = QPHY_V4_PCS_SW_RESET,
> -       [QPHY_START_CTRL]               = QPHY_V4_PCS_START_CONTROL,
> -       [QPHY_PCS_STATUS]               = QPHY_V4_PCS_PCS_STATUS1,
> -       [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V4_PCS_POWER_DOWN_CONTROL,
> +       [QPHY_SW_RESET]                         = QPHY_V4_PCS_SW_RESET,
> +       [QPHY_START_CTRL]                       = QPHY_V4_PCS_START_CONTROL,
> +       [QPHY_PCS_STATUS]                       = QPHY_V4_PCS_PCS_STATUS1,
> +       [QPHY_PCS_POWER_DOWN_CONTROL]           = QPHY_V4_PCS_POWER_DOWN_CONTROL,

No unnecessary whitespace changes, please.

> +       [QPHY_PCS_ENDPOINT_REFCLK_CNTRL]        = QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_CNTRL,

Any other platform having this register?

>  };
>
>  static const unsigned int pciephy_v5_regs_layout[QPHY_LAYOUT_SIZE] = {
> @@ -2244,6 +2248,8 @@ struct qmp_pcie {
>         struct phy *phy;
>         int mode;
>
> +       bool refclk_always_on;
> +
>         struct clk_fixed_rate pipe_clk_fixed;
>  };
>
> @@ -3159,6 +3165,10 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
>         qmp_pcie_configure(pcs, tbls->pcs, tbls->pcs_num);
>         qmp_pcie_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
>
> +       if (qmp->refclk_always_on && cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL])
> +               qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL],
> +                            EPCLK_ALWAYS_ON_EN);
> +
>         if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
>                 qmp_pcie_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
>                 qmp_pcie_init_port_b(qmp, tbls);
> @@ -3681,6 +3691,9 @@ static int qmp_pcie_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_node_put;
>
> +       qmp->refclk_always_on = of_property_read_bool(dev->of_node,
> +                                                     "qcom,refclk-always-on");

Error out if !cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL]).
Otherwise your DT value can be silently ignored.

> +
>         ret = phy_pipe_clk_register(qmp, np);
>         if (ret)
>                 goto err_node_put;
>
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
