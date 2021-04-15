Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB543606D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 12:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbhDOKMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 06:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbhDOKMh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 06:12:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A76FC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 03:12:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x20so8030397lfu.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Itx3xIB4vBXowgO5rVjeZp8XNY2n0XOetykFhl9hWow=;
        b=L4fOI3m5jedVmkoFqF4OMT0LKDappFVqesZYHY7CyLNRuknzo5hrAxbWLpeGBofHFn
         Kgi0cDatOkL0X14/u+gkYo0Sh4vlxHKlBWQaxNeOJ+GXhl2tfO0H2GiMYt3fa4Kq5CNK
         KtMdewT7N/e18vas4p77Xz9KempXtugzcD2n3d+1GKgWMuikghC5X7qXiO2hndzROTkl
         AbyGXbKsJZfKp3DuECU0TkgNr9AarbWV2v3aY+Gu508bQ8OnJwnBNbY6zNs9V5vUnRKq
         lfBwkYiaA7oTAFACrnnz4TpJpz1Kc2GsRFtI1wFHdA4wVfQYX7USAonbG5wtxlSu96/z
         5Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Itx3xIB4vBXowgO5rVjeZp8XNY2n0XOetykFhl9hWow=;
        b=k6jbHePO1rio3kq2eFqYRtrnrzwqrtQXmjFlg4V5c39pI1oDXj55dyDq+5dg5U5hV+
         gyc5NlkXKAnyOaHAzylJFetUB/2ks/ZyxvNJCF06k8OLromxUeqBZi7cQwC0CF3cp2yq
         EkCmrG3C1mh0LjlwH870Rhpvz86VinsEyRQIIOhMZTVzpkTwqIHZIxLL3tTYVv3/NgZ3
         fg/oXt/YA3V5rHN6s5nWTGdnrs7U0yK9w/jOV2WODBksqkRcjOr8CgLOsZovOqcYnOZq
         XQMcZuyfIUoI+cYTsEVTlPaEMqzqDFKmN+pVZNxUQbJxSv8t6PLlvyNxQb9EEamne6vz
         rBfg==
X-Gm-Message-State: AOAM530Wt2ow55ETEGKixNLOMYVerOdwo9wWYbhLwcj+7tkYm6NdEykL
        Ks9MWMGEIwm7ELv+wcnSiG6OjA==
X-Google-Smtp-Source: ABdhPJyD6Rs7jiUdmupgDiq3XJMVdCt6DZ+cyVt1/xewJXMALCuiphmTOBBn8HXbou8s2wx72Ft2Cw==
X-Received: by 2002:a05:6512:3ba9:: with SMTP id g41mr2115337lfv.38.1618481532082;
        Thu, 15 Apr 2021 03:12:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c23sm623400lfc.300.2021.04.15.03.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 03:12:11 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Message-ID: <b752d929-7f8c-6396-85a3-6b32c77121ca@linaro.org>
Date:   Thu, 15 Apr 2021 13:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On 12/04/2021 03:01, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I wanted to ping/remind regarding this patch and regarding 
https://lore.kernel.org/linux-arm-msm/20210410011901.1735866-1-dmitry.baryshkov@linaro.org/

It would be great to get those two fixes in linux-next or early during 
5.14 cycle.

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>   	if (pixel_clk_provider)
>   		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
> 


-- 
With best wishes
Dmitry
