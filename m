Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CBA3AF8BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhFUWqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:46:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51258 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFUWqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:46:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624315447; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EnQqZpKqFHELG5JLHnLXtDhv821KIi0FniuX67JCq+4=;
 b=ii3XOK7Vry/lfwlqghtXX9StyThG6ALwMFnN8pAIm4SRsndEJft2L54SMegJBZKkDID/dOzJ
 mOzZMm61jKcM4+csYgcF4zi3bTclMGEqb3VnBUjtj7GLk8EC56vk5ii3rmYJs29xGmqUx68R
 3wNgBtIHn92VdWubwgGglsvRrM4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60d116276ddc3305c4df4f30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:43:51
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4F2AC43460; Mon, 21 Jun 2021 22:43:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2181CC433D3;
        Mon, 21 Jun 2021 22:43:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Jun 2021 15:43:47 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 8/8] drm/msm/dsi: remove msm_dsi_dphy_timing
 from msm_dsi_phy
In-Reply-To: <20210515131217.1540412-9-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
 <20210515131217.1540412-9-dmitry.baryshkov@linaro.org>
Message-ID: <07cb421bd8c04d6883dced6586a2b37d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> Remove struct msm_dsi_dphy_timing field from the struct msm_dsi_phy.
> There is no need to store them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          | 18 ++++++++++++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          | 10 ++++++++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c     | 11 +++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 11 +++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c     | 10 ++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c     | 12 ++++--------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    | 10 ++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 13 ++++---------
>  8 files changed, 40 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 53a02c02dd6e..47145cab6b55 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -453,6 +453,8 @@ int msm_dsi_dphy_timing_calc_v4(struct
> msm_dsi_dphy_timing *timing,
>  	tmax = 255;
>  	timing->shared_timings.clk_pre = DIV_ROUND_UP((tmax - tmin) * 125,
> 10000) + tmin;
> 
> +	timing->bitclk_rate = bit_rate;
> +

I didnt follow this part of the change. agreed that 7nm PHY is using 
this but
why do we need to start storing this in the timing node.
Why cant we continue using it from msm_dsi_phy_clk_request?

>  	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
>  		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
>  		timing->clk_zero, timing->clk_trail, timing->clk_prepare, 
> timing->hs_exit,
> @@ -756,6 +758,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_shared_timings *shared_timings)
>  {
>  	struct device *dev = &phy->pdev->dev;
> +	struct msm_dsi_dphy_timing timing;
>  	int ret;
> 
>  	if (!phy || !phy->cfg->ops.enable)
> @@ -775,15 +778,22 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  		goto reg_en_fail;
>  	}
> 
> -	ret = phy->cfg->ops.enable(phy, clk_req);
> +	if (!phy->cfg->ops.dphy_timing_calc ||
> +	    phy->cfg->ops.dphy_timing_calc(&timing, clk_req)) {
> +		DRM_DEV_ERROR(&phy->pdev->dev,
> +			"%s: D-PHY timing calculation failed\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	memcpy(shared_timings, &timing.shared_timings,
> +	       sizeof(*shared_timings));
> +
> +	ret = phy->cfg->ops.enable(phy, &timing);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
>  		goto phy_en_fail;
>  	}
> 
> -	memcpy(shared_timings, &phy->timing.shared_timings,
> -	       sizeof(*shared_timings));
> -
>  	/*
>  	 * Resetting DSI PHY silently changes its PLL registers to reset 
> status,
>  	 * which will confuse clock driver and result in wrong output rate of
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..9ba03a242d24 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -17,10 +17,14 @@
>  #define dsi_phy_write_udelay(offset, data, delay_us) {
> msm_writel((data), (offset)); udelay(delay_us); }
>  #define dsi_phy_write_ndelay(offset, data, delay_ns) {
> msm_writel((data), (offset)); ndelay(delay_ns); }
> 
> +struct msm_dsi_dphy_timing;
> +
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
> -	int (*enable)(struct msm_dsi_phy *phy,
> +	int (*dphy_timing_calc)(struct msm_dsi_dphy_timing *timing,
>  			struct msm_dsi_phy_clk_request *clk_req);
> +	int (*enable)(struct msm_dsi_phy *phy,
> +			struct msm_dsi_dphy_timing *timing);
>  	void (*disable)(struct msm_dsi_phy *phy);
>  	void (*save_pll_state)(struct msm_dsi_phy *phy);
>  	int (*restore_pll_state)(struct msm_dsi_phy *phy);
> @@ -73,6 +77,9 @@ struct msm_dsi_dphy_timing {
>  	u32 hs_prep_dly_ckln;
>  	u8 hs_halfbyte_en;
>  	u8 hs_halfbyte_en_ckln;
> +
> +	/* For PHY v4 only */
> +	unsigned long bitclk_rate;
>  };
> 
>  #define DSI_BYTE_PLL_CLK		0
> @@ -90,7 +97,6 @@ struct msm_dsi_phy {
>  	struct clk *ahb_clk;
>  	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
> 
> -	struct msm_dsi_dphy_timing timing;
>  	const struct msm_dsi_phy_cfg *cfg;
> 
>  	enum msm_dsi_phy_usecase usecase;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 34bc93548fcf..bc838ee4f9b9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -789,24 +789,17 @@ static void dsi_phy_hw_v3_0_lane_settings(struct
> msm_dsi_phy *phy)
>  }
> 
>  static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
> -			       struct msm_dsi_phy_clk_request *clk_req)
> +			       struct msm_dsi_dphy_timing *timing)
>  {
>  	int ret;
>  	u32 status;
>  	u32 const delay_us = 5;
>  	u32 const timeout_us = 1000;
> -	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	void __iomem *base = phy->base;
>  	u32 data;
> 
>  	DBG("");
> 
> -	if (msm_dsi_dphy_timing_calc_v3(timing, clk_req)) {
> -		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	if (dsi_phy_hw_v3_0_is_pll_on(phy))
>  		pr_warn("PLL turned on before configuring PHY\n");
> 
> @@ -929,6 +922,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v3,
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
>  		.pll_init = dsi_pll_10nm_init,
> @@ -950,6 +944,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs 
> = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v3,
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
>  		.pll_init = dsi_pll_10nm_init,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 65d68eb9e3cb..5372d741bc76 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -939,9 +939,8 @@ static void dsi_14nm_dphy_set_timing(struct
> msm_dsi_phy *phy,
>  }
> 
>  static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
> -			       struct msm_dsi_phy_clk_request *clk_req)
> +			       struct msm_dsi_dphy_timing *timing)
>  {
> -	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	u32 data;
>  	int i;
>  	int ret;
> @@ -949,12 +948,6 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy 
> *phy,
>  	void __iomem *lane_base = phy->lane_base;
>  	u32 glbl_test_ctrl;
> 
> -	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
> -		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	data = 0x1c;
>  	if (phy->usecase != MSM_DSI_PHY_STANDALONE)
>  		data |= DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL(32);
> @@ -1032,6 +1025,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v2,
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
>  		.pll_init = dsi_pll_14nm_init,
> @@ -1053,6 +1047,7 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v2,
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
>  		.pll_init = dsi_pll_14nm_init,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index e96d789aea18..b953fb19e292 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -64,9 +64,8 @@ static void dsi_20nm_phy_regulator_ctrl(struct
> msm_dsi_phy *phy, bool enable)
>  }
> 
>  static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
> -				struct msm_dsi_phy_clk_request *clk_req)
> +			       struct msm_dsi_dphy_timing *timing)
>  {
> -	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	int i;
>  	void __iomem *base = phy->base;
>  	u32 cfg_4[4] = {0x20, 0x40, 0x20, 0x00};
> @@ -74,12 +73,6 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy 
> *phy,
> 
>  	DBG("");
> 
> -	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
> -		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	dsi_20nm_phy_regulator_ctrl(phy, true);
> 
>  	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
> @@ -138,6 +131,7 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
>  		.enable = dsi_20nm_phy_enable,
>  		.disable = dsi_20nm_phy_disable,
>  	},
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 3304acda2165..e39801d309ed 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -699,21 +699,14 @@ static void dsi_28nm_phy_regulator_ctrl(struct
> msm_dsi_phy *phy, bool enable)
>  }
> 
>  static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
> -				struct msm_dsi_phy_clk_request *clk_req)
> +			       struct msm_dsi_dphy_timing *timing)
>  {
> -	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	int i;
>  	void __iomem *base = phy->base;
>  	u32 val;
> 
>  	DBG("");
> 
> -	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
> -		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_STRENGTH_0, 0xff);
> 
>  	dsi_28nm_phy_regulator_ctrl(phy, true);
> @@ -775,6 +768,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> @@ -796,6 +790,7 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> @@ -817,6 +812,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 86e40a0d41a3..7d50822085f2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -590,19 +590,12 @@ static void dsi_28nm_phy_lane_config(struct
> msm_dsi_phy *phy)
>  }
> 
>  static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
> -				struct msm_dsi_phy_clk_request *clk_req)
> +			       struct msm_dsi_dphy_timing *timing)
>  {
> -	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	void __iomem *base = phy->base;
> 
>  	DBG("");
> 
> -	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
> -		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	dsi_28nm_phy_regulator_init(phy);
> 
>  	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LDO_CTRL, 0x04);
> @@ -654,6 +647,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
> = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc,
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_8960_init,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..993508268a15 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -802,13 +802,12 @@ static void dsi_phy_hw_v4_0_lane_settings(struct
> msm_dsi_phy *phy)
>  }
> 
>  static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
> -			      struct msm_dsi_phy_clk_request *clk_req)
> +			      struct msm_dsi_dphy_timing *timing)
>  {
>  	int ret;
>  	u32 status;
>  	u32 const delay_us = 5;
>  	u32 const timeout_us = 1000;
> -	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	void __iomem *base = phy->base;
>  	bool less_than_1500_mhz;
>  	u32 vreg_ctrl_0, glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
> @@ -817,12 +816,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
> *phy,
> 
>  	DBG("");
> 
> -	if (msm_dsi_dphy_timing_calc_v4(timing, clk_req)) {
> -		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	if (dsi_phy_hw_v4_0_is_pll_on(phy))
>  		pr_warn("PLL turned on before configuring PHY\n");
> 
> @@ -838,7 +831,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
> *phy,
>  	/* TODO: CPHY enable path (this is for DPHY only) */
> 
>  	/* Alter PHY configurations if data rate less than 1.5GHZ*/
> -	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
> +	less_than_1500_mhz = (timing->bitclk_rate <= 1500000000);
> 
>  	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> @@ -965,6 +958,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v4,
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
>  		.pll_init = dsi_pll_7nm_init,
> @@ -987,6 +981,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs 
> = {
>  		},
>  	},
>  	.ops = {
> +		.dphy_timing_calc = msm_dsi_dphy_timing_calc_v4,
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
>  		.pll_init = dsi_pll_7nm_init,
