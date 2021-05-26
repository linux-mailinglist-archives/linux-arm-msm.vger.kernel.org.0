Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C207390D95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 02:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhEZA4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 20:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhEZA4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 20:56:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2109C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:55:03 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b12so33320938ljp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=++3NER/8q2jl+9nnQ5/5WI2wqMfqwPJ99Tc3glHslUM=;
        b=VjgkLIxrlysMYoMxfxguP6+fPz3+tzoyDxW+tLGKvM4Y65vuxmWclT+z1Zhn1P4d8f
         rvsA5BMANFVKhcv6feEHwSMpQfJDveH1s/tq0+02ODMg/HBhtF1pjOisvnbny+ZfpPHG
         MfcHNTl3KK4muf9yDEnyx4bUQJEN2UxB1iybLM/H84/EqypNBUy7lTrj+l5WcKuwP4xL
         V40H832nGd97tXYQ0qVGRGwMLqRzKv2pZhXzMGwWv8TAxbA5PXLWtC6PY7xBsHMkmEp/
         PatYxR9wUnL+okoP3w+ZY5pcayZR6e1Y6c/5bUKTT9tWvMlDogdW6S7N1v6x+Wi8WR1+
         Ygew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=++3NER/8q2jl+9nnQ5/5WI2wqMfqwPJ99Tc3glHslUM=;
        b=Ksvp9UxDY0O7vcVi8kc3o/DcoSQRmLmlAd8g+5sbipD94b85iqamqeX9gJ9RMFjDLs
         yQbL/jdYZwYR/zDjNMZ8Kclq/wFMr+2MPtIz9A7nWa6LdPVzmokFzM9/G8IV7rMWtBcd
         19DJUu7+ZpGNYUekkBwsDf+cH5FhzCnLso0YvaM8qanr3pUI2dme6AxUy7QfefrJS/Iu
         HoTbm35u5q/UjWpkpFWYW3eU70qA8i3cRCyOX3wzKcbHoryrhryBAOJ2/F4W0lp5lMNg
         U+LwaQ+yxrteZDq6/r69eYwKgOrzzKfu/dIOogkaSdnbpob1u5ow9IVWXHred7GEUHQI
         /kOw==
X-Gm-Message-State: AOAM532fudvmuDef+mPK3cw3ry6+hnNKvRdIJNs45llEb2ieb+2GJmKx
        Chf5eM/IgYPaEuV5pKVigEkl8A==
X-Google-Smtp-Source: ABdhPJzMJesdN5t9gO5cn8xDGUoBVDqumulGav19HFVyEoN4ZFEsOGLQ4WBt2mpUvAwcj87zidYCWw==
X-Received: by 2002:a2e:95cb:: with SMTP id y11mr214930ljh.461.1621990502032;
        Tue, 25 May 2021 17:55:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d15sm1873714lfa.137.2021.05.25.17.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 17:55:01 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: remove unneeded variable ret
To:     Bernard Zhao <bernard@vivo.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210407130654.3387-1-bernard@vivo.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <dcd91b6a-7115-5018-c75c-436f20f6a63c@linaro.org>
Date:   Wed, 26 May 2021 03:55:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210407130654.3387-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2021 16:06, Bernard Zhao wrote:
> This patch fix coccicheck warning:
> drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret". Return "0" on line 880
> Also remove unneeded function return value check.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da78c4a..3395b08155a6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -843,10 +843,8 @@ bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
>   	return ret == 1;
>   }
>   
> -static int dp_link_parse_vx_px(struct dp_link_private *link)
> +static void dp_link_parse_vx_px(struct dp_link_private *link)
>   {
> -	int ret = 0;
> -
>   	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
>   		drm_dp_get_adjust_request_voltage(link->link_status, 0),
>   		drm_dp_get_adjust_request_voltage(link->link_status, 1),
> @@ -876,8 +874,6 @@ static int dp_link_parse_vx_px(struct dp_link_private *link)
>   	DRM_DEBUG_DP("Requested: v_level = 0x%x, p_level = 0x%x\n",
>   			link->dp_link.phy_params.v_level,
>   			link->dp_link.phy_params.p_level);
> -
> -	return ret;
>   }
>   
>   /**
> @@ -891,8 +887,6 @@ static int dp_link_parse_vx_px(struct dp_link_private *link)
>   static int dp_link_process_phy_test_pattern_request(
>   		struct dp_link_private *link)
>   {
> -	int ret = 0;
> -
>   	if (!(link->request.test_requested & DP_TEST_LINK_PHY_TEST_PATTERN)) {
>   		DRM_DEBUG_DP("no phy test\n");
>   		return -EINVAL;
> @@ -918,12 +912,9 @@ static int dp_link_process_phy_test_pattern_request(
>   	link->dp_link.link_params.rate =
>   		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
>   
> -	ret = dp_link_parse_vx_px(link);
> -
> -	if (ret)
> -		DRM_ERROR("parse_vx_px failed. ret=%d\n", ret);
> +	dp_link_parse_vx_px(link);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
> 


-- 
With best wishes
Dmitry
