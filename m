Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1323F7D69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 22:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhHYU5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 16:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhHYU5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 16:57:24 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCF5C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:56:37 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso658933ots.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ezxYJuB5+DPwLQMhcOC4dJ+od4nl/giL4m1EpPE7Y2M=;
        b=rHQbo1MnEf8p6biTTcw6ebRelV9inX4oWWUMM8/t01OqgbpiCZny3ZdI6CE1FBiE3K
         sTWqCbR7gh3WGzyEEHbQKqeO9fxgs1j2cFsj4HesEj0TUAO+x98xPn0cNB0mR/iGHfy4
         8C/lIo0ljkdiToLnICz2KE2YGPLxrSmq2G7KEtCMbBOOu9aV0NORXYDoeeRMtRn8WRUP
         oqVzQuWSj+3Q3MAs+kgllJgFt7zv691TR8HuZ17WcLnoIr0mY1Uo2EGU4L/IqshhyxtS
         N3jKEXDfnvJqduVAzFawbLmUTtvLP0gt7TwFBqw2ib43OE3/WWJN8sGKxIo0TCvB/PfF
         0ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ezxYJuB5+DPwLQMhcOC4dJ+od4nl/giL4m1EpPE7Y2M=;
        b=RpYvNKpyNa1Wwax/+ff4469jT+BOAwdFHW6LjqjYYwVVraY3GSPkfNSPOjIWuu467X
         NA4p8V11hjXE8Vko6Mbz8uyv9+HwdU0P6zvlh0kZJG7+nXXQ28NxkLGs9f7rYE4XnbiZ
         9ayAm/KE/oZidsfIdycYVJcPqFX6r6xTHs0xVifRfQN1Hlae8G+NMonUb4+CYfkmzr2W
         uXS449e4aacZvg5zLZmijt4jOvzR4Yoe/lJULReup0k4TRP/1JAkalb9ptzRrEXvNHuz
         Dn5yk6yccqAGMENq3TIJISsES0sAaMtCDv4pzQmHb/K1E/eqxLJ/u5goqQMkI5hXxhcc
         uJwg==
X-Gm-Message-State: AOAM532IES45aeH+75lwqtT6nkiYt+h3l56xJDQDXryqWgvjQhqQ0RPI
        JeWO164Igwhuchdukdaj+PPd4Q==
X-Google-Smtp-Source: ABdhPJwfMEkSmISvoitevz6s3lkfvIwiZ22UHmmWIow+l4jG2ft/Yhhn7RD281SJu+FbYrURwujnDw==
X-Received: by 2002:a9d:4104:: with SMTP id o4mr321206ote.139.1629924997078;
        Wed, 25 Aug 2021 13:56:37 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b3sm220878oie.1.2021.08.25.13.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 13:56:36 -0700 (PDT)
Date:   Wed, 25 Aug 2021 13:57:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kishon@ti.com, p.zabel@pengutronix.de
Subject: Re: [PATCH] phy: qcom-qmp: add support for voltage and pre emphesis
 swing
Message-ID: <YSau0HrLMZOAu2Nx@ripper>
References: <1629847775-16767-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629847775-16767-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Aug 16:29 PDT 2021, Kuogee Hsieh wrote:

> Add voltage and pre emphesis swing tables so that voltage and
> pre emphsis swing level can be configured base on link rate.
> 

I think it would be nice if $subject, or at least the commit message
mentioned that this relates to the DisplayPort part of the QMP driver.

Also the commit message states that this allows someone/something to
configure the properties based on link rate. But it doesn't state why
this is needed.

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 95 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 82 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 31036aa..52bab6e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1916,7 +1916,7 @@ static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
> -	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x22),

Why is this initial value changed in order to make the swing and
emphasis configurable?

>  	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
>  };
>  
> @@ -3727,6 +3727,81 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>  
>  	return 0;
>  }
> +/*
> + * 0x20 deducted from tables
> + *
> + * swing_value |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> + * pre_emphasis_value |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;

How about rewriting this as something like
  "The values in these tables are given without MUX_EN (0x20) bit set"

?

> +*/
> +static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
> +	/* p0    p1    p2    p3 */
> +	{ 0x00, 0x0c, 0x15, 0x1b },	/* s0 */
> +	{ 0x02, 0x0e, 0x16, 0xff },	/* s1 */
> +	{ 0x02, 0x11, 0xff, 0xff },	/* s2 */
> +	{ 0x04, 0xff, 0xff, 0xff }	/* s3 */
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {
> +	/* p0    p1    p2    p3 */
> +	{ 0x02, 0x12, 0x16, 0x1a },	/* s0 */
> +	{ 0x09, 0x19, 0x1f, 0xff },	/* s1 */
> +	{ 0x10, 0x1f, 0xff, 0xff },	/* s2 */
> +	{ 0x1f, 0xff, 0xff, 0xff }	/* s3 */
> +};
> +
> +static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
> +	/* p0    p1    p2    p3 */
> +	{ 0x00, 0x0e, 0x15, 0x1b },	/* s0 */
> +	{ 0x00, 0x0e, 0x15, 0xff },	/* s1 */
> +	{ 0x00, 0x0e, 0xff, 0xff },	/* s2 */
> +	{ 0x04, 0xff, 0xff, 0xff }	/* s3 */
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
> +	/* p0    p1    p2    p3 */
> +	{ 0x08, 0x0f, 0x16, 0x1f },	/* s0 */
> +	{ 0x11, 0x1e, 0x1f, 0xff },	/* s1 */
> +	{ 0x16, 0x1f, 0xff, 0xff },	/* s2 */
> +	{ 0x1f, 0xff, 0xff, 0xff }	/* s3 */
> +};
> +
> +static int qcom_qmp_v4_phy_configure_dp_swing(struct qmp_phy *qphy,
> +		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	unsigned int v_level = 0, p_level = 0;
> +	u8 voltage_swing_cfg, pre_emphasis_cfg;

The "_cfg" suffix on these variables doesn't really add any value.
Frankly, calling them "voltage" (or "swing") and "emphasis" seems just
as expressive, but easier to read.

> +	int i;
> +
> +	for (i = 0; i < dp_opts->lanes; i++) {
> +		v_level = max(v_level, dp_opts->voltage[i]);
> +		p_level = max(p_level, dp_opts->pre[i]);
> +	}
> +
> +
> +	if (dp_opts->link_rate <= 2700) {
> +		voltage_swing_cfg = qmp_dp_v4_voltage_swing_hbr_rbr[v_level][p_level];
> +		pre_emphasis_cfg = qmp_dp_v4_pre_emphasis_hbr_rbr[v_level][p_level];
> +	} else {
> +		voltage_swing_cfg = qmp_dp_v4_voltage_swing_hbr3_hbr2[v_level][p_level];
> +		pre_emphasis_cfg = qmp_dp_v4_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +	}
> +
> +	/* TODO: Move check to config check */
> +	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)

Why is this && and not || ? 

> +		return -EINVAL;
> +
> +	/* Enable MUX to use Cursor values from these registers */
> +	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +
> +	writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
> +	writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
> +	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
> +	writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);
> +

This function is called once, so why is drv_lvl_reg and emp_post_reg
variables passed to the function, rather than just using the defines
directly?

Regards,
Bjorn

> +	return 0;
> +}
>  
>  static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>  {
> @@ -3757,14 +3832,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>  
>  static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>  {
> -	/* Program default values before writing proper values */
> -	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> -
> -	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -
> -	qcom_qmp_phy_configure_dp_swing(qphy,
> +	qcom_qmp_v4_phy_configure_dp_swing(qphy,
>  			QSERDES_V4_TX_TX_DRV_LVL,
>  			QSERDES_V4_TX_TX_EMP_POST1_LVL);
>  }
> @@ -3885,6 +3953,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>  	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>  
> +	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
> +
>  	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>  	udelay(2000);
>  	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> @@ -3896,11 +3967,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>  			10000))
>  		return -ETIMEDOUT;
>  
> -	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> -	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
>  
> -	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x22, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x22, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>  
>  	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>  	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
