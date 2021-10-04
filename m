Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602EA421A50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 00:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236774AbhJDWyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 18:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbhJDWyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 18:54:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F39C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 15:52:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m3so77127461lfu.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pDk/FVPOlxwV0pour3j7eAFM0fv3H6VSdZ22j28Ul7U=;
        b=LIv4rNlTW8FZGeFN9OkcGsftb922JtWUGHeoNCbgBi6EOkzrphtlaL86X0Hx7bs80t
         p7VXvOlZVNc7F5AQNYcglEw20Ah86By1tMy+7LoL0pQ7DRafzu+tN99UGZ2PlKx0IOIK
         aPWXsf7+wTAFck25sXUSAL58cQVuU6rzuOc9KXLu/HwXWpthKx9f8pyq9GQ6PMwqhDRr
         UjsFpM7bZYRaH/8eKjibPnwG+lfKVEgnAl1nxyUoN6IqWK5Ml/aRS7ZCq6rnVyXOnPTY
         cle+wYnhZFt7nWOkdiccozA7HSZ9Suk6A4+aEVP3fGjfMDOQevNReKtFdSy2h6CnMjNV
         xsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pDk/FVPOlxwV0pour3j7eAFM0fv3H6VSdZ22j28Ul7U=;
        b=ehqPxQBIFiiA2yBoGmSB1Q8EaQC62tmqKH1N2P1h3ZrmdaSWYzyrA8o4di/9Z2tLNl
         0npX57dfrRryt+fkQMSCJS0K6Tlx/2x/S2yFMq40ctlYWpkjIcGpRsQ8SeSO0LEkOd91
         hI8Se8KLyaoFTv5E3bHhxd79y6ZxgWg+70JyAYDqDiRp7+TuxUSSe8QwNDwuKiN5NtPw
         TyDDtitCwiuVwnpC7yC5v4mISs0dYdv4CUrkFo1Rsac9jj5nsuB0folvSixQxXD2muMM
         O41JEFhsqi0ULNp+Z+em5YFqShZJKhBANKyL9rdJIfXka6aRYEAiroEvmpCEVGXVbsnx
         ltag==
X-Gm-Message-State: AOAM5313/J1FdB+n0/19vwhfOh2+SVHA5KE2Uy5FTfJz6T2hS+VbnN+1
        0avllVjXFW6DJwE1EVlHBi3faqwqr0M+sA==
X-Google-Smtp-Source: ABdhPJwHXTIoF58UEmE9I595+cUvc0Pa9iUt0YlUP6A5/oqTKG230Mc7tliM7eddZqoG3qUtMqgpUw==
X-Received: by 2002:a05:651c:10a6:: with SMTP id k6mr7148355ljn.325.1633387949735;
        Mon, 04 Oct 2021 15:52:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s29sm1886275ljd.54.2021.10.04.15.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 15:52:29 -0700 (PDT)
Subject: Re: [PATCH v3 11/14] drm/msm/dp: Re-order dp_audio_put in
 deinit_sub_modules
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-12-sean@poorly.run>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <39d559a6-d656-7904-7f1c-ac891a386a7a@linaro.org>
Date:   Tue, 5 Oct 2021 01:52:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-12-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Audio is initialized last, it should be de-initialized first to match
> the order in dp_init_sub_modules().
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-12-sean@poorly.run #v2

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Changes in v2:
> -None
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fbe4c2cd52a3..19946024e235 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -714,9 +714,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
>   {
>   	dp_debug_put(dp->debug);
> +	dp_audio_put(dp->audio);
>   	dp_panel_put(dp->panel);
>   	dp_aux_put(dp->aux);
> -	dp_audio_put(dp->audio);
>   }
>   
>   static int dp_init_sub_modules(struct dp_display_private *dp)
> 


-- 
With best wishes
Dmitry
