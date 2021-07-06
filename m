Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1893BDFB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 01:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhGFXT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 19:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhGFXT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 19:19:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DC3C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 16:17:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y42so707982lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 16:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VLzE7VV6mscc+vgGAg4a2KqSEev6fTFF/MgknYbkxfM=;
        b=CWXJpXRsEpBSy9DnkUMp7UsTDzFZxJ2jA1AbWvWiIkcZDB0rusqpLMfQenTnYWg32/
         U700PWQ03TOFHDS2hIQchtaUB+bdsDTLBUEb4VbOtdybtaAkKYG6EYVz7HbKuKomw20c
         wTLYfftXTv/YEr1Kazoe8GsJkXz3KZ1VlLd89aqLSFidD3NYfjv4CiM4y8JQ7M7dPzdS
         2ycxaQYQ92Z2YmLQ5TDuvfhzC5QE0s8W1UHTP835pzwuYLBDqVpcV8/xKU1xYUmXEiv4
         YGcHSl4SfE/cWJZIQEV9LBLVUFHhk920EsiBtjW2+xZ/MuwZ70AA+7q7HJViEzCXbsPV
         AvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VLzE7VV6mscc+vgGAg4a2KqSEev6fTFF/MgknYbkxfM=;
        b=hk9O4w2ykUMef+oomGrzMnfrMt9eGDhOVRjoub+6efxGASylFNY0bT1/+XpRdPb0P+
         dB7Ke6fpW2l3EQsOx13zVXt9A+SimtQy43fhSDQ2hfwTUqHGY/OJkWgvUh8vPr9sujEr
         dyoIEsLtIXOey8cr1FCo0yCuUM23QWhoxXSZG1j28edkPpaXJjGF2RPXFpzQ5DWl+U10
         /Jl2OUgf4o3gaKz4ntbU4nrF9qna6IzITcwX9mlBzMulJEWBWJbL3yFkVxCSwkrrhz+z
         gECvxJSCzL0SgN/tx6UCnRXubcmETcq0IzEixeBI8/s0JlQSDxjp2KXxb4wYVW/cowSM
         WzBg==
X-Gm-Message-State: AOAM531UTd91uugOQY2qXocWw6paBVowkfI6H11itc5rey4DA3rpjpWm
        2nzRO6ylS9aUMH595O3MWJWes4PyTcld4Q==
X-Google-Smtp-Source: ABdhPJzG/Yb3HEzwkvS1k6JudrRwM/zab/4paZXjguAjlBYAleJZkyTBoCg8Xo1ARIVE7974Od3veQ==
X-Received: by 2002:a05:6512:348f:: with SMTP id v15mr14130797lfr.533.1625613435203;
        Tue, 06 Jul 2021 16:17:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v5sm325752lfr.299.2021.07.06.16.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 16:17:14 -0700 (PDT)
Subject: Re: [PATCH v2] drm/msm/dsi: do not use uninitialized kms
To:     David Heidelberg <david@ixit.cz>,
        Sean Paul <seanpaul@chromium.org>,
        robdclark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
References: <20210705233639.335951-1-david@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4df2c14e-5e59-0faa-48f8-5425f2c26a8f@linaro.org>
Date:   Wed, 7 Jul 2021 02:17:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705233639.335951-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2021 02:36, David Heidelberg wrote:
> Without this patch boot ends at NULL ptr exception at msm_dsi_manager_setup_encoder
> on devices like Nexus 7 with MDP4 version 4.4.
> 
> Fixes: 03436e3ec69c ("drm/msm/dsi: Move setup_encoder to modeset_init")
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Being not an expert in the mdp4 sources, I suspect that the fix is not 
quite correct. I'd suggest setting priv->kms in the mdp4_kms_init() 
before calling modeset_init().

> ---
> 
> v2: typo in Fixes commit reference
> 
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 4ebfedc4a9ac..8114612b34b0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -230,7 +230,7 @@ void msm_dsi_manager_setup_encoder(int id)
>   	struct msm_kms *kms = priv->kms;
>   	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
>   
> -	if (encoder && kms->funcs->set_encoder_mode)
> +	if (encoder && kms && kms->funcs->set_encoder_mode)
>   		kms->funcs->set_encoder_mode(kms, encoder,
>   					     dsi_mgr_is_cmd_mode(msm_dsi));
>   }
> 


-- 
With best wishes
Dmitry
