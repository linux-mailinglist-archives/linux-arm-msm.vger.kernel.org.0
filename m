Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43321682D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 13:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjAaM6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 07:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjAaM6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 07:58:52 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0405249965
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 04:58:51 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id be12so3047032edb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 04:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkyFyenacXd17rNywCrJx/hKCAb3GagOAKoON+f0+6U=;
        b=xvjussJajMGrV0E16LOEg6Xo1NdVhD1K2qehnwgL2nO62EsrAsujBgzOvxLBNuWIjc
         FItyKlZPBGn9TEhEOoKVsBF4uKWKuNRBCPYaoa39PgMG2j183FwRryXCD1kFW487MSPK
         f8kYY4gNZj4Ryd8bQmFio6830hyXTSS98GbnjqYT0YWbp0JDy9QhR/OyDKCRp1vQSzYY
         WbyfgjJx3FGIGd8NYg69KOZbtAUliGMClLUWZnhvoVbWyNyiWp3KNT5RyewaWO2Z11RO
         4ivceMHpQouAnBjIkkmbPeLfef1tBj3/zN07qHmKZ26a1NUhIimLyyS9VrvqYbYFdR0E
         qlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkyFyenacXd17rNywCrJx/hKCAb3GagOAKoON+f0+6U=;
        b=1Ytw0hDZzMRhCSp0wb5i0S7CeCdWwtgZbgCaDxUE1gg4+RHaC/50IbklN3YORypDMP
         Fgx2JzokOOnFMKk045SnIKhQ1g+J5gPGkZKM28STfKB0w2KHPFBIsfWy9sOVbPzU7US2
         2tXR6ncWjB8TppxwtlAIWhlwLzEoaFsQCq3VVx2PFfXNZe5Th8DGtGQzXn/IbVOSGaMq
         mjfpDXL+66obVfarG/EvrasV9SPANjR6YeO8fjDC6h1VjvpXf6QpJQGXSWJv1weVQWHZ
         uvCkz80pAxrdr0jemFn2JORgN5iRr82FT4XSoyY1kHGkXS/VPhtWoGEi5V+VFeyexQFi
         mZPQ==
X-Gm-Message-State: AO0yUKXqWX25K5TabUVkt3nTjqLXxJ/WSm9F0q2GVnwrXkAaK3uia9wd
        yacvNdGZuiw/PBcNZv8RvW69vg==
X-Google-Smtp-Source: AK7set9DTffFITUeObIldoYH99bvR7fanzNv9obiIvPU2KG2ZgBN3vkTKSyWZa/gE145bKkkX5/SZw==
X-Received: by 2002:a05:6402:4502:b0:4a2:b97:adc4 with SMTP id ez2-20020a056402450200b004a20b97adc4mr3204700edb.38.1675169929238;
        Tue, 31 Jan 2023 04:58:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id i11-20020a50870b000000b004a0f9d31d18sm7957666edb.71.2023.01.31.04.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 04:58:48 -0800 (PST)
Message-ID: <60af517c-e22d-780c-221c-4df41f1e7c5c@linaro.org>
Date:   Tue, 31 Jan 2023 14:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v12 13/14] drm/msm/disp/dpu: add PSR support for eDP
 interface in dpu driver
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-14-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675091494-13988-14-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 17:11, Vinod Polimera wrote:
> Enable PSR on eDP interface using drm self-refresh librabry.
> This patch uses a trigger from self-refresh library to enter/exit
> into PSR, when there are no updates from framework.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 ++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>   3 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f29a339..60e5984 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -21,6 +21,7 @@
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_self_refresh_helper.h>
>   
>   #include "dpu_kms.h"
>   #include "dpu_hw_lm.h"
> @@ -1021,6 +1022,9 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   
>   	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>   
> +	if (old_crtc_state->self_refresh_active)
> +		return;
> +

I have been looking at the crtc_needs_disable(). It explicitly mentions 
that 'We also need to run through the crtc_funcs->disable() function 
[..] if it's transitioning to self refresh mode...'. Don't we need to 
perform some cleanup here (like disabling the vblank irq handling, 
freeing the bandwidth, etc)?

>   	/* Disable/save vblank irq handling */
>   	drm_crtc_vblank_off(crtc);
>   
> @@ -1577,7 +1581,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   {
>   	struct drm_crtc *crtc = NULL;
>   	struct dpu_crtc *dpu_crtc = NULL;
> -	int i;
> +	int i, ret;
>   
>   	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
>   	if (!dpu_crtc)
> @@ -1614,6 +1618,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   	/* initialize event handling */
>   	spin_lock_init(&dpu_crtc->event_lock);
>   
> +	ret = drm_self_refresh_helper_init(crtc);
> +	if (ret) {
> +		DPU_ERROR("Failed to initialize %s with self-refresh helpers %d\n",
> +			crtc->name, ret);
> +		return ERR_PTR(ret);
> +	}
> +
>   	DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc->name);
>   	return crtc;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 01b7509..450abb1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -12,6 +12,7 @@
>   #include <linux/kthread.h>
>   #include <linux/seq_file.h>
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_probe_helper.h>
> @@ -1212,11 +1213,24 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>   					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_state = NULL;
>   	int i = 0;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
> +	crtc = drm_atomic_get_old_crtc_for_encoder(state, drm_enc);
> +	if (crtc)
> +		old_state = drm_atomic_get_old_crtc_state(state, crtc);
> +
> +	/*
> +	 * The encoder is already disabled if self refresh mode was set earlier,
> +	 * in the old_state for the corresponding crtc.
> +	 */
> +	if (old_state && old_state->self_refresh_active)
> +		return;
> +

Again the same question here, doesn't crtc_needs_disable() take care of 
this clause? I might be missing something in the PSR state transitions. 
Could you please add some explanation here?

>   	mutex_lock(&dpu_enc->enc_lock);
>   	dpu_enc->enabled = false;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a683bd9..681dd2e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -491,7 +491,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
>   		return;
>   	}
>   
> -	if (!crtc->state->active) {
> +	if (!drm_atomic_crtc_effectively_active(crtc->state)) {
>   		DPU_DEBUG("[crtc:%d] not active\n", crtc->base.id);
>   		return;
>   	}

-- 
With best wishes
Dmitry

