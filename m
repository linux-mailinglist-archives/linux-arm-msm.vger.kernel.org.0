Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E016FD71B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 08:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjEJGfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 02:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjEJGfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 02:35:05 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6632C2716
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 23:35:04 -0700 (PDT)
Received: from SoMainline.org (unknown [89.205.225.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EC6AB20210;
        Wed, 10 May 2023 08:35:01 +0200 (CEST)
Date:   Wed, 10 May 2023 08:35:00 +0200
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
Subject: Re: [PATCH v7 5/8] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Message-ID: <k6xgvs64hryacvgkgc3gvz6ifcibcy62us6ejamyl2ktapnt3q@fnftioyh6ruj>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-5-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-5-df48a2c54421@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Title suggestion: Use **fixed** MSM DSC helper...

To make it clear that this is a bugfix without having to read the commit
description first.

- Marijn

On 2023-05-09 15:06:51, Jessica Zhang wrote:
> The current dpu_hw_dsc calculation for det_thresh_flatness does not
> match the downstream calculation or the DSC spec.
> 
> Use the DRM DSC helper for det_thresh_flatness to match downstream
> implementation and the DSC spec.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 4e1396575e6a..1e11c0fb0545 100644
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
> 2.40.1
> 
