Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5749E6FB923
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 23:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjEHVKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 17:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjEHVKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 17:10:16 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FCF76A1
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 14:10:14 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7F95C3F409;
        Mon,  8 May 2023 23:10:11 +0200 (CEST)
Date:   Mon, 8 May 2023 23:10:09 +0200
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
Subject: Re: [PATCH] drm/msm/dsi: simplify pixel clk rate handling
Message-ID: <63xbsz3mcly2nh7zehf7lutfe4i6qux2bqrlmiywr6hevs3rc2@et2kxxj6tqvf>
References: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-01-18 15:00:31, Dmitry Baryshkov wrote:
> Move a call to dsi_calc_pclk() out of calc_clk_rate directly towards
> msm_dsi_host_get_phy_clk_req(). It is called for both 6g and v2 hosts.
> 
> Also, while we are at it, replace another dsi_get_pclk_rate() invocation
> with using the stored value at msm_host->pixel_clk_rate.

Yes please, this was annoying and confusing to read in one of the recent
patches to that stray pclk_bpp assignment, thanks for cleaning it up.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

For the rest of the cleanup, also totally happy to see the duplication
moved out of the callback.  As Abhinav notes it does make the functions
a bit lighter, but that's exactly the purpose to make the differences
more obvious.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h      |  4 ++--
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++------------
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index bd3763a5d723..93ec54478eb6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -129,8 +129,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host);
> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>  void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>  struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 44be4a88aa83..5106e66846c3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -51,7 +51,7 @@ struct msm_dsi_host_cfg_ops {
>  	void* (*tx_buf_get)(struct msm_dsi_host *msm_host);
>  	void (*tx_buf_put)(struct msm_dsi_host *msm_host);
>  	int (*dma_base_get)(struct msm_dsi_host *msm_host, uint64_t *iova);
> -	int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
> +	int (*calc_clk_rate)(struct msm_dsi_host *msm_host);
>  };
>  
>  struct msm_dsi_cfg_handler {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 18fa30e1e858..7d99a108bff6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -616,28 +616,21 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  
>  }
>  
> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host)
>  {
> -	if (!msm_host->mode) {
> -		pr_err("%s: mode not set\n", __func__);
> -		return -EINVAL;
> -	}
> -
> -	dsi_calc_pclk(msm_host, is_bonded_dsi);
>  	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
> +
>  	return 0;
>  }
>  
> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host)
>  {
>  	u32 bpp = dsi_get_bpp(msm_host->format);
>  	u64 pclk_bpp;
>  	unsigned int esc_mhz, esc_div;
>  	unsigned long byte_mhz;
>  
> -	dsi_calc_pclk(msm_host, is_bonded_dsi);
> -
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
> +	pclk_bpp = msm_host->pixel_clk_rate * bpp;
>  	do_div(pclk_bpp, 8);
>  	msm_host->src_clk_rate = pclk_bpp;
>  
> @@ -2292,7 +2285,14 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>  	int ret;
>  
> -	ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_bonded_dsi);
> +	if (!msm_host->mode) {
> +		pr_err("%s: mode not set\n", __func__);
> +		return;
> +	}
> +
> +	dsi_calc_pclk(msm_host, is_bonded_dsi);
> +
> +	ret = cfg_hnd->ops->calc_clk_rate(msm_host);
>  	if (ret) {
>  		pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
>  		return;
> -- 
> 2.39.0
> 
