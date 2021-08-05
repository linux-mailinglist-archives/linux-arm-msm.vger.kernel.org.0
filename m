Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64A33E1637
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 16:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240361AbhHEOAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 10:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238069AbhHEOAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 10:00:37 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6E7C061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 07:00:22 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c24so7993617lfi.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5meyUU5c75KlfpjDtjU0FZ5byhyUrjIowVbBuxl5gt8=;
        b=exwaS8glI5xqkQg7fftcfVSt0yKa5ROwNh4MsE4dv4suv9aVtEEmxfyL+3QPhV++UO
         F/TqJGkDSCqRHGxQiBd1r6AAcsvwuPPiZJrNMyU0E/fJawKNG6ZOLxt4al3Ion4+XrXc
         pSFhsC/F4Hwjm6n01l0155RK2RnITgIKiVqPqlS0TW09QQApBAtRQyOV/CmdulbVi3Ki
         0hg3R8oUP9Ax5gQCKPhOYvPnZLWm9K8ZyIDaAXTsaiUmYArWWZyKZNus4F4vc4ki5sMF
         7DskWiTIZzsbIVWugFUgBDh1H51/Qj9TwN3iFHW3vF6pVlFqfO77WlpdPXWQicoyi8wk
         88ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5meyUU5c75KlfpjDtjU0FZ5byhyUrjIowVbBuxl5gt8=;
        b=P2SnOz3cMfOOh8W4hMuCFOHTDyHkSmYu2AF4p8zf0LS3/+bGHoX19qwMKWf08UDmk5
         PaCNCSwRyYZv1rJgUmq7nOiWLyauiHDKJct+I2y432KYtk7WPW/ZtZaOVhVmrP0WX7Y9
         Er9RE6EFH7NeX1sHJqw1EmwGW1EAYuGxWkBp0oPu3O4IOuxV+htgKiIoHcgRVPf4/+Pk
         q98GaTwnWZcPFngvEYb+xCY5tMk5+xDLJjUvoW1n/TF+qlclfvEYUED5sA+HoiyHAQIz
         afR4ZIIuhL/AXkB9W+aiCXnDM9ocMMjfRuRk7hoaq/ArfNEhJsy7dZnrycYzl302nl9t
         r4/Q==
X-Gm-Message-State: AOAM53224dCj78tSbIDknwWTBPz5a5PSeex66CYnlDn1WUpLFEioFrgs
        spEheAEnRdcdOqOCRrb43vJtYg==
X-Google-Smtp-Source: ABdhPJwcFb9ISI0KyAfqPA/9+TTAYxcorPwRB7ZppyJCzqw58qaB0x19GC8SIvHlp3gsTBbdGxLDrQ==
X-Received: by 2002:a05:6512:2186:: with SMTP id b6mr3736739lft.490.1628172021033;
        Thu, 05 Aug 2021 07:00:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c13sm523002lfv.133.2021.08.05.07.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 07:00:20 -0700 (PDT)
Subject: Re: [RESEND PATCH v6 04/14] drm/msm/dpu: Replace definitions for dpu
 debug macros
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        ppaalanen@gmail.com, maarten.lankhorst@linux.intel.com,
        tzimmermann@suse.de, airlied@linux.ie, daniel.vetter@ffwll.ch
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-5-sean@poorly.run>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a73f8e7e-35a4-259f-74da-175600be7770@linaro.org>
Date:   Thu, 5 Aug 2021 17:00:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721175526.22020-5-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/2021 20:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The debug messages shouldn't be logged as errors when debug categories
> are enabled. Use the drm logging helpers to do the right thing
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run #v5

The patch seems correct, but I'd propose another approach.
There is just 1 user of DPU_DEBUG_DRIVER and 29 users of DPU_DEBUG. So 
we might instead replace them with DRM_DEBUG_* calls and drop the 
DPU_DEBUG/DPU_DEBUG_DRIVER altogether. DPU_ERROR is used in ~190 places, 
so it will be more intrusive, but still doable.

> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..c33164d3944a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -31,27 +31,15 @@
>    * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
>    * @fmt: Pointer to format string
>    */
> -#define DPU_DEBUG(fmt, ...)                                                \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
>   
>   /**
>    * DPU_DEBUG_DRIVER - macro for hardware driver logging
>    * @fmt: Pointer to format string
>    */
> -#define DPU_DEBUG_DRIVER(fmt, ...)                                         \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
> -			DRM_ERROR(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> -
> -#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> +#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
> +
> +#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
>   
>   /**
>    * ktime_compare_safe - compare two ktime structures
> 


-- 
With best wishes
Dmitry
