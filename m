Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB4B400553
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 20:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350619AbhICSww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 14:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350605AbhICSww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 14:52:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CC4C061757
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 11:51:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id g14so291962ljk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CGgzXCdE/Vq7B9miSyLOddv3Rnpk5fkhdhUAv/F6bFU=;
        b=j6uHwa3CYVqqxebmAZUpVozSQIY4vCnHYonuiFq2WdOpzYxZC4qv790QDk3DHG0O09
         7Hfu72FNXkNpUQI2bYtiHlhXp9w9Wv0M0brfzW+v2ifGhnO8lb3zjUF9a+n5vbYyePR0
         AVlxUwU/cJcTPe/aFsl+R2q5Nh19hTmNlUqV3d5mM1mrjv4fuLz68sd9LnDz+0BpTZOJ
         0/P0abPEeCsZZEG3/Qm0KCtcmXdneV4B5JCjpPVnZWTHZ8PGhcDkxCAJGCMHc9ZwB1ey
         te2M6vADtboCIrDx3C+2y9uEIYO4juBO+JmcibGxGmZmPJZSUebJJcI/trIXew0h/EzO
         T0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CGgzXCdE/Vq7B9miSyLOddv3Rnpk5fkhdhUAv/F6bFU=;
        b=SgVk99z2BxmVn+c/XwbIaceXCRxmzl5Q+NjwjErgyUwDiXl7GZRz/4xh0X+0N5pRPr
         WFiAvdeyhwi2ITnyZkZWckWuPVJVnlCufbmCGcX9iHJAJ4NdaqFIS0hmxrLFBlJALjyz
         CHK2R0D6gnNOXiL9m4v2cUMSfGd+vMy/3Z3luiVrjG5lyOgLG3+NkLrFeFmJRlKFRbpq
         HcWljQ0o2IOKLXBsVxjf918L+jBcxGpAap+bjEZ2YinabMXnlK/fMxiB9VrBJ4IIUOlI
         6Nn8VGY5m2ek6sNuKnZkMlZTKGKhYvkXPV/oIbPqsIiPWGGEXHcAGIZl2ne5CUuiwWTg
         xfSQ==
X-Gm-Message-State: AOAM532CwE5rXqybt3xOD6n0ulK1C0wztFVzbRkQMhhMY6mfHG8/uSRB
        Bns8NXlal6yiajdarDg3zq1pAQ==
X-Google-Smtp-Source: ABdhPJyrp1FHP6A/jWM2UEHJjZAjv8wE5xkA68qW9HBXTbA6YbMhGtQ4qIeBH1MvoLAQijDEs8Gbcg==
X-Received: by 2002:a2e:83d0:: with SMTP id s16mr322899ljh.328.1630695108904;
        Fri, 03 Sep 2021 11:51:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y1sm22335lfb.297.2021.09.03.11.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 11:51:48 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: remove unneeded variable
To:     cgel.zte@gmail.com, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        lyude@redhat.com, airlied@redhat.com,
        laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
        treding@nvidia.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <65f56c2b-591a-16c8-7f3a-41695b1147b3@linaro.org>
Date:   Fri, 3 Sep 2021 21:51:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831115127.18236-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/08/2021 14:51, cgel.zte@gmail.com wrote:
> From: Chi Minghao <chi.minghao@zte.com.cn>
> 
> Fix the following coccicheck REVIEW:
> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Glancing on msm/edp, as it was never supported by the in-kernel dts I 
wonder: maybe we should drop it completely? If the need arises the 
removal can be reverted anytime.

Does anybody hacking 8084/8074/8974 support has eDP port access?

> ---
>   drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..3610e26e62fa 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl *ctrl)
>   int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>   		struct drm_connector *connector, struct edid **edid)
>   {
> -	int ret = 0;
> -
>   	mutex_lock(&ctrl->dev_mutex);
>   
>   	if (ctrl->edid) {
> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>   	}
>   unlock_ret:
>   	mutex_unlock(&ctrl->dev_mutex);
> -	return ret;
> +	return 0;
>   }
>   
>   int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
> 


-- 
With best wishes
Dmitry
