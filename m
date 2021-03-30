Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DD534DF5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhC3DbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhC3Daz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:30:55 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB09C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:30:55 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso14363202otp.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+/HdDYbMdDoQR4If7z7Wxa8GlBsFTDBe/lqbhU/Xv0I=;
        b=QIWYP3vSzzPEtNcxV9pZnFCcKKVOadkr2xKq8O8BMPbaKXedKCfXfw9lLjunJT+CrR
         O9WhhWgsf4bG+B3zE9ZTZ6r8yV54MPKN/eTCcQLSfd+vUEgyHcrjQ5xRnVOQ78WBm5iQ
         FTt3NCi2OzVcj8JfnpeGQzXTQiTYuFI43+BKyFbH3TW6FPTWUCXOoBWonb8I1UJd8uF2
         tvXvxt3tX/bzA/CvTrWb7KY7ZOmHz0hx8Ek9tQVSiLqgJyWPp4pZv7djblVK8Weo2u3G
         m6fL+jHH0JUgfDO3Dll/wcGJRzHj6W1ZDisJYkZGgIl4yaUgVl1CyPHtYXPJDKiU7GgW
         UVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+/HdDYbMdDoQR4If7z7Wxa8GlBsFTDBe/lqbhU/Xv0I=;
        b=BExAQaftSuK87MjJeQZldOENKDfw+/8pYaMJ8uqAYm31+3IUiWNyTBHREecp6gdRku
         HLtl3/8plKKgf5YBvsPlNFtJ1qTnxNla1UvLTQqUSvi4v7TtDOYQ8eJ8VToZSk5nSBUA
         aMOnhjTevJHN+l1CpGLRl3XZ3tiGn/ZUXveppMHw01+ADX0Y4GCm9rdECOVDK1KUMNo2
         rEJPwg3arHF+lO8Z5xHjmJMQM5vLp51Coj3pid1yJOOm7+miVAZ45ytOocB+ISwD1yFf
         HyFVVz5CoIAZmIoo6fyPNQLEg3XfFsU8BkazZlDyGBeqB1oqjMjTFs8zwwUHolhKwj0W
         V6ZA==
X-Gm-Message-State: AOAM531aMqHin7EFSRFvDzz3SRQz8ifjvYuhegoKG0J78lg9n6L2Un+p
        l0T6BeV3y2vbAHEDRQM2oBhgYg==
X-Google-Smtp-Source: ABdhPJxOJ1WIpUtM9e2kb9kkxqWzkVKmclB9qMd6WE79aocVQfkar2TB7HYGJwnP4lfaQajZfUXjMg==
X-Received: by 2002:a9d:7ccf:: with SMTP id r15mr14459328otn.108.1617075054577;
        Mon, 29 Mar 2021 20:30:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g5sm3874494oiy.24.2021.03.29.20.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:30:54 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:30:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/7] phy: qcom-qmp: add support for sm8250-usb3-dp phy
Message-ID: <YGKbbIPSAH8pOs5R@builder.lan>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
 <20210328205257.3348866-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328205257.3348866-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 28 Mar 15:52 CDT 2021, Dmitry Baryshkov wrote:

> Add support for QMP V4 Combo USB3+DP PHY (for SM8250 platform).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 388 ++++++++++++++++++++++++++--
>  drivers/phy/qualcomm/phy-qcom-qmp.h |  40 ++-
>  2 files changed, 406 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 097bc005ba43..a47da2fff7a1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1840,6 +1840,86 @@ static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
>  };
>  
> +static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x3b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYS_CLK_CTRL, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORE_CLK_EN, 0x1f),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_rbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x6f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr2[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x8c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x1c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr3[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x2a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_VMODE_CTRL1, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_INTERFACE_SELECT, 0x3b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_CLKBUF_ENABLE, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RESET_TSYNC_EN, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_INTERFACE_MODE, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
> +};
> +
>  static const struct qmp_phy_init_tbl sm8250_qmp_pcie_serdes_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
> @@ -2488,11 +2568,10 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
>  	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
> -static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
> +static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy, unsigned int drv_lvl, unsigned int emp_post)
>  {
>  	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>  	unsigned int v_level = 0, p_level = 0;
> -	u32 bias_en, drvr_en;
>  	u8 voltage_swing_cfg, pre_emphasis_cfg;
>  	int i;
>  
> @@ -2501,29 +2580,42 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
>  		p_level = max(p_level, dp_opts->pre[i]);
>  	}
>  
> -	if (dp_opts->lanes == 1) {
> -		bias_en = 0x3e;
> -		drvr_en = 0x13;
> -	} else {
> -		bias_en = 0x3f;
> -		drvr_en = 0x10;
> -	}
> -
>  	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
>  	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
>  
>  	/* TODO: Move check to config check */
>  	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
> -		return;
> +		return -EINVAL;
>  
>  	/* Enable MUX to use Cursor values from these registers */
>  	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
>  	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
>  
> -	writel(voltage_swing_cfg, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
> -	writel(pre_emphasis_cfg, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> -	writel(voltage_swing_cfg, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> -	writel(pre_emphasis_cfg, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(voltage_swing_cfg, qphy->tx + drv_lvl);
> +	writel(pre_emphasis_cfg, qphy->tx + emp_post);
> +	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl);
> +	writel(pre_emphasis_cfg, qphy->tx2 + emp_post);
> +
> +	return 0;
> +}
> +
> +static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	u32 bias_en, drvr_en;
> +
> +	if (qcom_qmp_phy_configure_dp_swing(qphy,
> +			QSERDES_V3_TX_TX_DRV_LVL,
> +			QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
> +		return;
> +
> +	if (dp_opts->lanes == 1) {
> +		bias_en = 0x3e;
> +		drvr_en = 0x13;
> +	} else {
> +		bias_en = 0x3f;
> +		drvr_en = 0x10;
> +	}
>  
>  	writel(drvr_en, qphy->tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
>  	writel(bias_en, qphy->tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> @@ -2531,12 +2623,10 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
>  	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
>  }
>  
> -static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
> +static bool qcom_qmp_phy_configure_dp_mode(struct qmp_phy *qphy)
>  {
> -	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
> -	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> -	u32 val, phy_vco_div, status;
> -	unsigned long pixel_freq;
> +	u32 val;
> +	bool reverse = false;
>  
>  	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
> @@ -2559,6 +2649,19 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	writel(val, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
>  
>  	writel(0x5c, qphy->pcs + QSERDES_DP_PHY_MODE);
> +
> +	return reverse;
> +}
> +
> +static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
> +{
> +	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	u32 phy_vco_div, status;
> +	unsigned long pixel_freq;
> +
> +	qcom_qmp_phy_configure_dp_mode(qphy);
> +
>  	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
>  	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
>  
> @@ -2641,6 +2744,204 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>  	return 0;
>  }
>  
> +static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
> +{
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
> +
> +	/* Turn on BIAS current for PHY/PLL */
> +	writel(0x17, qphy->serdes + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
> +
> +	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG0);
> +	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(0xa4, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
> +	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG3);
> +	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG4);
> +	writel(0x26, qphy->pcs + QSERDES_DP_PHY_AUX_CFG5);
> +	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG6);
> +	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
> +	writel(0xb7, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
> +	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
> +	qphy->dp_aux_cfg = 0;
> +
> +	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> +	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> +	       PHY_AUX_REQ_ERR_MASK,
> +	       qphy->pcs + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
> +}
> +
> +static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
> +{
> +	/* Program default values before writing proper values */
> +	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +
> +	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +
> +	qcom_qmp_phy_configure_dp_swing(qphy,
> +			QSERDES_V4_TX_TX_DRV_LVL,
> +			QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +}
> +
> +static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
> +{
> +	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	u32 phy_vco_div, status;
> +	unsigned long pixel_freq;
> +	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
> +	bool reverse;
> +
> +	writel(0x0f, qphy->pcs + QSERDES_V4_DP_PHY_CFG_1);
> +
> +	reverse = qcom_qmp_phy_configure_dp_mode(qphy);
> +
> +	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(0xa4, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
> +
> +	writel(0x05, qphy->pcs + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qphy->pcs + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 1620000000UL / 2;
> +		break;
> +	case 2700:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 2700000000UL / 2;
> +		break;
> +	case 5400:
> +		phy_vco_div = 0x2;
> +		pixel_freq = 5400000000UL / 4;
> +		break;
> +	case 8100:
> +		phy_vco_div = 0x0;
> +		pixel_freq = 8100000000UL / 6;
> +		break;
> +	default:
> +		/* Other link rates aren't supported */
> +		return -EINVAL;
> +	}
> +	writel(phy_vco_div, qphy->pcs + QSERDES_V4_DP_PHY_VCO_DIV);
> +
> +	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
> +	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
> +
> +	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qphy->pcs + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qphy->serdes + QSERDES_V4_COM_RESETSM_CNTRL);
> +
> +	if (readl_poll_timeout(qphy->serdes + QSERDES_V4_COM_C_READY_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qphy->serdes + QSERDES_V4_COM_CMN_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qphy->serdes + QSERDES_V4_COM_CMN_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qphy->pcs + QSERDES_V4_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qphy->pcs + QSERDES_V4_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	/*
> +	 * At least for 7nm DP PHY this has to be done after enabling link
> +	 * clock.
> +	 */
> +
> +	if (dp_opts->lanes == 1) {
> +		bias0_en = reverse ? 0x3e : 0x15;
> +		bias1_en = reverse ? 0x15 : 0x3e;
> +		drvr0_en = reverse ? 0x13 : 0x10;
> +		drvr1_en = reverse ? 0x10 : 0x13;
> +	} else if (dp_opts->lanes == 2) {
> +		bias0_en = reverse ? 0x3f : 0x15;
> +		bias1_en = reverse ? 0x15 : 0x3f;
> +		drvr0_en = 0x10;
> +		drvr1_en = 0x10;
> +	} else {
> +		bias0_en = 0x3f;
> +		bias1_en = 0x3f;
> +		drvr0_en = 0x10;
> +		drvr1_en = 0x10;
> +	}
> +
> +	writel(drvr0_en, qphy->tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
> +	writel(bias0_en, qphy->tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
> +	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
> +	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
> +
> +	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	udelay(2000);
> +	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qphy->pcs + QSERDES_V4_DP_PHY_STATUS,
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
> +
> +	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +
> +	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +
> +	return 0;
> +}
> +
> +/*
> + * We need to calibrate the aux setting here as many times
> + * as the caller tries
> + */
> +static int qcom_qmp_v4_dp_phy_calibrate(struct qmp_phy *qphy)
> +{
> +	static const u8 cfg1_settings[] = { 0x20, 0x13, 0x23, 0x1d };
> +	u8 val;
> +
> +	qphy->dp_aux_cfg++;
> +	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
> +	val = cfg1_settings[qphy->dp_aux_cfg];
> +
> +	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
> +
> +	return 0;
> +}
> +
>  static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -3346,6 +3647,46 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
>  	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
>  };
>  
> +static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
> +	.type			= PHY_TYPE_DP,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= qmp_v4_dp_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
> +	.tx_tbl			= qmp_v4_dp_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
> +
> +	.serdes_tbl_rbr		= qmp_v4_dp_serdes_tbl_rbr,
> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_rbr),
> +	.serdes_tbl_hbr		= qmp_v4_dp_serdes_tbl_hbr,
> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr),
> +	.serdes_tbl_hbr2	= qmp_v4_dp_serdes_tbl_hbr2,
> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr2),
> +	.serdes_tbl_hbr3	= qmp_v4_dp_serdes_tbl_hbr3,
> +	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr3),
> +
> +	.clk_list		= qmp_v4_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v4_usb3phy_regs_layout,
> +
> +	.has_phy_dp_com_ctrl	= true,
> +	.is_dual_lane_phy	= true,
> +
> +	.dp_aux_init = qcom_qmp_v4_phy_dp_aux_init,
> +	.configure_dp_tx = qcom_qmp_v4_phy_configure_dp_tx,
> +	.configure_dp_phy = qcom_qmp_v4_phy_configure_dp_phy,
> +	.calibrate_dp_phy = qcom_qmp_v4_dp_phy_calibrate,
> +};
> +
> +static const struct qmp_phy_combo_cfg sm8250_usb3dpphy_cfg = {
> +	.usb_cfg		= &sm8250_usb3phy_cfg,
> +	.dp_cfg			= &sm8250_dpphy_cfg,
> +};
> +
>  static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
>  	.type			= PHY_TYPE_USB3,
>  	.nlanes			= 1,
> @@ -4601,6 +4942,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8250-qmp-usb3-phy",
>  		.data = &sm8250_usb3phy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
> +		/* It's a combo phy */
>  	}, {
>  		.compatible = "qcom,sm8250-qmp-usb3-uni-phy",
>  		.data = &sm8250_usb3_uniphy_cfg,
> @@ -4635,6 +4979,10 @@ static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
>  		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
>  		.data = &sc7180_usb3dpphy_cfg,
>  	},
> +	{
> +		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
> +		.data = &sm8250_usb3dpphy_cfg,
> +	},
>  	{ }
>  };
>  
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 981d8ee891c0..67bd2dd0d8c5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -397,6 +397,7 @@
>  #define QSERDES_V3_DP_PHY_STATUS			0x0c0
>  
>  /* Only for QMP V4 PHY - QSERDES COM registers */
> +#define QSERDES_V4_COM_BG_TIMER				0x00c
>  #define QSERDES_V4_COM_SSC_EN_CENTER			0x010
>  #define QSERDES_V4_COM_SSC_PER1				0x01c
>  #define QSERDES_V4_COM_SSC_PER2				0x020
> @@ -404,7 +405,9 @@
>  #define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0		0x028
>  #define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1		0x030
>  #define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1		0x034
> +#define QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN		0x044
>  #define QSERDES_V4_COM_CLK_ENABLE1			0x048
> +#define QSERDES_V4_COM_SYS_CLK_CTRL			0x04c
>  #define QSERDES_V4_COM_SYSCLK_BUF_ENABLE		0x050
>  #define QSERDES_V4_COM_PLL_IVCO				0x058
>  #define QSERDES_V4_COM_CMN_IPTRIM			0x060
> @@ -415,6 +418,7 @@
>  #define QSERDES_V4_COM_PLL_CCTRL_MODE0			0x084
>  #define QSERDES_V4_COM_PLL_CCTRL_MODE1			0x088
>  #define QSERDES_V4_COM_SYSCLK_EN_SEL			0x094
> +#define QSERDES_V4_COM_RESETSM_CNTRL			0x09c
>  #define QSERDES_V4_COM_LOCK_CMP_EN			0x0a4
>  #define QSERDES_V4_COM_LOCK_CMP1_MODE0			0x0ac
>  #define QSERDES_V4_COM_LOCK_CMP2_MODE0			0x0b0
> @@ -428,16 +432,24 @@
>  #define QSERDES_V4_COM_DIV_FRAC_START1_MODE1		0x0d8
>  #define QSERDES_V4_COM_DIV_FRAC_START2_MODE1		0x0dc
>  #define QSERDES_V4_COM_DIV_FRAC_START3_MODE1		0x0e0
> +#define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0		0x0ec
> +#define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0		0x0f0
> +#define QSERDES_V4_COM_VCO_TUNE_CTRL			0x108
>  #define QSERDES_V4_COM_VCO_TUNE_MAP			0x10c
>  #define QSERDES_V4_COM_VCO_TUNE1_MODE0			0x110
>  #define QSERDES_V4_COM_VCO_TUNE2_MODE0			0x114
>  #define QSERDES_V4_COM_VCO_TUNE1_MODE1			0x118
>  #define QSERDES_V4_COM_VCO_TUNE2_MODE1			0x11c
>  #define QSERDES_V4_COM_VCO_TUNE_INITVAL2		0x124
> +#define QSERDES_V4_COM_CMN_STATUS			0x140
>  #define QSERDES_V4_COM_CLK_SELECT			0x154
>  #define QSERDES_V4_COM_HSCLK_SEL			0x158
>  #define QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL		0x15c
> +#define QSERDES_V4_COM_CORECLK_DIV_MODE0		0x168
>  #define QSERDES_V4_COM_CORECLK_DIV_MODE1		0x16c
> +#define QSERDES_V4_COM_CORE_CLK_EN			0x174
> +#define QSERDES_V4_COM_C_READY_STATUS			0x178
> +#define QSERDES_V4_COM_CMN_CONFIG			0x17c
>  #define QSERDES_V4_COM_SVS_MODE_CLK_SEL			0x184
>  #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
>  #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
> @@ -446,19 +458,32 @@
>  #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
>  
>  /* Only for QMP V4 PHY - TX registers */
> +#define QSERDES_V4_TX_CLKBUF_ENABLE			0x08
> +#define QSERDES_V4_TX_TX_EMP_POST1_LVL			0x0c
> +#define QSERDES_V4_TX_TX_DRV_LVL			0x14
> +#define QSERDES_V4_TX_RESET_TSYNC_EN			0x1c
> +#define QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN		0x20
> +#define QSERDES_V4_TX_TX_BAND				0x24
> +#define QSERDES_V4_TX_INTERFACE_SELECT			0x2c
>  #define QSERDES_V4_TX_RES_CODE_LANE_TX			0x34
>  #define QSERDES_V4_TX_RES_CODE_LANE_RX			0x38
>  #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX 		0x3c
>  #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX 		0x40
> +#define QSERDES_V4_TX_TRANSCEIVER_BIAS_EN		0x54
> +#define QSERDES_V4_TX_HIGHZ_DRVR_EN			0x58
> +#define QSERDES_V4_TX_TX_POL_INV			0x5c
> +#define QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN	0x60
>  #define QSERDES_V4_TX_LANE_MODE_1			0x84
>  #define QSERDES_V4_TX_LANE_MODE_2			0x88
>  #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
> +#define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
> +#define QSERDES_V4_TX_TX_INTERFACE_MODE			0xbc
>  #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
>  #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
>  #define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0xe0
>  #define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0xe4
> -#define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
> -#define QSERDES_V4_TX_PI_QEC_CTRL		0x104
> +#define QSERDES_V4_TX_VMODE_CTRL1			0xe8
> +#define QSERDES_V4_TX_PI_QEC_CTRL			0x104
>  
>  /* Only for QMP V4 PHY - RX registers */
>  #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
> @@ -515,6 +540,17 @@
>  #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
>  #define QSERDES_V4_RX_VTH_CODE				0x1c4
>  
> +/* Only for QMP V4 PHY - DP PHY registers */
> +#define QSERDES_V4_DP_PHY_CFG_1				0x014
> +#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK		0x054
> +#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_CLEAR		0x058
> +#define QSERDES_V4_DP_PHY_VCO_DIV			0x070
> +#define QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL		0x078
> +#define QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL		0x09c
> +#define QSERDES_V4_DP_PHY_SPARE0			0x0c8
> +#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
> +#define QSERDES_V4_DP_PHY_STATUS			0x0dc
> +
>  /* Only for QMP V4 PHY - UFS PCS registers */
>  #define QPHY_V4_PCS_UFS_PHY_START				0x000
>  #define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL			0x004
> -- 
> 2.30.2
> 
