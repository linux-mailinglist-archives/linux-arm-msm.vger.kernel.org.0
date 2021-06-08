Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A778039EB59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 03:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFHBae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 21:30:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58807 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230209AbhFHBae (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 21:30:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623115722; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ALppXYAn0VcZBVpBHjzjYENlrHw1CZzy97XnmejR2Bw=;
 b=dHwZ+7K3uvtTfppEjyZ7VF4lyj9DW37hRvFdW4xZwHdxe5v8235u1mp3ea9HrdYGWCQLjBCv
 bq7rvU4VkQb90K8nSOsMhUmQ3yUj9g35a1i9WNIOotSuslyfmsRGMCVACZqHU3J5tSXxIpdF
 VA9liaWmGo6OOtb7Cqv/4+QfLcc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60bec7b88491191eb32d99b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 01:28:24
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 107EAC433F1; Tue,  8 Jun 2021 01:28:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72B28C433D3;
        Tue,  8 Jun 2021 01:28:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Jun 2021 18:28:22 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/msm/dsi: add continuous clock support for 7nm PHY
In-Reply-To: <20210607230021.2193253-1-dmitry.baryshkov@linaro.org>
References: <20210607230021.2193253-1-dmitry.baryshkov@linaro.org>
Message-ID: <41cdc58d1d1189dbf2ea9e46aefc840e@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-07 16:00, Dmitry Baryshkov wrote:
> Unlike previous generations, 7nm PHYs are required to collaborate with
> the host for conitnuos clock mode. Add changes neccessary to enable
"the host for continuous clock mode"
> continuous clock mode in the 7nm DSI PHYs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v2:
>  - Really drop msm_dsi_phy_needs_hs_phy_sel()
> 
> Changes since v1:
>  - Remove the need for a separate msm_dsi_phy_needs_hs_phy_sel() call
>  - Fix setting continuous clock for a dual DSI case.
Maybe I am missing something but I cannot find this part of the change.
What has been fixed for dual DSI?
> 
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h             |  3 ++-
>  drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
>  drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  9 +++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
>  7 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 7abfeab08165..5be458c701d2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -108,7 +108,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host 
> *host);
>  int msm_dsi_host_disable(struct mipi_dsi_host *host);
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi);
> +			bool is_dual_dsi, struct msm_dsi_phy *phy);
>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  				  const struct drm_display_mode *mode);
> @@ -173,6 +173,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
> +bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 50eb4d1b8fdd..9762af6035e9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -510,6 +510,7 @@ static inline uint32_t
> DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
>  #define DSI_LANE_STATUS_DLN0_DIRECTION				0x00010000
> 
>  #define REG_DSI_LANE_CTRL					0x000000a8
> +#define DSI_LANE_CTRL_HS_REQ_SEL_PHY				0x01000000
>  #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST			0x10000000
> 
>  #define REG_DSI_LANE_SWAP_CTRL					0x000000ac
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 41e1d0f7ab6e..50be935edcad 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -835,7 +835,7 @@ static inline enum dsi_cmd_dst_format 
> dsi_get_cmd_fmt(
>  }
> 
>  static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool 
> enable,
> -			struct msm_dsi_phy_shared_timings *phy_shared_timings)
> +			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct
> msm_dsi_phy *phy)
>  {
>  	u32 flags = msm_host->mode_flags;
>  	enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
> @@ -930,6 +930,10 @@ static void dsi_ctrl_config(struct msm_dsi_host
> *msm_host, bool enable,
> 
>  	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
>  		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
> +
> +		if (msm_dsi_phy_set_continuous_clock(phy, enable))
> +			lane_ctrl |= DSI_LANE_CTRL_HS_REQ_SEL_PHY;
> +
Not sure how I missed this in the prev patch but for enabling continuous 
clock mode for new PHY, you need to clear bit 24
and not set it. If you set it, it goes back to legacy mode ( older 
method of continuous clock mode )
>  		dsi_write(msm_host, REG_DSI_LANE_CTRL,
>  			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
>  	}
> @@ -2360,7 +2364,7 @@ static void msm_dsi_sfpb_config(struct
> msm_dsi_host *msm_host, bool enable)
> 
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi)
> +			bool is_dual_dsi, struct msm_dsi_phy *phy)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> @@ -2400,7 +2404,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host 
> *host,
> 
>  	dsi_timing_setup(msm_host, is_dual_dsi);
>  	dsi_sw_reset(msm_host);
> -	dsi_ctrl_config(msm_host, true, phy_shared_timings);
> +	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
> 
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 1);
> @@ -2431,7 +2435,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host 
> *host)
>  		goto unlock_ret;
>  	}
> 
> -	dsi_ctrl_config(msm_host, false, NULL);
> +	dsi_ctrl_config(msm_host, false, NULL, NULL);
> 
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 0);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index e138a0c16085..cc18ea2b244c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -382,7 +382,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> 
> -	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
> is_dual_dsi);
> +	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> is_dual_dsi, msm_dsi->phy);
>  	if (ret) {
>  		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
>  		goto host_on_fail;
> @@ -390,7 +390,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
> 
>  	if (is_dual_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_power_on(msm_dsi1->host,
> -				&phy_shared_timings[DSI_1], is_dual_dsi);
> +				&phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi1->phy);
>  		if (ret) {
>  			pr_err("%s: power on host1 failed, %d\n",
>  							__func__, ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ccbd19f7d9cf..1b11c0337a59 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -851,6 +851,15 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy 
> *phy,
>  		phy->usecase = uc;
>  }
> 
> +/* Returns true if we have to enable DSI_LANE_CTRL.HS_REQ_SEL_PHY */
> +bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable)
> +{
> +	if (!phy || !phy->cfg->ops.set_continuous_clock)
> +		return false;
> +
> +	return phy->cfg->ops.set_continuous_clock(phy, enable);
> +}
> +
>  int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
>  {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..08e516d0dac4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
>  	void (*disable)(struct msm_dsi_phy *phy);
>  	void (*save_pll_state)(struct msm_dsi_phy *phy);
>  	int (*restore_pll_state)(struct msm_dsi_phy *phy);
> +	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
>  };
> 
>  struct msm_dsi_phy_cfg {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..310b15653fa3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -930,6 +930,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
> *phy,
>  	return 0;
>  }
> 
> +static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable)
> +{
> +	void __iomem *base = phy->base;
> +	u32 data;
> +
> +	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
> +	if (enable)
> +		data |= BIT(5) | BIT(6);
> +	else
> +		data &= ~(BIT(5) | BIT(6));
> +	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
> +
> +	return enable;
> +}
> +
>  static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>  {
>  	void __iomem *base = phy->base;
> @@ -970,6 +985,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  		.save_pll_state = dsi_7nm_pll_save_state,
>  		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
>  	},
>  	.min_pll_rate = 600000000UL,
>  	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
> ULONG_MAX,
> @@ -992,6 +1008,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs 
> = {
>  		.pll_init = dsi_pll_7nm_init,
>  		.save_pll_state = dsi_7nm_pll_save_state,
>  		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
