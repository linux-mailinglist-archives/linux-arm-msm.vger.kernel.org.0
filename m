Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7047C35062A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhCaSTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:19:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27037 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234950AbhCaSTR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:19:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617214757; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kF/20iZqiGx7wNR+fkuad3zo5/rtj1z2trqAMlWamaQ=;
 b=ZTLCvMLmE6f4nYdYn81JrHaTW8ptIDCdvHl/pBV8eoNVhGGuKy6G/h3M9MB4iqQPV492s7uU
 mDhE3JntOVvpVngIvkOQOoO1HEzVY7fE8LLLvJJdn8zG+k29a1OnEBn+Um6LXZkkW99BJRNT
 VoPT3+UPGXBjMFfG9kQExFDJZv8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6064bd1e8166b7eff7dc1653 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 18:19:10
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70773C433ED; Wed, 31 Mar 2021 18:19:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D7C8C433CA;
        Wed, 31 Mar 2021 18:19:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 31 Mar 2021 11:19:07 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v4 23/24] drm/msm/dsi: inline
 msm_dsi_phy_set_src_pll
In-Reply-To: <20210331105735.3690009-24-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-24-dmitry.baryshkov@linaro.org>
Message-ID: <848e764a0b26be36ec110964bc2655d0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-31 03:57, Dmitry Baryshkov wrote:
> The src_truthtable config is not used for some of phys, which use other
> means of configuring the master/slave usecases. Inline this function
> with the goal of removing src_pll_id argument in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 17 -----------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  8 --------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 --
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 13 +++++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 11 +++++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 13 +++++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 --
>  8 files changed, 21 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 344887025720..93e81bb78d26 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -461,23 +461,6 @@ int msm_dsi_dphy_timing_calc_v4(struct
> msm_dsi_dphy_timing *timing,
>  	return 0;
>  }
> 
> -void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 
> reg,
> -				u32 bit_mask)
> -{
> -	int phy_id = phy->id;
> -	u32 val;
> -
> -	if ((phy_id >= DSI_MAX) || (pll_id >= DSI_MAX))
> -		return;
> -
> -	val = dsi_phy_read(phy->base + reg);
> -
> -	if (phy->cfg->src_pll_truthtable[phy_id][pll_id])
> -		dsi_phy_write(phy->base + reg, val | bit_mask);
> -	else
> -		dsi_phy_write(phy->base + reg, val & (~bit_mask));
> -}
> -
>  static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>  {
>  	struct regulator_bulk_data *s = phy->supplies;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 7748f8b5ea53..00ef01baaebd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -33,12 +33,6 @@ struct msm_dsi_phy_cfg {
>  	unsigned long	min_pll_rate;
>  	unsigned long	max_pll_rate;
> 
> -	/*
> -	 * Each cell {phy_id, pll_id} of the truth table indicates
> -	 * if the source PLL selection bit should be set for each PHY.
> -	 * Fill default H/W values in illegal cells, eg. cell {0, 1}.
> -	 */
> -	bool src_pll_truthtable[DSI_MAX][DSI_MAX];
>  	const resource_size_t io_start[DSI_MAX];
>  	const int num_dsi_phy;
>  	const int quirks;
> @@ -121,7 +115,5 @@ int msm_dsi_dphy_timing_calc_v3(struct
> msm_dsi_dphy_timing *timing,
>  				struct msm_dsi_phy_clk_request *clk_req);
>  int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>  				struct msm_dsi_phy_clk_request *clk_req);
> -void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 
> reg,
> -				u32 bit_mask);
> 
>  #endif /* __DSI_PHY_H__ */
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 655996cf8688..64b8b0efc1a4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -921,7 +921,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
> -	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
> @@ -943,7 +942,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
> -	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 090d3e7a2212..9a2937589435 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -947,6 +947,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	int ret;
>  	void __iomem *base = phy->base;
>  	void __iomem *lane_base = phy->lane_base;
> +	u32 glbl_test_ctrl;
> 
>  	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
>  		DRM_DEV_ERROR(&phy->pdev->dev,
> @@ -994,10 +995,12 @@ static int dsi_14nm_phy_enable(struct
> msm_dsi_phy *phy, int src_pll_id,
>  	udelay(100);
>  	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
> 
> -	msm_dsi_phy_set_src_pll(phy, src_pll_id,
> -				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
> -				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
> -
> +	glbl_test_ctrl = dsi_phy_read(base + 
> REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
> +	if (phy->id == DSI_1 && src_pll_id == DSI_0)
> +		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> +	else
> +		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> +	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, 
> glbl_test_ctrl);
>  	ret = dsi_14nm_set_usecase(phy);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
> @@ -1021,7 +1024,6 @@ static void dsi_14nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
> -	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
> @@ -1043,7 +1045,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
> -	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index 5e73f811d645..f5b88c85a8fc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -70,6 +70,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	int i;
>  	void __iomem *base = phy->base;
>  	u32 cfg_4[4] = {0x20, 0x40, 0x20, 0x00};
> +	u32 val;
> 
>  	DBG("");
> 
> @@ -83,9 +84,12 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
> 
>  	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
> 
> -	msm_dsi_phy_set_src_pll(phy, src_pll_id,
> -				REG_DSI_20nm_PHY_GLBL_TEST_CTRL,
> -				DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL);
> +	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
> +	if (src_pll_id == DSI_1)
> +		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> +	else
> +		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> +	dsi_phy_write(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL, val);
> 
>  	for (i = 0; i < 4; i++) {
>  		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_3(i),
> @@ -125,7 +129,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
> -	.src_pll_truthtable = { {false, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 2,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index e09fa80c413e..61f2f7f672ca 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -704,6 +704,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	int i;
>  	void __iomem *base = phy->base;
> +	u32 val;
> 
>  	DBG("");
> 
> @@ -743,9 +744,12 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
> 
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
> 
> -	msm_dsi_phy_set_src_pll(phy, src_pll_id,
> -				REG_DSI_28nm_PHY_GLBL_TEST_CTRL,
> -				DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL);
> +	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
> +	if (phy->id == DSI_1 && src_pll_id == DSI_0)
> +		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> +	else
> +		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL, val);
> 
>  	return 0;
>  }
> @@ -763,7 +767,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
> -	.src_pll_truthtable = { {true, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
> @@ -785,7 +788,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
> -	.src_pll_truthtable = { {true, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
> @@ -807,7 +809,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
> -	.src_pll_truthtable = { {true, true}, {true, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 08bd93b719e0..83e275ed7476 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -642,7 +642,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
> -	.src_pll_truthtable = { {true, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index b079ecc63212..dc28dd37c7f9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -957,7 +957,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
> -	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
> @@ -980,7 +979,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
> -	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
