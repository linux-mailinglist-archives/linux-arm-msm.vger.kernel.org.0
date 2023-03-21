Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6276C356C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 16:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbjCUPRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 11:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjCUPRj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 11:17:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54BA3A4D7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 08:17:30 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 20so8736879lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679411848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XuN8ioBm9gED1jU+nlNm3booZamb6HksWvoqUTWd1g=;
        b=c4gxjGtla+JNjRGkDzpJTdkTRVA6lR2ifbRYG3M4hp8vN8IZyjFHxibGGeo6/tMNmQ
         7bJE3Dm6yE7h4W24X+p6mcJWxxy1Im2NZQ+ishRd45Hl4HY2JeItLVYG0+pz+7RP4827
         XgbgVC0tOL9BnefuWstAyqHmy7RIvPcc0YZoagMEDVMqJKMFcKAA0kBfGKkJwm5tg+UJ
         nAkGoxn4kwhMAMc0LDE7AfoLnLVtBY4E5YikSRr9s3XkZ5OUckDzGdY5cpO5v3AMNYW6
         XATgQ3pMEGc+4Eg96s7hdQy7COOyRHK1+uMCx4+NN+Hv+6RLjMzZgJAhi8t3hefQhYPn
         ba0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679411848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XuN8ioBm9gED1jU+nlNm3booZamb6HksWvoqUTWd1g=;
        b=ngjVJ4TK3374ErNgfqcr9IXzVOM7an5JUxihe9HK2nSHeozI1JkEgOXGXZ2/P4xO86
         0RKRpL8Q9zIfI52sJcIA1SvkYnSCcIJGB8rQq5s09Oj8+uhACqFYAu/GbSRFJ6u/H1Kr
         oYD6kFq0MGtEPqE5KEtKliV38JjyW64lIShkf+jP2s51Z6bkthQjtUUHt5b2JDPTIONk
         cM0OTjsjSKuyQpnaySORfKgHZORrWAzP/WX6knET/Nx3JojANRn7/GLLBiHJZstyfhcc
         NYJbEgKD37kjMq1RaKCREtp5TdUaHUdt+yD8nWsTsLUtCwiTG9QmvgZhxzqSOiNdRRCc
         DuhQ==
X-Gm-Message-State: AO0yUKVW9oN2Ev7DSnNpXCZAfHX5iza1JljvGTj5V6PI24H2Y8CqBlki
        2Jnixx3LW62ZpVtJ3XOovmfsuA==
X-Google-Smtp-Source: AK7set+wO4LorH7uYnHfYL0IdUkOOFwxIV3C4LbBFNE9iVka078oBidQSR39tP5A80cThqr2YQnN4Q==
X-Received: by 2002:a2e:7e0f:0:b0:295:9265:b36a with SMTP id z15-20020a2e7e0f000000b002959265b36amr960881ljc.12.1679411848056;
        Tue, 21 Mar 2023 08:17:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e21-20020a2e8ed5000000b002934ea0def9sm2222690ljl.140.2023.03.21.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:17:27 -0700 (PDT)
Message-ID: <3025b62f-fbaa-cda3-8ab4-73e86b942450@linaro.org>
Date:   Tue, 21 Mar 2023 17:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/10] drm/msm: fix NULL-deref on irq uninstall
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-5-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/03/2023 12:07, Johan Hovold wrote:
> In case of early initialisation errors and on platforms that do not use
> the DPU controller, the deinitilisation code can be called with the kms
> pointer set to NULL.
> 
> Fixes: f026e431cf86 ("drm/msm: Convert to Linux IRQ interfaces")
> Cc: stable@vger.kernel.org	# 5.14
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 17a59d73fe01..2f2bcdb671d2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -251,9 +251,11 @@ static int msm_drm_uninit(struct device *dev)
>   		drm_bridge_remove(priv->bridges[i]);
>   	priv->num_bridges = 0;
>   
> -	pm_runtime_get_sync(dev);
> -	msm_irq_uninstall(ddev);
> -	pm_runtime_put_sync(dev);
> +	if (kms) {
> +		pm_runtime_get_sync(dev);
> +		msm_irq_uninstall(ddev);
> +		pm_runtime_put_sync(dev);
> +	}
>   
>   	if (kms && kms->funcs)
>   		kms->funcs->destroy(kms);

-- 
With best wishes
Dmitry

