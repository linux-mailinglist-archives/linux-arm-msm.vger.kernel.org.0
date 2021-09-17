Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C53740FF50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 20:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242270AbhIQS0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 14:26:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33959 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344993AbhIQSZX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 14:25:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631903040; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lA9m8iW0h+GpB3q/tv02Ab4h8KK1vfBdEm/JgwArBvI=;
 b=HGfdLnI1wIZEDLKYLj8faaVWtYeZ1h7mVn02dM85Vi4Nb1FZ9Ye0SzzHy2pg5l9Jhvx6EhKn
 jOlXPJykcjA0utmX5O/6Ig+AKTN9Q2mmzJoL0PByXDOQUfqOQttja2105vr64C1QD7g27mEN
 IEjAuytntw9oY6LBhNEKyW8w+uM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6144dd2fc1b30e2f026663af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 18:23:43
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58860C4363B; Fri, 17 Sep 2021 18:23:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3A1AC43639;
        Fri, 17 Sep 2021 18:23:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Sep 2021 11:23:38 -0700
From:   abhinavk@codeaurora.org
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        airlied@linux.ie, daniel.vetter@ffwll.ch,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [RESEND PATCH v6 04/14] drm/msm/dpu: Replace
 definitions for dpu debug macros
In-Reply-To: <20210721175526.22020-5-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-5-sean@poorly.run>
Message-ID: <745692f677884badc0829193842967dd@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The debug messages shouldn't be logged as errors when debug categories
> are enabled. Use the drm logging helpers to do the right thing
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run
> #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..c33164d3944a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -31,27 +31,15 @@
>   * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
>   * @fmt: Pointer to format string
>   */
> -#define DPU_DEBUG(fmt, ...)                                            
>     \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
> 
>  /**
>   * DPU_DEBUG_DRIVER - macro for hardware driver logging
>   * @fmt: Pointer to format string
>   */
> -#define DPU_DEBUG_DRIVER(fmt, ...)                                     
>     \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
> -			DRM_ERROR(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> -
> -#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> +#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, 
> ##__VA_ARGS__)
> +
> +#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
> 
>  /**
>   * ktime_compare_safe - compare two ktime structures
