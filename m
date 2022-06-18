Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA3C5504E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 14:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbiFRM6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 08:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235699AbiFRM6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 08:58:13 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C877175A8;
        Sat, 18 Jun 2022 05:58:01 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id t16so5013151qvh.1;
        Sat, 18 Jun 2022 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZqBnN1ULWkS8r0TpXSi8pL3fE266/CPUViRLMDHChM0=;
        b=kApQ44sW4dbVk/9UmY1iNwyz/fd+LcLJzRXUuP9riJ7FutgYyqtRTuQRdW9Nm0dg7a
         VbnfMR5WV+AgR4GkZYu/3QmAAzMPFNGKtsLx7gAol6JZoz/QTd2b5jYF6rkIL6r8Of6w
         NGWIWqHV6P4BFKgHT92dZEAGtvkJNa3P+HkxsznzBpebPWuyQt4ZyIAW4ha2gYpLAl2A
         dXphcp3JBFFeOH70DMVpX03QwStpAJexS85Lpe4V2EmleZAODSR5IOW4Lg/8WRaRmgJP
         fhpuCcXapzOXTyUOPvehzkWP6JCzUUXWJn++gKSwS2M0fogJh5jdZnZmaI1W9psDhgxi
         nS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZqBnN1ULWkS8r0TpXSi8pL3fE266/CPUViRLMDHChM0=;
        b=e2G/gwhDteOylOumI1HlOnE8dAraz8xcVGc+mVrVFwD0cvIEmMdgjpDSAZPnOu/jne
         KskBXusU1P4cqozgN8v3jfvG2zHQ7FycdFb09px1jvoTx9vr9Dxw0RVbr9bRZsnHEHDp
         fP+X5pfT15FpasDHg99+HC8fMx6JMX/zushbos/PEzh5UVZrzPB+IpaptoVKee0UP2xD
         IdkEW6Nn/HbdvpYUEcLmj9tzj8GQO0LsVtnxdLSQVhHCbozZQQkkHRZ/X0Bur2PhNamc
         dnaZw/TeZNiK0oES9moi0GC1PwFLzQdhH7lJRpwIor5h0vmxW/mSWhAycY9AxNtvKK2y
         VIcw==
X-Gm-Message-State: AJIora860J8BK/8faKQY0dcBF1yp52n+aLN5eov7n+5NyiYffxEfhUBo
        QwwV1auN8Y1Fuwf2NJlKbyDT2ILCcxbHhdjg8Ao=
X-Google-Smtp-Source: AGRyM1tJDht5ER1Hjl1iQSkq5zshVFtXS0ZMtgb7GRMk53cABr4aBHFPCMyR8WCCw9bSv4zdkLO1hJ/++KWs8BTW/uU=
X-Received: by 2002:a05:622a:144:b0:305:ad2:44f with SMTP id
 v4-20020a05622a014400b003050ad2044fmr12650363qtw.494.1655557080378; Sat, 18
 Jun 2022 05:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220531214420.916278-1-robimarko@gmail.com> <20220531214420.916278-2-robimarko@gmail.com>
 <YqvFOchsfapJWOfW@matsya>
In-Reply-To: <YqvFOchsfapJWOfW@matsya>
From:   Robert Marko <robimarko@gmail.com>
Date:   Sat, 18 Jun 2022 14:57:49 +0200
Message-ID: <CAOX2RU5zsDUHrxYSiLe7nf0P=q6LKpwSuVt12f50_BxyyDAHeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: add IPQ8074 PCIe Gen3 QMP PHY support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, kishon@ti.com,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        Devicetree List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Jun 2022 at 02:05, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 31-05-22, 23:44, Robert Marko wrote:
> > IPQ8074 has 2 different single lane PCIe PHY-s, one Gen2 and one Gen3.
> > Gen2 one is already supported, so add the support for the Gen3 one.
> > It uses the same register layout as IPQ6018.
>
> This needs rebase on split up phy driver.

Yeah, will do it now as the PHY driver was split.

Regards,
Robert
>
>
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 173 +++++++++++++++++++++++++++-
> >  1 file changed, 171 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index b144ae1f729a..7a12c5a92c48 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -824,6 +824,133 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_pcs_tbl[] = {
> >       QMP_PHY_INIT_CFG_L(QPHY_START_CTRL, 0x3),
> >  };
> >
> > +static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_serdes_tbl[] = {
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x31),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x01),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_MAP, 0x04),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER1, 0xff),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER2, 0x3f),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x30),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x21),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x82),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE0, 0x03),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE0, 0x355),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE0, 0x35555),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x1a),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0x1a0a),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0xb),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x16),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x28),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x0),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0x40),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x20),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV, 0xa),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x32),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x02),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x08),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0xa),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x1),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x68),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE1, 0x2),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE1, 0x2aa),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE1, 0x2aaab),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x34),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0x3414),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x0b),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x16),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x28),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x0),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0x40),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x0),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE0, 0x19),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE1, 0x28),
> > +     QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_tx_tbl[] = {
> > +     QMP_PHY_INIT_CFG(QSERDES_TX0_RES_CODE_LANE_OFFSET_TX, 0x02),
> > +     QMP_PHY_INIT_CFG(QSERDES_TX0_RCV_DETECT_LVL_2, 0x12),
> > +     QMP_PHY_INIT_CFG(QSERDES_TX0_HIGHZ_DRVR_EN, 0x10),
> > +     QMP_PHY_INIT_CFG(QSERDES_TX0_LANE_MODE_1, 0x06),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_rx_tbl[] = {
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_CNTRL, 0x03),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_ENABLES, 0x1c),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_DEGLITCH_CNTRL, 0x14),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL2, 0xe),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL3, 0x4),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL4, 0x1b),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_DFE_EN_TIMER, 0x04),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_PI_CONTROLS, 0x70),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_LOW, 0x00),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH, 0x02),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH2, 0xc8),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH3, 0x09),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH4, 0xb1),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_LOW, 0x01),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH, 0x02),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH2, 0xc8),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH3, 0x09),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH4, 0xb1),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_LOW, 0xf0),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH, 0x2),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH2, 0x2f),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH3, 0xd3),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH4, 0x40),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_HIGH, 0x00),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_LOW, 0xc0),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_FO_GAIN, 0x0c),
> > +     QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_GAIN, 0x02),
> > +};
> > +
> > +static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_tbl[] = {
> > +     QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL2, 0x83),
> > +     QMP_PHY_INIT_CFG(PCS_COM_FLL_CNT_VAL_L, 0x9),
> > +     QMP_PHY_INIT_CFG(PCS_COM_FLL_CNT_VAL_H_TOL, 0x42),
> > +     QMP_PHY_INIT_CFG(PCS_COM_FLL_MAN_CODE, 0x40),
> > +     QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL1, 0x01),
> > +     QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_H, 0x0),
> > +     QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x1),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_ACTIONS, 0x0),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG1, 0x11),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG2, 0xb),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_CONFIG2, 0x52),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG2, 0x50),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG4, 0x1a),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x6),
> > +     QMP_PHY_INIT_CFG(PCS_COM_G12S1_TXDEEMPH_M3P5DB, 0x10),
> > +     QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
> > +     QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
> > +     QMP_PHY_INIT_CFG(PCS_COM_RX_SIGDET_LVL, 0xaa),
> > +     QMP_PHY_INIT_CFG(PCS_COM_REFGEN_REQ_CONFIG1, 0x0d),
> > +};
> > +
> >  static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
> >       QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
> >       QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> > @@ -3493,6 +3620,36 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
> >       .pwrdn_delay_max        = 1005,         /* us */
> >  };
> >
> > +static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
> > +     .type                   = PHY_TYPE_PCIE,
> > +     .nlanes                 = 1,
> > +
> > +     .serdes_tbl             = ipq8074_pcie_gen3_serdes_tbl,
> > +     .serdes_tbl_num         = ARRAY_SIZE(ipq8074_pcie_gen3_serdes_tbl),
> > +     .tx_tbl                 = ipq8074_pcie_gen3_tx_tbl,
> > +     .tx_tbl_num             = ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
> > +     .rx_tbl                 = ipq8074_pcie_gen3_rx_tbl,
> > +     .rx_tbl_num             = ARRAY_SIZE(ipq8074_pcie_gen3_rx_tbl),
> > +     .pcs_tbl                = ipq8074_pcie_gen3_pcs_tbl,
> > +     .pcs_tbl_num            = ARRAY_SIZE(ipq8074_pcie_gen3_pcs_tbl),
> > +     .clk_list               = ipq8074_pciephy_clk_l,
> > +     .num_clks               = ARRAY_SIZE(ipq8074_pciephy_clk_l),
> > +     .reset_list             = ipq8074_pciephy_reset_l,
> > +     .num_resets             = ARRAY_SIZE(ipq8074_pciephy_reset_l),
> > +     .vreg_list              = NULL,
> > +     .num_vregs              = 0,
> > +     .regs                   = ipq_pciephy_gen3_regs_layout,
> > +
> > +     .start_ctrl             = SERDES_START | PCS_START,
> > +     .pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
> > +
> > +     .has_phy_com_ctrl       = false,
> > +     .has_lane_rst           = false,
> > +     .has_pwrdn_delay        = true,
> > +     .pwrdn_delay_min        = 995,          /* us */
> > +     .pwrdn_delay_max        = 1005,         /* us */
> > +};
> > +
> >  static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
> >       .type                   = PHY_TYPE_PCIE,
> >       .nlanes                 = 1,
> > @@ -5568,6 +5725,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
> >  {
> >       struct clk_fixed_rate *fixed;
> >       struct clk_init_data init = { };
> > +     u32 rate;
> >       int ret;
> >
> >       ret = of_property_read_string(np, "clock-output-names", &init.name);
> > @@ -5582,8 +5740,16 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
> >
> >       init.ops = &clk_fixed_rate_ops;
> >
> > -     /* controllers using QMP phys use 125MHz pipe clock interface */
> > -     fixed->fixed_rate = 125000000;
> > +     /*
> > +      * Controllers using QMP PHY-s use 125MHz pipe clock interface
> > +      * unless other frequency is specified in the DTS.
> > +      */
> > +     ret = of_property_read_u32(np, "clock-output-rate", &rate);
> > +     if (ret)
> > +             fixed->fixed_rate = 125000000;
> > +     else
> > +             fixed->fixed_rate = rate;
> > +
> >       fixed->hw.init = &init;
> >
> >       ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
> > @@ -5959,6 +6125,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
> >       }, {
> >               .compatible = "qcom,ipq8074-qmp-pcie-phy",
> >               .data = &ipq8074_pciephy_cfg,
> > +     }, {
> > +             .compatible = "qcom,ipq8074-qmp-gen3-pcie-phy",
> > +             .data = &ipq8074_pciephy_gen3_cfg,
> >       }, {
> >               .compatible = "qcom,ipq6018-qmp-pcie-phy",
> >               .data = &ipq6018_pciephy_cfg,
> > --
> > 2.36.1
>
> --
> ~Vinod
