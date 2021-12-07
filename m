Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D8946BDB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 15:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbhLGOcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 09:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbhLGOcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 09:32:46 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2287C061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 06:29:15 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso18362253otf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 06:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8qjP+pEwrVWW8ojpY+aChkI82zJfRTztR+mOskZJx4w=;
        b=pTBDgV9oTmZu2RTmq6EWV4lOz8mUmKPEtyvPPdouMu0OMBI6HFwLiKoOSoKHE2kqZP
         7hFaOYMTABtlm0DioJivWaz5FRiPGOBveKM+aiQXjyvhN3fFxHa6FqwlocKqOZbxEbar
         33cM9F+XLhDekdnfk8Qh14Ck6jhOLlW5ucTR2RLvcWRtBFnxRZae1IHJ58hwTfeTThJB
         8omkw+hN1zpbm/WbDXrnpxDWAPTFPFNLpRRf+L5nhneE9dBVUMZ9l6TyXubrBQA1uzoA
         9Idj+WOhlUyt1RcEeuOhKLTCC1aDBijmxzL5Z495ONaXyjUFthNNRzgwhl2NiURGhCRe
         hr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8qjP+pEwrVWW8ojpY+aChkI82zJfRTztR+mOskZJx4w=;
        b=tWTl5pp0+BeZOEh9pPiXdEnN+DrtEwAkBbJA8DgiLQurwWmVqSE3D3KTkaUgakULAa
         Dz/jmeM1T4KAQw4BsF/bD3obw/uz2bucQrOt8tzPyvV9YlCytD1habYs0Bc2bRmQkjuF
         toPpjF8ds2UcexhzIhDQ9diGLW9QecuHliaz8n5R/HhLtVnckpZMQy2XamIa973WNEuH
         Ye8+oKu/Z8SjNFd/g7GAEZPrA4+dz2L81wNfyjfhNMYNdwQCZNjFMyasUXOB0uRlNCjz
         lWxb/odON7bh2NBZYrlTK1YvxCofotpH+BZPVDTSkq1FmrvQhrZ8+6TjJ26CGYUjZnye
         1g7A==
X-Gm-Message-State: AOAM531cpSYMCVMeb1MVwD9upkJL2u3D26JN3C1BofdDiY6nsuKX4VLy
        8cEWg8saTsUNp5VRq02EEOwfBh9eta98oA==
X-Google-Smtp-Source: ABdhPJzEFtpD24P8pyEUcamyKdaxq1OKXW7Y79lQjUNmokEXlQMK5qKSYqUp50lucIw3Mhxw1GxW3w==
X-Received: by 2002:a9d:12c:: with SMTP id 41mr35950380otu.322.1638887355096;
        Tue, 07 Dec 2021 06:29:15 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w24sm2753175ots.10.2021.12.07.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 06:29:14 -0800 (PST)
Date:   Tue, 7 Dec 2021 06:30:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Wilczy??ski <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 03/10] phy: qcom-qmp: Add SM8450 PCIe0 PHY support
Message-ID: <Ya9wD5gxEIRxJzOv@ripper>
References: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
 <20211202141726.1796793-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202141726.1796793-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Dec 06:17 PST 2021, Dmitry Baryshkov wrote:

> There are two different PCIe PHYs on SM8450, one having one lane (v5)
> and another with two lanes (v5.20). This commit adds support for the
> first PCIe phy only, support for the second PCIe PHY is coming in next
> commits.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 125 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h |  33 ++++++++
>  2 files changed, 158 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index a959c97a699f..22e95de6d7a2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2866,6 +2866,97 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8450_qmp_pcie_serdes_tbl[] = {

I presume these tables will differ for the other instance, so would it
perhaps be useful to include "gen3x1" in the name of these arrays?

Regards,
Bjorn

> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_SELECT, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CORECLK_DIV_MODE1, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP_EN, 0x42),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE1_MODE0, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE2_MODE1, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE1_MODE1, 0xb4),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DIV_FRAC_START3_MODE0, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DIV_FRAC_START2_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x68),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DIV_FRAC_START3_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DIV_FRAC_START2_MODE1, 0xaa),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DIV_FRAC_START1_MODE1, 0xab),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xa2),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_BUF_ENABLE, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_EN_CENTER, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_PER1, 0x31),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_PER2, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE1_MODE0, 0xde),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE2_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE1_MODE1, 0x4c),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE2_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8450_qmp_pcie_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x75),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x04),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8450_qmp_pcie_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xbf),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xd8),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa6),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH4, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf0),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_TX_ADAPT_POST_THRESH, 0xf0),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x09),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8450_qmp_pcie_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0x77),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RATE_SLEW_CNTRL1, 0x0b),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x05),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8450_qmp_pcie_pcs_misc_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG2, 0x0f),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
> +};
> +
>  struct qmp_phy;
>  
>  /* struct qmp_phy_cfg - per-PHY initialization config */
> @@ -4116,6 +4207,37 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
>  	.is_dual_lane_phy	= true,
>  };
>  
> +static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
> +	.type = PHY_TYPE_PCIE,
> +	.nlanes = 1,
> +
> +	.serdes_tbl		= sm8450_qmp_pcie_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8450_qmp_pcie_serdes_tbl),
> +	.tx_tbl			= sm8450_qmp_pcie_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8450_qmp_pcie_tx_tbl),
> +	.rx_tbl			= sm8450_qmp_pcie_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8450_qmp_pcie_rx_tbl),
> +	.pcs_tbl		= sm8450_qmp_pcie_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8450_qmp_pcie_pcs_tbl),
> +	.pcs_misc_tbl		= sm8450_qmp_pcie_pcs_misc_tbl,
> +	.pcs_misc_tbl_num	= ARRAY_SIZE(sm8450_qmp_pcie_pcs_misc_tbl),
> +	.clk_list		= sdm845_pciephy_clk_l,
> +	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
> +	.reset_list		= sdm845_pciephy_reset_l,
> +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= sm8250_pcie_regs_layout,
> +
> +	.start_ctrl             = SERDES_START | PCS_START,
> +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
> +
> +	.has_pwrdn_delay	= true,
> +	.pwrdn_delay_min	= 995,		/* us */
> +	.pwrdn_delay_max	= 1005,		/* us */
> +};
> +
>  static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>  	.type			= PHY_TYPE_USB3,
>  	.nlanes			= 1,
> @@ -5774,6 +5896,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8350-qmp-usb3-uni-phy",
>  		.data = &sm8350_usb3_uniphy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8450-qmp-gen3x1-pcie-phy",
> +		.data = &sm8450_qmp_gen3x1_pciephy_cfg,
>  	}, {
>  		.compatible = "qcom,sm8450-qmp-ufs-phy",
>  		.data = &sm8450_ufsphy_cfg,
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index e15f461065bb..08422037f81b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -1069,6 +1069,15 @@
>  #define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x828
>  
>  /* Only for QMP V5 PHY - QSERDES COM registers */
> +#define QSERDES_V5_COM_SSC_EN_CENTER			0x010
> +#define QSERDES_V5_COM_SSC_PER1				0x01c
> +#define QSERDES_V5_COM_SSC_PER2				0x020
> +#define QSERDES_V5_COM_SSC_STEP_SIZE1_MODE0		0x024
> +#define QSERDES_V5_COM_SSC_STEP_SIZE2_MODE0		0x028
> +#define QSERDES_V5_COM_SSC_STEP_SIZE1_MODE1		0x030
> +#define QSERDES_V5_COM_SSC_STEP_SIZE2_MODE1		0x034
> +#define QSERDES_V5_COM_CLK_ENABLE1			0x048
> +#define QSERDES_V5_COM_SYSCLK_BUF_ENABLE		0x050
>  #define QSERDES_V5_COM_PLL_IVCO				0x058
>  #define QSERDES_V5_COM_CP_CTRL_MODE0			0x074
>  #define QSERDES_V5_COM_CP_CTRL_MODE1			0x078
> @@ -1084,10 +1093,22 @@
>  #define QSERDES_V5_COM_DEC_START_MODE0			0x0bc
>  #define QSERDES_V5_COM_LOCK_CMP2_MODE1			0x0b8
>  #define QSERDES_V5_COM_DEC_START_MODE1			0x0c4
> +#define QSERDES_V5_COM_DIV_FRAC_START1_MODE0		0x0cc
> +#define QSERDES_V5_COM_DIV_FRAC_START2_MODE0		0x0d0
> +#define QSERDES_V5_COM_DIV_FRAC_START3_MODE0		0x0d4
> +#define QSERDES_V5_COM_DIV_FRAC_START1_MODE1		0x0d8
> +#define QSERDES_V5_COM_DIV_FRAC_START2_MODE1		0x0dc
> +#define QSERDES_V5_COM_DIV_FRAC_START3_MODE1		0x0e0
>  #define QSERDES_V5_COM_VCO_TUNE_MAP			0x10c
> +#define QSERDES_V5_COM_VCO_TUNE1_MODE0			0x110
> +#define QSERDES_V5_COM_VCO_TUNE2_MODE0			0x114
> +#define QSERDES_V5_COM_VCO_TUNE1_MODE1			0x118
> +#define QSERDES_V5_COM_VCO_TUNE2_MODE1			0x11c
>  #define QSERDES_V5_COM_VCO_TUNE_INITVAL2		0x124
> +#define QSERDES_V5_COM_CLK_SELECT			0x154
>  #define QSERDES_V5_COM_HSCLK_SEL			0x158
>  #define QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL		0x15c
> +#define QSERDES_V5_COM_CORECLK_DIV_MODE1		0x16c
>  #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
>  #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
>  #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
> @@ -1130,6 +1151,7 @@
>  #define QSERDES_V5_RX_AC_JTAG_ENABLE			0x068
>  #define QSERDES_V5_RX_AC_JTAG_MODE			0x078
>  #define QSERDES_V5_RX_RX_TERM_BW			0x080
> +#define QSERDES_V5_RX_TX_ADAPT_POST_THRESH		0x0cc
>  #define QSERDES_V5_RX_VGA_CAL_CNTRL1			0x0d4
>  #define QSERDES_V5_RX_VGA_CAL_CNTRL2			0x0d8
>  #define QSERDES_V5_RX_GM_CAL				0x0dc
> @@ -1167,6 +1189,17 @@
>  #define QSERDES_V5_RX_DCC_CTRL1				0x1a8
>  #define QSERDES_V5_RX_VTH_CODE				0x1b0
>  
> +/* Only for QMP V5 PHY - USB/PCIe PCS registers */
> +#define QPHY_V5_PCS_REFGEN_REQ_CONFIG1			0x0dc
> +#define QPHY_V5_PCS_RX_SIGDET_LVL			0x188
> +#define QPHY_V5_PCS_RATE_SLEW_CNTRL1			0x198
> +
> +/* Only for QMP V5 PHY - PCS_PCIE registers */
> +#define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x20
> +#define QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x54
> +#define QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS		0x94
> +#define QPHY_V5_PCS_PCIE_EQ_CONFIG2			0xa8
> +
>  /* Only for QMP V5 PHY - UFS PCS registers */
>  #define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
>  #define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
> -- 
> 2.33.0
> 
