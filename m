Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F5B730B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 00:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbjFNW6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 18:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFNW6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 18:58:00 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D350F2130
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:57:58 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 13AC13F804;
        Thu, 15 Jun 2023 00:57:57 +0200 (CEST)
Date:   Thu, 15 Jun 2023 00:57:55 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm/dsi: split dsi_ctrl_config() function
Message-ID: <kkqjd5kmopmuhcnkksk2vzn3rwunbmzoq3yybnlw4eu4fjnmxo@seilko33i5ri>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
 <20230614224402.296825-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614224402.296825-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-15 01:44:02, Dmitry Baryshkov wrote:
> It makes no sense to pass NULL parameters to dsi_ctrl_config() in the
> disable case. Split dsi_ctrl_config() into enable and disable parts and
> drop unused params.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Indeed, it makes much more sense to split this out instead of faking a
_configure(false) with a return right at the top and "bogus" pointers.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index eaee621aa6c8..3f6dfb4f9d5a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -705,7 +705,12 @@ static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
>  	}
>  }
>  
> -static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
> +static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
> +{
> +	dsi_write(msm_host, REG_DSI_CTRL, 0);
> +}
> +
> +static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
>  {
>  	u32 flags = msm_host->mode_flags;
> @@ -713,11 +718,6 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>  	u32 data = 0, lane_ctrl = 0;
>  
> -	if (!enable) {
> -		dsi_write(msm_host, REG_DSI_CTRL, 0);
> -		return;
> -	}
> -
>  	if (flags & MIPI_DSI_MODE_VIDEO) {
>  		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
>  			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
> @@ -802,7 +802,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
>  		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
>  
> -		if (msm_dsi_phy_set_continuous_clock(phy, enable))
> +		if (msm_dsi_phy_set_continuous_clock(phy, true))
>  			lane_ctrl &= ~DSI_LANE_CTRL_HS_REQ_SEL_PHY;
>  
>  		dsi_write(msm_host, REG_DSI_LANE_CTRL,
> @@ -2358,7 +2358,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  
>  	dsi_timing_setup(msm_host, is_bonded_dsi);
>  	dsi_sw_reset(msm_host);
> -	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
> +	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
>  
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 1);
> @@ -2390,7 +2390,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  		goto unlock_ret;
>  	}
>  
> -	dsi_ctrl_config(msm_host, false, NULL, NULL);
> +	dsi_ctrl_disable(msm_host);
>  
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 0);
> -- 
> 2.39.2
> 
