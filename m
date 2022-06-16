Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2968354DCD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358862AbiFPI1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiFPI1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:27:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7D321834
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:27:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id h36so1097529lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w1e49/RT1G/0F4I3kIBtOTXnF5clM6kkXg++Aurqqkc=;
        b=xYFGCRnII/oj+iFkmWC+35FH0emewDvo3IfGjaRBCA8h1Kbp/yJS8XhdOis3lycOwV
         H8OUj6IV7zbwrGMrinOvVXmm9IaddDHoJPBP1jFpGjSKnHP9OeX2bDHLyjq+tlcvgo9K
         Edj3uVAMuVH3GIJMA3w4Vp2Nxmzi1X/ah+e+k96IPlC1RMT23/4Xf44ign+k3dBOT7lT
         m58Xxt+Cg79LBtII6cd80aLtA0b3IROUkFJ7lJ9OV0ca86waw5RsXSbk5x16vN1khPbI
         PO0Hckd0A1mFFgHeEIo0aNHOenX4pi6uqis5W4+uBoLeSEc7q1ruqnmRXZ7B+MREjFQ4
         BWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w1e49/RT1G/0F4I3kIBtOTXnF5clM6kkXg++Aurqqkc=;
        b=wo1qSE7mYWH7H2wmre1wymi3ETzcC9ixFoCQlh6PTqzlS+axtc6Jl8yGgqJHlxW5m/
         HTmqhyoDZKvL55EZuqDT4VKB5fNXJf1OQOqChnBZdQRgKS5UrofzgEvIjIhVUhRTXrdo
         Tu5ZnitRgBuf5FKYbXC6gRCcPG+PU0QafttKPAFGaJ4owgDm/9zZ7vrpi+1o4D0DHs10
         M4+qXuqQGjCPagsV8iMlvYPQU+Ach+71/YI13QCFMNq8rbMe/CjSwP07oaraxZ4Ksft7
         6RSi/hbqp2IFY8zi9cKOns5uthSGVI6501gzMnMG0P/uMR69ZITRe4vCXmet8c4lmgYR
         cjGw==
X-Gm-Message-State: AJIora/V87HNzwWZcEjfHPnzCbW/cW8YLtXj5sA56u+INc5IMe/trH3N
        F7qyLUtZtgHR1LzJIjFbjEFR1g==
X-Google-Smtp-Source: AGRyM1srcz6dxbDCtAE+GlTF+QUFod2PGyuzr4Vek1bEdN/TaKeEuW6wtSBOlLrFUu2TZD1Bl/xO5A==
X-Received: by 2002:a05:6512:32c1:b0:479:3452:28d5 with SMTP id f1-20020a05651232c100b00479345228d5mr2021882lfg.492.1655368061433;
        Thu, 16 Jun 2022 01:27:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7-20020a198c07000000b0047255d211e9sm142498lfd.280.2022.06.16.01.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 01:27:40 -0700 (PDT)
Message-ID: <991331d8-ddda-a816-d279-fdaed90b43c1@linaro.org>
Date:   Thu, 16 Jun 2022 11:27:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm: Fix fence rollover issue
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20220615162435.3011793-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220615162435.3011793-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2022 19:24, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> And while we are at it, let's start the fence counter close to the
> rollover point so that if issues slip in, they are more obvious.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Should it also have

Fixes: fde5de6cb461 ("drm/msm: move fence code to it's own file")

Or maybe

Fixes: 5f3aee4ceb5b ("drm/msm: Handle fence rollover")

Otherwise:

Reviewed: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/msm_fence.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index 3df255402a33..a35a6746c7cd 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -28,6 +28,14 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>   	fctx->fenceptr = fenceptr;
>   	spin_lock_init(&fctx->spinlock);
>   
> +	/*
> +	 * Start out close to the 32b fence rollover point, so we can
> +	 * catch bugs with fence comparisons.
> +	 */
> +	fctx->last_fence = 0xffffff00;
> +	fctx->completed_fence = fctx->last_fence;
> +	*fctx->fenceptr = fctx->last_fence;

This looks like a debugging hack. But probably it's fine to have it, as 
it wouldn't cause any side effects.

> +
>   	return fctx;
>   }
>   
> @@ -46,11 +54,12 @@ bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence)
>   		(int32_t)(*fctx->fenceptr - fence) >= 0;
>   }
>   
> -/* called from workqueue */
> +/* called from irq handler */
>   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>   {
>   	spin_lock(&fctx->spinlock);
> -	fctx->completed_fence = max(fence, fctx->completed_fence);
> +	if (fence_after(fence, fctx->completed_fence))
> +		fctx->completed_fence = fence;
>   	spin_unlock(&fctx->spinlock);
>   }
>   


-- 
With best wishes
Dmitry
