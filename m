Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D847434DF54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhC3D3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhC3D3J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:29:09 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450FFC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:29:07 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id k25so15155588oic.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kvvizSI/eH8dizHZU0PwYTjxW0HZDtOPRt7qREigOa8=;
        b=sopzwizYGwbhp968wplqLc37pPJ+nQJZY/eDlskfbMcsyYCaNuvVVuLHasBGaDuHwl
         2AD73F6oTyVNshADGqIPMo+P9jltF+4UGcw0Uj2PcA6H/+iFJ5YC6VcCNgbInWdMFhiT
         thPQtCX7Y0cwKnSwN1EbIaSYu+ByZY1SGAnVqUXxIO1sq67G6VEnGlSC7OCvYem0GJlq
         MGNlwc+6FyRK2VUoK2rzSJ67a0hDst3Anp75rG7QLT98HjyI4hywErKRSEUpSe58E/xu
         xToQnUeNLU07TN3+ovPDfrbeg8kQNBdbNyj6i8NA9D7lWGeXKD3VGRCB08OKtag9PYS2
         gN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kvvizSI/eH8dizHZU0PwYTjxW0HZDtOPRt7qREigOa8=;
        b=MzAI2lY3FNpbxD4syr6r1At4uEVW3AlbfAs4hKeVBUwW/kd+f46bgYWyUKFretsugq
         xX2is54A1X7MqOe3595ydrmgyG34Q8ckcJDwps5pHaTVrCZ2PHluCAZcg7gw59zNLGiX
         edG4vivV3bplke3ow4WDsqqmNi5ezeeixnyIpd0nft+QfhASg7Smajj9vmReJD0R50GE
         PsHDgcooFPw6EDIm+moMH2+V5XXabb9G6eIDXp4wW3ai9UbxNdoROg6+D2xiO7Q5ROlD
         isOIA7bwp+KtgCLSsVT5w19Uce5269YZ7x9Jz9r4ndDoPRHfWvi2DZ9LjqyTI+cveLl1
         tQmw==
X-Gm-Message-State: AOAM533RBf0Tmol159GOJOaStkYxQ3Z8X56KjXMgvG1zM3DLCptgSmyB
        oOHRQHYRy5hDZJtGAh+0mu22hw==
X-Google-Smtp-Source: ABdhPJyFaQikpOe1Ou+a4mXJxuw+cUzuhl76xxQMJvUIefiHlLoWjOLzu3Z0s42CmZb1EiX3TTDP3g==
X-Received: by 2002:aca:a8c3:: with SMTP id r186mr1641616oie.129.1617074946696;
        Mon, 29 Mar 2021 20:29:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c205sm3834922oib.40.2021.03.29.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:29:06 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:29:04 -0500
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
Subject: Re: [PATCH v5 4/7] phy: qcom-qmp: rename common registers
Message-ID: <YGKbAOzT5XWm4kR3@builder.lan>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
 <20210328205257.3348866-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328205257.3348866-5-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 28 Mar 15:52 CDT 2021, Dmitry Baryshkov wrote:

> A plenty of DP PHY registers are common between V3 and V4. To simplify
> V4 code, rename all common registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 50 ++++++++++++++---------------
>  drivers/phy/qualcomm/phy-qcom-qmp.h | 37 ++++++++++-----------
>  2 files changed, 44 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 4150096fd350..097bc005ba43 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2435,20 +2435,20 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
>  {
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> -	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
>  
>  	/* Turn on BIAS current for PHY/PLL */
>  	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
>  	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
>  	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
>  
> -	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
>  
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
>  	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
>  	       DP_PHY_PD_CTL_DP_CLAMP_EN,
> -	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
>  
>  	writel(QSERDES_V3_COM_BIAS_EN |
>  	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
> @@ -2456,16 +2456,16 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
>  	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
>  	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
>  
> -	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG0);
> -	writel(0x13, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
> -	writel(0x24, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
> -	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG3);
> -	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG4);
> -	writel(0x26, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG5);
> -	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG6);
> -	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG7);
> -	writel(0xbb, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG8);
> -	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG9);
> +	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG0);
> +	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(0x24, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
> +	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG3);
> +	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG4);
> +	writel(0x26, qphy->pcs + QSERDES_DP_PHY_AUX_CFG5);
> +	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG6);
> +	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
> +	writel(0xbb, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
> +	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
>  	qphy->dp_aux_cfg = 0;
>  
>  	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> @@ -2556,9 +2556,9 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	 *	writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
>  	 */
>  	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
> -	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +	writel(val, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
>  
> -	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
> +	writel(0x5c, qphy->pcs + QSERDES_DP_PHY_MODE);
>  	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
>  	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
>  
> @@ -2588,11 +2588,11 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
>  	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
>  
> -	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
> -	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> -	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> -	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> -	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x04, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
> +	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qphy->pcs + QSERDES_DP_PHY_CFG);
>  
>  	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
>  
> @@ -2603,7 +2603,7 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
>  			10000))
>  		return -ETIMEDOUT;
>  
> -	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
>  
>  	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
>  			status,
> @@ -2612,9 +2612,9 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
>  			10000))
>  		return -ETIMEDOUT;
>  
> -	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>  	udelay(2000);
> -	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
> +	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
>  
>  	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
>  			status,
> @@ -2636,7 +2636,7 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>  	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
>  	val = cfg1_settings[qphy->dp_aux_cfg];
>  
> -	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
> +	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
>  
>  	return 0;
>  }
> @@ -3898,7 +3898,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
>  
>  	if (cfg->type == PHY_TYPE_DP) {
>  		/* Assert DP PHY power down */
> -		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
>  	} else {
>  		/* PHY reset */
>  		if (!cfg->no_pcs_sw_reset)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 71ce3aa174ae..981d8ee891c0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -349,13 +349,13 @@
>  #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
>  #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
>  
> -/* Only for QMP V3 PHY - DP PHY registers */
> -#define QSERDES_V3_DP_PHY_REVISION_ID0			0x000
> -#define QSERDES_V3_DP_PHY_REVISION_ID1			0x004
> -#define QSERDES_V3_DP_PHY_REVISION_ID2			0x008
> -#define QSERDES_V3_DP_PHY_REVISION_ID3			0x00c
> -#define QSERDES_V3_DP_PHY_CFG				0x010
> -#define QSERDES_V3_DP_PHY_PD_CTL			0x018
> +/* QMP PHY - DP PHY registers */
> +#define QSERDES_DP_PHY_REVISION_ID0			0x000
> +#define QSERDES_DP_PHY_REVISION_ID1			0x004
> +#define QSERDES_DP_PHY_REVISION_ID2			0x008
> +#define QSERDES_DP_PHY_REVISION_ID3			0x00c
> +#define QSERDES_DP_PHY_CFG				0x010
> +#define QSERDES_DP_PHY_PD_CTL				0x018
>  # define DP_PHY_PD_CTL_PWRDN				0x001
>  # define DP_PHY_PD_CTL_PSR_PWRDN			0x002
>  # define DP_PHY_PD_CTL_AUX_PWRDN			0x004
> @@ -363,18 +363,19 @@
>  # define DP_PHY_PD_CTL_LANE_2_3_PWRDN			0x010
>  # define DP_PHY_PD_CTL_PLL_PWRDN			0x020
>  # define DP_PHY_PD_CTL_DP_CLAMP_EN			0x040
> -#define QSERDES_V3_DP_PHY_MODE				0x01c
> -#define QSERDES_V3_DP_PHY_AUX_CFG0			0x020
> -#define QSERDES_V3_DP_PHY_AUX_CFG1			0x024
> -#define QSERDES_V3_DP_PHY_AUX_CFG2			0x028
> -#define QSERDES_V3_DP_PHY_AUX_CFG3			0x02c
> -#define QSERDES_V3_DP_PHY_AUX_CFG4			0x030
> -#define QSERDES_V3_DP_PHY_AUX_CFG5			0x034
> -#define QSERDES_V3_DP_PHY_AUX_CFG6			0x038
> -#define QSERDES_V3_DP_PHY_AUX_CFG7			0x03c
> -#define QSERDES_V3_DP_PHY_AUX_CFG8			0x040
> -#define QSERDES_V3_DP_PHY_AUX_CFG9			0x044
> +#define QSERDES_DP_PHY_MODE				0x01c
> +#define QSERDES_DP_PHY_AUX_CFG0				0x020
> +#define QSERDES_DP_PHY_AUX_CFG1				0x024
> +#define QSERDES_DP_PHY_AUX_CFG2				0x028
> +#define QSERDES_DP_PHY_AUX_CFG3				0x02c
> +#define QSERDES_DP_PHY_AUX_CFG4				0x030
> +#define QSERDES_DP_PHY_AUX_CFG5				0x034
> +#define QSERDES_DP_PHY_AUX_CFG6				0x038
> +#define QSERDES_DP_PHY_AUX_CFG7				0x03c
> +#define QSERDES_DP_PHY_AUX_CFG8				0x040
> +#define QSERDES_DP_PHY_AUX_CFG9				0x044
>  
> +/* Only for QMP V3 PHY - DP PHY registers */
>  #define QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK		0x048
>  # define PHY_AUX_STOP_ERR_MASK				0x01
>  # define PHY_AUX_DEC_ERR_MASK				0x02
> -- 
> 2.30.2
> 
