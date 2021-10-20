Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96709434D2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 16:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhJTOOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 10:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhJTOOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 10:14:10 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F247C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:11:56 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id b12so3114825qtq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x7JOzkLp3qJQ5ZEG3Wvg8nto1+QE37HnHtRsZbydM6A=;
        b=keol+gj5+qeTZu7psqLrfHytYbYF9Njy0f1C2oSux4ZVQa3fJggX2xMmvZcZCrOnzc
         CGQU5fMG+V+CmoXPEcUUb+lQIEJ4c6INHctBT5mvtWiaBFg+E2XRHhYWKxaM355n1uI/
         iDwz+FJm9X4PHN5d6ffrvfV42N4MBDB6hhuCOjas27HSXDXCizS3SypOs36+dUP8BmG2
         O3z7Nfr6wxYBF9thGB91/o/m/ATC6eYbX+TBGXiXV7t0z7UhgN+HSVVa0GCBJPXcnCRQ
         RsTHJ66Gg0yW0Bj4/jKK6HRNDv3EYh/yPL/3AF07U2jcqbfnn+s2Y6XV1ULfzISJ8wyU
         bRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x7JOzkLp3qJQ5ZEG3Wvg8nto1+QE37HnHtRsZbydM6A=;
        b=4eVaml5pbyQn7j2OS/+XigxnUtCVhksHL17JMkZTcEg4njUpRPTOv+X5kBBBtESngg
         MzilpKWL+Hmf0IIV2AQGgzyB2ESqFyKN5oJC9V2DaimE45G/DZxLW8rEXM3wATvdUDau
         B8TmgikYKytpBDH/Ln+CEaGdb/kfDHNS2dk9Va9W/uQmomKtOy8vDvMxwFZP8dRi6VRs
         aRI7oox7cYykLeGpMxCjVESojq5/Xs/2F1sQRO7bm7W8lM4ZNPXiILRF0Y41O2ZdgYoX
         AZjEwAAU6mXtl76FUkuJEX+Qqv1wZSGe/Q0piSh6h7q984NwTRhB+kZtcci1ur6iS+J3
         XAeQ==
X-Gm-Message-State: AOAM5316xzSssjwML5kSYQvJM6uFEqbbCoS+dlgDbqONE5i5uV+v1IQZ
        wsQlwAqo1Y0KY2HYY68HuoFDTg==
X-Google-Smtp-Source: ABdhPJywLYD3sCDbm0hAanxdF+yNPD6msA//MmQPz+lrjVYHgur0Zel8YSlYYQkwYSXID4FUi4RNIA==
X-Received: by 2002:ac8:7145:: with SMTP id h5mr176222qtp.240.1634739115459;
        Wed, 20 Oct 2021 07:11:55 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id s189sm1028875qka.100.2021.10.20.07.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 07:11:55 -0700 (PDT)
Subject: Re: [PATCH v4 19/20] crypto: qce: Add 'sm8250-qce' compatible string
 check
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-20-bhupesh.sharma@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <86fe25d6-c20c-b143-deb2-984aa727c657@linaro.org>
Date:   Wed, 20 Oct 2021 10:11:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-20-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/21 6:55 AM, Bhupesh Sharma wrote:
> Add 'sm8250-qce' compatible string check in qce crypto
> driver as we add support for sm8250 crypto device in the
> device-tree in the subsequent patch.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

-- 
Warm Regards
Thara (She/Her/Hers)

> ---
>   drivers/crypto/qce/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index c6f686126fc9..4c55eceb4e7f 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -306,6 +306,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
>   static const struct of_device_id qce_crypto_of_match[] = {
>   	{ .compatible = "qcom,ipq6018-qce", },
>   	{ .compatible = "qcom,sdm845-qce", },
> +	{ .compatible = "qcom,sm8250-qce", },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
> 


