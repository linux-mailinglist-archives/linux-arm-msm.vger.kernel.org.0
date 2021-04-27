Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE99A36CE80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 00:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbhD0WPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 18:15:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42380 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbhD0WPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 18:15:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619561664; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w9iYbla8SfuYYaXRJhm+8Av4oAS2iP488Q4jqLprjkk=;
 b=qo3p/OeB1OE1bcRdDdncd4kXg34YirfLxHL08tE2Z45NVw13DrsVVOq892Ow2DTmMnpWjgHP
 kC7ol9PTbBZlXB9NLmTBkQgHxJURnUMQyT7OpWj9Ee8Oo1KCDzrqcs1Q2RBwmD9Xrcti4e+2
 5MlgbGPUkeCQKdCpM11VQ/INY0g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60888cbca817abd39af1c775 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 22:14:20
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C48B4C4323A; Tue, 27 Apr 2021 22:14:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95428C4338A;
        Tue, 27 Apr 2021 22:14:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Apr 2021 15:14:18 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi: add DSI PHY registers to snapshot
 data
In-Reply-To: <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
Message-ID: <c567806ed6024e5c8b6b8a948632fc71@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Add DSI PHY registers to the msm state snapshots to be able to check
> their contents.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 31 +++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  4 ++++
>  4 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
> b/drivers/gpu/drm/msm/dsi/dsi.c
> index 322d2e535df0..75afc12a7b25 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -269,5 +269,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
> struct drm_device *dev,
>  void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi)
>  {
>  	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
> +	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b5679cf89413..cea73f9c4be9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -176,6 +176,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
> +void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..bf7a4c20c13c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -658,14 +658,14 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
>  				"qcom,dsi-phy-regulator-ldo-mode");
> 
> -	phy->base = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
> +	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", 
> &phy->base_size);
>  	if (IS_ERR(phy->base)) {
>  		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
>  		ret = -ENOMEM;
>  		goto fail;
>  	}
> 
> -	phy->pll_base = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> +	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", "DSI_PLL", 
> &phy->pll_size);
>  	if (IS_ERR(phy->pll_base)) {
>  		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
>  		ret = -ENOMEM;
> @@ -673,7 +673,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	}
> 
>  	if (phy->cfg->has_phy_lane) {
> -		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
> +		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane",
> "DSI_PHY_LANE", &phy->lane_size);
>  		if (IS_ERR(phy->lane_base)) {
>  			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", 
> __func__);
>  			ret = -ENOMEM;
> @@ -682,7 +682,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	}
> 
>  	if (phy->cfg->has_phy_regulator) {
> -		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", 
> "DSI_PHY_REG");
> +		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator",
> "DSI_PHY_REG", &phy->reg_size);
>  		if (IS_ERR(phy->reg_base)) {
>  			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator
> base\n", __func__);
>  			ret = -ENOMEM;
> @@ -868,3 +868,26 @@ int msm_dsi_phy_pll_restore_state(struct 
> msm_dsi_phy *phy)
> 
>  	return 0;
>  }
> +
> +void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy)
> +{
> +	msm_disp_snapshot_add_block(disp_state,
> +			phy->base_size, phy->base,
> +			"dsi%d_phy", phy->id);
> +
> +	/* Do not try accessing PLL registers if it is switched off */
> +	if (phy->pll_on)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->pll_size, phy->pll_base,
> +			"dsi%d_pll", phy->id);
> +
> +	if (phy->lane_base)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->lane_size, phy->lane_base,
> +			"dsi%d_lane", phy->id);
> +
> +	if (phy->reg_base)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->reg_size, phy->reg_base,
> +			"dsi%d_reg", phy->id);
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..5b0feef87127 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -85,6 +85,10 @@ struct msm_dsi_phy {
>  	void __iomem *pll_base;
>  	void __iomem *reg_base;
>  	void __iomem *lane_base;
> +	phys_addr_t base_size;
> +	phys_addr_t pll_size;
> +	phys_addr_t reg_size;
> +	phys_addr_t lane_size;
>  	int id;
> 
>  	struct clk *ahb_clk;
