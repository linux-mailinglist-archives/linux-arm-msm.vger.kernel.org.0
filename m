Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD241F116
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhJAPWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355003AbhJAPWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:22:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580EBC06177C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 08:20:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z24so40210630lfu.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a42zKH2Tz1xdsd82BNyM3/JzMce4gdtbfSOE4DnvM4I=;
        b=gDvlAQfOEYKry6coVGHJcy7BwGm89sWKXZ10vwTmBlanwHmjpzrbSWRyesPq7+unE+
         4e62mIX3xbLm+SvW2iXv8SXV9qXyfmFo0LBN11KC0bApcC3faYsj02W9yAxZKKZ7122Z
         ixBcnqsN3KNraq8bpfs18/Gie9xSbXbxyZ+pU+64XGRdqntqmWnlVDrjMxl9FunijN0K
         K6OWwFzP6ie948y/GBQo9DfbqrLCZOtlrGTNoV6MVMj8Bqbyws0WhmAvBaL5PkyYIrXP
         zNxQyxJbuZ3MIFTTZA7TqXnTGyRXVt2VdO0GqvmRMc1/WTfdonQ2wjrRskWiAz+9L2MU
         vpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a42zKH2Tz1xdsd82BNyM3/JzMce4gdtbfSOE4DnvM4I=;
        b=C1/m/C86V/vTyx2mkPGpeFAfUce3zXEICb0zX4TGBy70LK6A2V9slPnOXg+G//9HDx
         wSvjtUIqGw57Pj4UEAgvH+TF4+ePitFGlkYxy1Q1Fn0tQg3QcP2uk7zmr9Pgto2HO/7Q
         HNv8TYlYkd16EdFLQ1KM1ldyv2PqowsTvBtm7kFxUTLgnxUMcmXkWkWrp/W8JSL3w+Y/
         PS8nMrwo2T2nTf3hK5/3Au1jlacJZ0JmRX5erkOcHHY5ndtlWrZX5jRtcNo7F4ohuFTB
         FesvNBmtkUNpdGEqwOYmtLh7014XRkWVtnBGH9nZ0ZW46gdqcRE3bgDWm/o9lj518GyS
         4zcA==
X-Gm-Message-State: AOAM531hIx3YHU3c6mwp/MQCVyYfJOZyONl7LmENYbMg7wvopCLEJYwd
        197U2v/ZdoWeOmf7AVIGcL43qEL0+w4ppt/1
X-Google-Smtp-Source: ABdhPJz5R8MadhnX8c6ibjK+02JQ4SKsSiXQURM7ZiOQIwjYP/d6zBf1bDX35CC2Hl/Bk+LtwFrhtA==
X-Received: by 2002:a05:651c:1790:: with SMTP id bn16mr12325475ljb.457.1633101652679;
        Fri, 01 Oct 2021 08:20:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j16sm212083lfk.257.2021.10.01.08.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 08:20:52 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: Fix some reference counted resource leaks
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, abhinavk@codeaurora.org, hali@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <f15bc57648a00e7c99f943903468a04639d50596.1628241097.git.christophe.jaillet@wanadoo.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <9ea0857b-fca5-3011-6ebb-3ff6173ac037@linaro.org>
Date:   Fri, 1 Oct 2021 18:20:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f15bc57648a00e7c99f943903468a04639d50596.1628241097.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/08/2021 12:15, Christophe JAILLET wrote:
> 'of_find_device_by_node()' takes a reference that must be released when
> not needed anymore.
> This is expected to be done in 'dsi_destroy()'.
> 
> However, there are 2 issues in 'dsi_get_phy()'.
> 
> First, if 'of_find_device_by_node()' succeeds but 'platform_get_drvdata()'
> returns NULL, 'msm_dsi->phy_dev' will still be NULL, and the reference
> won't be released in 'dsi_destroy()'.
> 
> Secondly, as 'of_find_device_by_node()' already takes a reference, there is
> no need for an additional 'get_device()'.
> 
> Move the assignment to 'msm_dsi->phy_dev' a few lines above and remove the
> unneeded 'get_device()' to solve both issues.
> 
> Fixes: ec31abf6684e ("drm/msm/dsi: Separate PHY to another platform device")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Review carefully, management of reference counted resources is sometimes
> tricky.
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 75afc12a7b25..29d11f1cb79b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -26,8 +26,10 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   	}
>   
>   	phy_pdev = of_find_device_by_node(phy_node);
> -	if (phy_pdev)
> +	if (phy_pdev) {
>   		msm_dsi->phy = platform_get_drvdata(phy_pdev);
> +		msm_dsi->phy_dev = &phy_pdev->dev;
> +	}
>   
>   	of_node_put(phy_node);
>   
> @@ -36,8 +38,6 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   		return -EPROBE_DEFER;
>   	}
>   
> -	msm_dsi->phy_dev = get_device(&phy_pdev->dev);
> -
>   	return 0;
>   }
>   
> 


-- 
With best wishes
Dmitry
