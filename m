Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0051F701A08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 23:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjEMVUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 May 2023 17:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjEMVUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 May 2023 17:20:07 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11891FF0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 14:20:06 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7FBED3EEAA;
        Sat, 13 May 2023 23:20:04 +0200 (CEST)
Date:   Sat, 13 May 2023 23:20:03 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 3/8] drm/msm/dsi: use DRM DSC helpers for DSC setup
Message-ID: <6f3v5xmv66yw7mxecwqbrj6mxlfos3cwosb6xqs7hjbgrjgfqz@acm27l7qot5f>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-3-4cb21168c227@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v10-3-4cb21168c227@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-12 14:32:13, Jessica Zhang wrote:
> 
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Use new DRM DSC helpers to setup DSI DSC configuration. The
> initial_scale_value needs to be adjusted according to the standard, but
> this is a separate change.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

All the parameters check out.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

(And as asked elsewhere: is it valuable to have t-b on top of this r-b,
 for all the devices/boards/SoCs/panels I have these patches working
 on?)

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 61 +++++---------------------------------
>  1 file changed, 8 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 961689a255c4..74d38f90398a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1731,28 +1731,9 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>  	return -EINVAL;
>  }
>  
> -static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> -	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
> -	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> -};
> -
> -/* only 8bpc, 8bpp added */
> -static char min_qp[DSC_NUM_BUF_RANGES] = {
> -	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
> -};
> -
> -static char max_qp[DSC_NUM_BUF_RANGES] = {
> -	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
> -};
> -
> -static char bpg_offset[DSC_NUM_BUF_RANGES] = {
> -	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> -};
> -
>  static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
>  {
> -	int i;
> -	u16 bpp = dsc->bits_per_pixel >> 4;
> +	int ret;
>  
>  	if (dsc->bits_per_pixel & 0xf) {
>  		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
> @@ -1764,49 +1745,23 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  		return -EOPNOTSUPP;
>  	}
>  
> -	dsc->rc_model_size = 8192;
> -	dsc->first_line_bpg_offset = 12;
> -	dsc->rc_edge_factor = 6;
> -	dsc->rc_tgt_offset_high = 3;
> -	dsc->rc_tgt_offset_low = 3;
>  	dsc->simple_422 = 0;
>  	dsc->convert_rgb = 1;
>  	dsc->vbr_enable = 0;
>  
> -	/* handle only bpp = bpc = 8 */
> -	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
> -		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
> +	drm_dsc_set_const_params(dsc);
> +	drm_dsc_set_rc_buf_thresh(dsc);
>  
> -	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> -		dsc->rc_range_params[i].range_min_qp = min_qp[i];
> -		dsc->rc_range_params[i].range_max_qp = max_qp[i];
> -		/*
> -		 * Range BPG Offset contains two's-complement signed values that fill
> -		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
> -		 */

I wish drm_dsc_setup_rc_params() used this comment :)

> -		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
> +	/* handle only bpp = bpc = 8, pre-SCR panels */
> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +	if (ret) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> +		return ret;
>  	}
>  
> -	dsc->initial_offset = 6144;		/* Not bpp 12 */
> -	if (bpp != 8)
> -		dsc->initial_offset = 2048;	/* bpp = 12 */
> -
> -	if (dsc->bits_per_component <= 10)
> -		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> -	else
> -		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
> -
> -	dsc->initial_xmit_delay = 512;
>  	dsc->initial_scale_value = 32;
> -	dsc->first_line_bpg_offset = 12;
>  	dsc->line_buf_depth = dsc->bits_per_component + 1;
>  
> -	/* bpc 8 */
> -	dsc->flatness_min_qp = 3;
> -	dsc->flatness_max_qp = 12;
> -	dsc->rc_quant_incr_limit0 = 11;
> -	dsc->rc_quant_incr_limit1 = 11;
> -
>  	return drm_dsc_compute_rc_parameters(dsc);
>  }
>  
> 
> -- 
> 2.40.1
> 
