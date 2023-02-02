Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F48B687FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjBBOPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjBBOPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:15:08 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF2EB44C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:15:06 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id mc11so6268017ejb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3sTEA+yVbqUv9p9k31N1U7fTYDNkAXgvhPV3je9O84=;
        b=Omhkk+TOp8r8oxs6mUENxRaCma0Yz2t1fEXacjo0pmY5UMshJNSP4gnN6WPvjpWVoI
         hn9okBO24aKJnRAdS4Rf/PSYPVBj6Tzqitr2UfghJ5D+rVxBj3Hn0M3tfopzaIKgXvDV
         L5T1V0ssl0gtOBX+dTvtygd2y6wzMBY9nrXygsVyF4gENhwhnUSzhW/YeY5/+QfvaYAj
         HMN0jD59mmN+ZGSF+fOiw1NvsihfWVlhQybQVHlh158czwvAOzEGxGiIm9yR47WgXOzE
         Fbx3nIo/uTirlp6PvW8eRTUyiwD30GW5wisTDmuQOSbX1DM9nrMr0LxYeK9hXt+XWK7i
         OwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3sTEA+yVbqUv9p9k31N1U7fTYDNkAXgvhPV3je9O84=;
        b=ybRR0TURhLKeGNNq5tda9WrMTcYeZIg8M6BDMTh8IYVsLgTQWXkxZrUWsWVeLSzEZr
         HYWyZZeDw27q9FSkneLfUXGvFT24yu9HvJzh3HGr1/lzZyT9DlfFHd1ivLLn3wTokoDj
         5OoN4UTZRtsbXCYzGo/y5bULccRYxhtusDdcx6oTeq+DwBNSMw2g9vfs8h7tRB3I/FL6
         csJueweCIn/mXTOKZE8A8sfN9rW0gD6r+ocQQA0fOfYFBIuD/SB8TELqwzjbDwuLHgaV
         SbkzaFHYnBZEflq1XQDf3Xn4GcOkDIEWbVSrIpKKtcG3hepOkf7QEKiMczUPDB+zlsIK
         mxUg==
X-Gm-Message-State: AO0yUKWrtTKxc1KzXs7WrBefct4e/4RJyQuOLm1wZCsC3qgEcsPld4+q
        mEtGDn2xl7fNVLLebYo3SMQIug==
X-Google-Smtp-Source: AK7set9ZdNajbh6gPYzPthQ+bI8lhuEt4DecKRwJzWbqwyTsNZlXu29c8p4x0w9EXdLlwmc0kjcuOQ==
X-Received: by 2002:a17:907:4cc:b0:884:9b56:e422 with SMTP id vz12-20020a17090704cc00b008849b56e422mr5171011ejb.6.1675347305336;
        Thu, 02 Feb 2023 06:15:05 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id y17-20020a1709060a9100b00883c1bcb25bsm8415472ejf.109.2023.02.02.06.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:15:04 -0800 (PST)
Message-ID: <397bcc25-dd5e-808f-a38b-15e6c18db669@linaro.org>
Date:   Thu, 2 Feb 2023 16:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v8 9/9] crypto: qce: core: Add new compatibles for qce
 crypto driver
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-10-vladimir.zapolskiy@linaro.org>
 <6577abf2-7717-b952-13d7-9143200f24fc@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6577abf2-7717-b952-13d7-9143200f24fc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 2/2/23 16:01, Krzysztof Kozlowski wrote:
> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>
>> Since we decided to use soc specific compatibles for describing
>> the qce crypto IP nodes in the device-trees, adapt the driver
>> now to handle the same.
>>
>> Keep the old deprecated compatible strings still in the driver,
>> to ensure backward compatibility.
>>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: herbert@gondor.apana.org.au
>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> [vladimir: added more SoC specfic compatibles]
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/crypto/qce/core.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
>> index 8e496fb2d5e2..2420a5ff44d1 100644
>> --- a/drivers/crypto/qce/core.c
>> +++ b/drivers/crypto/qce/core.c
>> @@ -291,8 +291,20 @@ static int qce_crypto_remove(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id qce_crypto_of_match[] = {
>> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>>   	{ .compatible = "qcom,crypto-v5.1", },
>>   	{ .compatible = "qcom,crypto-v5.4", },
>> +	/* Add compatible strings as per updated dt-bindings, here: */
>> +	{ .compatible = "qcom,ipq4019-qce", },
>> +	{ .compatible = "qcom,ipq6018-qce", },
>> +	{ .compatible = "qcom,ipq8074-qce", },
>> +	{ .compatible = "qcom,msm8996-qce", },
>> +	{ .compatible = "qcom,sdm845-qce", },
>> +	{ .compatible = "qcom,sm8150-qce", },
>> +	{ .compatible = "qcom,sm8250-qce", },
>> +	{ .compatible = "qcom,sm8350-qce", },
>> +	{ .compatible = "qcom,sm8450-qce", },
>> +	{ .compatible = "qcom,sm8550-qce", },
> I did not agree with this at v7 and I still do not agree. We already did
> some effort to clean this pattern in other drivers, so to make it clear
> - driver does not need 10 compatibles because they are the same.

Here is a misunderstanding, the compatibles are not the same and it shall
not be assumed this way, only the current support of the IP on different SoCs
in the driver is the same.

Later on every minor found difference among IPs will require to break DTB ABI,
if all of the particular SoC specific comaptibles are not listed.

> And before anyone responds that we need SoC-specific compatibles, yes, we
> need them, its is obvious, but in the bindings. Not in the driver.
> 
> Please go with SoC compatible fallback, as many times encouraged by Rob.
> Worst case go with generic fallback compatible.
> 

--
Best wishes,
Vladimir
