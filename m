Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9585349AB81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 06:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391432AbiAYFGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 00:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S250376AbiAYEQs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 23:16:48 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E149C036BF2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 18:47:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id u6so22254587lfm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 18:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WSgw+Bai9akIbsNX8qE1iDGkZDqwpur2u3wwvUxZaos=;
        b=oh0ZGUYdJjwb/WULwnJIpti/MED7HLmMZVHOk9IKD0rr8P1tHXUBsy0GnBK6ZwnYIh
         tJCowFsUgGAVBBYLsw4BFJPAXHTlcoHxc6pkhKCwUUiyLK18hTNYa8EkrIiEUCK30f7+
         e9B86H6+E5jHBxNituWhdgYulf+E1Pmn2NoWGyUzDcZqU09ii/UfH4aWOc4QYjXOagRL
         nIKlAMTUw4RY6LRQmrof23eAD/aSAyNlQuygygGFJf+hwTpZPljRaWoVquCojr6YlrO8
         3vjCDFb1uGUKdCHRnXgGSUZMUGealQRlTR0nNvT522GnnVDptIvCHG88NDdprW0RNcVK
         mqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WSgw+Bai9akIbsNX8qE1iDGkZDqwpur2u3wwvUxZaos=;
        b=evbc5ZILcg8QF823/yjoQU6N4aKhUlORGlmTFImUYVxVr2z4zI08emOSRQIZYiCL6K
         zFmWIX0LIZb9Eup/B4g9jwvszVYQuLD9I3mY9q9oBCEIj5yOncZMs5l3dtlY5VSvO08O
         kt4vjnuvdcPq6TA+Ow2e4BFcd6TYLsqE2Nd8FE/Xa+IRk+v9UV93SaMrJdWSer47tXFx
         mtZ1jQa1DhqxcmV7LGT395ueHVCGM8uvc48yHRaYr9ljk4seUscZ2k3de3fbzRUp9aZJ
         3U3fVj/kqR5QEqMFAWuqGsSb9oee31x/dAFzTh/g2QssWwzUDQA0271uheyOyD3Diq3I
         /jYg==
X-Gm-Message-State: AOAM5313tkBhbB3+CCsh9/F8kCuKK5P3FNU2rSkFC7FFR51p5JhZfY4F
        hhDjXWkzOq00jfWOgSG0p7AsFQ==
X-Google-Smtp-Source: ABdhPJw/HdOl+VUK3mcD6a1INueBqbK59eArLJlh5fV2q6DjMOQxtjwEObG+XzPUSBGydBKpE5XwKw==
X-Received: by 2002:a19:640c:: with SMTP id y12mr5522574lfb.245.1643078861686;
        Mon, 24 Jan 2022 18:47:41 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u1sm1065629lfc.98.2022.01.24.18.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 18:47:40 -0800 (PST)
Message-ID: <4d9fa340-19fd-ee0f-0244-15ded5e66c67@linaro.org>
Date:   Tue, 25 Jan 2022 05:47:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm/a6xx: Add missing suspend_count increment
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Danylo Piliaiev <dpiliaiev@igalia.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220113163215.215367-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220113163215.215367-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2022 19:32, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Fixes: 3ab1c5cc3939 ("drm/msm: Add param for userspace to query suspend count")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 51b83776951b..17cfad6424db 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1560,6 +1560,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   		for (i = 0; i < gpu->nr_rings; i++)
>   			a6xx_gpu->shadow[i] = 0;
>   
> +	gpu->suspend_count++;
> +
>   	return 0;
>   }
>   


-- 
With best wishes
Dmitry
