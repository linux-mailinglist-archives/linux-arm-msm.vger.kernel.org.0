Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1118468884
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Dec 2021 01:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhLEAIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Dec 2021 19:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhLEAIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Dec 2021 19:08:20 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F04C0613F8
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Dec 2021 16:04:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m27so15737364lfj.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Dec 2021 16:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QHHT00VDKbwiouuYvA1Na4+bMK2mwHXPvhFSQ6VIIAQ=;
        b=SwRQubzrVU07x/VktGwMithEDwR0OtcUO9ZRFHzLW29oKvJBZZrIj3BQgW4J1XqokR
         rp2LCfezWTiENH43r57iXD7DQ5kMd/og8uEKihoNgjX9GfRuBouLkTgq5DNIASWEVZ5l
         sah5gLr05evGtVIBNyJwZn3dmNmHwTD9luKmqnv7wSFkPyEnIc8XJ36qmg+DPYe6wEnQ
         iH72RIuchoJnPUgGR6qo2f/CrIKy3SsJv7o69ZvmNc5qakkyvpo7/6s0buqpjodOXWhb
         fnx13/BsnQtUKnwKlUaXH8m6oM3j8KTnEOnJTULiFm2WXKCS/AutviM7TzmrK5HXtVyO
         ciDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QHHT00VDKbwiouuYvA1Na4+bMK2mwHXPvhFSQ6VIIAQ=;
        b=5qyRFAAfNR+prqKnjLrjRX21cR1c51bV4t75eelrJ56onaxhDgO+mpyBJTIBQbvmqV
         OcOGOySXJkT9Fb5Byi/pymV4e+S0G0oErOzO4IjoaefNBaT63M426Z611lcBx/non6mw
         Nk4K5lqWF/6t+h5pwsRUKPLAglJzvMkNn9pbEno9hZ3eS1XkYYAKG/wxnX0v4D8tT5EA
         sajErBSkGVU+V72Ypbhp8hLjU+0lopkoTYT09L/RQVMTxL7Tcw8Kmje8pdsixZLoU4t1
         iYIBlkVw+EHHjqXFkmewCo14KZkCE6++czyA/EheZmyJFFtwPK+4sUt1ms7MYwkk5Ic9
         Pa6w==
X-Gm-Message-State: AOAM532eUXSK8kFj8CLQEva6zdG3aGX2HFS0XEgWTifCmaOgHElhLy4l
        0hIhMPLU8rKAFuwL9ZXhW85qfg==
X-Google-Smtp-Source: ABdhPJyf0aWmyyXdQuK9tcW9hG+AZg5FYjzqR1EZHhkn86w8R8hWq3kojn/veWvo4kuYm0XtzbmClg==
X-Received: by 2002:a05:6512:3f0c:: with SMTP id y12mr18196895lfa.579.1638662692680;
        Sat, 04 Dec 2021 16:04:52 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6sm910322lff.125.2021.12.04.16.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 16:04:52 -0800 (PST)
Message-ID: <9ef59b63-fb05-5a4b-4327-479eb48cf618@linaro.org>
Date:   Sun, 5 Dec 2021 03:04:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/dp: Add "qcom,sc7280-dp" to support display port.
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/12/2021 01:02, Kuogee Hsieh wrote:
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d44f18b..91582d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -146,6 +146,7 @@ static const struct msm_dp_config sc7280_dp_cfg = {
>   static const struct of_device_id dp_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> +	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
>   	{}
>   };
>   
> 


-- 
With best wishes
Dmitry
