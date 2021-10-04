Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D9B421A4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 00:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbhJDWx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 18:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbhJDWx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 18:53:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A499C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 15:52:07 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b20so78644987lfv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 15:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n2rNk2E+G/cxsFo+UVYGO/JUt2OiyOp2K9xAxANCqjQ=;
        b=KrMsvt7t5H7u6NfeViKVXg60ElsAvGwJ16KoqqIOO1Fr0/P57LEHgtH6WJIeLeTwwy
         IkeS1sToENhS+vK+6X1mpNg5hysaKFZvQAfGiz7QJuuOmuRqDyUJJ7vzuHwxUNGMAg6I
         M0+4U3mMa/UT69+qidXFOCCP6rxwdMuRKObSKWRp5szkOYgkjP8LdepxAHKqw1T98esB
         3ZNkwCaXtPC/oSQ5YVEO3Toz9TyMme+mdw/h66Q/21+2bf2GKLNcx62hFUqgEC/xia5o
         aVWyMLEdEBVL1vhze/Pj/KhvFP6510lDA417X54FzpgJV4RDG1Kp/I6z5bTJJeKMfUJf
         93PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n2rNk2E+G/cxsFo+UVYGO/JUt2OiyOp2K9xAxANCqjQ=;
        b=DAyQoXdWA5xoGwDpZktHBTc4/HGp7v7UYPqXKi2LsieIGzv84yPOh8dGJFDJH/evIO
         ptppIoZEilWb7zXebSYaq25689Lm7sgPYKMJEKdxS+DVAYi3dyJajVRlIK9eyEFhqIUf
         nOTuK79ITvYRaGnSFP/SUL1N57YkJUjgVJNvC6he020Eh0h3Ml8S2KpEUcWQgcca+SsL
         jBOiKCf2CwizPKPHLeHlpCbG7Tc0XLo5AfNHYdupxmxsL5CIHCdkQ1PW8OMXWeuwb81q
         +qRq15ZyfFNGQ20/+1/NPRcmzaUBOOHIHLGxqU5p9i8MEz2b4Dbu1jNPUTjhTdNwD3VB
         9njQ==
X-Gm-Message-State: AOAM531uLK3NxaJmJO4BA75XMyf2OArooDcscvn5k5lQ+zjoFA4bEao1
        GCpfIO2i7yc0w9vSj4lO1zlYPJdXGR1V3A==
X-Google-Smtp-Source: ABdhPJwvmulNoSrhYFJe7UiFFtlQKNs+NMIumA+F1Bn1eH9NtiSi71RhvJxaiyDBCkrkfzdRouJOnA==
X-Received: by 2002:a2e:155d:: with SMTP id 29mr19318202ljv.522.1633387925321;
        Mon, 04 Oct 2021 15:52:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b26sm1779127lji.128.2021.10.04.15.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 15:52:04 -0700 (PDT)
Subject: Re: [PATCH v3 10/14] drm/msm/dpu: Remove encoder->enable() hack
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-11-sean@poorly.run>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d4fe5bdd-8b79-8b83-c1a7-a873863ad925@linaro.org>
Date:   Tue, 5 Oct 2021 01:52:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-11-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> encoder->commit() was being misused because there were some global
> resources which needed to be tweaked in encoder->enable() which were not
> accessible in dpu_encoder.c. That is no longer true and the redirect
> serves no purpose any longer. So remove the indirection.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-11-sean@poorly.run #v2

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  5 +----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ---------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ----
>   4 files changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 984f8a59cb73..ddc542a0d41f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2122,11 +2122,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   	.mode_set = dpu_encoder_virt_mode_set,
>   	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_kms_encoder_enable,
> +	.enable = dpu_encoder_virt_enable,
>   	.atomic_check = dpu_encoder_virt_atomic_check,
> -
> -	/* This is called by dpu_kms_encoder_enable */
> -	.commit = dpu_encoder_virt_enable,
>   };
>   
>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index fb0d9f781c66..4a0b55d145ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -381,28 +381,6 @@ static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>   	}
>   }
>   
> -/*
> - * Override the encoder enable since we need to setup the inline rotator and do
> - * some crtc magic before enabling any bridge that might be present.
> - */
> -void dpu_kms_encoder_enable(struct drm_encoder *encoder)
> -{
> -	const struct drm_encoder_helper_funcs *funcs = encoder->helper_private;
> -	struct drm_device *dev = encoder->dev;
> -	struct drm_crtc *crtc;
> -
> -	/* Forward this enable call to the commit hook */
> -	if (funcs && funcs->commit)
> -		funcs->commit(encoder);
> -
> -	drm_for_each_crtc(crtc, dev) {
> -		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
> -			continue;
> -
> -		trace_dpu_kms_enc_enable(DRMID(crtc));
> -	}
> -}
> -
>   static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
>   {
>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..f1ebb60dacab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -248,8 +248,6 @@ void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
>   int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>   void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>   
> -void dpu_kms_encoder_enable(struct drm_encoder *encoder);
> -
>   /**
>    * dpu_kms_get_clk_rate() - get the clock rate
>    * @dpu_kms:  pointer to dpu_kms structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 37bba57675a8..54d74341e690 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -266,10 +266,6 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_complete_commit,
>   	TP_PROTO(uint32_t drm_id),
>   	TP_ARGS(drm_id)
>   );
> -DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_enc_enable,
> -	TP_PROTO(uint32_t drm_id),
> -	TP_ARGS(drm_id)
> -);
>   DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_commit,
>   	TP_PROTO(uint32_t drm_id),
>   	TP_ARGS(drm_id)
> 


-- 
With best wishes
Dmitry
