Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3075B20AD67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 09:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbgFZHjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 03:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgFZHjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 03:39:48 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E9FC08C5DB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:39:48 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k71so1148228pje.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/nB59vJ48fv87U3B6yJcF40xIb4v0oj8oAEKjmjc888=;
        b=YSB0stXVeMr/tlz9Y/djSeDqIImzfrQInj6tDo/eKjZf55KjkgoHK9l0HnSeZUFZL7
         UJb11FtKAREg0f+af/mLgj2XkZ+x1e1flUlSOwRdAjWyayvo5FNo/KPDk1p0Yqlcmhul
         Ht03BvE4bgestM471TTquJjKtYA5KqrCL3VNm9YuQJCagPucYTv1+6GOPTULPuiStrJX
         E6v2qiM7C6sGEqRRv0q5IAVLFTznvqdEfg/POCaycfr0JmRFlILMUSeSsdDaZKdxgrUe
         9mVV3X1kio/j2ZbSE7b++uSMtOUxNIdhZ7n1hOXkiQqRuasTv0jve3iMbGZs39kx7nzd
         /Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/nB59vJ48fv87U3B6yJcF40xIb4v0oj8oAEKjmjc888=;
        b=Mz9sE7v7TsOl6F3hTlW+bqXdxBSA9vyHtCE8hIGE45k9bpy00HwXyyQD9etJR+Av+z
         sc3uPSVNXVei16RtRqeq7iGxjiBf/pp//OloyGARDu81g7blccCtgVTtJt8qDzIK8JIE
         30nHCBRiG1wKy9WjZD+739B3umMe3eej2IYGm0qIpaDmIB9/39BAZG3oGMTa5PXGerOa
         /aVlHR3UKvsVMznt5JpR9cvooC3Ru/h103JFXcTmNUW3pG5YSdsUlVoUcZ3dsYGp7E5L
         4Jt5RH/Hner8cjzAXfHOWzEObXZF+UbEMxgidwJekJyw/keXu4fdRc2nGcQRdcH6tLAU
         IeCA==
X-Gm-Message-State: AOAM530WIrb/HM4DtnfoLE/JimaTdpQ3w4m5aqZpya3P3oZzhlstyg5s
        AZbXcdt4dBMA/LJO2LZK26Yhsczs7Us=
X-Google-Smtp-Source: ABdhPJwCdcrQHyLN/8ieNGMExZRkbKonxPkM0tXjUrW1wxgIXRqvdPEAT3sWRhhOvdwsycx1t0Vz9A==
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr1990273pjb.168.1593157188062;
        Fri, 26 Jun 2020 00:39:48 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d6sm3735555pfn.47.2020.06.26.00.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:39:47 -0700 (PDT)
Date:   Fri, 26 Jun 2020 00:37:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] phy: qcom-qmp: Add QMP V4 USB3 UNIPHY
Message-ID: <20200626073709.GF388985@builder.lan>
References: <20200524021416.17049-1-jonathan@marek.ca>
 <20200524021416.17049-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524021416.17049-3-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 May 19:14 PDT 2020, Jonathan Marek wrote:

> Add support for the USB3 PHY used by the secondary usb controller on sm8150
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

I've not reviewed the individual register listings, but the rest looks
good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 150 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h |   5 +
>  2 files changed, 155 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b3e07afca3ca..9367f8f793b5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -199,6 +199,17 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_START_CTRL]		= 0x44,
>  	[QPHY_PCS_STATUS]		= 0x14,
>  	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
> +	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x308,
> +	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x314,
> +};
> +
> +static const unsigned int qmp_v4_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
> +	[QPHY_SW_RESET]			= 0x00,
> +	[QPHY_START_CTRL]		= 0x44,
> +	[QPHY_PCS_STATUS]		= 0x14,
> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
> +	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x608,
> +	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x614,
>  };
>  
>  static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
> @@ -1413,6 +1424,114 @@ static const struct qmp_phy_init_tbl sm8150_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xea),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xea),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xca),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0xde),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x95),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x05),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0xb8),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x37),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xef),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb3),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x0b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0f),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +};
> +
>  /* struct qmp_phy_cfg - per-PHY initialization config */
>  struct qmp_phy_cfg {
>  	/* phy-type - PCIE/UFS/USB */
> @@ -2000,6 +2119,34 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
>  	.is_dual_lane_phy	= true,
>  };
>  
> +static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
> +	.tx_tbl			= sm8150_usb3_uniphy_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_tx_tbl),
> +	.rx_tbl			= sm8150_usb3_uniphy_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_rx_tbl),
> +	.pcs_tbl		= sm8150_usb3_uniphy_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_pcs_tbl),
> +	.clk_list		= qmp_v4_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v4_usb3_uniphy_regs_layout,
> +
> +	.start_ctrl		= SERDES_START | PCS_START,
> +	.pwrdn_ctrl		= SW_PWRDN,
> +
> +	.has_pwrdn_delay	= true,
> +	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> +	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
> +};
> +
>  static void qcom_qmp_phy_configure_lane(void __iomem *base,
>  					const unsigned int *regs,
>  					const struct qmp_phy_init_tbl tbl[],
> @@ -2774,6 +2921,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8150-qmp-usb3-phy",
>  		.data = &sm8150_usb3phy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8150-qmp-usb3-uni-phy",
> +		.data = &sm8150_usb3_uniphy_cfg,
>  	},
>  	{ },
>  };
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 6d017a0c0c8d..f39f7a968228 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -363,6 +363,7 @@
>  /* Only for QMP V4 PHY - TX registers */
>  #define QSERDES_V4_TX_RES_CODE_LANE_TX			0x34
>  #define QSERDES_V4_TX_RES_CODE_LANE_RX			0x38
> +#define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX 		0x3c
>  #define QSERDES_V4_TX_LANE_MODE_1			0x84
>  #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
>  #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
> @@ -709,6 +710,10 @@
>  #define QPHY_V4_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x354
>  #define QPHY_V4_PCS_USB3_TEST_CONTROL			0x358
>  
> +/* Only for QMP V4 PHY - UNI has 0x300 offset for PCS_USB3 regs */
> +#define QPHY_V4_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL	0x618
> +#define QPHY_V4_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2	0x638
> +
>  /* Only for QMP V4 PHY - PCS_MISC registers */
>  #define QPHY_V4_PCS_MISC_TYPEC_CTRL			0x00
>  #define QPHY_V4_PCS_MISC_TYPEC_PWRDN_CTRL		0x04
> -- 
> 2.26.1
> 
