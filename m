Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BE34DF07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhC3DKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:10:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51420 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhC3DJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:09:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617073793; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4HpahDicqHsMNC5MQZ/HngbfLPfoCkT5YuapJzaEP1A=;
 b=iwfFYtJX8ah4WBu0dpAUtbVatdIafw1WQbJrFjOfye+xTX6vzdf5OGze9tiMVzm4WYjcE5rM
 Rkr7Hz9G5EVNYfyzIjYpl44ym0wEldLW4YSCiN/1CgGpQmtgWPjHpc9ZzgzkHlm8+MSWS9tQ
 UyNssWaWmG+scQYaEVO2zw0ANKE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 606296813f4005d075d16262 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 03:09:53
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2EF67C43464; Tue, 30 Mar 2021 03:09:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBDDAC433C6;
        Tue, 30 Mar 2021 03:09:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 20:09:50 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 18/25] drm/msm/dsi: make save_state/restore_state
 callbacks accept msm_dsi_phy
In-Reply-To: <20210327110305.3289784-19-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-19-dmitry.baryshkov@linaro.org>
Message-ID: <ea0174c65ac5d66d379ef25e392fc33f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Make save_state/restore callbacks accept struct msm_dsi_phy rather than
> struct msm_dsi_pll. This moves them to struct msm_dsi_phy_ops, allowing
> us to drop struct msm_dsi_pll_ops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 12 +++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 11 +++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 22 +++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 24 ++++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 34 ++++++++-----------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 18 +++++-----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 22 +++++-------
>  7 files changed, 60 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 176930800082..f21f3babec68 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -858,9 +858,9 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
> 
>  void msm_dsi_phy_save_state(struct msm_dsi_phy *phy)
>  {
> -	if (phy->cfg->pll_ops.save_state) {
> -		phy->cfg->pll_ops.save_state(phy->pll);
> -		phy->pll->state_saved = true;
> +	if (phy->cfg->ops.save_state) {
> +		phy->cfg->ops.save_state(phy);
> +		phy->state_saved = true;
>  	}
>  }
> 
> @@ -868,12 +868,12 @@ int msm_dsi_phy_restore_state(struct msm_dsi_phy 
> *phy)
>  {
>  	int ret;
> 
> -	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
> -		ret = phy->cfg->pll_ops.restore_state(phy->pll);
> +	if (phy->cfg->ops.restore_state && phy->state_saved) {
> +		ret = phy->cfg->ops.restore_state(phy);
>  		if (ret)
>  			return ret;
> 
> -		phy->pll->state_saved = false;
> +		phy->state_saved = false;
>  	}
> 
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b477d21804c8..fa09f4c2c071 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -17,7 +17,6 @@
>  struct msm_dsi_pll {
>  	struct clk_hw	clk_hw;
>  	bool		pll_on;
> -	bool		state_saved;
> 
>  	const struct msm_dsi_phy_cfg *cfg;
>  };
> @@ -29,17 +28,13 @@ struct msm_dsi_phy_ops {
>  	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  	void (*disable)(struct msm_dsi_phy *phy);
> -};
> -
> -struct msm_dsi_pll_ops {
> -	void (*save_state)(struct msm_dsi_pll *pll);
> -	int (*restore_state)(struct msm_dsi_pll *pll);
> +	void (*save_state)(struct msm_dsi_phy *phy);
> +	int (*restore_state)(struct msm_dsi_phy *phy);
I think that naming these save_pll_state/restore_pll_state would be more 
appropriate.
>  };
> 
>  struct msm_dsi_phy_cfg {
>  	struct dsi_reg_config reg_cfg;
>  	struct msm_dsi_phy_ops ops;
> -	const struct msm_dsi_pll_ops pll_ops;
> 
>  	unsigned long	min_pll_rate;
>  	unsigned long	max_pll_rate;
> @@ -115,6 +110,8 @@ struct msm_dsi_phy {
>  	struct msm_dsi_pll *pll;
> 
>  	struct clk_hw_onecell_data *provided_clocks;
> +
> +	bool state_saved;
>  };
> 
>  /*
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index bfb96d87d1d7..25fd4d860c4d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -518,9 +518,9 @@ static const struct clk_ops 
> clk_ops_dsi_pll_10nm_vco = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_10nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
>  	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> @@ -541,9 +541,9 @@ static void dsi_pll_10nm_save_state(struct 
> msm_dsi_pll *pll)
>  	    cached->pix_clk_div, cached->pll_mux);
>  }
> 
> -static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
>  	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
>  	u32 val;
> @@ -562,7 +562,7 @@ static int dsi_pll_10nm_restore_state(struct
> msm_dsi_pll *pll)
>  	val |= cached->pll_mux;
>  	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
> 
> -	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw,
> pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
> +	ret = dsi_pll_10nm_vco_set_rate(&phy->pll->clk_hw,
> pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
>  			"restore vco rate failed. ret=%d\n", ret);
> @@ -1005,10 +1005,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
>  		.pll_init = dsi_pll_10nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_10nm_save_state,
> -		.restore_state = dsi_pll_10nm_restore_state,
> +		.save_state = dsi_10nm_save_state,
> +		.restore_state = dsi_10nm_restore_state,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> @@ -1029,10 +1027,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
>  		.pll_init = dsi_pll_10nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_10nm_save_state,
> -		.restore_state = dsi_pll_10nm_restore_state,
> +		.save_state = dsi_10nm_save_state,
> +		.restore_state = dsi_10nm_restore_state,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 91c5bb2fd169..c7c462bfe96d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -795,9 +795,9 @@ static const struct clk_ops 
> clk_ops_dsi_pll_14nm_postdiv = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_14nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	u32 data;
> @@ -810,18 +810,18 @@ static void dsi_pll_14nm_save_state(struct
> msm_dsi_pll *pll)
>  	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
>  	    cached_state->n1postdiv, cached_state->n2postdiv);
> 
> -	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
> +	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
>  }
> 
> -static int dsi_pll_14nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	u32 data;
>  	int ret;
> 
> -	ret = dsi_pll_14nm_vco_set_rate(&pll->clk_hw,
> +	ret = dsi_pll_14nm_vco_set_rate(&phy->pll->clk_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
> @@ -1166,10 +1166,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
>  		.pll_init = dsi_pll_14nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_14nm_save_state,
> -		.restore_state = dsi_pll_14nm_restore_state,
> +		.save_state = dsi_14nm_save_state,
Similarly even for the respective PLL API names, 
dsi_14nm_pll_save_state/dsi_14nm_pll_restore_state will be better.
> +		.restore_state = dsi_14nm_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -1190,10 +1188,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
>  		.pll_init = dsi_pll_14nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_14nm_save_state,
> -		.restore_state = dsi_pll_14nm_restore_state,
> +		.save_state = dsi_14nm_save_state,
> +		.restore_state = dsi_14nm_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 20b31398b540..bfd110eb25fc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -470,9 +470,9 @@ static const struct clk_ops 
> clk_ops_dsi_pll_28nm_vco_lp = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
> 
> @@ -481,20 +481,20 @@ static void dsi_pll_28nm_save_state(struct
> msm_dsi_pll *pll)
>  	cached_state->postdiv1 =
>  			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
>  	cached_state->byte_mux = pll_read(base + 
> REG_DSI_28nm_PHY_PLL_VREG_CFG);
> -	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
> -		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
> +	if (dsi_pll_28nm_clk_is_enabled(&phy->pll->clk_hw))
> +		cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
>  	else
>  		cached_state->vco_rate = 0;
>  }
> 
> -static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
>  	int ret;
> 
> -	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
> +	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
> @@ -527,7 +527,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
> 
>  	DBG("%d", pll_28nm->id);
> 
> -	if (pll_28nm->base.cfg->type == MSM_DSI_PHY_28NM_LP)
> +	if (pll_28nm->base.cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
>  	else
>  		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
> @@ -783,10 +783,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_state = dsi_28nm_save_state,
> +		.restore_state = dsi_28nm_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -807,10 +805,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_state = dsi_28nm_save_state,
> +		.restore_state = dsi_28nm_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -831,10 +827,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs 
> = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_state = dsi_28nm_save_state,
> +		.restore_state = dsi_28nm_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 952444e3e8f0..c71c5f07666d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -334,9 +334,9 @@ static const struct clk_ops clk_bytediv_ops = {
>  /*
>   * PLL Callbacks
>   */
> -static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
> 
> @@ -347,17 +347,17 @@ static void dsi_pll_28nm_save_state(struct
> msm_dsi_pll *pll)
>  	cached_state->postdiv1 =
>  			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
> 
> -	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
> +	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
>  }
> 
> -static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
>  	int ret;
> 
> -	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
> +	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
> @@ -662,10 +662,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_8960_cfgs = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_8960_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_state = dsi_28nm_save_state,
> +		.restore_state = dsi_28nm_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index f760904efac9..015e099d7b7f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -543,9 +543,9 @@ static const struct clk_ops clk_ops_dsi_pll_7nm_vco 
> = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_7nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
>  	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> @@ -566,9 +566,9 @@ static void dsi_pll_7nm_save_state(struct 
> msm_dsi_pll *pll)
>  	    cached->pix_clk_div, cached->pll_mux);
>  }
> 
> -static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
>  	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
>  	u32 val;
> @@ -587,7 +587,7 @@ static int dsi_pll_7nm_restore_state(struct
> msm_dsi_pll *pll)
>  	val |= cached->pll_mux;
>  	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
> 
> -	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw,
> pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
> +	ret = dsi_pll_7nm_vco_set_rate(&phy->pll->clk_hw,
> pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);

Can you double check the char length on this line? Wouldnt this exceed 
100chars?
similarly other dsi_pll_**_vco_set_rates might too

>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
>  			"restore vco rate failed. ret=%d\n", ret);
> @@ -1038,10 +1038,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = 
> {
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
>  		.pll_init = dsi_pll_7nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_7nm_save_state,
> -		.restore_state = dsi_pll_7nm_restore_state,
> +		.save_state = dsi_7nm_save_state,
> +		.restore_state = dsi_7nm_restore_state,
>  	},
>  	.min_pll_rate = 600000000UL,
>  	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
> ULONG_MAX,
> @@ -1063,10 +1061,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
>  		.pll_init = dsi_pll_7nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_7nm_save_state,
> -		.restore_state = dsi_pll_7nm_restore_state,
> +		.save_state = dsi_7nm_save_state,
> +		.restore_state = dsi_7nm_restore_state,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
