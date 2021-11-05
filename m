Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA90E446A62
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 22:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhKEVMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 17:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhKEVMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 17:12:53 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13592C061205
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 14:10:13 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id v2so8077276qve.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YFJucjWETudf8plExmrMsJYwyJAweHfa6D+W6U/u+yI=;
        b=LM0TAm5yGfnuWBJ0hZCA/KTpEnKNovqvCv+OJT3trxH9OtJx2vlcQd82f2AVrNTyXI
         GX2/0AVmESJqYxNMjjE/X8A6vJoUSg3LnxLswq0B4xnNRT2d8qfvDhpOgohuSxzTcgMR
         mkNYK1zDZdWuHlrcIrvtxhAaheTedFpkhMGTec0wR7qf9gGnadc94R8TCTic/Q9AzLWM
         +XfF6mzr6/whryqDJT4sJ9nM/r8XJyX1X2lEg3NQPm8xmyK/+Q4NRPGcXyoTwRZ5JWsv
         pvYZGgzPq1QSzEKGkgMBZXjVLGY90+qfO0HegFvvYz7RcYv1XbQcgsaBLMxEv8VCcqLs
         le6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YFJucjWETudf8plExmrMsJYwyJAweHfa6D+W6U/u+yI=;
        b=oYQWEvm3BY7AblQ5hP/IP097xkOoHMusnXY4KWcTrWpFbWzPfw+6hQEWBBy/RT7zyf
         5IB4ovYXeGaC925RjRdCw/lApjvKo1x5sAasdWjvPIjdetN4//JAjoBxl0HHUYQwyowq
         kBIHCRJ8HkMunLC12UHDojY5nZ0kx+vgWzg8AT4hVGop0Aisxr/bRAIoe5/MyjujBl44
         S1IfDUJepZB5B8cPhk9VjMmDX3or2+DPV3o/T7wu6ptHFTXQ/BtlMwxXA/pqH0f1TiBg
         Vc0g6OmszGuNgxS0fwmJzF4xkPjO0pAeNVpXkethlU2iw1Mp6UrDFuV1mDPtGuYpVHTi
         A9Uw==
X-Gm-Message-State: AOAM531DQp/8W19GDU5Sosn7Ve0RBUwN8X25oC0dgGbcZ11YFCTClJEG
        6rZhG1QorHB0XfURWvPFbHYaSMybgHopZg==
X-Google-Smtp-Source: ABdhPJzu0ui9oW3Cx+SpaLlLXMaNl0/mCVmpBmEGViDt2jV6NwWaTVr7gdJ52TIyiqPGGYBtjgsZWw==
X-Received: by 2002:a05:6214:3012:: with SMTP id ke18mr1576398qvb.63.1636146611706;
        Fri, 05 Nov 2021 14:10:11 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id v17sm6096607qkl.123.2021.11.05.14.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:10:11 -0700 (PDT)
Subject: Re: [PATCH] crypto: qce: fix uaf on qce_ahash_register_one
To:     Chengfeng Ye <cyeaa@connect.ust.hk>, herbert@gondor.apana.org.au,
        davem@davemloft.net, svarbanov@mm-sol.com
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20211104133831.20049-1-cyeaa@connect.ust.hk>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <58122e53-b85e-5bc9-4eca-396623e62fae@linaro.org>
Date:   Fri, 5 Nov 2021 17:10:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211104133831.20049-1-cyeaa@connect.ust.hk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/4/21 9:38 AM, Chengfeng Ye wrote:
> Pointer base points to sub field of tmpl, it
> is dereferenced after tmpl is freed. Fix
> this by accessing base before free tmpl.
> 
> Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")
> Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>

> ---
>   drivers/crypto/qce/sha.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
> index 8e6fcf2c21cc..59159f5e64e5 100644
> --- a/drivers/crypto/qce/sha.c
> +++ b/drivers/crypto/qce/sha.c
> @@ -498,8 +498,8 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
>   
>   	ret = crypto_register_ahash(alg);
>   	if (ret) {
> -		kfree(tmpl);
>   		dev_err(qce->dev, "%s registration failed\n", base->cra_name);
> +		kfree(tmpl);
>   		return ret;
>   	}
>   
> 

-- 
Warm Regards
Thara (She/Her/Hers)
