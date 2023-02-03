Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098C6689385
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 10:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjBCJVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 04:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjBCJUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 04:20:33 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFE19A832
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 01:19:11 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1866809wms.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 01:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k37em+iSA4pp8shcy4mhDg2LmO0zZyrhvJ8r9gNWLJ0=;
        b=hW8YY1DMLlxd9jNvgjF+foIj96CLaP2x6fGEN3RnsYoKyYKBlhoDG+DL3eFeCgMJ+G
         hTaESuTAECCmfVVmS1lN9FtWFm4hVY/im6yf/WTfqBwFNoZLq+aNv1MDOPVkHRQ0JFIa
         UrdAYTMdEqZk2cFbiif32JoTZU+uc8cF4B2q8TcMsmY5fllCeIlrPaJUcIxTf9j/y+v8
         rV9Hm7hMffgjydBAhYbpVjTtbrHLykfzyc9+/fwG/eSt2NDB93/AgPCQztfNsVuTkeJ9
         9GlnAdXKsAg5wa5XWMN+XNpoXpz/c4oukZh+KgF0KBzHseDzFaaV53Go8l738VYj6kgg
         NClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k37em+iSA4pp8shcy4mhDg2LmO0zZyrhvJ8r9gNWLJ0=;
        b=OWNKKLDdauPmOpRHrA1iBvOaq0/ucWJYS4xw1FhnkRlWFIElE9PcAHnFFYlpWoZELu
         j7CAm8vhsTKncxtc63G8o9VcVQcQgCytz1oLv11zlVEH92STJdrCp8A0ob7VGPmWd1Fk
         KZ/iAEyK1VdXJiZSVyciVNM/pvsivqNXEfkFc4EIGnGTM37vJbTHEsMrEtDOoM4NOq3W
         afNP++kZnj+/NO3sDdD1IKSPNGDUHyfciR+4wGRpjE6nIPACTsVibiifIeFd4E9fdaw2
         3ltP7CC1gCasBLwLNS9FRb7aX1Uw8I6xk6SoWVMEOR++LVY8W29t9iZ3hp04FuZysseN
         rdyg==
X-Gm-Message-State: AO0yUKU+YVE78OsjGsGk86Qecu1JfXZEFqbXHVTS6jWgxT0l3FShNA65
        KinLB1FZUSb2QcIH4sqpjwknyg==
X-Google-Smtp-Source: AK7set/GYFh4y3+97uGQ1U+qyS7rnb64ienSjSRieFpcYKYgKW8VBKY4nXFj4D2ARmH2eRfTsz3GLw==
X-Received: by 2002:a7b:cb85:0:b0:3da:1357:4ca2 with SMTP id m5-20020a7bcb85000000b003da13574ca2mr9816355wmi.11.1675415949575;
        Fri, 03 Feb 2023 01:19:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7407:d8b9:ec7a:537? ([2a01:e0a:982:cbb0:7407:d8b9:ec7a:537])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c3b0d00b003dc51c48f0bsm7999595wms.19.2023.02.03.01.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:19:09 -0800 (PST)
Message-ID: <261fb8cd-5043-3b2d-2c9a-2e602678517c@linaro.org>
Date:   Fri, 3 Feb 2023 10:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 9/9] crypto: qce: core: Add new compatibles for qce
 crypto driver
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <397bcc25-dd5e-808f-a38b-15e6c18db669@linaro.org>
 <8cf36a4b-2070-2e79-c06d-b0ec06d8b9f7@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <8cf36a4b-2070-2e79-c06d-b0ec06d8b9f7@linaro.org>
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

On 02/02/2023 15:20, Krzysztof Kozlowski wrote:
> On 02/02/2023 15:15, Vladimir Zapolskiy wrote:
>> Hi Krzysztof,
>>
>> On 2/2/23 16:01, Krzysztof Kozlowski wrote:
>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>>>
>>>> Since we decided to use soc specific compatibles for describing
>>>> the qce crypto IP nodes in the device-trees, adapt the driver
>>>> now to handle the same.
>>>>
>>>> Keep the old deprecated compatible strings still in the driver,
>>>> to ensure backward compatibility.
>>>>
>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: herbert@gondor.apana.org.au
>>>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>>> [vladimir: added more SoC specfic compatibles]
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>>    drivers/crypto/qce/core.c | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
>>>> index 8e496fb2d5e2..2420a5ff44d1 100644
>>>> --- a/drivers/crypto/qce/core.c
>>>> +++ b/drivers/crypto/qce/core.c
>>>> @@ -291,8 +291,20 @@ static int qce_crypto_remove(struct platform_device *pdev)
>>>>    }
>>>>    
>>>>    static const struct of_device_id qce_crypto_of_match[] = {
>>>> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>>>>    	{ .compatible = "qcom,crypto-v5.1", },
>>>>    	{ .compatible = "qcom,crypto-v5.4", },
>>>> +	/* Add compatible strings as per updated dt-bindings, here: */
>>>> +	{ .compatible = "qcom,ipq4019-qce", },
>>>> +	{ .compatible = "qcom,ipq6018-qce", },
>>>> +	{ .compatible = "qcom,ipq8074-qce", },
>>>> +	{ .compatible = "qcom,msm8996-qce", },
>>>> +	{ .compatible = "qcom,sdm845-qce", },
>>>> +	{ .compatible = "qcom,sm8150-qce", },
>>>> +	{ .compatible = "qcom,sm8250-qce", },
>>>> +	{ .compatible = "qcom,sm8350-qce", },
>>>> +	{ .compatible = "qcom,sm8450-qce", },
>>>> +	{ .compatible = "qcom,sm8550-qce", },
>>> I did not agree with this at v7 and I still do not agree. We already did
>>> some effort to clean this pattern in other drivers, so to make it clear
>>> - driver does not need 10 compatibles because they are the same.
>>
>> Here is a misunderstanding, the compatibles are not the same and it shall
>> not be assumed this way, only the current support of the IP on different SoCs
>> in the driver is the same.

It seems the IP version is discoverable, in this case it's perfectly valid
to have a generic compatible along a soc specific compatible.

It has been done and validated multiple times, like for the ARM Mali Bifrost [1]

I'll propose then to add a generic "qcom,crypto" as fallback to
all of those new compatibles and clearly document that this is only
for crypto IP cores versions that have the runtime version discoverable.

We could even add a major version generic fallback compatible like "qcom,crypto-v5" or "qcom,crypto-v5.x"
to differentiate from older crypto devices.

Neil

> 
> They are the same for the driver. It's the same what we fixed for SDHCI
> and other cases. Why this should be treated differently?
> 
>>
>> Later on every minor found difference among IPs will require to break DTB ABI,
>> if all of the particular SoC specific comaptibles are not listed.
> 
> No, why? Why SDHCI and hundreds of other devices are not affected and
> this one is?
> 
> Best regards,
> Krzysztof
> 

[1] https://lore.kernel.org/all/20190401080949.14550-1-narmstrong@baylibre.com/
