Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206D1421A48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 00:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbhJDWu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 18:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbhJDWu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 18:50:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA9DC061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 15:49:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g41so77899310lfv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 15:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8tGetNrXALTlS0gY47hdtBEGpeMB4ZyPkCRNhwkRLtc=;
        b=vabATdZ84U2C/CkW9T7Ar3+yZgL63YcHmEBJBib8OV+HYPjdjLp3UakcWr/vMcIh9h
         xM10nmP/VgA7vSlM/y2UA3zcaXQxprsPyPbV477XMdge8jLj7Fn2Dnbzef6BBtc+pGdD
         L47RD8GQtqi/uReHNxSWfGy6ivC7zFOty1oCLBa1a/1iIfVl32IBUJmYCg0ej1lbMszr
         J4DmoXfK+/rg1CF/eEMDQ6Qa50ie/rcHjrH31/BBHkchTOdy8GvM1YI3WyDTfMsiYVAd
         7UDQOM9QcddcojhQ/g0lVlom3NyL7f1EYxpWJFlPfmbSme2CHLhBxQBSjXP1cyq3nui9
         GutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8tGetNrXALTlS0gY47hdtBEGpeMB4ZyPkCRNhwkRLtc=;
        b=rXGOTxO5Z9XLs3sBivqN93npHK0L+abgwz/6dQNJEr5gCGF6LiGqUcZlFQjG4UHKEw
         b4ik2mtYA+TuN8FFntS63pwTChWGNGDSeViyHgRTBfudyFDV1pSmUgAJNVq6FvBeZ+xi
         jE8PaXhMzTvEGnxweWq5hEaftCQH4M2tJm2MWfHxuxOg+qZZy5fh4lFwadLyvrjF02MA
         9W7tYvhxIwIT2LtIvaHNS8wzGzKMIOShbuVP9FcThcCUKyNEHfhlDUIKqWvfp0P/bME3
         7m2cPAhHuDWM4s3pJD5DluPgTkS3LKpChLQX2xmCFrEmsFsOSU+0e7srFwz5nN+cKrDU
         ZZhA==
X-Gm-Message-State: AOAM531NxIlD9bW8QmasHfejW/gLHX5q2tolB0fw42XbO58CVL9MehN0
        J4tbO/CMY3K9/0g33sOUPnooFadMlkFE+w==
X-Google-Smtp-Source: ABdhPJy+286dU+0v9d3W1xDxI2x6RfznBbPFqXMzp+FrGqO9VLlpm/Vz968b85aCsYJVKtYmxpaUtg==
X-Received: by 2002:a05:6512:1581:: with SMTP id bp1mr846072lfb.552.1633387747442;
        Mon, 04 Oct 2021 15:49:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b26sm1782221ljo.123.2021.10.04.15.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 15:49:07 -0700 (PDT)
Subject: Re: [PATCH v3 09/14] drm/msm/dpu: Remove useless checks in
 dpu_encoder
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-10-sean@poorly.run>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b87960ad-20ab-a51a-97ca-9ca081b67ccc@linaro.org>
Date:   Tue, 5 Oct 2021 01:49:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-10-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> A couple more useless checks to remove in dpu_encoder.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-10-sean@poorly.run #v2

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0e9d3fa1544b..984f8a59cb73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1153,10 +1153,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	struct msm_drm_private *priv;
>   	struct drm_display_mode *cur_mode = NULL;
>   
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
>   	mutex_lock(&dpu_enc->enc_lock);
> @@ -1203,14 +1199,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	struct msm_drm_private *priv;
>   	int i = 0;
>   
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	} else if (!drm_enc->dev) {
> -		DPU_ERROR("invalid dev\n");
> -		return;
> -	}
> -
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
> 


-- 
With best wishes
Dmitry
