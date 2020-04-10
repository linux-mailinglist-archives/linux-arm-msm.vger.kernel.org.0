Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434581A4BD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 00:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgDJWSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 18:18:10 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33014 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgDJWSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 18:18:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id c138so1607818pfc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 15:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eg7KB2UmJiacn5HMhVr3STCxlXC7Ncdbl28teyA/qnE=;
        b=RF5Go9aJ2nuQ4sJRdmrw+wT5SZwrNy/InkqPYjDgpYTW2iSw1VH+4Jv+JF6QAeMePV
         K/Hv+YvYhCqz0c8xAbzjbedG9Z/FrERSQmzjx0c1aTJJojWrAn0lIvqEdF1Af4oOArqn
         SjtCA39xxKgApKVTqoPk8c56zrxfw0MiFRYW4BB70wsIUMGuTFR5kZtTWO2Un4WpJYOW
         fdqHAlIbGHi/nggKl50By9FBuNfsGVU7uo9Dye7dSMUCvuLoPSTn7ElqOww1i2jrVqrS
         qYn1Tez4IB9MU1lxkE70v3VZna2OTUQLCKtp3C9e6YGrwMMUPe3xgQb0TjvsUwFhyilx
         LpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eg7KB2UmJiacn5HMhVr3STCxlXC7Ncdbl28teyA/qnE=;
        b=gjouPoAmWGTMrDT6NzrXlVyOv8JTKdbaWjvBlv7uf9MOdDi2yzbk27K+O1LF2j4Fv+
         y4H5trUy+icx4h+DhXToSBqQ5+Lr46Ls9M3puqrxZco6tNhCM9NH1m11bdhhPTzlyWjP
         2kbWxWcr6Qpho9onX4WPhxcoI7/er0VhPASSD6kZofevX6U887RJp/8WJfn9jS/knQCN
         S9qRHhBV0NNZ0VyMxBcdNyIr3Do8sCbeUJHJpKEZsFbmsNm7mhexhNF/+GvmXQOmv6AP
         Zl9QbLBGsKV8f4QxICJtmcfD7cXxVtOkhgbIzcJgV6a/vY1gXkBPJu52AcSPyLsOeUQd
         Ee8g==
X-Gm-Message-State: AGi0PuYCJbj30USnONP7+HyktYHzkeMJMXhALGNFTBKNwxXefzc7Pmr2
        /juFdPLYpJZ9J4LPW0seKdr+4Q==
X-Google-Smtp-Source: APiQypKuGog96mc6Yc47EvysrBnEd7V/DVsXoRgNLK+vUHBherAsLMJ/s5zJhZVcB+q1LdTVeX7W6w==
X-Received: by 2002:a63:8c51:: with SMTP id q17mr6606761pgn.320.1586557088739;
        Fri, 10 Apr 2020 15:18:08 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g4sm2629429pfb.169.2020.04.10.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:18:08 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:18:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH 2/3] phy: qcom-qmp: Add USB QMP PHY support for IPQ8074
Message-ID: <20200410221818.GE20625@builder.lan>
References: <1586543372-13969-1-git-send-email-sivaprak@codeaurora.org>
 <1586543372-13969-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586543372-13969-3-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 Apr 11:29 PDT 2020, Sivaprakash Murugesan wrote:

> Add QMP USB PHY found in IPQ8074
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Balaji Prakash J <bjagadee@codeaurora.org>
> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 102 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index c190406..8e9a8a4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -188,6 +188,81 @@ static const unsigned int sm8150_ufsphy_regs_layout[] = {
>  	[QPHY_SW_RESET]			= QPHY_V4_SW_RESET,
>  };
>  
> +static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
> +	/* PLL and Loop filter settings */
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x15),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x34),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
> +	/* SSC settings */
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0xde),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x07),
> +};
> +
> +static const struct qmp_phy_init_tbl ipq8074_usb3_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xb8),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x0),
> +};
> +
> +static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V0, 0x15),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0e),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL2, 0x83),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL1, 0x02),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_L, 0x09),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_MAN_CODE, 0x85),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG1, 0xd1),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG2, 0x1f),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG3, 0x47),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_POWER_STATE_CONFIG2, 0x1b),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME, 0x75),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK, 0x86),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TSYNC_RSYNC_TIME, 0x44),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_L, 0x40),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_H, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V0, 0x17),
> +	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
> +};
> +
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
>  	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> @@ -1467,6 +1542,30 @@ static const char * const qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll",
>  };
>  
> +static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= ipq8074_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_usb3_serdes_tbl),
> +	.tx_tbl			= msm8996_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(msm8996_usb3_tx_tbl),
> +	.rx_tbl			= ipq8074_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(ipq8074_usb3_rx_tbl),
> +	.pcs_tbl		= ipq8074_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_usb3_pcs_tbl),
> +	.clk_list		= msm8996_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= usb3phy_regs_layout,
> +
> +	.start_ctrl		= SERDES_START | PCS_START,
> +	.pwrdn_ctrl		= SW_PWRDN,
> +};
> +
>  static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
>  	.type			= PHY_TYPE_PCIE,
>  	.nlanes			= 3,
> @@ -2498,6 +2597,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
>  
>  static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	{
> +		.compatible = "qcom,ipq8074-qmp-usb3-phy",
> +		.data = &ipq8074_usb3phy_cfg,
> +	}, {
>  		.compatible = "qcom,msm8996-qmp-pcie-phy",
>  		.data = &msm8996_pciephy_cfg,
>  	}, {
> -- 
> 2.7.4
> 
