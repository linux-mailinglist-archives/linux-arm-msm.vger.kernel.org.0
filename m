Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDF740058A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 21:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350980AbhICTKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 15:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350970AbhICTKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 15:10:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B084C061575
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 12:09:17 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id m4so339885ljq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jp+DzdKvplQFh1frqe9YEr4t0IdxJGv9l0U7vlDKxAE=;
        b=keN39KZ0vWlLEi9OKwSw5hmoTYjcTN1CK1hkNb3IYonIbeR/xxBQuJVDFpLjlAkkI9
         GPrlil9uV4fGOaNy9xCxE7EEwq8wfvYZ2gDdMjMLiqRZiy9zUdkm4IjuqTdHDf6PdvYi
         1jrexSH0xQqQDwTqH3AAuIDKOUC9GPzLPFw1fWHWnxut47ou5bB3fe6BzUMcSM3VmjDM
         S2H9z3mK8LXHMNuNO07bQtwuOj7zaGx1fzU/EIEj2kV1a8D7JTocKqVtaizRYDTPtUSn
         M0Qpuq9vfw867cJV3haMXs1R3hv+VtLnHtXmKqQ5DqvfFkVkCp/DxEZH8t3Q2+V7FWah
         LFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jp+DzdKvplQFh1frqe9YEr4t0IdxJGv9l0U7vlDKxAE=;
        b=nwsGP//gQB8F7WVZku3DyjxoRviP90hVYVHY9CSzQWyh8xdEBkkJ47kHtBdEK7/0jf
         DAy9XJy5yE9jW4GIuzrX5YuVN7SxW5xtzG6+8Mb1C3pOs2z2albG4BbZ+7tKyIgMeslJ
         4cMM66tT/lrLPSUix6AQyX2r+PVW5R4uBmzIgJucTU8ZUuIDdIgde75dcugkasA2gMmf
         52OT80jeB13N7C98K5SQfvyDuK73evALYnqX6bqfQlucvSZWIW/68x2lO+PBwfE1nTeu
         8VdcdYwuQrb6/OlTXFYsD3Z66J9pUSVALtiM3Q/JZ3i9KSHGvw+M+tHM+yHmKLgF696Z
         ZlGw==
X-Gm-Message-State: AOAM532E9kueBocRYguFCXzedHSNGESNnUyfUeAv+esJ9mufp1i7Rpdt
        LsRmLJ9JdjIBWvw6ye4FhcOQDQ==
X-Google-Smtp-Source: ABdhPJwpyPlobUvxLpAOoI/kG3rwsrGzmOslLAl/atLkMKb+NfqT54jhzWC3SHZh7DgSrLiB6kX4xg==
X-Received: by 2002:a2e:94ce:: with SMTP id r14mr361343ljh.259.1630696155921;
        Fri, 03 Sep 2021 12:09:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y35sm4060lje.127.2021.09.03.12.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 12:09:15 -0700 (PDT)
Subject: Re: [PATCH v2] phy: qcom-qmp: add support for display port voltage
 and pre-emphasis swing
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
References: <1630098658-23149-1-git-send-email-khsieh@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <72483937-8ccb-331b-e1af-8f30f6cefc07@linaro.org>
Date:   Fri, 3 Sep 2021 22:09:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630098658-23149-1-git-send-email-khsieh@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2021 00:10, Kuogee Hsieh wrote:
> Both voltage and pre-emphasis swing level are set during link training
> negotiation between host and sink. There are totally four tables added.
> A voltage swing table for both hbr and hbr1, a voltage table for both
> hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> added to complete the sequence of configure dp phy base on HPG.
> 
> Chnages in v2:
> -- revise commit test
> -- add Fixes tag
> -- replaced voltage_swing_cfg with voltage
> -- replaced pre_emphasis_cfg with emphasis
> -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
> 
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp.c | 117 ++++++++++++++++++++++++++----------
>   1 file changed, 85 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 31036aa..021cbb0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3546,12 +3546,11 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
>   	{ 0x1f, 0xff, 0xff, 0xff }
>   };
>   
> -static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
> -		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
> +static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy)

As this becomes a v3-only function, could you please rename it to 
qcom_qmp_v3_phy_configure_dp_swing()

>   {
>   	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>   	unsigned int v_level = 0, p_level = 0;
> -	u8 voltage_swing_cfg, pre_emphasis_cfg;
> +	u8 voltage, emphasis;
>   	int i;
>   
>   	for (i = 0; i < dp_opts->lanes; i++) {
> @@ -3560,26 +3559,25 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
>   	}
>   
>   	if (dp_opts->link_rate <= 2700) {
> -		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> -		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> +		voltage = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> +		emphasis = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
>   	} else {
> -		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
> -		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +		voltage = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
> +		emphasis = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
>   	}
>   
>   	/* TODO: Move check to config check */
> -	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
> +	if (voltage == 0xFF && emphasis == 0xFF)
>   		return -EINVAL;
>   
>   	/* Enable MUX to use Cursor values from these registers */
> -	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> -	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> -
> -	writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
> -	writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
> -	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
> -	writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);
> +	voltage |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +	emphasis |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
>   
> +	writel(voltage, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(emphasis, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(voltage, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(emphasis, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>   	return 0;
>   }
>   
> @@ -3588,9 +3586,7 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
>   	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>   	u32 bias_en, drvr_en;
>   
> -	if (qcom_qmp_phy_configure_dp_swing(qphy,
> -				QSERDES_V3_TX_TX_DRV_LVL,
> -				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
> +	if (qcom_qmp_phy_configure_dp_swing(qphy) < 0)
>   		return;
>   
>   	if (dp_opts->lanes == 1) {
> @@ -3728,6 +3724,71 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>   	return 0;
>   }
>   
> +/* The values in these tables are given without MUX_EN (0x20) bit set */
> +static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
> +	{ 0x00, 0x0c, 0x15, 0x1b },
> +	{ 0x02, 0x0e, 0x16, 0xff },
> +	{ 0x02, 0x11, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {
> +	{ 0x02, 0x12, 0x16, 0x1a },
> +	{ 0x09, 0x19, 0x1f, 0xff },
> +	{ 0x10, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
> +	{ 0x00, 0x0e, 0x15, 0x1b },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
> +	{ 0x08, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x16, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static int qcom_qmp_v4_phy_configure_dp_swing(struct qmp_phy *qphy)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	unsigned int v_level = 0, p_level = 0;
> +	u8 voltage, emphasis;
> +	int i;
> +
> +	for (i = 0; i < dp_opts->lanes; i++) {
> +		v_level = max(v_level, dp_opts->voltage[i]);
> +		p_level = max(p_level, dp_opts->pre[i]);
> +	}
> +
> +	if (dp_opts->link_rate <= 2700) {
> +		voltage = qmp_dp_v4_voltage_swing_hbr_rbr[v_level][p_level];
> +		emphasis = qmp_dp_v4_pre_emphasis_hbr_rbr[v_level][p_level];
> +	} else {
> +		voltage = qmp_dp_v4_voltage_swing_hbr3_hbr2[v_level][p_level];
> +		emphasis = qmp_dp_v4_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +	}
> +
> +	/* TODO: Move check to config check */
> +	if (voltage == 0xFF && emphasis == 0xFF)
> +		return -EINVAL;
> +
> +	/* Enable MUX to use Cursor values from these registers */
> +	voltage |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +	emphasis |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +
> +	writel(voltage, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(emphasis, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +	writel(voltage, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(emphasis, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +
> +	return 0;
> +}
> +
>   static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>   {
>   	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> @@ -3757,16 +3818,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>   
>   static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>   {
> -	/* Program default values before writing proper values */
> -	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> -
> -	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -
> -	qcom_qmp_phy_configure_dp_swing(qphy,
> -			QSERDES_V4_TX_TX_DRV_LVL,
> -			QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +	qcom_qmp_v4_phy_configure_dp_swing(qphy);
>   }
>   
>   static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
> @@ -3885,6 +3937,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>   	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>   	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>   
> +	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
> +
>   	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>   	udelay(2000);
>   	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> @@ -3896,11 +3951,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>   			10000))
>   		return -ETIMEDOUT;
>   
> -	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> -	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
>   
> -	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x22, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x22, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>   
>   	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>   	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> 


-- 
With best wishes
Dmitry
