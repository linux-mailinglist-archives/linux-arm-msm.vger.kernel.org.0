Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11AAE51AD1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355848AbiEDSov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbiEDSot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:44:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696876462
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 11:41:12 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i10so3814445lfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wTxln7YGVkX89i8PG0IKXfsso9aaC9QMWGmO6EX/EGY=;
        b=z2Ctxr3w9cDEGS/IXiaRNEtZDn6Wv0POATksyAG9keUZE2UBpjRpqxqEhe03gIVezk
         JUHIQzyf/0MFa26gN3hi0g8FHd/HHXCynEgpy2M5H7LEO8cPdG9LbSNWy4iMxvJh/joQ
         KVsH9tDJmcqntkqGTL3cxSgFiPZgi+CX0jvzztvuwLE5KOCWpXjvHU8Nm3OXF7d/+Kop
         MaDt4RjNKWP6xsVrGhiEed3Zu7Y1eH3v+cMbJ04VzT7yPGJHlsXkTiyp1XYyofqvPaQi
         QbrsqXxwYv8AvPL0L/DqQxBoG7tz9RBWjz0w9SJu5p2yT+8+8vehbDyH1X46CuUQ+MW9
         mCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wTxln7YGVkX89i8PG0IKXfsso9aaC9QMWGmO6EX/EGY=;
        b=6GW7in7ib5a6w6D0mIVCRpqVsbm5rSg3GE1GXWLEBpT4T/3JLfanUoawvio/0151MT
         8Xdc969IeyC6JK24dN39YHt8SEeKmbUqvQTT23ESyKZB2w4dlvhvT/QCVwdptBgoa+t4
         Q6cJaIu64N5a2ETBhf5LFGpf7dyHrgvNICwkTyNJHNUoMads1eUhICcvUe/+rsQ8Bjrf
         ltGID3QynstVAtIctPRC+ffz8H8MthOLypugAvV7oBfDzGOKyvo5zLTlE9PpYRD6Mozd
         x/Hd3sfGPF4CSvoDcUCaySsVdtvTp0l8RUnCQUxiHzYqoHZWa5vRmvr3i7Fv9b7tZSCL
         SrMQ==
X-Gm-Message-State: AOAM5301E7qJJClZ9bppaYhT2HL6Gm1sDJdAnpoiZXWOtrq1qXRDuECy
        IqEEugcyPZk/KiTpTYc0Ad9NGQ==
X-Google-Smtp-Source: ABdhPJy4zg1hpUl4Auyu5EEfhi6Mx+a0yiiys0cRdUGvJh5KnPLpnHF/RaEZ9+x6pGoF15y0uGxIGA==
X-Received: by 2002:a05:6512:683:b0:473:a110:e52 with SMTP id t3-20020a056512068300b00473a1100e52mr8290893lfe.412.1651689670755;
        Wed, 04 May 2022 11:41:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15-20020ac25fef000000b0047255d2115esm1274090lfg.141.2022.05.04.11.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 11:41:10 -0700 (PDT)
Message-ID: <aa898db3-c52f-61d5-6a55-0d8b836343fb@linaro.org>
Date:   Wed, 4 May 2022 21:41:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm: Limit command submission when no IOMMU
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20220502172908.3569799-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502172908.3569799-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2022 20:29, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Running the GPU without an IOMMU is not really a supported (or sane)
> configuration.  Yet it can be useful during SoC bringup (ie. if the
> iommu driver doesn't work yet).
> 
> Lets limit it to users who already have /dev/mem access, to avoid the
> chance that a user accidentially configures kernel without IOMMU
> support.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 23b68bc945f6..9cd8c8708990 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -734,6 +734,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	if (args->pad)
>   		return -EINVAL;
>   
> +	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
> +		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
> +		return -EPERM;
> +	}
> +
>   	/* for now, we just have 3d pipe.. eventually this would need to
>   	 * be more clever to dispatch to appropriate gpu module:
>   	 */


-- 
With best wishes
Dmitry
