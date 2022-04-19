Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9503E507257
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 17:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354143AbiDSP74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 11:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354136AbiDSP7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 11:59:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA2323BC4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:57:12 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t25so30173933lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aBBlrcuINY/huqI+pmNpt7ezjRhcp+EsZeDz0RlBbYA=;
        b=oYSRwbUAXncHSazO9/um5GURByFyEv/d1wSyWc52WIGTl0Dn2fBv7EVe8HLgBQaop2
         q6XNg7gZCRjdwhctLljfU9EYI4JWF+aT2nXZ7JUtsuoqr1ldsayYtbNq56JtkDP+uHhs
         EVISorbf2Qb+HvhQlrkODKLDY9lirkhtgzJ/Xp9UwuUAGHYsX3P8i3LoMKg1jBinFkGc
         8HpiDB+f+HYE+kRpEVCBQ5xYc8vGQWEVWZ3OwLaKUsKNSxOqcOQU93sfMiGB5Tj652i/
         OfdAjRhzNoYxolGuewaXMjdRf8rgOo8zH/3YFgHzOnlP6v0Sq3248bwvXIKypJcU/bSv
         YUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aBBlrcuINY/huqI+pmNpt7ezjRhcp+EsZeDz0RlBbYA=;
        b=3iHbxxvwyLaG90wmO3C7q55mfRsE1g4x2iVArDg8qPIyXOtagRjJo+Rp67kcU0T56N
         ShvmOtgn2JM38KRhXAAJIPC2hAcowRLcddyx4hxIXhC0DfEGXnUnK3dFPzY8WbLh5VbO
         Ust2NirdjV1F7TmkImYD4ZIHpt32y68GHgAzRXANMnJ9aRwIr76HoO4hdxcGDwdjO/t8
         uzF3VNJU6zWp8K+/YXMpnjRHyVGr3jhKX71s9+A3Nu+RYrWM51U0SLBwJS+LjbCxMkwO
         0eMz3tAYBr9x0sXtJtW+C46UtrjRIGwmoNxTfjLvb5203XHokW6nFKPs8CSZf08ugn6l
         KB4w==
X-Gm-Message-State: AOAM5328yc8/dVouBn6gDmw3FKd0Dpe4wsFM1N1h+RqqdRvIe/fpjIFn
        6NmPDQBUXTlSRtdzSa9391gH/A==
X-Google-Smtp-Source: ABdhPJxIyRpDkdE3DsvHCugAEECr9Cihw3eu2sWWZa6oOoYWQV5BWYcP0qZa3q08lMbeYZwFMdbP3Q==
X-Received: by 2002:ac2:4306:0:b0:46b:c41c:1478 with SMTP id l6-20020ac24306000000b0046bc41c1478mr11760488lfh.559.1650383830827;
        Tue, 19 Apr 2022 08:57:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f20-20020a056512229400b0044a6ac1af69sm1546934lfu.181.2022.04.19.08.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 08:57:10 -0700 (PDT)
Message-ID: <aadad18c-5a55-ae30-6158-f6c584c59fae@linaro.org>
Date:   Tue, 19 Apr 2022 18:57:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/mdp5: Eliminate useless code
Content-Language: en-GB
To:     Haowen Bai <baihaowen@meizu.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1650348980-19050-1-git-send-email-baihaowen@meizu.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650348980-19050-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 09:16, Haowen Bai wrote:
> Since mdp5_state is initialized twice at the same time, so
> we make code simple and easy to understand by delete one.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 428f88b786f9..406c34e9f3f8 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -386,8 +386,6 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
>   	if (!crtc_state->active)
>   		return -EINVAL;
>   
> -	mdp5_state = to_mdp5_plane_state(new_plane_state);
> -
>   	/* don't use fast path if we don't have a hwpipe allocated yet */
>   	if (!mdp5_state->hwpipe)
>   		return -EINVAL;


-- 
With best wishes
Dmitry
