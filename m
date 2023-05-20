Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3617870A666
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 10:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjETIa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 04:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjETIa1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 04:30:27 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5CCA1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 01:30:26 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 730B420079;
        Sat, 20 May 2023 10:30:24 +0200 (CEST)
Date:   Sat, 20 May 2023 10:30:23 +0200
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
Subject: Re: [PATCH 2/2] drm/msm/dsi: use mult_frac for pclk_bpp calculation
Message-ID: <am4iyar6ubidfq6mgylk62fo3nx2glm2gvxuudspxabzp7m5ve@zic5lrwc23cm>
References: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
 <20230520002846.2870546-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230520002846.2870546-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-20 03:28:46, Dmitry Baryshkov wrote:
> Simplify calculatoins around pixel_clk_rate division. Replace common

calculations*

> pattern of doing 64-bit multiplication and then a do_div() call with
> simpler mult_frac call.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

That's a cool function, I did not know of its existence!  Will keep it
in mind in future drm/msm changes and review, thanks for showing this!
(There seem to be a few more places where we *could* apply this)

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2b257b459974..744f2398a6d6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -585,7 +585,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>  	u8 lanes = msm_host->lanes;
>  	u32 bpp = dsi_get_bpp(msm_host->format);
>  	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> -	u64 pclk_bpp = (u64)pclk_rate * bpp;
> +	unsigned long pclk_bpp;
>  
>  	if (lanes == 0) {
>  		pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
> @@ -594,9 +594,9 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>  
>  	/* CPHY "byte_clk" is in units of 16 bits */
>  	if (msm_host->cphy_mode)
> -		do_div(pclk_bpp, (16 * lanes));
> +		pclk_bpp = mult_frac(pclk_rate, bpp, 16 * lanes);
>  	else
> -		do_div(pclk_bpp, (8 * lanes));
> +		pclk_bpp = mult_frac(pclk_rate, bpp, 8 * lanes);
>  
>  	return pclk_bpp;
>  }
> @@ -627,15 +627,12 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
>  	u32 bpp = dsi_get_bpp(msm_host->format);
> -	u64 pclk_bpp;
>  	unsigned int esc_mhz, esc_div;
>  	unsigned long byte_mhz;
>  
>  	dsi_calc_pclk(msm_host, is_bonded_dsi);
>  
> -	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
> -	do_div(pclk_bpp, 8);
> -	msm_host->src_clk_rate = pclk_bpp;
> +	msm_host->src_clk_rate = mult_frac(msm_host->pixel_clk_rate, bpp, 8);
>  
>  	/*
>  	 * esc clock is byte clock followed by a 4 bit divider,
> -- 
> 2.39.2
> 
