Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D226E780F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 13:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjDSLHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 07:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjDSLHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 07:07:47 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C326F6EAD
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 04:07:45 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-54f21cdfadbso444155887b3.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 04:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681902465; x=1684494465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/9Ddcy28AQvgkYKDUWdOvB6YfbaMyaHlxkJl7KwWfDY=;
        b=l51RaSDNen29BvZ4wsxn6mP3IzAAGLMo1pjRCVRrNjrX/l6X5JGCVrbVSn7k0iV9qW
         ySDuPHCT/iTPA/DwfHCd043jTHVbysDsqNeQ7BY/I2bX+ES2NtCeoFxKcgBO8cIX+axv
         ovTJc6GWRQQKTK83oueQ/oERSrPjwpiHOARJzp5hdtU5+4TP+R5ysg5uQ2Bxx7BQ0uqm
         uWgVJ4Wo8BXYZFNSZIZAFv59IAuMtycwwgoHFal2jFBQYppTeuWM9iWtiCt1VrYjhMIH
         y4NaDbgXX4x6JbJDwuJMfSQujGtlGSeRCv7jeWvjVcDdX62rOEtMozCvStvgTz52I21l
         6Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902465; x=1684494465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9Ddcy28AQvgkYKDUWdOvB6YfbaMyaHlxkJl7KwWfDY=;
        b=loKKgY8A5Bj6UHmbcqdg3vGKmOthX0LlPkFHeQJ70R0L/hvVVPdk6pexK02/b+uND1
         G3qlnhTMMiMirxVXibO3M5MEsDQX5bh/0/btw+hdbg7ASOhocKdn8Co3QxA/EZ/wcTi6
         Zzgdr+JfgKEhA1yzwy7tKYWMXS9nO2mswV6ceFyWh0zFO4lUHssz9VAQgcZg9hGQhxf2
         6O9MbEn4nyqRoJISVvzNlXnhXmzjrns6dPqZT4NcpXhY/nTE7v2QJkFwglLoqu/ybdoj
         wf4zFsWAu0g7qEBLE/mgRhfIiB49orBDr6KwszQ2Fsb9dOcGbjcyviRQHTNtx5ppH1KS
         AMCw==
X-Gm-Message-State: AAQBX9cAU4vFQi2ewrgnlcxx6F+OTe1Uzu5iBeR+S9TOmdv7m+EhsD7L
        tKU2jCLYsfQSIVdCWMvLyhkBPUVyfBoK0tJNxWcQwQ==
X-Google-Smtp-Source: AKy350bV/FU6PgqfAJS+Si54A+i2xqPl7MusskZwg/guLRpeJO/sQP6AtVhr8dqMUbekAzagk7flXPpDjvWhKbvXPJs=
X-Received: by 2002:a81:8701:0:b0:54e:ffbd:7a7e with SMTP id
 x1-20020a818701000000b0054effbd7a7emr2906584ywf.45.1681902464961; Wed, 19 Apr
 2023 04:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230414205425.3878902-1-dmitry.baryshkov@linaro.org> <999af225-2f21-0cf5-0292-3c5afa332121@linaro.org>
In-Reply-To: <999af225-2f21-0cf5-0292-3c5afa332121@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 19 Apr 2023 14:07:34 +0300
Message-ID: <CAA8EJpq0Xe+ycNj6wuCyRdLCW7J5XgUJrSjqtHFkNFXhQvZ-Fw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qmp-pcie: correct sm8350 PHY tables
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Apr 2023 at 13:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 14.04.2023 22:54, Dmitry Baryshkov wrote:
> > Correct sm8350 PCIe PHY tables according to the vendor dtsi file.
> > This accounts some additional differences between PHY programming on
> > sm8350 and sm8450.
> >
> > The name for the PCS register 0x8 is not present in the vendor kernels,
> > but since on other generations the register prior to POWER_STATE_CONFIG2
> > is called POWER_STATE_CONFIG1, we can establish that as its name.
> >
> > Fixes: c70052739d16 ("phy: qcom-qmp-pcie: add support for sm8350 platform")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Are you referencing the entries in lahaina-2.1.dtsi?

Let me double check it. I had this patch for quite some time in my tree.

>
> [...]
>
> > +static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_pcs_tbl[] = {
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0xa8),
> e.g. my downstream says 0x77 here
>
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_RATE_SLEW_CNTRL1, 0x0b),
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x05),
>
> Konrad
>
> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_pcs_misc_tbl[] = {
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG2, 0x0f),
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG1, 0x0f),
> > +     QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_serdes_tbl[] = {
> > +     QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
> >  };
> >
> >  static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_rx_tbl[] = {
> > @@ -2325,15 +2349,15 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x1_pciephy_cfg = {
> >               .tx_num         = ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_tx_tbl),
> >               .rx             = sm8450_qmp_gen3_pcie_rx_tbl,
> >               .rx_num         = ARRAY_SIZE(sm8450_qmp_gen3_pcie_rx_tbl),
> > -             .pcs            = sm8450_qmp_gen3_pcie_pcs_tbl,
> > -             .pcs_num        = ARRAY_SIZE(sm8450_qmp_gen3_pcie_pcs_tbl),
> > -             .pcs_misc       = sm8450_qmp_gen3x1_pcie_pcs_misc_tbl,
> > -             .pcs_misc_num   = ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_misc_tbl),
> > +             .pcs            = sm8350_qmp_gen3x1_pcie_pcs_tbl,
> > +             .pcs_num        = ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_pcs_tbl),
> > +             .pcs_misc       = sm8350_qmp_gen3x1_pcie_pcs_misc_tbl,
> > +             .pcs_misc_num   = ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_pcs_misc_tbl),
> >       },
> >
> >       .tbls_rc = &(const struct qmp_phy_cfg_tbls) {
> > -             .serdes         = sm8450_qmp_gen3x1_pcie_rc_serdes_tbl,
> > -             .serdes_num     = ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rc_serdes_tbl),
> > +             .serdes         = sm8350_qmp_gen3x1_pcie_rc_serdes_tbl,
> > +             .serdes_num     = ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_serdes_tbl),
> >               .rx             = sm8350_qmp_gen3x1_pcie_rc_rx_tbl,
> >               .rx_num         = ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_rx_tbl),
> >       },
> > @@ -2369,6 +2393,8 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x2_pciephy_cfg = {
> >       },
> >
> >       .tbls_rc = &(const struct qmp_phy_cfg_tbls) {
> > +             .serdes         = sm8350_qmp_gen3x2_pcie_rc_serdes_tbl,
> > +             .serdes_num     = ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_serdes_tbl),
> >               .rx             = sm8350_qmp_gen3x2_pcie_rc_rx_tbl,
> >               .rx_num         = ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_rx_tbl),
> >               .pcs            = sm8350_qmp_gen3x2_pcie_rc_pcs_tbl,
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
> > index a469ae2a10a1..ea466e14ca12 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
> > @@ -8,6 +8,7 @@
> >  #define QCOM_PHY_QMP_PCS_PCIE_V5_H_
> >
> >  /* Only for QMP V5 PHY - PCS_PCIE registers */
> > +#define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG1         0x08
> >  #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG2         0x0c
> >  #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG4         0x14
> >  #define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE               0x20



-- 
With best wishes
Dmitry
