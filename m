Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F3D34AE3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 19:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhCZSGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 14:06:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62342 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230114AbhCZSFx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 14:05:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616781953; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Gjm43SdfpwDXIBiOLyxle6Taf6ku7fuAYmnZAyJ0Cic=;
 b=xLE1xraDyZdgjqsbzA3j/mJh4WvPB2fqH4yr3iHArlPWT51Vd8oUi422akhrDdPXg6dtYU9j
 zKLFK3xyUoulJ9f3khsXN8QCDYpV9bSZVlIko31ViyDMKJPeqs9Shetml9kjbKOhO4diLu29
 daGbQTxvAQ1vnH3OutAIXWfsAmI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 605e227904a1954ec3486a4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 18:05:45
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 759BBC43462; Fri, 26 Mar 2021 18:05:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1E64C433C6;
        Fri, 26 Mar 2021 18:05:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Mar 2021 11:05:41 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 11/28] drm/msm/dsi: stop setting clock
 parents manually
In-Reply-To: <20210324151846.2774204-12-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-12-dmitry.baryshkov@linaro.org>
Message-ID: <70b511f16d9d3edfdcaa27d749933ca7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> There is no reason to set clock parents manually, use device tree to
> assign DSI/display clock parents to DSI PHY clocks. Dropping this 
> manual
> setup allows us to drop repeating code and to move registration of hw
> clock providers to generic place.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With this change, there is a change in behavior for dual DSI using 
single PLL.
So today, it looks like once we specify qcom,dual-dsi-mode; in the DT,
this code was also setting the src pll of the other DSI to be DSI0.

> -		src_pll = msm_dsi_phy_get_pll(clk_master_dsi->phy);
> -		if (IS_ERR(src_pll))
> -			return PTR_ERR(src_pll);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
> -		if (ret)
> -			return ret;
> -		ret = msm_dsi_host_set_src_pll(other_dsi->host, src_pll);

With this change, we not only have to do mark qcom,dual-dsi-mode but 
also change the
parent in the DTSI like below:

assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc 
DISP_CC_MDSS_PCLK1_CLK_SRC>;
assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;

So it seems like we need to do two things for dual DSI panels to work?
Have you verified it like this on any of your boards?

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  9 ----
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 51 -------------------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c         | 12 -----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 --
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 19 -------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 17 -------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 18 -------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 16 ------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 19 -------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 11 ----
>  10 files changed, 175 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b310cf344ed4..3614af64ff52 100644
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
> @@ -143,8 +136,6 @@ unsigned long msm_dsi_host_get_mode_flags(struct
> mipi_dsi_host *host);
>  struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host 
> *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host, bool 
> check_defer);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> -int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -			struct msm_dsi_pll *src_pll);
>  void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
>  void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  	struct msm_dsi_phy_clk_request *clk_req,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ab281cba0f08..bf3468ccc965 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2225,57 +2225,6 @@ void msm_dsi_host_cmd_xfer_commit(struct
> mipi_dsi_host *host, u32 dma_base,
>  	wmb();
>  }
> 
> -int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -	struct msm_dsi_pll *src_pll)
> -{
> -	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> -	struct clk *byte_clk_provider, *pixel_clk_provider;
> -	int ret;
> -
> -	ret = msm_dsi_pll_get_clk_provider(src_pll,
> -				&byte_clk_provider, &pixel_clk_provider);
> -	if (ret) {
> -		pr_info("%s: can't get provider from pll, don't set parent\n",
> -			__func__);
> -		return 0;
> -	}
> -
> -	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
> -	if (ret) {
> -		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
> -	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
> -	if (ret) {
> -		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
> -	if (msm_host->dsi_clk_src) {
> -		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
> -		if (ret) {
> -			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
> -				__func__, ret);
> -			goto exit;
> -		}
> -	}
> -
> -	if (msm_host->esc_clk_src) {
> -		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
> -		if (ret) {
> -			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
> -				__func__, ret);
> -			goto exit;
> -		}
> -	}
> -
> -exit:
> -	return ret;
> -}
> -
>  void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 1d28dfba2c9b..6b65d86d116a 100644
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
> @@ -79,10 +78,6 @@ static int dsi_mgr_setup_components(int id)
>  			return ret;
> 
>  		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
> -		if (IS_ERR(src_pll))
> -			return PTR_ERR(src_pll);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
>  	} else if (!other_dsi) {
>  		ret = 0;
>  	} else {
> @@ -109,13 +104,6 @@ static int dsi_mgr_setup_components(int id)
>  					MSM_DSI_PHY_MASTER);
>  		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
>  					MSM_DSI_PHY_SLAVE);
> -		src_pll = msm_dsi_phy_get_pll(clk_master_dsi->phy);
> -		if (IS_ERR(src_pll))
> -			return PTR_ERR(src_pll);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
> -		if (ret)
> -			return ret;
> -		ret = msm_dsi_host_set_src_pll(other_dsi->host, src_pll);
>  	}
> 
>  	return ret;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index f737bef74b91..3e3ed884c3dc 100644
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
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 7a98e420414f..319d7b26c784 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -621,23 +621,6 @@ static int dsi_pll_10nm_set_usecase(struct
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
> @@ -1105,7 +1088,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.pll_init = dsi_pll_10nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_10nm_get_provider,
>  		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
> @@ -1131,7 +1113,6 @@ const struct msm_dsi_phy_cfg 
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
> index bab86fa6dc4b..6f3021f66ecc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -880,21 +880,6 @@ static int dsi_pll_14nm_set_usecase(struct
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
> @@ -1227,7 +1212,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.pll_init = dsi_pll_14nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_14nm_get_provider,
>  		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> @@ -1255,7 +1239,6 @@ const struct msm_dsi_phy_cfg 
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
> index d267b25e5da0..83c73230266d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -495,21 +495,6 @@ static int dsi_pll_28nm_restore_state(struct
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
> @@ -802,7 +787,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_28nm_get_provider,
>  		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> @@ -830,7 +814,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		.pll_init = dsi_pll_28nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_28nm_get_provider,
>  		.destroy = dsi_pll_28nm_destroy,
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> @@ -858,7 +841,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
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
> index 31e7910c6050..0e26780e3eb4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -377,21 +377,6 @@ static int dsi_pll_28nm_restore_state(struct
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
> @@ -702,7 +687,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
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
> index 5acdfe1f63be..7618f40ad45d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -646,23 +646,6 @@ static int dsi_pll_7nm_set_usecase(struct 
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
> @@ -1138,7 +1121,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  	},
>  	.pll_ops = {
> -		.get_provider = dsi_pll_7nm_get_provider,
>  		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
> @@ -1165,7 +1147,6 @@ const struct msm_dsi_phy_cfg 
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
> index 98ee4560581a..5768e8d225fc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -74,17 +74,6 @@ void msm_dsi_pll_helper_unregister_clks(struct
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
