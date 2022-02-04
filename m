Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B944AA48E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Feb 2022 00:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240343AbiBDXmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 18:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiBDXmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 18:42:33 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3709CE001A65
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 15:42:30 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a28so15482428lfl.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9vy38E4JVnD68Bkm9KtEPkvBWxdhLuFhS9Sl7Qc8YiE=;
        b=jD7sDeKEWY7nW+EAB2tYPiLsM15u0ioStaIADx/jWncZHJzYQD2pouzfGM7/yh+lym
         2EgAwirkH690kdfzHIqKg3jvEQpaD76eSSaUOwDNeek8uhMixZPDl/zw3P9D6821MrMm
         NvCH6ZjbYPJTEvtI0RDkv/SIk8qEy8kRR0nqt7cDNZJwhWkbtv5mexqERSwOv4e2onNT
         HwKvXOE5OWfSoJ+7hvvCz1l8TFVLtgsQZbPXYvNE69qP24yVFWTWkKtcffSGtlm/Ff2D
         kHdgTSK4Nh7nqW9RWKhjN9aq9euw6GUYEMtRdrOBUDW8qSv/hpu+E26Vf98TQs3f7sb7
         Udbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9vy38E4JVnD68Bkm9KtEPkvBWxdhLuFhS9Sl7Qc8YiE=;
        b=4uEu08475sGq5cW9yA5MlFmvdlJhn5E1OilxJewBfs5wAnYD/XAKX/eJADXp/8Xk+N
         izZrCIPS1UmXG5rA1mJYOUVKk7ZWlig/RqtFOCzHUoK98d7xvw2PLZSOoa0fhWV/tV96
         TujtGg6PeQ16fE8MhzQVTHkPGxwumHk5b8kyU7CutLPyiMWCdfPsr3YcSOLo1SdfjLza
         jc974glLx2UbFjcT4eOEiG5SSkJ5IpmsDjr+JJAZi+9b8xSp3F9F7gMFi6tQ6by0m02z
         9DRQDnGwSAmN6CCEO1KFdi93B75vf7OwpMpaU+1erOUszGnFC0BOOtNCa2Fpx6dJ2jjK
         fZqA==
X-Gm-Message-State: AOAM530Fruk416pwCBpqsorBCT4izS/YMzWvehRObo8zsz5M0mPSX9iO
        sBQUK/LCc9wDqnEQt6bF9iBnkphD/ssxzQ==
X-Google-Smtp-Source: ABdhPJwdZM7DMeGe39kXSqF6vI6V6ASyjinB2RGh4iB90UoTjkcMrYXnpWg88KVgt4S8Bs9tukKo/g==
X-Received: by 2002:a05:6512:22c9:: with SMTP id g9mr973676lfu.148.1644018148552;
        Fri, 04 Feb 2022 15:42:28 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t27sm440574ljk.138.2022.02.04.15.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 15:42:28 -0800 (PST)
Message-ID: <940f739f-219f-3169-dcf0-c270dbe815e9@linaro.org>
Date:   Sat, 5 Feb 2022 02:42:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/12] drm/msm/dpu: add encoder operations to
 prepare/cleanup wb job
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org, daniel@ffwll.ch,
        markyacoub@chromium.org, quic_jesszhan@quicinc.com
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-8-git-send-email-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-8-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2022 00:17, Abhinav Kumar wrote:
> add dpu encoder APIs to prepare and cleanup writeback job
> for the writeback encoder. These shall be invoked from the
> prepare_wb_job/cleanup_wb_job hooks of the drm_writeback
> framework.

Having dpu-encoder-wide API for the single case of WB looks like an 
overkill. But I think we have no other choice here.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 34 ++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      | 16 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  5 ++++
>   3 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 947069b..b51a677 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -958,6 +958,40 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   	return 0;
>   }
>   
> +void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	int i;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->ops.prepare_wb_job)
> +			phys->ops.prepare_wb_job(phys, job);
> +
> +	}
> +}
> +
> +void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	int i;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->ops.cleanup_wb_job)
> +			phys->ops.cleanup_wb_job(phys, job);
> +
> +	}
> +}
> +
>   static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   				      struct drm_display_mode *mode,
>   				      struct drm_display_mode *adj_mode)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index cc10436..da5b6d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -171,4 +171,20 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>    */
>   int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>   
> +/**
> + * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * @job:        Pointer to the current drm writeback job
> + */
> +void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job);
> +
> +/**
> + * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * @job:        Pointer to the current drm writeback job
> + */
> +void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 07c3525..7b3354d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -7,6 +7,7 @@
>   #ifndef __DPU_ENCODER_PHYS_H__
>   #define __DPU_ENCODER_PHYS_H__
>   
> +#include <drm/drm_writeback.h>
>   #include <linux/jiffies.h>
>   
>   #include "dpu_kms.h"
> @@ -146,6 +147,10 @@ struct dpu_encoder_phys_ops {
>   	void (*restore)(struct dpu_encoder_phys *phys);
>   	int (*get_line_count)(struct dpu_encoder_phys *phys);
>   	int (*get_frame_count)(struct dpu_encoder_phys *phys);
> +	void (*prepare_wb_job)(struct dpu_encoder_phys *phys_enc,
> +			struct drm_writeback_job *job);
> +	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
> +			struct drm_writeback_job *job);
>   };
>   
>   /**


-- 
With best wishes
Dmitry
