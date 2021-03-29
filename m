Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F02534D9F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 00:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhC2WNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 18:13:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62817 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230323AbhC2WNG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 18:13:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617055985; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=b5NbHrhOUF7yWSvl+N4oCKvXI9qST5nU4wmowCwISkg=;
 b=lCu0s1w3PR6YVHgA0wp3sNbH/VtUFUBoVbNJ99qOpi00ztHFDOCnToZYPDsnLq/v/AFALbo1
 MZ/1/aGgFr9RpVUBducf0W7YHZXnXSRcwwpK7V2C83kCNGcRZYTbumOcBI2VjJSAE+GgnD9/
 7abTh2nn7K5ZjrtLJaOif0x7GPY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 606250f13f4005d0753478a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 22:13:05
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26FABC43465; Mon, 29 Mar 2021 22:13:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F24C4C433CA;
        Mon, 29 Mar 2021 22:12:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 15:12:58 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 11/25] drm/msm/dsi: push provided clocks
 handling into a generic code
In-Reply-To: <20210327110305.3289784-12-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-12-dmitry.baryshkov@linaro.org>
Message-ID: <a29161d0f740ecac1321b72709861623@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> All MSM DSI PHYs provide two clocks: byte and pixel ones.
> Register/unregister provided clocks from the generic place, removing
> boilerplate code from all MSM DSI PHY drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                 | 11 +---
>  drivers/gpu/drm/msm/dsi/dsi_host.c            |  4 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c         | 13 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 34 ++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  9 ++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 55 ++--------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 53 ++--------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 63 +++----------------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 57 +++--------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 55 ++--------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 16 +----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  3 +-
>  12 files changed, 78 insertions(+), 295 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b310cf344ed4..43590f338d20 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -96,19 +96,12 @@ struct drm_encoder *msm_dsi_get_encoder(struct
> msm_dsi *msm_dsi);
>  struct msm_dsi_pll;
>  #ifdef CONFIG_DRM_MSM_DSI_PLL
>  void msm_dsi_pll_destroy(struct msm_dsi_pll *pll);
> -int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
>  int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
>  #else
>  static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
>  {
>  }
> -static inline int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll 
> *pll,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
> -{
> -	return -ENODEV;
> -}
>  static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
>  {
>  }
> @@ -144,7 +137,7 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct
> mipi_dsi_host *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host, bool 
> check_defer);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -			struct msm_dsi_pll *src_pll);
> +			struct msm_dsi_phy *src_phy);
>  void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
>  void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  	struct msm_dsi_phy_clk_request *clk_req,
> @@ -196,6 +189,8 @@ void msm_dsi_phy_get_shared_timings(struct 
> msm_dsi_phy *phy,
>  struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc);
> +int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> +	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ab281cba0f08..41e1d0f7ab6e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2226,13 +2226,13 @@ void msm_dsi_host_cmd_xfer_commit(struct
> mipi_dsi_host *host, u32 dma_base,
>  }
> 
>  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -	struct msm_dsi_pll *src_pll)
> +	struct msm_dsi_phy *src_phy)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	struct clk *byte_clk_provider, *pixel_clk_provider;
>  	int ret;
> 
> -	ret = msm_dsi_pll_get_clk_provider(src_pll,
> +	ret = msm_dsi_phy_get_clk_provider(src_phy,
>  				&byte_clk_provider, &pixel_clk_provider);
>  	if (ret) {
>  		pr_info("%s: can't get provider from pll, don't set parent\n",
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 1d28dfba2c9b..86e36be58701 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -70,7 +70,6 @@ static int dsi_mgr_setup_components(int id)
>  	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
>  	struct msm_dsi *clk_master_dsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
>  	struct msm_dsi *clk_slave_dsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
> -	struct msm_dsi_pll *src_pll;
>  	int ret;
> 
>  	if (!IS_DUAL_DSI()) {
> @@ -79,10 +78,7 @@ static int dsi_mgr_setup_components(int id)
>  			return ret;
> 
>  		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
> -		if (IS_ERR(src_pll))
> -			return PTR_ERR(src_pll);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
> +		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
>  	} else if (!other_dsi) {
>  		ret = 0;
>  	} else {
> @@ -109,13 +105,10 @@ static int dsi_mgr_setup_components(int id)
>  					MSM_DSI_PHY_MASTER);
>  		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
>  					MSM_DSI_PHY_SLAVE);
> -		src_pll = msm_dsi_phy_get_pll(clk_master_dsi->phy);
> -		if (IS_ERR(src_pll))
> -			return PTR_ERR(src_pll);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
> +		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
>  		if (ret)
>  			return ret;
> -		ret = msm_dsi_host_set_src_pll(other_dsi->host, src_pll);
> +		ret = msm_dsi_host_set_src_pll(other_dsi->host, 
> clk_master_dsi->phy);
>  	}
> 
>  	return ret;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 5f153b683521..69214447f757 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>   */
> 
> +#include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
> 
>  #include "dsi_phy.h"
> @@ -652,6 +653,14 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	if (!match)
>  		return -ENODEV;
> 
> +	phy->provided_clocks = devm_kzalloc(dev,
> +			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
> +			GFP_KERNEL);
> +	if (!phy->provided_clocks)
> +		return -ENOMEM;
> +
> +	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
> +
>  	phy->cfg = match->data;
>  	phy->pdev = pdev;
> 
> @@ -719,6 +728,13 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  		}
>  	}
> 
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +				     phy->provided_clocks);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n",
> __func__, ret);
> +		goto fail;
> +	}
> +
>  	dsi_phy_disable_resource(phy);
> 
>  	platform_set_drvdata(pdev, phy);
> @@ -726,6 +742,12 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	return 0;
> 
>  fail:
> +	if (phy->pll) {
> +		of_clk_del_provider(dev->of_node);
> +		msm_dsi_pll_destroy(phy->pll);
> +		phy->pll = NULL;
> +	}
> +
>  	return ret;
>  }
> 
> @@ -734,6 +756,7 @@ static int dsi_phy_driver_remove(struct
> platform_device *pdev)
>  	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
> 
>  	if (phy && phy->pll) {
> +		of_clk_del_provider(pdev->dev.of_node);
>  		msm_dsi_pll_destroy(phy->pll);
>  		phy->pll = NULL;
>  	}
> @@ -851,3 +874,14 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy 
> *phy,
>  	if (phy)
>  		phy->usecase = uc;
>  }
> +
> +int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> +	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
> +{
> +	if (byte_clk_provider)
> +		*byte_clk_provider = 
> phy->provided_clocks->hws[DSI_BYTE_PLL_CLK]->clk;
> +	if (pixel_clk_provider)
> +		*pixel_clk_provider = 
> phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
> +
> +	return -EINVAL;
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index f737bef74b91..c3099629fa3b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -23,9 +23,6 @@ struct msm_dsi_phy_ops {
>  struct msm_dsi_pll_ops {
>  	int (*enable_seq)(struct msm_dsi_pll *pll);
>  	void (*disable_seq)(struct msm_dsi_pll *pll);
> -	int (*get_provider)(struct msm_dsi_pll *pll,
> -			struct clk **byte_clk_provider,
> -			struct clk **pixel_clk_provider);
>  	void (*destroy)(struct msm_dsi_pll *pll);
>  	void (*save_state)(struct msm_dsi_pll *pll);
>  	int (*restore_state)(struct msm_dsi_pll *pll);
> @@ -87,6 +84,10 @@ struct msm_dsi_dphy_timing {
>  	u8 hs_halfbyte_en_ckln;
>  };
> 
> +#define DSI_BYTE_PLL_CLK		0
> +#define DSI_PIXEL_PLL_CLK		1
> +#define NUM_PROVIDED_CLKS		2
> +
>  struct msm_dsi_phy {
>  	struct platform_device *pdev;
>  	void __iomem *base;
> @@ -104,6 +105,8 @@ struct msm_dsi_phy {
>  	bool regulator_ldo_mode;
> 
>  	struct msm_dsi_pll *pll;
> +
> +	struct clk_hw_onecell_data *provided_clocks;
>  };
> 
>  /*
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 7a98e420414f..8666da1c29e5 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -36,10 +36,6 @@
>   *                                                  
> dsi0_pll_post_out_div_clk
>   */
> 
> -#define DSI_BYTE_PLL_CLK		0
> -#define DSI_PIXEL_PLL_CLK		1
> -#define NUM_PROVIDED_CLKS		2
> -
>  #define VCO_REF_CLK_RATE		19200000
> 
>  struct dsi_pll_regs {
> @@ -116,9 +112,6 @@ struct dsi_pll_10nm {
>  	struct clk_hw *pclk_mux_hw;
>  	struct clk_hw *out_dsiclk_hw;
> 
> -	/* clock-provider: */
> -	struct clk_hw_onecell_data *hw_data;
> -
>  	struct pll_10nm_cached_state cached_state;
> 
>  	enum msm_dsi_phy_usecase uc;
> @@ -621,30 +614,11 @@ static int dsi_pll_10nm_set_usecase(struct
> msm_dsi_pll *pll,
>  	return 0;
>  }
> 
> -static int dsi_pll_10nm_get_provider(struct msm_dsi_pll *pll,
> -				     struct clk **byte_clk_provider,
> -				     struct clk **pixel_clk_provider)
> -{
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> -	struct clk_hw_onecell_data *hw_data = pll_10nm->hw_data;
> -
> -	DBG("DSI PLL%d", pll_10nm->id);
> -
> -	if (byte_clk_provider)
> -		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
> -
> -	return 0;
> -}
> -
>  static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> -	struct device *dev = &pll_10nm->pdev->dev;
> 
>  	DBG("DSI PLL%d", pll_10nm->id);
> -	of_clk_del_provider(dev->of_node);
> 
>  	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
>  	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
> @@ -662,7 +636,7 @@ static void dsi_pll_10nm_destroy(struct msm_dsi_pll 
> *pll)
>   * state to follow the master PLL's divider/mux state. Therefore, we 
> don't
>   * require special clock ops that also configure the slave PLL 
> registers
>   */
> -static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
> +static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct
> clk_hw **provided_clocks)
>  {
>  	char clk_name[32], parent[32], vco_name[32];
>  	char parent2[32], parent3[32], parent4[32];
> @@ -674,18 +648,11 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm)
>  		.ops = &clk_ops_dsi_pll_10nm_vco,
>  	};
>  	struct device *dev = &pll_10nm->pdev->dev;
> -	struct clk_hw_onecell_data *hw_data;
>  	struct clk_hw *hw;
>  	int ret;
> 
>  	DBG("DSI%d", pll_10nm->id);
> 
> -	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
> -			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
> -			       GFP_KERNEL);
> -	if (!hw_data)
> -		return -ENOMEM;
> -
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->id);
>  	pll_10nm->base.clk_hw.init = &vco_init;
> 
> @@ -737,7 +704,7 @@ static int pll_10nm_register(struct dsi_pll_10nm 
> *pll_10nm)
>  	}
> 
>  	pll_10nm->byte_clk_hw = hw;
> -	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
> +	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
> @@ -797,22 +764,10 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm)
>  	}
> 
>  	pll_10nm->out_dsiclk_hw = hw;
> -	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
> -
> -	hw_data->num = NUM_PROVIDED_CLKS;
> -	pll_10nm->hw_data = hw_data;
> -
> -	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> -				     pll_10nm->hw_data);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
> -		goto err_dsiclk_hw;
> -	}
> +	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> 
>  	return 0;
> 
> -err_dsiclk_hw:
> -	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
>  err_pclk_mux_hw:
>  	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
>  err_post_out_div_clk_hw:
> @@ -868,7 +823,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	pll_10nm->vco_delay = 1;
> 
> -	ret = pll_10nm_register(pll_10nm);
> +	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
>  		return ret;
> @@ -1105,7 +1060,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.pll_init = dsi_pll_10nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_10nm_get_provider,
>  		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
> @@ -1131,7 +1085,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  		.pll_init = dsi_pll_10nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_10nm_get_provider,
>  		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index bab86fa6dc4b..07ecdf34f614 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -34,15 +34,10 @@
>  #define POLL_MAX_READS			15
>  #define POLL_TIMEOUT_US			1000
> 
> -#define NUM_PROVIDED_CLKS		2
> -
>  #define VCO_REF_CLK_RATE		19200000
>  #define VCO_MIN_RATE			1300000000UL
>  #define VCO_MAX_RATE			2600000000UL
> 
> -#define DSI_BYTE_PLL_CLK		0
> -#define DSI_PIXEL_PLL_CLK		1
> -
>  #define DSI_PLL_DEFAULT_VCO_POSTDIV	1
> 
>  struct dsi_pll_input {
> @@ -142,9 +137,6 @@ struct dsi_pll_14nm {
>  	struct clk_hw *hws[NUM_DSI_CLOCKS_MAX];
>  	u32 num_hws;
> 
> -	/* clock-provider: */
> -	struct clk_hw_onecell_data *hw_data;
> -
>  	struct pll_14nm_cached_state cached_state;
> 
>  	enum msm_dsi_phy_usecase uc;
> @@ -880,29 +872,11 @@ static int dsi_pll_14nm_set_usecase(struct
> msm_dsi_pll *pll,
>  	return 0;
>  }
> 
> -static int dsi_pll_14nm_get_provider(struct msm_dsi_pll *pll,
> -				     struct clk **byte_clk_provider,
> -				     struct clk **pixel_clk_provider)
> -{
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> -	struct clk_hw_onecell_data *hw_data = pll_14nm->hw_data;
> -
> -	if (byte_clk_provider)
> -		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
> -
> -	return 0;
> -}
> -
>  static void dsi_pll_14nm_destroy(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> -	struct platform_device *pdev = pll_14nm->pdev;
>  	int num_hws = pll_14nm->num_hws;
> 
> -	of_clk_del_provider(pdev->dev.of_node);
> -
>  	while (num_hws--)
>  		clk_hw_unregister(pll_14nm->hws[num_hws]);
>  }
> @@ -943,7 +917,7 @@ static struct clk_hw
> *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
>  	return &pll_postdiv->hw;
>  }
> 
> -static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
> +static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct
> clk_hw **provided_clocks)
>  {
>  	char clk_name[32], parent[32], vco_name[32];
>  	struct clk_init_data vco_init = {
> @@ -955,19 +929,12 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm)
>  	};
>  	struct device *dev = &pll_14nm->pdev->dev;
>  	struct clk_hw **hws = pll_14nm->hws;
> -	struct clk_hw_onecell_data *hw_data;
>  	struct clk_hw *hw;
>  	int num = 0;
>  	int ret;
> 
>  	DBG("DSI%d", pll_14nm->id);
> 
> -	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
> -			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
> -			       GFP_KERNEL);
> -	if (!hw_data)
> -		return -ENOMEM;
> -
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->id);
>  	pll_14nm->base.clk_hw.init = &vco_init;
> 
> @@ -998,7 +965,7 @@ static int pll_14nm_register(struct dsi_pll_14nm 
> *pll_14nm)
>  		return PTR_ERR(hw);
> 
>  	hws[num++] = hw;
> -	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
> +	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
>  	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
> @@ -1025,20 +992,10 @@ static int pll_14nm_register(struct
> dsi_pll_14nm *pll_14nm)
>  		return PTR_ERR(hw);
> 
>  	hws[num++] = hw;
> -	hw_data->hws[DSI_PIXEL_PLL_CLK]	= hw;
> +	provided_clocks[DSI_PIXEL_PLL_CLK]	= hw;
> 
>  	pll_14nm->num_hws = num;
> 
> -	hw_data->num = NUM_PROVIDED_CLKS;
> -	pll_14nm->hw_data = hw_data;
> -
> -	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> -				     pll_14nm->hw_data);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
> 
> @@ -1082,7 +1039,7 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	pll_14nm->vco_delay = 1;
> 
> -	ret = pll_14nm_register(pll_14nm);
> +	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
>  		return ret;
> @@ -1227,7 +1184,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.pll_init = dsi_pll_14nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_14nm_get_provider,
>  		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> @@ -1255,7 +1211,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		.pll_init = dsi_pll_14nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_14nm_get_provider,
>  		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index d267b25e5da0..3446be318648 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -31,15 +31,10 @@
>  #define POLL_MAX_READS			10
>  #define POLL_TIMEOUT_US		50
> 
> -#define NUM_PROVIDED_CLKS		2
> -
>  #define VCO_REF_CLK_RATE		19200000
>  #define VCO_MIN_RATE			350000000
>  #define VCO_MAX_RATE			750000000
> 
> -#define DSI_BYTE_PLL_CLK		0
> -#define DSI_PIXEL_PLL_CLK		1
> -
>  /* v2.0.0 28nm LP implementation */
>  #define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
> 
> @@ -83,10 +78,6 @@ struct dsi_pll_28nm {
>  	struct clk *clks[NUM_DSI_CLOCKS_MAX];
>  	u32 num_clks;
> 
> -	/* clock-provider: */
> -	struct clk *provided_clks[NUM_PROVIDED_CLKS];
> -	struct clk_onecell_data clk_data;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -495,38 +486,16 @@ static int dsi_pll_28nm_restore_state(struct
> msm_dsi_pll *pll)
>  	return 0;
>  }
> 
> -static int dsi_pll_28nm_get_provider(struct msm_dsi_pll *pll,
> -				struct clk **byte_clk_provider,
> -				struct clk **pixel_clk_provider)
> -{
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -
> -	if (byte_clk_provider)
> -		*byte_clk_provider = pll_28nm->provided_clks[DSI_BYTE_PLL_CLK];
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider =
> -				pll_28nm->provided_clks[DSI_PIXEL_PLL_CLK];
> -
> -	return 0;
> -}
> -
>  static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -	int i;
> -
> -	msm_dsi_pll_helper_unregister_clks(pll_28nm->pdev,
> -					pll_28nm->clks, pll_28nm->num_clks);
> 
> -	for (i = 0; i < NUM_PROVIDED_CLKS; i++)
> -		pll_28nm->provided_clks[i] = NULL;
> +	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, 
> pll_28nm->num_clks);
> 
>  	pll_28nm->num_clks = 0;
> -	pll_28nm->clk_data.clks = NULL;
> -	pll_28nm->clk_data.clk_num = 0;
>  }
> 
> -static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
> +static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct
> clk_hw **provided_clocks)
>  {
>  	char clk_name[32], parent1[32], parent2[32], vco_name[32];
>  	struct clk_init_data vco_init = {
> @@ -538,9 +507,7 @@ static int pll_28nm_register(struct dsi_pll_28nm 
> *pll_28nm)
>  	};
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	struct clk **clks = pll_28nm->clks;
> -	struct clk **provided_clks = pll_28nm->provided_clks;
>  	int num = 0;
> -	int ret;
> 
>  	DBG("%d", pll_28nm->id);
> 
> @@ -564,11 +531,11 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm)
> 
>  	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
> -	clks[num++] = provided_clks[DSI_PIXEL_PLL_CLK] =
> -			clk_register_divider(dev, clk_name,
> +	clks[num++] = clk_register_divider(dev, clk_name,
>  				parent1, 0, pll_28nm->mmio +
>  				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
>  				0, 8, 0, NULL);
> +	provided_clocks[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> 
>  	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
> @@ -581,22 +548,12 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm)
> 
>  	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->id);
> -	clks[num++] = provided_clks[DSI_BYTE_PLL_CLK] =
> -			clk_register_fixed_factor(dev, clk_name,
> +	clks[num++] = clk_register_fixed_factor(dev, clk_name,
>  				parent1, CLK_SET_RATE_PARENT, 1, 4);
> +	provided_clocks[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> 
>  	pll_28nm->num_clks = num;
> 
> -	pll_28nm->clk_data.clk_num = NUM_PROVIDED_CLKS;
> -	pll_28nm->clk_data.clks = provided_clks;
> -
> -	ret = of_clk_add_provider(dev->of_node,
> -			of_clk_src_onecell_get, &pll_28nm->clk_data);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
> 
> @@ -625,14 +582,13 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
>  	}
> 
>  	pll = &pll_28nm->base;
> +	pll->cfg = phy->cfg;
>  	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		pll_28nm->vco_delay = 1000;
>  	else
>  		pll_28nm->vco_delay = 1;
> 
> -	pll->cfg = phy->cfg;
> -
> -	ret = pll_28nm_register(pll_28nm);
> +	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
>  		return ret;
> @@ -802,7 +758,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_28nm_get_provider,
>  		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> @@ -830,7 +785,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_28nm_get_provider,
>  		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> @@ -858,7 +812,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_28nm_get_provider,
>  		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 31e7910c6050..c4b433790cfb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -39,15 +39,10 @@
>  #define POLL_MAX_READS		8000
>  #define POLL_TIMEOUT_US		1
> 
> -#define NUM_PROVIDED_CLKS	2
> -
>  #define VCO_REF_CLK_RATE	27000000
>  #define VCO_MIN_RATE		600000000
>  #define VCO_MAX_RATE		1200000000
> 
> -#define DSI_BYTE_PLL_CLK	0
> -#define DSI_PIXEL_PLL_CLK	1
> -
>  #define VCO_PREF_DIV_RATIO	27
> 
>  struct pll_28nm_cached_state {
> @@ -76,10 +71,6 @@ struct dsi_pll_28nm {
>  	struct clk *clks[NUM_DSI_CLOCKS_MAX];
>  	u32 num_clks;
> 
> -	/* clock-provider: */
> -	struct clk *provided_clks[NUM_PROVIDED_CLKS];
> -	struct clk_onecell_data clk_data;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -377,30 +368,14 @@ static int dsi_pll_28nm_restore_state(struct
> msm_dsi_pll *pll)
>  	return 0;
>  }
> 
> -static int dsi_pll_28nm_get_provider(struct msm_dsi_pll *pll,
> -				struct clk **byte_clk_provider,
> -				struct clk **pixel_clk_provider)
> -{
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -
> -	if (byte_clk_provider)
> -		*byte_clk_provider = pll_28nm->provided_clks[DSI_BYTE_PLL_CLK];
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider =
> -				pll_28nm->provided_clks[DSI_PIXEL_PLL_CLK];
> -
> -	return 0;
> -}
> -
>  static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> 
> -	msm_dsi_pll_helper_unregister_clks(pll_28nm->pdev,
> -					pll_28nm->clks, pll_28nm->num_clks);
> +	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, 
> pll_28nm->num_clks);
>  }
> 
> -static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
> +static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct
> clk_hw **provided_clocks)
>  {
>  	char *clk_name, *parent_name, *vco_name;
>  	struct clk_init_data vco_init = {
> @@ -411,10 +386,9 @@ static int pll_28nm_register(struct dsi_pll_28nm 
> *pll_28nm)
>  	};
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	struct clk **clks = pll_28nm->clks;
> -	struct clk **provided_clks = pll_28nm->provided_clks;
>  	struct clk_bytediv *bytediv;
>  	struct clk_init_data bytediv_init = { };
> -	int ret, num = 0;
> +	int num = 0;
> 
>  	DBG("%d", pll_28nm->id);
> 
> @@ -426,10 +400,6 @@ static int pll_28nm_register(struct dsi_pll_28nm 
> *pll_28nm)
>  	if (!vco_name)
>  		return -ENOMEM;
> 
> -	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -	if (!parent_name)
> -		return -ENOMEM;
> -
>  	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
>  	if (!clk_name)
>  		return -ENOMEM;
> @@ -457,29 +427,19 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm)
>  	bytediv_init.num_parents = 1;
> 
>  	/* DIV2 */
> -	clks[num++] = provided_clks[DSI_BYTE_PLL_CLK] =
> -			clk_register(dev, &bytediv->hw);
> +	clks[num++] = clk_register(dev, &bytediv->hw);
> +	provided_clocks[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> 
>  	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
>  	/* DIV3 */
> -	clks[num++] = provided_clks[DSI_PIXEL_PLL_CLK] =
> -			clk_register_divider(dev, clk_name,
> +	clks[num++] = clk_register_divider(dev, clk_name,
>  				parent_name, 0, pll_28nm->mmio +
>  				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
>  				0, 8, 0, NULL);
> +	provided_clocks[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
> 
>  	pll_28nm->num_clks = num;
> 
> -	pll_28nm->clk_data.clk_num = NUM_PROVIDED_CLKS;
> -	pll_28nm->clk_data.clks = provided_clks;
> -
> -	ret = of_clk_add_provider(dev->of_node,
> -			of_clk_src_onecell_get, &pll_28nm->clk_data);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
> 
> @@ -511,7 +471,7 @@ static int dsi_pll_28nm_8960_init(struct 
> msm_dsi_phy *phy)
> 
>  	pll->cfg = phy->cfg;
> 
> -	ret = pll_28nm_register(pll_28nm);
> +	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
>  		return ret;
> @@ -702,7 +662,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
> = {
>  		.pll_init = dsi_pll_28nm_8960_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_28nm_get_provider,
>  		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 5acdfe1f63be..0b601afa9e49 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -36,10 +36,6 @@
>   *                                                  
> dsi0_pll_post_out_div_clk
>   */
> 
> -#define DSI_BYTE_PLL_CLK		0
> -#define DSI_PIXEL_PLL_CLK		1
> -#define NUM_PROVIDED_CLKS		2
> -
>  #define VCO_REF_CLK_RATE		19200000
> 
>  struct dsi_pll_regs {
> @@ -116,9 +112,6 @@ struct dsi_pll_7nm {
>  	struct clk_hw *pclk_mux_hw;
>  	struct clk_hw *out_dsiclk_hw;
> 
> -	/* clock-provider: */
> -	struct clk_hw_onecell_data *hw_data;
> -
>  	struct pll_7nm_cached_state cached_state;
> 
>  	enum msm_dsi_phy_usecase uc;
> @@ -646,30 +639,11 @@ static int dsi_pll_7nm_set_usecase(struct
> msm_dsi_pll *pll,
>  	return 0;
>  }
> 
> -static int dsi_pll_7nm_get_provider(struct msm_dsi_pll *pll,
> -				     struct clk **byte_clk_provider,
> -				     struct clk **pixel_clk_provider)
> -{
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> -	struct clk_hw_onecell_data *hw_data = pll_7nm->hw_data;
> -
> -	DBG("DSI PLL%d", pll_7nm->id);
> -
> -	if (byte_clk_provider)
> -		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
> -
> -	return 0;
> -}
> -
>  static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> -	struct device *dev = &pll_7nm->pdev->dev;
> 
>  	DBG("DSI PLL%d", pll_7nm->id);
> -	of_clk_del_provider(dev->of_node);
> 
>  	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
>  	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
> @@ -687,7 +661,7 @@ static void dsi_pll_7nm_destroy(struct msm_dsi_pll 
> *pll)
>   * state to follow the master PLL's divider/mux state. Therefore, we 
> don't
>   * require special clock ops that also configure the slave PLL 
> registers
>   */
> -static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
> +static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct
> clk_hw **provided_clocks)
>  {
>  	char clk_name[32], parent[32], vco_name[32];
>  	char parent2[32], parent3[32], parent4[32];
> @@ -699,18 +673,11 @@ static int pll_7nm_register(struct dsi_pll_7nm 
> *pll_7nm)
>  		.ops = &clk_ops_dsi_pll_7nm_vco,
>  	};
>  	struct device *dev = &pll_7nm->pdev->dev;
> -	struct clk_hw_onecell_data *hw_data;
>  	struct clk_hw *hw;
>  	int ret;
> 
>  	DBG("DSI%d", pll_7nm->id);
> 
> -	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
> -			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
> -			       GFP_KERNEL);
> -	if (!hw_data)
> -		return -ENOMEM;
> -
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
>  	pll_7nm->base.clk_hw.init = &vco_init;
> 
> @@ -762,7 +729,7 @@ static int pll_7nm_register(struct dsi_pll_7nm 
> *pll_7nm)
>  	}
> 
>  	pll_7nm->byte_clk_hw = hw;
> -	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
> +	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> 
>  	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
> @@ -822,22 +789,10 @@ static int pll_7nm_register(struct dsi_pll_7nm 
> *pll_7nm)
>  	}
> 
>  	pll_7nm->out_dsiclk_hw = hw;
> -	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
> -
> -	hw_data->num = NUM_PROVIDED_CLKS;
> -	pll_7nm->hw_data = hw_data;
> -
> -	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> -				     pll_7nm->hw_data);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
> -		goto err_dsiclk_hw;
> -	}
> +	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> 
>  	return 0;
> 
> -err_dsiclk_hw:
> -	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
>  err_pclk_mux_hw:
>  	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
>  err_post_out_div_clk_hw:
> @@ -893,7 +848,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	pll_7nm->vco_delay = 1;
> 
> -	ret = pll_7nm_register(pll_7nm);
> +	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
>  		return ret;
> @@ -1138,7 +1093,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_7nm_get_provider,
>  		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
> @@ -1165,7 +1119,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_7nm_get_provider,
>  		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index 98ee4560581a..914e95435dcb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -57,11 +57,8 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw 
> *hw)
>  	pll->pll_on = false;
>  }
> 
> -void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
> -					struct clk **clks, u32 num_clks)
> +void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 
> num_clks)
>  {
> -	of_clk_del_provider(pdev->dev.of_node);
> -
>  	if (!num_clks || !clks)
>  		return;
> 
> @@ -74,17 +71,6 @@ void msm_dsi_pll_helper_unregister_clks(struct
> platform_device *pdev,
>  /*
>   * DSI PLL API
>   */
> -int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
> -{
> -	if (pll->cfg->pll_ops.get_provider)
> -		return pll->cfg->pll_ops.get_provider(pll,
> -					byte_clk_provider,
> -					pixel_clk_provider);
> -
> -	return -EINVAL;
> -}
> -
>  void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
>  {
>  	if (pll->cfg->pll_ops.destroy)
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> index 8306911f8318..d819a886beb8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> @@ -55,8 +55,7 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw 
> *hw,
>  int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
>  void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
>  /* misc */
> -void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
> -					struct clk **clks, u32 num_clks);
> +void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 
> num_clks);
> 
>  #endif /* __DSI_PLL_H__ */
