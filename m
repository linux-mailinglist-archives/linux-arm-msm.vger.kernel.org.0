Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D607A34DC87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 01:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhC2Xd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 19:33:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43056 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhC2Xdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 19:33:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617060826; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FYw8FVoFjxcc64Pv5ya2KccTrTGu/YMJrDvjxFKzZfI=;
 b=CgbxX7IssbwyOsBcP94OD7Ito7E+vtYaVFswyiKZ+BxYtV00Qh7AG3YUrn3zdioQaiXMN3GZ
 5V9PiSBryNYtQxlOa7zq7s3x0Go4fGV61JZ/EH1GTflYbidjVBAAfNrMKdaVA0tUwP5GOg6E
 qEdmv/e8sAu1qBHzXByVE99Gii4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 606263d904a1954ec3dc822f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 23:33:45
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0A4DC43461; Mon, 29 Mar 2021 23:33:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DA32C433CA;
        Mon, 29 Mar 2021 23:33:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 16:33:41 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 12/25] drm/msm/dsi: use devm_clk_*register
 to registe DSI PHY clocks
In-Reply-To: <20210327110305.3289784-13-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-13-dmitry.baryshkov@linaro.org>
Message-ID: <2b5c9256f41bcfd16accacd97bb7e520@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Use devres-enabled version of clock registration functions. This lets 
> us
> remove dsi_pll destroy callbacks completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  4 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 84 ++++---------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 35 +-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 50 +++++------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 39 +++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 84 ++++---------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 17 ----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 -
>  10 files changed, 71 insertions(+), 249 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 43590f338d20..0970f05cd47f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -95,13 +95,9 @@ struct drm_encoder *msm_dsi_get_encoder(struct
> msm_dsi *msm_dsi);
>  /* dsi pll */
>  struct msm_dsi_pll;
>  #ifdef CONFIG_DRM_MSM_DSI_PLL
> -void msm_dsi_pll_destroy(struct msm_dsi_pll *pll);
>  void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
>  int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
>  #else
> -static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
> -{
> -}
>  static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
>  {
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 69214447f757..df3b91b0ea88 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -744,7 +744,6 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  fail:
>  	if (phy->pll) {
>  		of_clk_del_provider(dev->of_node);
> -		msm_dsi_pll_destroy(phy->pll);
>  		phy->pll = NULL;
>  	}
> 
> @@ -757,7 +756,6 @@ static int dsi_phy_driver_remove(struct
> platform_device *pdev)
> 
>  	if (phy && phy->pll) {
>  		of_clk_del_provider(pdev->dev.of_node);
> -		msm_dsi_pll_destroy(phy->pll);
>  		phy->pll = NULL;
>  	}
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index c3099629fa3b..2c5196844ba9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -23,7 +23,6 @@ struct msm_dsi_phy_ops {
>  struct msm_dsi_pll_ops {
>  	int (*enable_seq)(struct msm_dsi_pll *pll);
>  	void (*disable_seq)(struct msm_dsi_pll *pll);
> -	void (*destroy)(struct msm_dsi_pll *pll);
>  	void (*save_state)(struct msm_dsi_pll *pll);
>  	int (*restore_state)(struct msm_dsi_pll *pll);
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 8666da1c29e5..6300b92c65eb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -103,15 +103,6 @@ struct dsi_pll_10nm {
>  	struct dsi_pll_config pll_configuration;
>  	struct dsi_pll_regs reg_setup;
> 
> -	/* private clocks: */
> -	struct clk_hw *out_div_clk_hw;
> -	struct clk_hw *bit_clk_hw;
> -	struct clk_hw *byte_clk_hw;
> -	struct clk_hw *by_2_bit_clk_hw;
> -	struct clk_hw *post_out_div_clk_hw;
> -	struct clk_hw *pclk_mux_hw;
> -	struct clk_hw *out_dsiclk_hw;
> -
>  	struct pll_10nm_cached_state cached_state;
> 
>  	enum msm_dsi_phy_usecase uc;
> @@ -614,22 +605,6 @@ static int dsi_pll_10nm_set_usecase(struct
> msm_dsi_pll *pll,
>  	return 0;
>  }
> 
> -static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> -
> -	DBG("DSI PLL%d", pll_10nm->id);
> -
> -	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
> -	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
> -	clk_hw_unregister_fixed_factor(pll_10nm->post_out_div_clk_hw);
> -	clk_hw_unregister_fixed_factor(pll_10nm->by_2_bit_clk_hw);
> -	clk_hw_unregister_fixed_factor(pll_10nm->byte_clk_hw);
> -	clk_hw_unregister_divider(pll_10nm->bit_clk_hw);
> -	clk_hw_unregister_divider(pll_10nm->out_div_clk_hw);
> -	clk_hw_unregister(&pll_10nm->base.clk_hw);
> -}
> -
>  /*
>   * The post dividers and mux clocks are created using the standard 
> divider and
>   * mux API. Unlike the 14nm PHY, the slave PLL doesn't need its 
> dividers/mux
> @@ -656,30 +631,28 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->id);
>  	pll_10nm->base.clk_hw.init = &vco_init;
> 
> -	ret = clk_hw_register(dev, &pll_10nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_10nm->base.clk_hw);
>  	if (ret)
>  		return ret;
> 
>  	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->id);
> 
> -	hw = clk_hw_register_divider(dev, clk_name,
> +	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				     parent, CLK_SET_RATE_PARENT,
>  				     pll_10nm->mmio +
>  				     REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
>  				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_base_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->out_div_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
> 
>  	/* BIT CLK: DIV_CTRL_3_0 */
> -	hw = clk_hw_register_divider(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
>  				     CLK_SET_RATE_PARENT,
>  				     pll_10nm->phy_cmn_mmio +
>  				     REG_DSI_10nm_PHY_CMN_CLK_CFG0,
> @@ -687,56 +660,49 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
>  				     &pll_10nm->postdiv_lock);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_out_div_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->bit_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
> 
>  	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  CLK_SET_RATE_PARENT, 1, 8);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_bit_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->byte_clk_hw = hw;
>  	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
> 
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  0, 1, 2);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_byte_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->by_2_bit_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
> 
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  0, 1, 4);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_by_2_bit_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->post_out_div_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
>  	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
>  	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
>  	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
> 
> -	hw = clk_hw_register_mux(dev, clk_name,
> +	hw = devm_clk_hw_register_mux(dev, clk_name,
>  				 ((const char *[]){
>  				 parent, parent2, parent3, parent4
>  				 }), 4, 0, pll_10nm->phy_cmn_mmio +
> @@ -744,44 +710,28 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
>  				 0, 2, 0, NULL);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_post_out_div_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->pclk_mux_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->id);
> 
>  	/* PIX CLK DIV : DIV_CTRL_7_4*/
> -	hw = clk_hw_register_divider(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
>  				     0, pll_10nm->phy_cmn_mmio +
>  					REG_DSI_10nm_PHY_CMN_CLK_CFG0,
>  				     4, 4, CLK_DIVIDER_ONE_BASED,
>  				     &pll_10nm->postdiv_lock);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_pclk_mux_hw;
> +		goto fail;
>  	}
> 
> -	pll_10nm->out_dsiclk_hw = hw;
>  	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> 
>  	return 0;
> 
> -err_pclk_mux_hw:
> -	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
> -err_post_out_div_clk_hw:
> -	clk_hw_unregister_fixed_factor(pll_10nm->post_out_div_clk_hw);
> -err_by_2_bit_clk_hw:
> -	clk_hw_unregister_fixed_factor(pll_10nm->by_2_bit_clk_hw);
> -err_byte_clk_hw:
> -	clk_hw_unregister_fixed_factor(pll_10nm->byte_clk_hw);
> -err_bit_clk_hw:
> -	clk_hw_unregister_divider(pll_10nm->bit_clk_hw);
> -err_out_div_clk_hw:
> -	clk_hw_unregister_divider(pll_10nm->out_div_clk_hw);
> -err_base_clk_hw:
> -	clk_hw_unregister(&pll_10nm->base.clk_hw);
> +fail:
> 
>  	return ret;
>  }
> @@ -1060,7 +1010,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.pll_init = dsi_pll_10nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
>  	},
> @@ -1085,7 +1034,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  		.pll_init = dsi_pll_10nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
>  	},
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 07ecdf34f614..7fe7c8348b42 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -133,10 +133,6 @@ struct dsi_pll_14nm {
>  	u64 vco_current_rate;
>  	u64 vco_ref_clk_rate;
> 
> -	/* private clocks: */
> -	struct clk_hw *hws[NUM_DSI_CLOCKS_MAX];
> -	u32 num_hws;
> -
>  	struct pll_14nm_cached_state cached_state;
> 
>  	enum msm_dsi_phy_usecase uc;
> @@ -872,15 +868,6 @@ static int dsi_pll_14nm_set_usecase(struct
> msm_dsi_pll *pll,
>  	return 0;
>  }
> 
> -static void dsi_pll_14nm_destroy(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> -	int num_hws = pll_14nm->num_hws;
> -
> -	while (num_hws--)
> -		clk_hw_unregister(pll_14nm->hws[num_hws]);
> -}
> -
>  static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm 
> *pll_14nm,
>  						const char *name,
>  						const char *parent_name,
> @@ -910,7 +897,7 @@ static struct clk_hw
> *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
>  	pll_postdiv->flags = CLK_DIVIDER_ONE_BASED;
>  	pll_postdiv->hw.init = &postdiv_init;
> 
> -	ret = clk_hw_register(dev, &pll_postdiv->hw);
> +	ret = devm_clk_hw_register(dev, &pll_postdiv->hw);
>  	if (ret)
>  		return ERR_PTR(ret);
> 
> @@ -928,9 +915,7 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm, struct clk_hw **prov
>  		.ops = &clk_ops_dsi_pll_14nm_vco,
>  	};
>  	struct device *dev = &pll_14nm->pdev->dev;
> -	struct clk_hw **hws = pll_14nm->hws;
>  	struct clk_hw *hw;
> -	int num = 0;
>  	int ret;
> 
>  	DBG("DSI%d", pll_14nm->id);
> @@ -938,12 +923,10 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm, struct clk_hw **prov
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->id);
>  	pll_14nm->base.clk_hw.init = &vco_init;
> 
> -	ret = clk_hw_register(dev, &pll_14nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_14nm->base.clk_hw);
>  	if (ret)
>  		return ret;
> 
> -	hws[num++] = &pll_14nm->base.clk_hw;
> -
>  	snprintf(clk_name, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
>  	snprintf(parent, 32, "dsi%dvco_clk", pll_14nm->id);
> 
> @@ -953,18 +936,15 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm, struct clk_hw **prov
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
> 
> -	hws[num++] = hw;
> -
>  	snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->id);
>  	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
> 
>  	/* DSI Byte clock = VCO_CLK / N1 / 8 */
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  CLK_SET_RATE_PARENT, 1, 8);
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
> 
> -	hws[num++] = hw;
>  	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
> @@ -974,12 +954,10 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm, struct clk_hw **prov
>  	 * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
>  	 * on the way. Don't let it set parent.
>  	 */
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 2);
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 
> 2);
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
> 
> -	hws[num++] = hw;
> -
>  	snprintf(clk_name, 32, "dsi%dpll", pll_14nm->id);
>  	snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
> 
> @@ -991,11 +969,8 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm, struct clk_hw **prov
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
> 
> -	hws[num++] = hw;
>  	provided_clocks[DSI_PIXEL_PLL_CLK]	= hw;
> 
> -	pll_14nm->num_hws = num;
> -
>  	return 0;
>  }
> 
> @@ -1184,7 +1159,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.pll_init = dsi_pll_14nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
>  		.disable_seq = dsi_pll_14nm_disable_seq,
> @@ -1211,7 +1185,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		.pll_init = dsi_pll_14nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
>  		.disable_seq = dsi_pll_14nm_disable_seq,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 3446be318648..3e9b7949b038 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -74,10 +74,6 @@ struct dsi_pll_28nm {
> 
>  	int vco_delay;
> 
> -	/* private clocks: */
> -	struct clk *clks[NUM_DSI_CLOCKS_MAX];
> -	u32 num_clks;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -486,15 +482,6 @@ static int dsi_pll_28nm_restore_state(struct
> msm_dsi_pll *pll)
>  	return 0;
>  }
> 
> -static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -
> -	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, 
> pll_28nm->num_clks);
> -
> -	pll_28nm->num_clks = 0;
> -}
> -
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct
> clk_hw **provided_clocks)
>  {
>  	char clk_name[32], parent1[32], parent2[32], vco_name[32];
> @@ -506,53 +493,63 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  		.ops = &clk_ops_dsi_pll_28nm_vco,
>  	};
>  	struct device *dev = &pll_28nm->pdev->dev;
> -	struct clk **clks = pll_28nm->clks;
> -	int num = 0;
> +	struct clk_hw *hw;
> +	int ret;
> 
>  	DBG("%d", pll_28nm->id);
> 
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
>  	pll_28nm->base.clk_hw.init = &vco_init;
> -	clks[num++] = clk_register(dev, &pll_28nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
> +	if (ret)
> +		return ret;
> 
>  	snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
> -	clks[num++] = clk_register_divider(dev, clk_name,
> +	hw = devm_clk_hw_register_divider(dev, clk_name,
>  			parent1, CLK_SET_RATE_PARENT,
>  			pll_28nm->mmio +
>  			REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
>  			0, 4, 0, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> 
>  	snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->id);
> -	clks[num++] = clk_register_fixed_factor(dev, clk_name,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
>  			parent1, CLK_SET_RATE_PARENT,
>  			1, 2);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> 
>  	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
> -	clks[num++] = clk_register_divider(dev, clk_name,
> +	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				parent1, 0, pll_28nm->mmio +
>  				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
>  				0, 8, 0, NULL);
> -	provided_clocks[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
>  	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->id);
> -	clks[num++] = clk_register_mux(dev, clk_name,
> +	hw = devm_clk_hw_register_mux(dev, clk_name,
>  			((const char *[]){
>  				parent1, parent2
>  			}), 2, CLK_SET_RATE_PARENT, pll_28nm->mmio +
>  			REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> 
>  	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->id);
> -	clks[num++] = clk_register_fixed_factor(dev, clk_name,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
>  				parent1, CLK_SET_RATE_PARENT, 1, 4);
> -	provided_clocks[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> -
> -	pll_28nm->num_clks = num;
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	return 0;
>  }
> @@ -758,7 +755,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
>  		.disable_seq = dsi_pll_28nm_disable_seq,
> @@ -785,7 +781,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
>  		.disable_seq = dsi_pll_28nm_disable_seq,
> @@ -812,7 +807,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
>  		.disable_seq = dsi_pll_28nm_disable_seq,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index c4b433790cfb..45b2bf482392 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -64,13 +64,6 @@ struct dsi_pll_28nm {
>  	struct platform_device *pdev;
>  	void __iomem *mmio;
> 
> -	/* custom byte clock divider */
> -	struct clk_bytediv *bytediv;
> -
> -	/* private clocks: */
> -	struct clk *clks[NUM_DSI_CLOCKS_MAX];
> -	u32 num_clks;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -368,13 +361,6 @@ static int dsi_pll_28nm_restore_state(struct
> msm_dsi_pll *pll)
>  	return 0;
>  }
> 
> -static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -
> -	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, 
> pll_28nm->num_clks);
> -}
> -
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct
> clk_hw **provided_clocks)
>  {
>  	char *clk_name, *parent_name, *vco_name;
> @@ -385,10 +371,10 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  		.ops = &clk_ops_dsi_pll_28nm_vco,
>  	};
>  	struct device *dev = &pll_28nm->pdev->dev;
> -	struct clk **clks = pll_28nm->clks;
> +	struct clk_hw *hw;
>  	struct clk_bytediv *bytediv;
>  	struct clk_init_data bytediv_init = { };
> -	int num = 0;
> +	int ret;
> 
>  	DBG("%d", pll_28nm->id);
> 
> @@ -404,14 +390,14 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	if (!clk_name)
>  		return -ENOMEM;
> 
> -	pll_28nm->bytediv = bytediv;
> -
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
>  	vco_init.name = vco_name;
> 
>  	pll_28nm->base.clk_hw.init = &vco_init;
> 
> -	clks[num++] = clk_register(dev, &pll_28nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
> +	if (ret)
> +		return ret;
> 
>  	/* prepare and register bytediv */
>  	bytediv->hw.init = &bytediv_init;
> @@ -427,18 +413,20 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	bytediv_init.num_parents = 1;
> 
>  	/* DIV2 */
> -	clks[num++] = clk_register(dev, &bytediv->hw);
> -	provided_clocks[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> +	ret = devm_clk_hw_register(dev, &bytediv->hw);
> +	if (ret)
> +		return ret;
> +	provided_clocks[DSI_BYTE_PLL_CLK] = &bytediv->hw;
> 
>  	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
>  	/* DIV3 */
> -	clks[num++] = clk_register_divider(dev, clk_name,
> +	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				parent_name, 0, pll_28nm->mmio +
>  				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
>  				0, 8, 0, NULL);
> -	provided_clocks[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> -
> -	pll_28nm->num_clks = num;
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> 
>  	return 0;
>  }
> @@ -662,7 +650,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
> = {
>  		.pll_init = dsi_pll_28nm_8960_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
>  		.disable_seq = dsi_pll_28nm_disable_seq,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 0b601afa9e49..c482e51d1bee 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -103,15 +103,6 @@ struct dsi_pll_7nm {
>  	struct dsi_pll_config pll_configuration;
>  	struct dsi_pll_regs reg_setup;
> 
> -	/* private clocks: */
> -	struct clk_hw *out_div_clk_hw;
> -	struct clk_hw *bit_clk_hw;
> -	struct clk_hw *byte_clk_hw;
> -	struct clk_hw *by_2_bit_clk_hw;
> -	struct clk_hw *post_out_div_clk_hw;
> -	struct clk_hw *pclk_mux_hw;
> -	struct clk_hw *out_dsiclk_hw;
> -
>  	struct pll_7nm_cached_state cached_state;
> 
>  	enum msm_dsi_phy_usecase uc;
> @@ -639,22 +630,6 @@ static int dsi_pll_7nm_set_usecase(struct 
> msm_dsi_pll *pll,
>  	return 0;
>  }
> 
> -static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> -
> -	DBG("DSI PLL%d", pll_7nm->id);
> -
> -	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
> -	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
> -	clk_hw_unregister_fixed_factor(pll_7nm->post_out_div_clk_hw);
> -	clk_hw_unregister_fixed_factor(pll_7nm->by_2_bit_clk_hw);
> -	clk_hw_unregister_fixed_factor(pll_7nm->byte_clk_hw);
> -	clk_hw_unregister_divider(pll_7nm->bit_clk_hw);
> -	clk_hw_unregister_divider(pll_7nm->out_div_clk_hw);
> -	clk_hw_unregister(&pll_7nm->base.clk_hw);
> -}
> -
>  /*
>   * The post dividers and mux clocks are created using the standard 
> divider and
>   * mux API. Unlike the 14nm PHY, the slave PLL doesn't need its 
> dividers/mux
> @@ -681,30 +656,28 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
>  	pll_7nm->base.clk_hw.init = &vco_init;
> 
> -	ret = clk_hw_register(dev, &pll_7nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_7nm->base.clk_hw);
>  	if (ret)
>  		return ret;
> 
>  	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%dvco_clk", pll_7nm->id);
> 
> -	hw = clk_hw_register_divider(dev, clk_name,
> +	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				     parent, CLK_SET_RATE_PARENT,
>  				     pll_7nm->mmio +
>  				     REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
>  				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_base_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->out_div_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
> 
>  	/* BIT CLK: DIV_CTRL_3_0 */
> -	hw = clk_hw_register_divider(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
>  				     CLK_SET_RATE_PARENT,
>  				     pll_7nm->phy_cmn_mmio +
>  				     REG_DSI_7nm_PHY_CMN_CLK_CFG0,
> @@ -712,56 +685,49 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
>  				     &pll_7nm->postdiv_lock);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_out_div_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->bit_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
> 
>  	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  CLK_SET_RATE_PARENT, 1, 8);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_bit_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->byte_clk_hw = hw;
>  	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
> 
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  0, 1, 2);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_byte_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->by_2_bit_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
> 
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
>  					  0, 1, 4);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_by_2_bit_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->post_out_div_clk_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
>  	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
>  	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
>  	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
> 
> -	hw = clk_hw_register_mux(dev, clk_name,
> +	hw = devm_clk_hw_register_mux(dev, clk_name,
>  				 ((const char *[]){
>  				 parent, parent2, parent3, parent4
>  				 }), 4, 0, pll_7nm->phy_cmn_mmio +
> @@ -769,44 +735,28 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
>  				 0, 2, 0, NULL);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_post_out_div_clk_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->pclk_mux_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->id);
> 
>  	/* PIX CLK DIV : DIV_CTRL_7_4*/
> -	hw = clk_hw_register_divider(dev, clk_name, parent,
> +	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
>  				     0, pll_7nm->phy_cmn_mmio +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG0,
>  				     4, 4, CLK_DIVIDER_ONE_BASED,
>  				     &pll_7nm->postdiv_lock);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
> -		goto err_pclk_mux_hw;
> +		goto fail;
>  	}
> 
> -	pll_7nm->out_dsiclk_hw = hw;
>  	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> 
>  	return 0;
> 
> -err_pclk_mux_hw:
> -	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
> -err_post_out_div_clk_hw:
> -	clk_hw_unregister_fixed_factor(pll_7nm->post_out_div_clk_hw);
> -err_by_2_bit_clk_hw:
> -	clk_hw_unregister_fixed_factor(pll_7nm->by_2_bit_clk_hw);
> -err_byte_clk_hw:
> -	clk_hw_unregister_fixed_factor(pll_7nm->byte_clk_hw);
> -err_bit_clk_hw:
> -	clk_hw_unregister_divider(pll_7nm->bit_clk_hw);
> -err_out_div_clk_hw:
> -	clk_hw_unregister_divider(pll_7nm->out_div_clk_hw);
> -err_base_clk_hw:
> -	clk_hw_unregister(&pll_7nm->base.clk_hw);
> +fail:
> 
>  	return ret;
>  }
> @@ -1093,7 +1043,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
>  	},
> @@ -1119,7 +1068,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  	},
>  	.pll_ops = {
> -		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
>  	},
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index 914e95435dcb..96de79b94f1b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -57,26 +57,9 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw 
> *hw)
>  	pll->pll_on = false;
>  }
> 
> -void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 
> num_clks)
> -{
> -	if (!num_clks || !clks)
> -		return;
> -
> -	do {
> -		clk_unregister(clks[--num_clks]);
> -		clks[num_clks] = NULL;
> -	} while (num_clks);
> -}
> -
>  /*
>   * DSI PLL API
>   */
> -void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
> -{
> -	if (pll->cfg->pll_ops.destroy)
> -		pll->cfg->pll_ops.destroy(pll);
> -}
> -
>  void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
>  {
>  	if (pll->cfg->pll_ops.save_state) {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> index d819a886beb8..c94f079b8275 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> @@ -11,8 +11,6 @@
> 
>  #include "dsi.h"
> 
> -#define NUM_DSI_CLOCKS_MAX	6
> -
>  struct msm_dsi_pll {
>  	struct clk_hw	clk_hw;
>  	bool		pll_on;
> @@ -54,8 +52,6 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw 
> *hw,
>  		unsigned long rate, unsigned long *parent_rate);
>  int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
>  void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
> -/* misc */
> -void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 
> num_clks);
> 
>  #endif /* __DSI_PLL_H__ */
