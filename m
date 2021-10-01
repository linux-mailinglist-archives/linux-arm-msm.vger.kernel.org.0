Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D1441F7B3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 00:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356299AbhJAWsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 18:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356360AbhJAWsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 18:48:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167D6C061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 15:45:55 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i25so44157343lfg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j+kPWhijK9ZE/26VUbCAEecJmq5SRMajLA/PCOWEcsE=;
        b=Bg5MG4XDDPuBh92Vk/tlS5dIVM7MtzTS0Ismt29VYAaBr+IFpXSm932DPSRRnvfdIt
         Nyx8Q2fiuKp+UI5YyOuqAJRvFg+LDUK3bdBvAvkIWD2o7XkIhzNaPHCWnsfmmP87Xxtm
         a/phJ1mWw8iRyPbyoBUiCPfQ2pIDi8SkbLnZaLQZt3cZ0ea0mqo0hl0IrxoDSQbiQPzm
         g9mPn14LMLU2RArV3CvPlxS87UJOsRw0gYaCMa2ZjaLzRYF/mCbLAb2qZ8jLpUjdaavC
         /W4OgTJEwQuWJD26fnYirpU4xszFu67Sbkzn1fB13ED04WQ5cQE9QDE5JltP23dS5SM5
         hatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j+kPWhijK9ZE/26VUbCAEecJmq5SRMajLA/PCOWEcsE=;
        b=Z/OPUHZ7mljxFY/I+GYHzE1laZ3ifB9mrlH0IBkk9ZsuUeuvDXNDn//wraQkQmnf9d
         +IJYdO2713BLseQcSnqbpNPE/zZwpNmkHJYkw6zGrXLgFovzbKE7X80aeFEkR2h1t/9j
         /N0wGM2Te31LK+09jdXxksymENmZoNTIcxVzzHKWl91l77BqDEli+IVSOXGzELwhM7TR
         aeD24eziDpGwmFbTbPpVz3nLseR1l1Ha7zckn+Z+E1XJ3mDBuQZSizNpSQ9OvGpgX7HN
         NUO+n5XfsPfgBawWqSXELsIo/fsY9vYcO98M8WslU0B6X4LkmIIZayWQpeNt7RLjrO4w
         UgpA==
X-Gm-Message-State: AOAM530fX3A1hfHG7/eCEmsCUAhlj1MLfvlMXrPBdOjEs7OAN1K5gee4
        So6tExO468jm24d2h/bdI1uGPg==
X-Google-Smtp-Source: ABdhPJzCU0y+2PqtP5/oarv1W4DPLeJhO+Y0HVBwtEqk8HTHDm58RH+SjkVFlxeTeBxkQqkbaYRGRA==
X-Received: by 2002:a05:6512:3d91:: with SMTP id k17mr585010lfv.430.1633128353444;
        Fri, 01 Oct 2021 15:45:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28sm868966lfo.47.2021.10.01.15.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 15:45:52 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/msm/dsi: Fix an error code in
 msm_dsi_modeset_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Archit Taneja <architt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211001123308.GF2283@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b5016410-4e26-cbc5-0794-db9482aa3a71@linaro.org>
Date:   Sat, 2 Oct 2021 01:45:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123308.GF2283@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2021 15:33, Dan Carpenter wrote:
> Return an error code if msm_dsi_manager_validate_current_config().
> Don't return success.
> 
> Fixes: 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual DSI mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 614dc7f26f2c..75ae3008b68f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -215,8 +215,10 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		goto fail;
>   	}
>   
> -	if (!msm_dsi_manager_validate_current_config(msm_dsi->id))
> +	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
> +		ret = -EINVAL;
>   		goto fail;
> +	}
>   
>   	msm_dsi->encoder = encoder;
>   
> 


-- 
With best wishes
Dmitry
