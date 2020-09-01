Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA48258F43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 15:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgIANhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 09:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgIANgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 09:36:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877B1C061246
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 06:36:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so1557235ljc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ERwotwRVaCh127Fl5xc8ZsTGxKMf2gtwNcfbtjzLo9I=;
        b=JZei36oAgZrw78tuNUlKIUsSmZz8VnIy9QhsqDcLmTtHb4pyw714VbapLJkDvGtl6t
         LtI4kMfo+90lodD5yPxvWDGKEAoFOig9vhencKNDIbazsraQTASmGv49Fsu57CLbixjT
         TCSfiui9l7w2GUTv9qlLEcGKa9t3XcDceD5xTeh4F0is+XYF8uZngUgSYj9voR6vxb6e
         JQmuNnZe+Ery4exPB1IYr209Imu2YAPJNQx/oYJ+l4KZ9l0j4LpC8aO028XxKQlUEf8/
         lWsBujvBvcohGbukqoKelRpnCZq6sNwEfryXOXCccoebLRb+OWrAKAGuBq9+GBYoui+G
         Cq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ERwotwRVaCh127Fl5xc8ZsTGxKMf2gtwNcfbtjzLo9I=;
        b=LO2KPHJPCJDQ9AA7JwBQsjexZmwYMvdEwTPd18/klAlwruyWkS3vGVVVQ/XdeSm+9w
         MOgsOVdjJQ3ACwnVI8wintqD4B2KvJ5JpkKcnLCXCZzqyIJkjYJaFH8W5F8h1ZSf1b3C
         smeLTnoSHaFo0D2GLiL5AX5ekpXII2N5vtk8yGN4cmx0keLXhCzI8E0pV0d9dYKWY5OK
         4fzKBjCiLQtmoLuLQRUZ4SE8vqeWwS+77ZW+DLaQqN/hMlC9Qiphla7WxYOrJyuuy8y2
         u+4degi2Kd3XvTl5lN7xWoolUBpAea7/5pGjHYUSXBfvUN9ie1ElgH20x2tC8XNwfNvq
         kdNQ==
X-Gm-Message-State: AOAM531xke5H1jmEoBcT6uVXSV1wT9YREZKQ4JbY9bN5XLTiuvyGveqx
        JTsz/+UHsxaOFBvZmCIdnUm7Xg==
X-Google-Smtp-Source: ABdhPJz/+PmX2B/zDbvxl+5IrcI0dghVe9sbCXhQ2fxNUbk7GlLoe144nz9t6kA0jpgfvU9xgnElkQ==
X-Received: by 2002:a2e:b53b:: with SMTP id z27mr619095ljm.441.1598967398680;
        Tue, 01 Sep 2020 06:36:38 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.32])
        by smtp.gmail.com with ESMTPSA id j7sm285445ljg.5.2020.09.01.06.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 06:36:37 -0700 (PDT)
Subject: Re: [PATCH v1 6/9] phy: qcom-qmp: Add support for DP in USB3+DP combo
 phy
To:     Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>
References: <20200826024711.220080-1-swboyd@chromium.org>
 <20200826024711.220080-7-swboyd@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <335a0660-40e1-0c1e-3f7d-87f7024de18a@linaro.org>
Date:   Tue, 1 Sep 2020 16:36:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826024711.220080-7-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/08/2020 05:47, Stephen Boyd wrote:
> Add support for the USB3 + DisplayPort (DP) "combo" phy to the qmp phy
> driver. We already have support for the USB3 part of the combo phy, so
> most additions are for the DP phy.
> 
> Split up the qcom_qmp_phy{enable,disable}() functions into the phy init,
> power on, power off, and exit functions that the common phy framework
> expects so that the DP phy can add even more phy ops like
> phy_calibrate() and phy_configure(). This allows us to initialize the DP
> PHY and configure the AUX channel before powering on the PHY at the link
> rate that was negotiated during link training.
> 
> The general design is as follows:
> 
>    1) DP controller calls phy_init() to initialize the PHY and configure
>    the dp_com register region.
> 
>    2) DP controller calls phy_configure() to tune the link rate and
>    voltage swing and pre-emphasis settings.
> 
>    3) DP controller calls phy_power_on() to enable the PLL and power on
>    the phy.
> 
>    4) DP controller calls phy_configure() again to tune the voltage swing
>    and pre-emphasis settings determind during link training.
> 
>    5) DP controller calls phy_calibrate() some number of times to change
>    the aux settings if the aux channel times out during link training.
> 
>    6) DP controller calls phy_power_off() if the link rate is to be
>    changed and goes back to step 2 to try again at a different link rate.
> 
>    5) DP controller calls phy_power_off() and then phy_exit() to power
>    down the PHY when it is done.
> 
> The DP PHY contains a PLL that is different from the one used for the
> USB3 PHY. Instead of a pipe clk there is a link clk and a pixel clk
> output from the DP PLL after going through various dividers. Introduce
> clk ops for these two clks that just tell the child clks what the
> frequency of the pixel and link are. When the phy link rate is
> configured we call clk_set_rate() to update the child clks in the
> display clk controller on what rate is in use. The clk frequencies
> always differ based on the link rate (i.e. 1.6Gb/s 2.7Gb/s, 5.4Gb/s, or
> 8.1Gb/s corresponding to various transmission modes like HBR1, HBR2 or
> HBR3) so we simply store the link rate and use that to calculate the clk
> frequencies.
> 
> The PLL enable sequence is a little different from other QMP phy PLLs so
> we power on the PLL in qcom_qmp_phy_configure_dp_phy() that gets called
> from phy_power_on(). This should probably be split out better so that
> each phy has a way to run the final PLL/PHY enable sequence.
> 
> This code is based on a submission of this phy and PLL in the drm
> subsystem.
> 
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20200609034623.10844-1-tanmay@codeaurora.org
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp.c | 935 +++++++++++++++++++++++++---
>   drivers/phy/qualcomm/phy-qcom-qmp.h |  80 +++
>   2 files changed, 926 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 76d7a9e80f04..dd77c7dfa310 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -947,6 +947,130 @@ static const struct qmp_phy_init_tbl qmp_v3_usb3_tx_tbl[] = {
>   	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
>   };
>   

I'd suggest to split common part of the following tables into 
dpphy_cfg->serdes_tbl and add the rest as "addon tables" 
(serdes_tbl_rbr, serdes_rbl_hbr/2/3) into the same dpphy_cfg.
It would ease V4 QMP DP PHY support.

> +static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_rbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x6f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr2[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x8c),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x1c),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
> +};
> +
> +static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr3[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x2a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
> +};
> +
>   static const struct qmp_phy_init_tbl qmp_v3_usb3_rx_tbl[] = {
>   	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
>   	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> @@ -1798,6 +1922,11 @@ struct qmp_phy_cfg {
>   	bool no_pcs_sw_reset;
>   };
>   
> +struct qmp_phy_combo_cfg {
> +	const struct qmp_phy_cfg *usb_cfg;
> +	const struct qmp_phy_cfg *dp_cfg;
> +};
> +
>   /**
>    * struct qmp_phy - per-lane phy descriptor
>    *
> @@ -1831,6 +1960,15 @@ struct qmp_phy {
>   	struct qcom_qmp *qmp;
>   	struct reset_control *lane_rst;
>   	enum phy_mode mode;
> +	unsigned int dp_aux_cfg;
> +	struct phy_configure_opts_dp dp_opts;
> +	struct qmp_phy_dp_clks *dp_clks;
> +};
> +
> +struct qmp_phy_dp_clks {
> +	struct qmp_phy *qphy;
> +	struct clk_hw dp_link_hw;
> +	struct clk_hw dp_pixel_hw;
>   };
>   
>   /**
> @@ -2475,6 +2613,329 @@ static void qcom_qmp_phy_configure(void __iomem *base,
>   	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
>   }
>   
> +static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
> +{
> +	struct qcom_qmp *qmp = qphy->qmp;
> +	const struct qmp_phy_cfg *cfg = qphy->cfg;
> +	void __iomem *serdes = qphy->serdes;
> +	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +	const struct qmp_phy_init_tbl *serdes_tbl;
> +	int serdes_tbl_num;
> +	int ret;
> +
> +	if (cfg->type == PHY_TYPE_DP) {
> +		switch (dp_opts->link_rate) {
> +		case 1620:
> +			serdes_tbl = qmp_v3_dp_serdes_tbl_rbr;
> +			serdes_tbl_num = ARRAY_SIZE(qmp_v3_dp_serdes_tbl_rbr);
> +			break;
> +		case 2700:
> +			serdes_tbl = qmp_v3_dp_serdes_tbl_hbr;
> +			serdes_tbl_num = ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr);
> +			break;
> +		case 5400:
> +			serdes_tbl = qmp_v3_dp_serdes_tbl_hbr2;
> +			serdes_tbl_num = ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr2);
> +			break;
> +		case 8100:
> +			serdes_tbl = qmp_v3_dp_serdes_tbl_hbr3;
> +			serdes_tbl_num = ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr3);
> +			break;
> +		default:
> +			/* Other link rates aren't supported */
> +			return -EINVAL;
> +		}
> +	} else {
> +		serdes_tbl = cfg->serdes_tbl;
> +		serdes_tbl_num = cfg->serdes_tbl_num;
> +	} > +
> +	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);

If we split DP serdes tables, it would look lile:
	qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl, 
cfg->serdes_tbl_num);
	if (cfg->type == PHY_TYPE_DP) {
		switch (dp_opts->link_rate) {
		case 1620:
			qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_rbr, 
cfg->serdes_tbl_rbr_num);
			break;
		case 2700:
			qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_hbr, 
cfg->serdes_tbl_hbr_num);
			break;
		case 5400:
			qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_hbr2, 
cfg->serdes_tbl_hbr2_num);
			break;
		case 8100:
			qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_hbr3, 
cfg->serdes_tbl_hbr3_num);
			break;
		default:
			/* Other link rates aren't supported */
			return -EINVAL;
		}
	}


 > +	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);


> +
> +	if (cfg->has_phy_com_ctrl) {
> +		void __iomem *status;
> +		unsigned int mask, val;
> +
> +		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
> +		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
> +			     SERDES_START | PCS_START);
> +
> +		status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
> +		mask = cfg->mask_com_pcs_ready;
> +
> +		ret = readl_poll_timeout(status, val, (val & mask), 10,
> +					 PHY_INIT_COMPLETE_TIMEOUT);
> +		if (ret) {
> +			dev_err(qmp->dev,
> +				"phy common block init timed-out\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
> +{
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +
> +	/* Turn on BIAS current for PHY/PLL */
> +	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
> +	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
> +	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
> +
> +	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +
> +	/* Make sure that hardware is done with  PSR power down */
> +	wmb();
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
> +	       DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +
> +	writel(QSERDES_V3_COM_BIAS_EN |
> +	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
> +	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
> +	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
> +	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
> +
> +	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG0);
> +	writel(0x13, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
> +	writel(0x24, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
> +	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG3);
> +	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG4);
> +	writel(0x26, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG5);
> +	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG6);
> +	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG7);
> +	writel(0xbb, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG8);
> +	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG9);
> +	qphy->dp_aux_cfg = 0;
> +
> +	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> +	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> +	       PHY_AUX_REQ_ERR_MASK,
> +	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
> +}
> +
> +static const u8 vm_pre_emphasis[4][4] = {

Could you please prefix with v3? V4 will use different tables here

> +	{ 0x00, 0x0b, 0x12, 0xff },       /* pe0, 0 db */
> +	{ 0x00, 0x0a, 0x12, 0xff },       /* pe1, 3.5 db */
> +	{ 0x00, 0x0c, 0xff, 0xff },       /* pe2, 6.0 db */
> +	{ 0xff, 0xff, 0xff, 0xff }        /* pe3, 9.5 db */
> +};
> +
> +/* voltage swing, 0.2v and 1.0v are not support */
> +static const u8 vm_voltage_swing[4][4] = {
> +	{ 0x07, 0x0f, 0x14, 0xff }, /* sw0, 0.4v  */
> +	{ 0x11, 0x1d, 0x1f, 0xff }, /* sw1, 0.6 v */
> +	{ 0x18, 0x1f, 0xff, 0xff }, /* sw1, 0.8 v */
> +	{ 0xff, 0xff, 0xff, 0xff }  /* sw1, 1.2 v, optional */
> +};
> +
> +static const u8 vm_pre_emphasis_hbr3_hbr2[4][4] = {
> +	{ 0x00, 0x0c, 0x15, 0x1a },
> +	{ 0x02, 0x0e, 0x16, 0xff },
> +	{ 0x02, 0x11, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 vm_voltage_swing_hbr3_hbr2[4][4] = {
> +	{ 0x02, 0x12, 0x16, 0x1a },
> +	{ 0x09, 0x19, 0x1f, 0xff },
> +	{ 0x10, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 vm_pre_emphasis_hbr_rbr[4][4] = {
> +	{ 0x00, 0x0c, 0x14, 0x19 },
> +	{ 0x00, 0x0b, 0x12, 0xff },
> +	{ 0x00, 0x0b, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 vm_voltage_swing_hbr_rbr[4][4] = {
> +	{ 0x08, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x19, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)

With these functions I'm struggling between introducing 
PHY_TYPE_DP_V3/V4 and introducing callbacks into qmp_phy_cfg. What would 
you prefer?

What about the following struct?

struct qmp_phy_dp_opts {
	void (*dp_aux_init)(struct qmp_phy *qphy);
	void (*dp_configure_tx)(struct qmp_phy *qphy);
	void (*dp_configure_lanes)(struct qmp_phy *qphy);
};

I'm not sure about dp_calibrate().



-- 
With best wishes
Dmitry
