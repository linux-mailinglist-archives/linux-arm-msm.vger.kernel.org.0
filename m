Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80ABB446A66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 22:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhKEVOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 17:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhKEVOq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 17:14:46 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BDEC061205
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 14:12:06 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id bq14so9955627qkb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E63rFcABRFafy7FYzxz7iS49IsPyTowk4qVbpdWjfQw=;
        b=EOBIa1aZzIWrZsSnRKO2Y2n4rBeO1VRY9xAopIoS7KtRFmVP1JLerEKABFZaA6TP3i
         dNb0+z3E81/8g6cY0kUnZtRC/ppRCI8f8ydTevXYm9rlvXmEgosz+zwT7OfllS/lbwoj
         q4GBd9DlQEPBDGOqqCeNw7xR7rGLeH4mE4av/ut1VAg6V4+XZdk+w0y5KrKGeekEJIzj
         uAuRws4NBYX3N3Na0d4QWjOhl4cxRLwdpG+l6ZPYgwh3pxPudmkWUkgqp/h9dGtSHfXJ
         SduWkGODG203Y6u9jRTZszmqg925sR51Z0jEgLBF3jgQvGy78AByMxvcps+Zuer/C4Nb
         RnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E63rFcABRFafy7FYzxz7iS49IsPyTowk4qVbpdWjfQw=;
        b=VoZJOKYj0cTLY0wVOM9t4wJh67/R4+2ItfOKUOKTBmhmzclUAsNdOP+wugu9lBwXPs
         JLPWwv6JYnup0giD+V6LNjC8QhHSWf7SyFHrQHEf96YXUHTe04If6my8GukfOnDpjSeQ
         /HGQkGVpDTdn48XBoPPPuiFEM+m4CxYhsnFbcUUv9O7qdrX9KP+5HvxzNpkM1305dbd6
         dcMQBsJNDUkHovr1IWZ65Pr3+T1CjVvCrKWV2ECS9ILxe7fmyX1wmcn7Fczy9A4yjeVg
         Ue0Ys400s/nqm2wHiOBFOI6myNh03H0a4c7reYLdKeLljoTwXesFcDDgMPM/gBbiNtkL
         WBqw==
X-Gm-Message-State: AOAM530FP+NOU8sUfosHSJvlK5v9L0KXShhX0q8Di8/cTK9hzzwVb6xq
        te8OwF2rt/U8Wy7Pxpk+KImjEDFRZ9geIg==
X-Google-Smtp-Source: ABdhPJwB5ojt8u4YPwOut4pV362BuCfMS+WpbyXqmWaXmfj8HaB90DX8AcfEKFB7vKsEfTCX/uyzew==
X-Received: by 2002:a05:620a:bca:: with SMTP id s10mr47942153qki.416.1636146725249;
        Fri, 05 Nov 2021 14:12:05 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id g19sm6764888qtg.78.2021.11.05.14.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:12:04 -0700 (PDT)
Subject: Re: [PATCH] crypto: qce: fix uaf on qce_skcipher_register_one
To:     Chengfeng Ye <cyeaa@connect.ust.hk>, herbert@gondor.apana.org.au,
        davem@davemloft.net, svarbanov@mm-sol.com
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20211104134642.20638-1-cyeaa@connect.ust.hk>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <7a158429-6eed-bbcb-f4d0-a6db8ba40d58@linaro.org>
Date:   Fri, 5 Nov 2021 17:12:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211104134642.20638-1-cyeaa@connect.ust.hk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/4/21 9:46 AM, Chengfeng Ye wrote:
> Pointer alg points to sub field of tmpl, it
> is dereferenced after tmpl is freed. Fix
> this by accessing alg before free tmpl.
> 
> Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")
> Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>

> ---
>   drivers/crypto/qce/skcipher.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
> index 8ff10928f581..3d27cd5210ef 100644
> --- a/drivers/crypto/qce/skcipher.c
> +++ b/drivers/crypto/qce/skcipher.c
> @@ -484,8 +484,8 @@ static int qce_skcipher_register_one(const struct qce_skcipher_def *def,
>   
>   	ret = crypto_register_skcipher(alg);
>   	if (ret) {
> -		kfree(tmpl);
>   		dev_err(qce->dev, "%s registration failed\n", alg->base.cra_name);
> +		kfree(tmpl);
>   		return ret;
>   	}
>   
> 

-- 
Warm Regards
Thara (She/Her/Hers)
