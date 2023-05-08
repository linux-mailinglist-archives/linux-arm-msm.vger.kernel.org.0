Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424416FBA65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 23:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjEHV7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 17:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbjEHV73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 17:59:29 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9357114
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 14:59:27 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 38F633F33C;
        Mon,  8 May 2023 23:59:26 +0200 (CEST)
Date:   Mon, 8 May 2023 23:59:25 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 3/7] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Message-ID: <pldbixvcvqn5pjcuohz2uijywsd7rbhabdaas2oag6eqwqofon@amyyth6qgy3u>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-3-cb7f59f0f7fb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-3-cb7f59f0f7fb@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-12 16:25:17, Jessica Zhang wrote:
> Use the DRM DSC helper for det_thresh_flatness to match downstream
> implementation and the DSC spec.

This should put more emphasis on the fact that the helper **has a
different math implementation** to calculate the value differently, and
that this hence is a **semantic change**.  Otherwise the Fixes: won't
make sense and the reader wouldn't notice it.

> Changes in V2:
> - Added a Fixes tag
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I've made the same change locally, so for the change itself:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926da1441..b952f7d2b7f5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2020-2022, Linaro Limited
>   */
>  
> +#include <drm/display/drm_dsc_helper.h>
> +
>  #include "dpu_kms.h"
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hwio.h"
> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  	data |= dsc->final_offset;
>  	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>  
> -	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
> +	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
>  	data = det_thresh_flatness << 10;
>  	data |= dsc->flatness_max_qp << 5;
>  	data |= dsc->flatness_min_qp;
> 
> -- 
> 2.40.0
> 
