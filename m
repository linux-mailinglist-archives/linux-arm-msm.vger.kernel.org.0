Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5569272D4C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 01:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjFLXJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 19:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjFLXJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 19:09:20 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B401BE4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 16:09:17 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C6159201A2;
        Tue, 13 Jun 2023 01:09:13 +0200 (CEST)
Date:   Tue, 13 Jun 2023 01:09:11 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yongqin Liu <yongqin.liu@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: do not enable color-management if DSPPs
 are not available
Message-ID: <dbt3zbvagd4vrrrvpjokshebiebjaes77lvjv5ithsxggcdlrj@ce4l2ykex7bm>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-12 21:25:33, Dmitry Baryshkov wrote:
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
> 
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Yep, this indeed makes the CTM blob property disappear from the CRTC
resource:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>  				struct drm_plane *cursor)
>  {
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  	struct drm_crtc *crtc = NULL;
>  	struct dpu_crtc *dpu_crtc = NULL;
>  	int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>  
>  	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>  
> -	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +	if (dpu_kms->catalog->dspp_count)
> +		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>  
>  	/* save user friendly CRTC name for later */
>  	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> -- 
> 2.39.2
> 
