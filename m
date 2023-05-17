Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF857071B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 21:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjEQTNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 15:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjEQTNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 15:13:47 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED231AD14
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 12:13:38 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5386920480;
        Wed, 17 May 2023 21:13:36 +0200 (CEST)
Date:   Wed, 17 May 2023 21:13:34 +0200
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
Subject: Re: [PATCH v11 8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
Message-ID: <l5caompoxuarl3fxhpv37xmpahprvwn2w6mg2y4tla5uitckmf@ytytt7wivfs7>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-8-30270e1eeac3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-8-30270e1eeac3@quicinc.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-17 11:51:17, Jessica Zhang wrote:
> 
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..b21108948061 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -28,6 +28,7 @@
>  #include "dsi.xml.h"
>  #include "sfpb.xml.h"
>  #include "dsi_cfg.h"
> +#include "msm_dsc_helper.h"
>  #include "msm_kms.h"
>  #include "msm_gem.h"
>  #include "phy/dsi_phy.h"
> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	/* first calculate dsc parameters and then program
>  	 * compress mode registers
>  	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>  
>  	/*
>  	 * If slice_count is greater than slice_per_intf
> @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	if (dsc->slice_count > slice_per_intf)
>  		dsc->slice_count = 1;
>  
> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	total_bytes_per_intf = dsc->slice_count * slice_per_intf;

Oh no, this line shouldn't have changed.  Besides not conforming to the
"use MSM and DRM DSC helper methods" title, this is now no longer
computing the bytes that we were in v10.  Was this tested?

- Marijn

>  
>  	eol_byte_num = total_bytes_per_intf % 3;
>  	pkt_per_line = slice_per_intf / dsc->slice_count;
> @@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  		return ret;
>  	}
>  
> -	dsc->initial_scale_value = 32;
> +	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
>  	dsc->line_buf_depth = dsc->bits_per_component + 1;
>  
>  	return drm_dsc_compute_rc_parameters(dsc);
> 
> -- 
> 2.40.1
> 
