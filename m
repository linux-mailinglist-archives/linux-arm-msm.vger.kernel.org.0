Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725DD699A52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 17:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjBPQl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 11:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjBPQlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 11:41:52 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5FA4ECE5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 08:41:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y25so3485791lfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMnX1HaH2NBclXeVG8VG3N1zQtjFM/4YnRJFVyQLDD8=;
        b=jQke9uCozYVKmQfyOWRZ2twqTstxxeFR0evUWdL8IvoBWvRzH5hKAZNdD1m+wmG/KX
         zCOW68zPjxJ0xC5Tj/wgOO0uiYVncKpbNUk3ScdM2XdxHaXAsDd0nynpbWlxOnNQGvvj
         sWcp0uoZJspqIjA1MI72jOTpCQXovGUJEtkmDrfOQi8cJIghONGDe+f00OL7/q0xGP4i
         W6bYz4w9BMv45fNzUa+0Gtz90kf+ugaXKasDcycnG7798XhIEksfGGoUGoMKuh+cywsg
         qJrOQ4gnj54NIC4KAy0fDdgEqtZhSRpRlyQ0RQmVG//sGDrJN71xDzv8p/2bAuaI6eEI
         aTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMnX1HaH2NBclXeVG8VG3N1zQtjFM/4YnRJFVyQLDD8=;
        b=RM/StJxJhFjmo1UobSuoNYzCN/jcDN6Pg3rsY3zNK3+Zp1qIEvS5ZAzs5OIldbKZQB
         owrCcVJnwjvC+yAxs0Tsa/YLlsHvNB/9362Z8d+tiHyeFQEsCZG/Jm4dsgxVotlDO1hK
         7232urXN+mE5HVwVJl7vexyftX8r+J6EVH/99x+tUAP4nnc0Q3iyyZYY1GWaTRUjkqCg
         L249B1AUcMcsa1vMVo9FYKULNmh50+MnMcP/FoXfTmZ3dUn8RQIGVVhUqCXmLW96OoPE
         32K+6UxfvYPZ3x3uC3I50y9uCpbhUazGjmhwG+EhnheY68f9chGs3O6QckgBVfOcP+LX
         wL4A==
X-Gm-Message-State: AO0yUKUEHVK0nf4V6cVI97E5E7C0JyzpfNRdiWZVE9SJmZu6B+LPV7jQ
        vq3j4VmIX19E1uv+guf1zz+p6A==
X-Google-Smtp-Source: AK7set/LQizZ5sM7tq/Gdq4hfmltV90P0uwRAz1nBb7Qf4+ZzkfNgvnGWpuPedwMWF+lEpXpUgzkKg==
X-Received: by 2002:a19:ac42:0:b0:4a4:68b9:19f6 with SMTP id r2-20020a19ac42000000b004a468b919f6mr1907767lfc.30.1676565709087;
        Thu, 16 Feb 2023 08:41:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l3-20020a19c203000000b004ceb053c3ebsm349490lfc.179.2023.02.16.08.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 08:41:48 -0800 (PST)
Message-ID: <8b14864b-89fa-ef02-f025-00d7713a0bc7@linaro.org>
Date:   Thu, 16 Feb 2023 18:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/msm: Fix potential invalid ptr free
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        open list <linux-kernel@vger.kernel.org>
References: <20230215235048.1166484-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230215235048.1166484-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/02/2023 01:50, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The error path cleanup expects that chain and syncobj are either NULL or
> valid pointers.  But post_deps was not allocated with __GFP_ZERO.
> 
> Fixes: ab723b7a992a ("drm/msm: Add syncobj support.")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This makes me want to rewrite the ab723b7a992a ("drm/msm: Add syncobj 
support.") in the usual explicit-error-path way. WDYT?

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 6503220e5a4b..e4d13540300e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -640,8 +640,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>   	int ret = 0;
>   	uint32_t i, j;
>   
> -	post_deps = kmalloc_array(nr_syncobjs, sizeof(*post_deps),
> -	                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> +	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
> +			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
>   	if (!post_deps)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -656,7 +656,6 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>   		}
>   
>   		post_deps[i].point = syncobj_desc.point;
> -		post_deps[i].chain = NULL;
>   
>   		if (syncobj_desc.flags) {
>   			ret = -EINVAL;

-- 
With best wishes
Dmitry

