Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F70A34DF23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhC3DTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:19:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18599 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231150AbhC3DSx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:18:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617074333; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=005oUKHv1PuiJbyzl5Z47KfgcBkQ33+NXtFTvox9Hs0=;
 b=nKPu/N6LK683mZmpa8Z5G2mwXtZYePg+55LPQWhb+q1CciSO9RclgUnVug+1ZfjV2LiSpJlY
 9wYuUwCNIUkoOkPP7TjubU49G//fZWqcyFNh/DmLuMl2kn2kETYtS+7ZDtIh54VeA0VwbHbl
 1jJDJ6q/CJYuPZxJSQ4S1MLL454=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6062989c0a4a07ffda905cd8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 03:18:52
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 446E2C43466; Tue, 30 Mar 2021 03:18:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47E82C433CA;
        Tue, 30 Mar 2021 03:18:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 20:18:46 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 21/25] drm/msm/dsi: move ioremaps to
 dsi_phy_driver_probe
In-Reply-To: <20210327110305.3289784-22-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-22-dmitry.baryshkov@linaro.org>
Message-ID: <15415d6825967b9188165ceb730858c8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:03, Dmitry Baryshkov wrote:
> All PHY drivers would map dsi_pll area. Some PHY drivers would also
> map dsi_phy area again (a leftover from old PHY/PLL separation). Move
> all ioremaps to the common dsi_phy driver code and drop individual
> ioremapped areas from PHY drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  7 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 75 +++++++-----------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 49 ++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 33 +++-----
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 27 +++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 79 ++++++++-----------
>  7 files changed, 108 insertions(+), 163 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f21f3babec68..74cc11c84d71 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -682,6 +682,13 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  		goto fail;
>  	}
> 
> +	phy->pll_base = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> +	if (IS_ERR(phy->pll_base)) {
> +		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
> +
>  	if (phy->cfg->has_phy_lane) {
>  		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
>  		if (IS_ERR(phy->lane_base)) {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index d7031a35e2da..8e828c5ca8f4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -88,6 +88,7 @@ struct msm_dsi_dphy_timing {
>  struct msm_dsi_phy {
>  	struct platform_device *pdev;
>  	void __iomem *base;
> +	void __iomem *pll_base;
>  	void __iomem *reg_base;
>  	void __iomem *lane_base;
>  	int id;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 73afbb597a9f..8a15ae91d44b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -91,9 +91,6 @@ struct dsi_pll_10nm {
> 
>  	struct msm_dsi_phy *phy;
> 
> -	void __iomem *phy_cmn_mmio;
> -	void __iomem *mmio;
> -
>  	u64 vco_ref_clk_rate;
>  	u64 vco_current_rate;
> 
> @@ -228,7 +225,7 @@ static void dsi_pll_calc_ssc(struct dsi_pll_10nm 
> *pll)
> 
>  static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	struct dsi_pll_regs *regs = &pll->reg_setup;
> 
>  	if (pll->pll_configuration.enable_ssc) {
> @@ -253,7 +250,7 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm 
> *pll)
> 
>  static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
> 
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
> @@ -279,7 +276,7 @@ static void dsi_pll_config_hzindep_reg(struct
> dsi_pll_10nm *pll)
> 
>  static void dsi_pll_commit(struct dsi_pll_10nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	struct dsi_pll_regs *reg = &pll->reg_setup;
> 
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
> @@ -336,7 +333,7 @@ static int dsi_pll_10nm_lock_status(struct
> dsi_pll_10nm *pll)
>  	u32 const delay_us = 100;
>  	u32 const timeout_us = 5000;
> 
> -	rc = readl_poll_timeout_atomic(pll->mmio +
> +	rc = readl_poll_timeout_atomic(pll->phy->pll_base +
>  				       REG_DSI_10nm_PHY_PLL_COMMON_STATUS_ONE,
>  				       status,
>  				       ((status & BIT(0)) > 0),
> @@ -351,21 +348,21 @@ static int dsi_pll_10nm_lock_status(struct
> dsi_pll_10nm *pll)
> 
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_10nm *pll)
>  {
> -	u32 data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_CTRL_0);
> +	u32 data = dsi_phy_read(pll->phy->base + 
> REG_DSI_10nm_PHY_CMN_CTRL_0);
> 
> -	dsi_phy_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
> +	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 
> 0);
> +	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
>  		  data & ~BIT(5));
>  	ndelay(250);
>  }
> 
>  static void dsi_pll_enable_pll_bias(struct dsi_pll_10nm *pll)
>  {
> -	u32 data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_CTRL_0);
> +	u32 data = dsi_phy_read(pll->phy->base + 
> REG_DSI_10nm_PHY_CMN_CTRL_0);
> 
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
> +	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
>  		  data | BIT(5));
> -	dsi_phy_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
> +	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 
> 0xc0);
>  	ndelay(250);
>  }
> 
> @@ -373,8 +370,8 @@ static void dsi_pll_disable_global_clk(struct
> dsi_pll_10nm *pll)
>  {
>  	u32 data;
> 
> -	data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_CLK_CFG1);
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
> +	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
> +	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
>  		  data & ~BIT(5));
>  }
> 
> @@ -382,8 +379,8 @@ static void dsi_pll_enable_global_clk(struct
> dsi_pll_10nm *pll)
>  {
>  	u32 data;
> 
> -	data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_CLK_CFG1);
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
> +	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
> +	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
>  		  data | BIT(5));
>  }
> 
> @@ -404,7 +401,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw 
> *hw)
>  	}
> 
>  	/* Start PLL */
> -	dsi_phy_write(pll_10nm->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
> +	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
>  		  0x01);
> 
>  	/*
> @@ -426,10 +423,10 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw 
> *hw)
>  	if (pll_10nm->slave)
>  		dsi_pll_enable_global_clk(pll_10nm->slave);
> 
> -	dsi_phy_write(pll_10nm->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
> +	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
>  		  0x01);
>  	if (pll_10nm->slave)
> -		dsi_phy_write(pll_10nm->slave->phy_cmn_mmio +
> +		dsi_phy_write(pll_10nm->slave->phy->base +
>  			  REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x01);
> 
>  error:
> @@ -438,7 +435,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw 
> *hw)
> 
>  static void dsi_pll_disable_sub(struct dsi_pll_10nm *pll)
>  {
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
> +	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
>  	dsi_pll_disable_pll_bias(pll);
>  }
> 
> @@ -452,7 +449,7 @@ static void dsi_pll_10nm_vco_unprepare(struct 
> clk_hw *hw)
>  	 * powering down the PLL
>  	 */
>  	dsi_pll_disable_global_clk(pll_10nm);
> -	dsi_phy_write(pll_10nm->phy_cmn_mmio + 
> REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0);
> +	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 
> 0);
>  	dsi_pll_disable_sub(pll_10nm);
>  	if (pll_10nm->slave) {
>  		dsi_pll_disable_global_clk(pll_10nm->slave);
> @@ -468,7 +465,7 @@ static unsigned long
> dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  	struct dsi_pll_config *config = &pll_10nm->pll_configuration;
> -	void __iomem *base = pll_10nm->mmio;
> +	void __iomem *base = pll_10nm->phy->pll_base;
>  	u64 ref_clk = pll_10nm->vco_ref_clk_rate;
>  	u64 vco_rate = 0x0;
>  	u64 multiplier;
> @@ -531,10 +528,10 @@ static void dsi_10nm_save_state(struct 
> msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
> -	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
> +	void __iomem *phy_base = pll_10nm->phy->base;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> 
> -	cached->pll_out_div = dsi_phy_read(pll_10nm->mmio +
> +	cached->pll_out_div = dsi_phy_read(pll_10nm->phy->pll_base +
>  				       REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
>  	cached->pll_out_div &= 0x3;
> 
> @@ -554,14 +551,14 @@ static int dsi_10nm_restore_state(struct 
> msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
> -	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
> +	void __iomem *phy_base = pll_10nm->phy->base;
>  	u32 val;
>  	int ret;
> 
> -	val = dsi_phy_read(pll_10nm->mmio + 
> REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
> +	val = dsi_phy_read(pll_10nm->phy->pll_base +
> REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
>  	val &= ~0x3;
>  	val |= cached->pll_out_div;
> -	dsi_phy_write(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, 
> val);
> +	dsi_phy_write(pll_10nm->phy->pll_base +
> REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
> 
>  	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
>  		  cached->bit_clk_div | (cached->pix_clk_div << 4));
> @@ -586,7 +583,7 @@ static int dsi_10nm_restore_state(struct 
> msm_dsi_phy *phy)
>  static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
> -	void __iomem *base = pll_10nm->phy_cmn_mmio;
> +	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
> 
>  	DBG("DSI PLL%d", pll_10nm->id);
> @@ -645,7 +642,7 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
> 
>  	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				     parent, CLK_SET_RATE_PARENT,
> -				     pll_10nm->mmio +
> +				     pll_10nm->phy->pll_base +
>  				     REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
>  				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
>  	if (IS_ERR(hw)) {
> @@ -659,7 +656,7 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
>  	/* BIT CLK: DIV_CTRL_3_0 */
>  	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
>  				     CLK_SET_RATE_PARENT,
> -				     pll_10nm->phy_cmn_mmio +
> +				     pll_10nm->phy->base +
>  				     REG_DSI_10nm_PHY_CMN_CLK_CFG0,
>  				     0, 4, CLK_DIVIDER_ONE_BASED,
>  				     &pll_10nm->postdiv_lock);
> @@ -710,7 +707,7 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
>  	hw = devm_clk_hw_register_mux(dev, clk_name,
>  				 ((const char *[]){
>  				 parent, parent2, parent3, parent4
> -				 }), 4, 0, pll_10nm->phy_cmn_mmio +
> +				 }), 4, 0, pll_10nm->phy->base +
>  				 REG_DSI_10nm_PHY_CMN_CLK_CFG1,
>  				 0, 2, 0, NULL);
>  	if (IS_ERR(hw)) {
> @@ -723,7 +720,7 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
> 
>  	/* PIX CLK DIV : DIV_CTRL_7_4*/
>  	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
> -				     0, pll_10nm->phy_cmn_mmio +
> +				     0, pll_10nm->phy->base +
>  					REG_DSI_10nm_PHY_CMN_CLK_CFG0,
>  				     4, 4, CLK_DIVIDER_ONE_BASED,
>  				     &pll_10nm->postdiv_lock);
> @@ -758,18 +755,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  	pll_10nm->id = id;
>  	pll_10nm_list[id] = pll_10nm;
> 
> -	pll_10nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
> -	if (IS_ERR_OR_NULL(pll_10nm->phy_cmn_mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
> -		return -ENOMEM;
> -	}
> -
> -	pll_10nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> -	if (IS_ERR_OR_NULL(pll_10nm->mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
> -		return -ENOMEM;
> -	}
> -
>  	spin_lock_init(&pll_10nm->postdiv_lock);
> 
>  	pll_10nm->phy = phy;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 408192ae1456..5a92c2c1e815 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -118,9 +118,6 @@ struct dsi_pll_14nm {
>  	int id;
>  	struct platform_device *pdev;
> 
> -	void __iomem *phy_cmn_mmio;
> -	void __iomem *mmio;
> -
>  	struct msm_dsi_phy *phy;
> 
>  	struct dsi_pll_input in;
> @@ -167,7 +164,7 @@ static bool pll_14nm_poll_for_ready(struct
> dsi_pll_14nm *pll_14nm,
>  				    u32 nb_tries, u32 timeout_us)
>  {
>  	bool pll_locked = false;
> -	void __iomem *base = pll_14nm->mmio;
> +	void __iomem *base = pll_14nm->phy->pll_base;
>  	u32 tries, val;
> 
>  	tries = nb_tries;
> @@ -380,7 +377,7 @@ static void pll_14nm_calc_vco_count(struct
> dsi_pll_14nm *pll)
> 
>  static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	struct dsi_pll_input *pin = &pll->in;
>  	struct dsi_pll_output *pout = &pll->out;
>  	u8 data;
> @@ -418,7 +415,7 @@ static void pll_db_commit_common(struct 
> dsi_pll_14nm *pll,
>  				 struct dsi_pll_input *pin,
>  				 struct dsi_pll_output *pout)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	u8 data;
> 
>  	/* confgiure the non frequency dependent pll registers */
> @@ -478,7 +475,7 @@ static void pll_db_commit_common(struct 
> dsi_pll_14nm *pll,
> 
>  static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
>  {
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *cmn_base = pll_14nm->phy->base;
> 
>  	/* de assert pll start and apply pll sw reset */
> 
> @@ -497,8 +494,8 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm 
> *pll,
>  			       struct dsi_pll_input *pin,
>  			       struct dsi_pll_output *pout)
>  {
> -	void __iomem *base = pll->mmio;
> -	void __iomem *cmn_base = pll->phy_cmn_mmio;
> +	void __iomem *base = pll->phy->pll_base;
> +	void __iomem *cmn_base = pll->phy->base;
>  	u8 data;
> 
>  	DBG("DSI%d PLL", pll->id);
> @@ -614,7 +611,7 @@ static unsigned long
> dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
> -	void __iomem *base = pll_14nm->mmio;
> +	void __iomem *base = pll_14nm->phy->pll_base;
>  	u64 vco_rate, multiplier = BIT(20);
>  	u32 div_frac_start;
>  	u32 dec_start;
> @@ -653,8 +650,8 @@ static unsigned long
> dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
>  static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
> -	void __iomem *base = pll_14nm->mmio;
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *base = pll_14nm->phy->pll_base;
> +	void __iomem *cmn_base = pll_14nm->phy->base;
>  	bool locked;
> 
>  	DBG("");
> @@ -682,7 +679,7 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw 
> *hw)
>  static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *cmn_base = pll_14nm->phy->base;
> 
>  	DBG("");
> 
> @@ -724,7 +721,7 @@ static unsigned long
> dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
>  {
>  	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
>  	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
> -	void __iomem *base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *base = pll_14nm->phy->base;
>  	u8 shift = postdiv->shift;
>  	u8 width = postdiv->width;
>  	u32 val;
> @@ -757,7 +754,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct
> clk_hw *hw, unsigned long rate,
>  {
>  	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
>  	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
> -	void __iomem *base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *base = pll_14nm->phy->base;
>  	spinlock_t *lock = &pll_14nm->postdiv_lock;
>  	u8 shift = postdiv->shift;
>  	u8 width = postdiv->width;
> @@ -784,7 +781,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct
> clk_hw *hw, unsigned long rate,
>  	 */
>  	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
>  		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
> -		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
> +		void __iomem *slave_base = pll_14nm_slave->phy->base;
> 
>  		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
>  	}
> @@ -808,7 +805,7 @@ static void dsi_14nm_save_state(struct msm_dsi_phy 
> *phy)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *cmn_base = pll_14nm->phy->base;
>  	u32 data;
> 
>  	data = dsi_phy_read(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
> @@ -826,7 +823,7 @@ static int dsi_14nm_restore_state(struct 
> msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +	void __iomem *cmn_base = pll_14nm->phy->base;
>  	u32 data;
>  	int ret;
> 
> @@ -848,7 +845,7 @@ static int dsi_14nm_restore_state(struct 
> msm_dsi_phy *phy)
>  	/* also restore post-dividers for slave DSI PLL */
>  	if (phy->usecase == MSM_DSI_PHY_MASTER) {
>  		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
> -		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
> +		void __iomem *slave_base = pll_14nm_slave->phy->base;
> 
>  		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
>  	}
> @@ -859,7 +856,7 @@ static int dsi_14nm_restore_state(struct 
> msm_dsi_phy *phy)
>  static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
> -	void __iomem *base = pll_14nm->mmio;
> +	void __iomem *base = phy->pll_base;
>  	u32 clkbuflr_en, bandgap = 0;
> 
>  	switch (phy->usecase) {
> @@ -1011,18 +1008,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
>  	pll_14nm->id = id;
>  	pll_14nm_list[id] = pll_14nm;
> 
> -	pll_14nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
> -	if (IS_ERR_OR_NULL(pll_14nm->phy_cmn_mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
> -		return -ENOMEM;
> -	}
> -
> -	pll_14nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> -	if (IS_ERR_OR_NULL(pll_14nm->mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
> -		return -ENOMEM;
> -	}
> -
>  	spin_lock_init(&pll_14nm->postdiv_lock);
> 
>  	pll_14nm->phy = phy;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index e964ea210c0b..bdb117938bcc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -72,8 +72,6 @@ struct dsi_pll_28nm {
> 
>  	struct msm_dsi_phy *phy;
> 
> -	void __iomem *mmio;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -86,7 +84,7 @@ static bool pll_28nm_poll_for_ready(struct
> dsi_pll_28nm *pll_28nm,
>  	u32 val;
> 
>  	while (nb_tries--) {
> -		val = dsi_phy_read(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_STATUS);
> +		val = dsi_phy_read(pll_28nm->phy->pll_base + 
> REG_DSI_28nm_PHY_PLL_STATUS);
>  		pll_locked = !!(val & DSI_28nm_PHY_PLL_STATUS_PLL_RDY);
> 
>  		if (pll_locked)
> @@ -101,7 +99,7 @@ static bool pll_28nm_poll_for_ready(struct
> dsi_pll_28nm *pll_28nm,
> 
>  static void pll_28nm_software_reset(struct dsi_pll_28nm *pll_28nm)
>  {
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
> 
>  	/*
>  	 * Add HW recommended delays after toggling the software
> @@ -120,7 +118,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw
> *hw, unsigned long rate,
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	struct device *dev = &pll_28nm->pdev->dev;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	unsigned long div_fbx1000, gen_vco_clk;
>  	u32 refclk_cfg, frac_n_mode, frac_n_value;
>  	u32 sdm_cfg0, sdm_cfg1, sdm_cfg2, sdm_cfg3;
> @@ -244,7 +242,7 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  		unsigned long parent_rate)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	u32 sdm0, doubler, sdm_byp_div;
>  	u32 sdm_dc_off, sdm_freq_seed, sdm2, sdm3;
>  	u32 ref_clk = VCO_REF_CLK_RATE;
> @@ -291,7 +289,7 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm 
> *pll_28nm)
>  {
>  	struct device *dev = &pll_28nm->pdev->dev;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	u32 max_reads = 5, timeout_us = 100;
>  	bool locked;
>  	u32 val;
> @@ -385,7 +383,7 @@ static int dsi_pll_28nm_vco_prepare_lp(struct 
> clk_hw *hw)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	struct device *dev = &pll_28nm->pdev->dev;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	bool locked;
>  	u32 max_reads = 10, timeout_us = 50;
>  	u32 val;
> @@ -439,7 +437,7 @@ static void dsi_pll_28nm_vco_unprepare(struct 
> clk_hw *hw)
>  	if (unlikely(!pll_28nm->phy->pll_on))
>  		return;
> 
> -	dsi_phy_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
> +	dsi_phy_write(pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_GLB_CFG, 
> 0x00);
> 
>  	pll_28nm->phy->pll_on = false;
>  }
> @@ -483,7 +481,7 @@ static void dsi_28nm_save_state(struct msm_dsi_phy 
> *phy)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
> 
>  	cached_state->postdiv3 =
>  			dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
> @@ -500,7 +498,7 @@ static int dsi_28nm_restore_state(struct 
> msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	int ret;
> 
>  	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
> @@ -551,7 +549,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
>  	hw = devm_clk_hw_register_divider(dev, clk_name,
>  			parent1, CLK_SET_RATE_PARENT,
> -			pll_28nm->mmio +
> +			pll_28nm->phy->pll_base +
>  			REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
>  			0, 4, 0, NULL);
>  	if (IS_ERR(hw))
> @@ -568,7 +566,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
>  	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
>  	hw = devm_clk_hw_register_divider(dev, clk_name,
> -				parent1, 0, pll_28nm->mmio +
> +				parent1, 0, pll_28nm->phy->pll_base +
>  				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
>  				0, 8, 0, NULL);
>  	if (IS_ERR(hw))
> @@ -581,7 +579,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	hw = devm_clk_hw_register_mux(dev, clk_name,
>  			((const char *[]){
>  				parent1, parent2
> -			}), 2, CLK_SET_RATE_PARENT, pll_28nm->mmio +
> +			}), 2, CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
>  			REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
> @@ -613,13 +611,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	pll_28nm->pdev = pdev;
>  	pll_28nm->id = id;
> -
> -	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> -	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
> -		return -ENOMEM;
> -	}
> -
>  	pll_28nm->phy = phy;
> 
>  	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index faefae5ec23c..36ee3f15d1e0 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -64,8 +64,6 @@ struct dsi_pll_28nm {
> 
>  	struct msm_dsi_phy *phy;
> 
> -	void __iomem *mmio;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -78,7 +76,7 @@ static bool pll_28nm_poll_for_ready(struct
> dsi_pll_28nm *pll_28nm,
>  	u32 val;
> 
>  	while (nb_tries--) {
> -		val = dsi_phy_read(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_RDY);
> +		val = dsi_phy_read(pll_28nm->phy->pll_base + 
> REG_DSI_28nm_8960_PHY_PLL_RDY);
>  		pll_locked = !!(val & DSI_28nm_8960_PHY_PLL_RDY_PLL_RDY);
> 
>  		if (pll_locked)
> @@ -98,7 +96,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw
> *hw, unsigned long rate,
>  				     unsigned long parent_rate)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	u32 val, temp, fb_divider;
> 
>  	DBG("rate=%lu, parent's=%lu", rate, parent_rate);
> @@ -147,7 +145,7 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	unsigned long vco_rate;
>  	u32 status, fb_divider, temp, ref_divider;
> 
> @@ -181,7 +179,7 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw 
> *hw)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	struct device *dev = &pll_28nm->pdev->dev;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	bool locked;
>  	unsigned int bit_div, byte_div;
>  	int max_reads = 1000, timeout_us = 100;
> @@ -234,7 +232,7 @@ static void dsi_pll_28nm_vco_unprepare(struct 
> clk_hw *hw)
>  	if (unlikely(!pll_28nm->phy->pll_on))
>  		return;
> 
> -	dsi_phy_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 
> 0x00);
> +	dsi_phy_write(pll_28nm->phy->pll_base +
> REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
> 
>  	pll_28nm->phy->pll_on = false;
>  }
> @@ -348,7 +346,7 @@ static void dsi_28nm_save_state(struct msm_dsi_phy 
> *phy)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
> 
>  	cached_state->postdiv3 =
>  			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
> @@ -364,7 +362,7 @@ static int dsi_28nm_restore_state(struct 
> msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
> -	void __iomem *base = pll_28nm->mmio;
> +	void __iomem *base = pll_28nm->phy->pll_base;
>  	int ret;
> 
>  	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
> @@ -425,7 +423,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
> 
>  	/* prepare and register bytediv */
>  	bytediv->hw.init = &bytediv_init;
> -	bytediv->reg = pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
> +	bytediv->reg = pll_28nm->phy->pll_base + 
> REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
> 
>  	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->id);
>  	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
> @@ -445,7 +443,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
>  	/* DIV3 */
>  	hw = devm_clk_hw_register_divider(dev, clk_name,
> -				parent_name, 0, pll_28nm->mmio +
> +				parent_name, 0, pll_28nm->phy->pll_base +
>  				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
>  				0, 8, 0, NULL);
>  	if (IS_ERR(hw))
> @@ -471,13 +469,6 @@ static int dsi_pll_28nm_8960_init(struct 
> msm_dsi_phy *phy)
> 
>  	pll_28nm->pdev = pdev;
>  	pll_28nm->id = id + 1;
> -
> -	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> -	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
> -		return -ENOMEM;
> -	}
> -
>  	pll_28nm->phy = phy;
> 
>  	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index b873b2f67e3a..8e8cf9e63e8f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -91,9 +91,6 @@ struct dsi_pll_7nm {
> 
>  	struct msm_dsi_phy *phy;
> 
> -	void __iomem *phy_cmn_mmio;
> -	void __iomem *mmio;
> -
>  	u64 vco_ref_clk_rate;
>  	u64 vco_current_rate;
> 
> @@ -231,7 +228,7 @@ static void dsi_pll_calc_ssc(struct dsi_pll_7nm 
> *pll)
> 
>  static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	struct dsi_pll_regs *regs = &pll->reg_setup;
> 
>  	if (pll->pll_configuration.enable_ssc) {
> @@ -256,7 +253,7 @@ static void dsi_pll_ssc_commit(struct dsi_pll_7nm 
> *pll)
> 
>  static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
> 
>  	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> @@ -298,13 +295,13 @@ static void dsi_pll_config_hzindep_reg(struct
> dsi_pll_7nm *pll)
>  	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>  		if (pll->slave)
> -			dsi_phy_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 
> 0x22);
> +			dsi_phy_write(pll->slave->phy->pll_base +
> REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>  	}
>  }
> 
>  static void dsi_pll_commit(struct dsi_pll_7nm *pll)
>  {
> -	void __iomem *base = pll->mmio;
> +	void __iomem *base = pll->phy->pll_base;
>  	struct dsi_pll_regs *reg = &pll->reg_setup;
> 
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
> @@ -354,7 +351,7 @@ static int dsi_pll_7nm_lock_status(struct 
> dsi_pll_7nm *pll)
>  	u32 const delay_us = 100;
>  	u32 const timeout_us = 5000;
> 
> -	rc = readl_poll_timeout_atomic(pll->mmio +
> +	rc = readl_poll_timeout_atomic(pll->phy->pll_base +
>  				       REG_DSI_7nm_PHY_PLL_COMMON_STATUS_ONE,
>  				       status,
>  				       ((status & BIT(0)) > 0),
> @@ -369,19 +366,19 @@ static int dsi_pll_7nm_lock_status(struct
> dsi_pll_7nm *pll)
> 
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>  {
> -	u32 data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> 
> -	dsi_phy_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data & 
> ~BIT(5));
> +	dsi_phy_write(pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 
> 0);
> +	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0, data & 
> ~BIT(5));
>  	ndelay(250);
>  }
> 
>  static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  {
> -	u32 data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> 
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data | 
> BIT(5));
> -	dsi_phy_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
> +	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0, data | 
> BIT(5));
> +	dsi_phy_write(pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 
> 0xc0);
>  	ndelay(250);
>  }
> 
> @@ -389,18 +386,18 @@ static void dsi_pll_disable_global_clk(struct
> dsi_pll_7nm *pll)
>  {
>  	u32 data;
> 
> -	data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data
> & ~BIT(5));
> +	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & 
> ~BIT(5));
>  }
> 
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
>  	u32 data;
> 
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
> +	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
> 
> -	data = dsi_phy_read(pll->phy_cmn_mmio + 
> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> +	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
>  		  data | BIT(5) | BIT(4));
>  }
> 
> @@ -411,9 +408,9 @@ static void dsi_pll_phy_dig_reset(struct 
> dsi_pll_7nm *pll)
>  	 * coming out of a CX or analog rail power collapse while
>  	 * ensuring that the pads maintain LP00 or LP11 state
>  	 */
> -	dsi_phy_write(pll->phy_cmn_mmio +
> REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
> +	dsi_phy_write(pll->phy->base +
> REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
>  	wmb(); /* Ensure that the reset is deasserted */
> -	dsi_phy_write(pll->phy_cmn_mmio +
> REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
> +	dsi_phy_write(pll->phy->base + 
> REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
>  	wmb(); /* Ensure that the reset is deasserted */
>  }
> 
> @@ -427,7 +424,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw 
> *hw)
>  		dsi_pll_enable_pll_bias(pll_7nm->slave);
> 
>  	/* Start PLL */
> -	dsi_phy_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 
> 0x01);
> +	dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 
> 0x01);
> 
>  	/*
>  	 * ensure all PLL configurations are written prior to checking
> @@ -463,7 +460,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw 
> *hw)
> 
>  static void dsi_pll_disable_sub(struct dsi_pll_7nm *pll)
>  {
> -	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
> +	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
>  	dsi_pll_disable_pll_bias(pll);
>  }
> 
> @@ -477,7 +474,7 @@ static void dsi_pll_7nm_vco_unprepare(struct clk_hw 
> *hw)
>  	 * powering down the PLL
>  	 */
>  	dsi_pll_disable_global_clk(pll_7nm);
> -	dsi_phy_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 
> 0);
> +	dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
>  	dsi_pll_disable_sub(pll_7nm);
>  	if (pll_7nm->slave) {
>  		dsi_pll_disable_global_clk(pll_7nm->slave);
> @@ -493,7 +490,7 @@ static unsigned long
> dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>  	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
> -	void __iomem *base = pll_7nm->mmio;
> +	void __iomem *base = pll_7nm->phy->pll_base;
>  	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
>  	u64 vco_rate = 0x0;
>  	u64 multiplier;
> @@ -556,10 +553,10 @@ static void dsi_7nm_save_state(struct msm_dsi_phy 
> *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
> +	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> 
> -	cached->pll_out_div = dsi_phy_read(pll_7nm->mmio +
> +	cached->pll_out_div = dsi_phy_read(pll_7nm->phy->pll_base +
>  				       REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  	cached->pll_out_div &= 0x3;
> 
> @@ -579,14 +576,14 @@ static int dsi_7nm_restore_state(struct 
> msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
> +	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 val;
>  	int ret;
> 
> -	val = dsi_phy_read(pll_7nm->mmio + 
> REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
> +	val = dsi_phy_read(pll_7nm->phy->pll_base +
> REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  	val &= ~0x3;
>  	val |= cached->pll_out_div;
> -	dsi_phy_write(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, 
> val);
> +	dsi_phy_write(pll_7nm->phy->pll_base +
> REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
> 
>  	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
>  		  cached->bit_clk_div | (cached->pix_clk_div << 4));
> @@ -611,7 +608,7 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy 
> *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = pll_7nm->phy_cmn_mmio;
> +	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
> 
>  	DBG("DSI PLL%d", pll_7nm->id);
> @@ -670,7 +667,7 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
> 
>  	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				     parent, CLK_SET_RATE_PARENT,
> -				     pll_7nm->mmio +
> +				     pll_7nm->phy->pll_base +
>  				     REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
>  				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
>  	if (IS_ERR(hw)) {
> @@ -684,7 +681,7 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
>  	/* BIT CLK: DIV_CTRL_3_0 */
>  	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
>  				     CLK_SET_RATE_PARENT,
> -				     pll_7nm->phy_cmn_mmio +
> +				     pll_7nm->phy->base +
>  				     REG_DSI_7nm_PHY_CMN_CLK_CFG0,
>  				     0, 4, CLK_DIVIDER_ONE_BASED,
>  				     &pll_7nm->postdiv_lock);
> @@ -735,7 +732,7 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
>  	hw = devm_clk_hw_register_mux(dev, clk_name,
>  				 ((const char *[]){
>  				 parent, parent2, parent3, parent4
> -				 }), 4, 0, pll_7nm->phy_cmn_mmio +
> +				 }), 4, 0, pll_7nm->phy->base +
>  				 REG_DSI_7nm_PHY_CMN_CLK_CFG1,
>  				 0, 2, 0, NULL);
>  	if (IS_ERR(hw)) {
> @@ -748,7 +745,7 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
> 
>  	/* PIX CLK DIV : DIV_CTRL_7_4*/
>  	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
> -				     0, pll_7nm->phy_cmn_mmio +
> +				     0, pll_7nm->phy->base +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG0,
>  				     4, 4, CLK_DIVIDER_ONE_BASED,
>  				     &pll_7nm->postdiv_lock);
> @@ -783,18 +780,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	pll_7nm->id = id;
>  	pll_7nm_list[id] = pll_7nm;
> 
> -	pll_7nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
> -	if (IS_ERR_OR_NULL(pll_7nm->phy_cmn_mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
> -		return -ENOMEM;
> -	}
> -
> -	pll_7nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> -	if (IS_ERR_OR_NULL(pll_7nm->mmio)) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
> -		return -ENOMEM;
> -	}
> -
>  	spin_lock_init(&pll_7nm->postdiv_lock);
> 
>  	pll_7nm->phy = phy;
