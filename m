Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E07770B0DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 23:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjEUVcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 17:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjEUVcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 17:32:12 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0B6BF
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 14:32:11 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6169B3F342;
        Sun, 21 May 2023 23:32:09 +0200 (CEST)
Date:   Sun, 21 May 2023 23:32:08 +0200
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
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE
 define
Message-ID: <blpuhpusgflnpshadkmbmrmxxd5yhrqsk27gxrk36vnvnrgfg6@o4jeuokwegha>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
 <20230521192230.9747-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521192230.9747-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-21 22:22:29, Dmitry Baryshkov wrote:
> This define is used only in one place, in dpu_encoder debugfs code.
> Inline the value and drop the define completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Even if this was a constant, always a fan of sizeof(name) versus
assuming that name has some length constant/define!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 --
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c771383446f2..af34932729db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2116,14 +2116,14 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>  
> -	char name[DPU_NAME_SIZE];
> +	char name[12];
>  
>  	if (!drm_enc->dev) {
>  		DPU_ERROR("invalid encoder or kms\n");
>  		return -EINVAL;
>  	}
>  
> -	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
> +	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
>  
>  	/* create overall sub-directory for the encoder */
>  	dpu_enc->debugfs_root = debugfs_create_dir(name,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 66209e2448d2..c4f82180ad10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -63,8 +63,6 @@
>  #define ktime_compare_safe(A, B) \
>  	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
>  
> -#define DPU_NAME_SIZE  12
> -
>  struct dpu_kms {
>  	struct msm_kms base;
>  	struct drm_device *dev;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 14b5cfe30611..ac75ba13aa01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -42,8 +42,6 @@
>  #define SHARP_SMOOTH_THR_DEFAULT	8
>  #define SHARP_NOISE_THR_DEFAULT	2
>  
> -#define DPU_NAME_SIZE  12
> -
>  #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>  #define DPU_ZPOS_MAX 255
>  
> -- 
> 2.39.2
> 
