Return-Path: <linux-arm-msm+bounces-38221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D01159D0FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 12:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FF4EB23F79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2228198A11;
	Mon, 18 Nov 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/gt8AwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDCD198A33
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928509; cv=none; b=Wj2IJdk9kd2DSPwEXBNdfEca8NrZ/CGaGXP0i+dnyWkGAOT/MU0wixNya1phnE5gftMIQ5sF0/5o91k5ycUOEh0Huy+H9u6ILOD2c3Hd4zo4HeMDRLfMBXziqVJtaZdjvU/15xsi95NusLghxveKHOg9/Yrb/pS8ynRvIsqpHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928509; c=relaxed/simple;
	bh=sJUTlnBSwsG8OmoEj9g6GSrcQrO4OkMEGLeEOJAWU6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYfFF4VlXgcyKTz+W5/LtcY/Ua5sWqe6/kbdnDO3C98vPtSIgmaNqsyD2KYySlAKJtCVXcbA+rAIieApQ78tdn+NbG9MxnfVtith7+nKr4dbjDuHA4/cqdrLVlGM9W23d8U/POs/X3MtLWF4XAcg0acV9BIbxYi81vhHYvdhYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/gt8AwZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53da3b911b9so3206285e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 03:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731928506; x=1732533306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ueCD+q2zQmY/7YkNPGnLJZ4H8YDacRal4x3H4VT+8ig=;
        b=W/gt8AwZvjHOwjAXmJGBPG2W1zq3nKan6YII2E1Ih+m9bQ3+dNlt4f8O0i60kawQDt
         A7e8s/P6wydG71kfGbDrchwMvHNTu2j0o/E9HG9tW5emqnngElDqZNlec/e6X8p/9H4p
         TRvgCjoi7NK/4bZbFNWRv6o/CPjUtuS5ASwjDnXiWcaXqXmv42mZF3vUiCCEJ34ji+g7
         ZOW2U/0jYL8rqzwCTar7Mm0mknuNXFwfu8E4Bwr3X4OhYfK9A/kACFCDFhNe5SHa2SI4
         gu6ayKtUXLqG7/6xIHF1ijLmTcUlRlkkBXhkFw7y/WyIKevYp05empsuma5gjXo2UPQK
         yTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928506; x=1732533306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueCD+q2zQmY/7YkNPGnLJZ4H8YDacRal4x3H4VT+8ig=;
        b=h04kNeFa2DayQNAbqRlQEJCXhtNVryWHGm4pHLFCGG/iR3Pm2FMEG/TH74ejk1MhXq
         pTDHLz/S3hnrB/j6LrLSut3iEty6N4oKzyNq2uoIycbAKLVK4/D4LtxP/cs8oM6EOMlp
         FDdUvFzVA7ZV4pvXM+g8wU1aNhspu6hM1I3BlVDt69vKdH9rqNb014puAvrBJmZEtO7p
         fqAkqmyU1vcJaqklexn2XdRPMpThatz7JG3eWEpQ8pJAGSqJIGWFGeiF3psqcLxgqK/H
         LnP+0QEUzSehX/94yasGLm6HVF2DsPqtizIUi6S7TEhBV2zW+Ofe9DkZZuDPvSPXKCN7
         HNMA==
X-Forwarded-Encrypted: i=1; AJvYcCXsCCMgid1IByUWHnG3IrsghBb7evplrj8NXxgPia3j4WZcAaHWWjC5mt/ZH20cxmG+NikF3uH2v+W31mmS@vger.kernel.org
X-Gm-Message-State: AOJu0YyIn3Ru3UAMfsQ91yflbA4fnqSuVswMMWwvHEblayEfRP3locSX
	w7s++X6DQyNXdN9+Xi6zHbPOgqnpvWFm0OtOpmUoE1AZ3DHD5tpn4pZQYU1fqqI=
X-Google-Smtp-Source: AGHT+IEUgWujqarYJLRGIXqX4efB6WP1xJ2RKrxxUOdVOeuS9AsGg98BIlDWVAaoRlKSwDHri4RUnw==
X-Received: by 2002:ac2:4bc1:0:b0:539:8fcd:524 with SMTP id 2adb3069b0e04-53dab2a6af0mr4788179e87.30.1731928505602;
        Mon, 18 Nov 2024 03:15:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653e19csm1575151e87.199.2024.11.18.03.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 03:15:04 -0800 (PST)
Date: Mon, 18 Nov 2024 13:15:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH 2/5] phy: qcom: qmp: Add phy register and clk setting for
 QCS615 PCIe
Message-ID: <2rygkimclano4hcgf5vaz7eyuhcqdal5ybnh5eyci3ig2b5jcl@sq5ygemgdhwr>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-3-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118082619.177201-3-quic_ziyuzhan@quicinc.com>

On Mon, Nov 18, 2024 at 04:26:16PM +0800, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add support for GEN3 x1 PCIe PHY found on Qualcomm QCS615 platform.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 105 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h |   1 +
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index f71787fb4d7e..df82f95a1fa2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -726,6 +726,83 @@ static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_pcs_misc_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
>  };
>  
> +static const struct qmp_phy_init_tbl qcs615_pcie_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0xf),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x1),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x0),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x6),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0xf),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x0),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x1),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0xa),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x9),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x4),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x3),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x0),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0xD),

lowercase the hex. LGTM otherwise.


> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x35),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x2),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x4),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x0),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CTRL_BY_PSM, 0x1),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0xa),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x1),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x1),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x2),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x0),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x19),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_EP_DIV, 0x19),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_pcie_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x1),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x0),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x4),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN_HALF, 0x4),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_pcie_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
> +	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x6),
> +	QMP_PHY_INIT_CFG(QSERDES_TX_RES_CODE_LANE_OFFSET, 0x2),
> +	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_pcie_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE, 0x4),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_OSC_DTCT_ACTIONS, 0x0),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x40),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x0),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB, 0x40),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB, 0x0),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x40),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME, 0x73),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_SIGDET_CNTRL, 0x7),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SIGDET_LVL, 0x99),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M6DB_V0, 0x15),
> +	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0, 0xe),
> +};
> +
>  static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
>  	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> @@ -2963,6 +3040,31 @@ static const struct qmp_phy_cfg ipq9574_gen3x2_pciephy_cfg = {
>  	.pipe_clock_rate	= 250000000,
>  };
>  
> +static const struct qmp_phy_cfg qcs615_pciephy_cfg = {
> +	.lanes			= 1,
> +
> +	.offsets		= &qmp_pcie_offsets_v2,
> +
> +	.tbls = {
> +		.serdes		= qcs615_pcie_serdes_tbl,
> +		.serdes_num	= ARRAY_SIZE(qcs615_pcie_serdes_tbl),
> +		.tx		= qcs615_pcie_tx_tbl,
> +		.tx_num		= ARRAY_SIZE(qcs615_pcie_tx_tbl),
> +		.rx		= qcs615_pcie_rx_tbl,
> +		.rx_num		= ARRAY_SIZE(qcs615_pcie_rx_tbl),
> +		.pcs		= qcs615_pcie_pcs_tbl,
> +		.pcs_num	= ARRAY_SIZE(qcs615_pcie_pcs_tbl),
> +	},
> +	.reset_list		= sdm845_pciephy_reset_l,
> +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= pciephy_v2_regs_layout,
> +
> +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS,
> +};
> +
>  static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
>  	.lanes			= 1,
>  
> @@ -4400,6 +4502,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,msm8998-qmp-pcie-phy",
>  		.data = &msm8998_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,qcs615-qmp-gen3x1-pcie-phy",
> +		.data = &qcs615_pciephy_cfg,
>  	}, {
>  		.compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy",
>  		.data = &sa8775p_qmp_gen4x2_pciephy_cfg,
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
> index bf36399d0057..1ecf4b5beba6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
> @@ -34,6 +34,7 @@
>  #define QPHY_V2_PCS_USB_PCS_STATUS			0x17c /* USB */
>  #define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB	0x1a8
>  #define QPHY_V2_PCS_OSC_DTCT_ACTIONS			0x1ac
> +#define QPHY_V2_PCS_SIGDET_CNTRL			0x1b0
>  #define QPHY_V2_PCS_RX_SIGDET_LVL			0x1d8
>  #define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
>  #define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

