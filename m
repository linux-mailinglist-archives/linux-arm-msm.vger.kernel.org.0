Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD80B434D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 16:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhJTOJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 10:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhJTOJg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 10:09:36 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764DBC061749
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:07:22 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id a13so3154340qkg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jgtlFeXdT3Hd6RC5M2SWvFMAen1H/83nOl5HVUgBtrI=;
        b=sc9i/fjetuLqOZM4ClryvZVwCtDOz6iEdlZj9diZQqB857ABVBaeLMBJBaf7uCp7il
         /xxNXijVWNSXUGG+x6hRHx/tAUvvWQXn2NJAWx4WYKAm5CRG+13RxBg343Wj9wbGGc+Y
         EZ5/E25rViC54giVVgDwTx9RILI1trr9/Ax+H+VLq+5siNhUc9JyYFeaqvzzrHghV/Uz
         Oq0L1Zc9hiKPqIPyqz44QEGFEGJo68Po1nm4I6bRYObW6QR8AjYw6WPBpzCdNQQCdV8I
         6Q2NsfIFph8frUQX8P/QDFy/aIaqctgcsF2Zb1YMoTpHE5P0y9IvzZ3KSLHbZpwhfp/9
         U2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jgtlFeXdT3Hd6RC5M2SWvFMAen1H/83nOl5HVUgBtrI=;
        b=Wur9CdLjSIpTRtvRfxrTi4MwBHlbbBLdcRvKJrNYx+Rf8uAmZI9JCfZwfFRFAWidf8
         q8HoFa7XQbZs6DSERSVv2E6nGUz4scCaLEt18ujoqTG/yvlCkvQ8zaiS+t/n4nJpckmE
         SuF8WsUGcVoy93I3CHKOCEtwDMPnSA4CxHCU2fHsmOENiaddjffiUxJ3GzZ04E9eZGnT
         UtEV4w7BXUbstvIIAaLCF/H9Xrmu6vVduJpLwmyhzepHXTmnYFWdbNBeYarRBcd6vYyk
         cN1pRi2ylr+Ix10e6Ca6BVNWLWoXLGT5vnlVc6Loxo8u94MtOjsaefGVEevIFosylBw7
         XRFA==
X-Gm-Message-State: AOAM5324i6C/piNykYZTycIWBDYFzsSFOSrJCONF7eaI418/AgP8jFY6
        JrJPoRhI28dtoo+0bMk4S9jqeg==
X-Google-Smtp-Source: ABdhPJyD1JzrgLozhl3rrIg7tRZDzkqL8hV4xjFIPqgoQogHBmFHJBrQ0i0KIJH9YuYozvlacl1IYg==
X-Received: by 2002:a37:aac8:: with SMTP id t191mr244715qke.52.1634738841624;
        Wed, 20 Oct 2021 07:07:21 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id bq41sm1053610qkb.26.2021.10.20.07.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 07:07:21 -0700 (PDT)
Subject: Re: [PATCH v4 15/20] crypto: qce: Add new compatibles for qce crypto
 driver
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-16-bhupesh.sharma@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <6aecc0aa-6219-d440-0075-39935aec0c7e@linaro.org>
Date:   Wed, 20 Oct 2021 10:07:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-16-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/21 6:55 AM, Bhupesh Sharma wrote:
> Since we decided to use soc specific compatibles for describing
> the qce crypto IP nodes in the device-trees, adapt the driver
> now to handle the same.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 033c7278aa5d..2ab0b97d718c 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -298,8 +298,8 @@ static int qce_crypto_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id qce_crypto_of_match[] = {
> -	{ .compatible = "qcom,crypto-v5.1", },
Hi Bhupesh,

I think we should keep the qcom,crypto-v5.1 here for backward 
compatibility. Since v5.4 was added only recently it might be okay to 
remove it.

-- 
Warm Regards
Thara (She/Her/Hers)


> -	{ .compatible = "qcom,crypto-v5.4", },
> +	{ .compatible = "qcom,ipq6018-qce", },
> +	{ .compatible = "qcom,sdm845-qce", },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
> 


