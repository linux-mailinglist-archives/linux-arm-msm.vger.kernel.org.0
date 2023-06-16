Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E0B733121
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 14:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244797AbjFPMZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 08:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241493AbjFPMZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 08:25:10 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FD630DF
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 05:25:08 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BB09540A74;
        Fri, 16 Jun 2023 14:25:05 +0200 (CEST)
Date:   Fri, 16 Jun 2023 14:25:04 +0200
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
Subject: Re: [PATCH] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Message-ID: <h2u5wsfbfpz7qivmxl3t37xen452zxt76uheonkwcihytfmb3l@axiy5bmwf4ma>
References: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-16 12:41:52, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 3f6dfb4f9d5a..72c377c9c7be 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -528,6 +528,21 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>  	clk_disable_unprepare(msm_host->byte_clk);
>  }
>  
> +/*
> + * Adjust the pclk rate by calculating a new hdisplay proportional to

Make this a kerneldoc with:

    /**
     * dsi_adjust_pclk_for_compression() - Adjust ...

> + * the compression ratio such that:
> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> + *
> + * Porches do not need to be adjusted:
> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.

as-is

Though this was never tested nor confirmed by QUIC, but we can assume it
is the case for now?

> + * - For the CMD mode the are no actual porches. Instead they represent the

the are no -> these are not

they currently* represent.  Let's make sure that folks read the FIXME
below by perhaps rewording it right into this entry?

> + *   overhead to the image data transfer. As such, they are calculated for the
> + *   final mode parameters (after the compression) and are not to be adjusted
> + *   too.
> + *
> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
> + *  refresh rate and data overhead as a starting point of the calculations.
> + */
>  static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>  		const struct drm_dsc_config *dsc)
>  {
> @@ -926,8 +941,24 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		if (ret)
>  			return;
>  
> -		/* Divide the display by 3 but keep back/font porch and
> -		 * pulse width same
> +		/*
> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
> +		 * not used, a single pixel is transferred at each pulse, no
> +		 * matter what bpp or pixel format is used. In case of DSC
> +		 * compression this results (due to data alignment
> +		 * requirements) in a transfer of 3 compressed pixel per pclk

3 compressed bytes*, not pixels.

> +		 * cycle.
> +		 *
> +		 * If widebus is enabled, bus width is extended to 6 bytes.
> +		 * This way the DPU can transfer 6 compressed pixels with bpp

pixels -> bytes?

> +		 * less or equal to 8 or 3 compressed pyxels in case bpp is

pixels*... bytes?

And I will ask this **again**: does this mean we can halve pclk?

> +		 * greater than 8.
> +		 *
> +		 * The back/font porch and pulse width are kept intact.  They
> +		 * represent timing parameters rather than actual data
> +		 * transfer.

See FIXME above on dsi_adjust_pclk_for_compression()?

Thanks so much for finally putting some of this to paper.

- Marijn

> +		 *
> +		 * XXX: widebus is not supported by the driver (yet).
>  		 */
>  		h_total -= hdisplay;
>  		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> -- 
> 2.39.2
> 
