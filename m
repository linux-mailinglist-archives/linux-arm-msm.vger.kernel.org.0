Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2766E5BF641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 08:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiIUG1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 02:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiIUG1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 02:27:16 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17833804B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 23:27:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so7531828lfo.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ggttj0ip5WkBjYpw/WnMtLi+fMdRVX8SYzRnIBF97Go=;
        b=gLNHjBBY/9pUni386AGpx3O5RYp5Fpj57LUMKRw4EAfeA4lfc8LwA9I0XXj+8DtbU1
         ieiDGYfv4vNdKyxTVdTy9i5g6Uf9XI/b42ByyBRI1K1nnOn3gZ5fbutzNpgzVNpDK4dV
         lPMOdtRLs9fOZaKkLq2Ux/QzwuzVwItSFKiSWhAtC2aYqYQ6wLz+OZWKP1tiM4SKeEWh
         biYCSeyIAjOwT+78hvXPVLTxy1Glc/PlFuJCKt5HRzN3fbkLo4i8afe/xf1PfwXigjCV
         QG+jsscYr65htWCnsNga28Uomb+ilWsJiNEZtxhLdVgHXRL3hfFvGE9ft1ZMNEKV7DZt
         /uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ggttj0ip5WkBjYpw/WnMtLi+fMdRVX8SYzRnIBF97Go=;
        b=ejBKPJC+8PMtpYmdx4CT5flY/h2RxWtgcIxAWy8+KZmCdAMH5YJAO/ib/EiRIgtE2O
         Kiy6M+47O8hXGEUFigosPkGBs0oq+co51e1Ga2zj5HERaSSGB/7VZ9LGI/HRPDP0ZZsf
         kj2gw9AQOLc2U7z9wk35AepyifVML/pUeImSQhLePHNdeZl/qZNkWYJZmB+wHaSRuNXN
         SHuo59plYQQlx9d9ExynbBcdPmSNJ4A34o2tiMog6tg6ezajo5q/ICi/zBvwslWoZqGo
         KuihOlg1VbWBIb2WLqsiwIqe5ZV4I0ompfZbm0aW6dPsnT0P75Y5dISUVDJkD8812utM
         Wzuw==
X-Gm-Message-State: ACrzQf2oluUm8B/2t+TBlCRYk7k5Zm9Zl045WWjHXjw5vKo4Yi7lpiDM
        f5koeVTYrQ8h4FJpLoonTfmMbQ==
X-Google-Smtp-Source: AMsMyM4v+9XrSkx4lonMl2BGq54oTlZZAdiyICLhFmj2KBH2DN43yIwR/rXT2bvseQKlycSOMZUvNQ==
X-Received: by 2002:a05:6512:4005:b0:49e:6f0a:b09e with SMTP id br5-20020a056512400500b0049e6f0ab09emr9123696lfb.330.1663741623117;
        Tue, 20 Sep 2022 23:27:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m3-20020a2ea883000000b0026c34bed71csm291411ljq.87.2022.09.20.23.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:27:02 -0700 (PDT)
Message-ID: <37b509ff-4fc2-73f1-b135-c0930075ec29@linaro.org>
Date:   Wed, 21 Sep 2022 08:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 6/9] crypto: qce: core: Add new compatibles for qce
 crypto driver
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, andersson@kernel.org, bhupesh.linux@gmail.com,
        davem@davemloft.net, Jordan Crouse <jorcrous@amazon.com>
References: <20220920114051.1116441-1-bhupesh.sharma@linaro.org>
 <20220920114051.1116441-7-bhupesh.sharma@linaro.org>
 <b4016460-f43a-13f8-432e-47c27237e005@linaro.org>
 <9b111583-519b-95a6-15b5-243e88dc8d39@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9b111583-519b-95a6-15b5-243e88dc8d39@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 08:16, Bhupesh Sharma wrote:
> 
> 
> On 9/20/22 8:42 PM, Krzysztof Kozlowski wrote:
>> On 20/09/2022 13:40, Bhupesh Sharma wrote:
>>> Since we decided to use soc specific compatibles for describing
>>> the qce crypto IP nodes in the device-trees, adapt the driver
>>> now to handle the same.
>>>
>>> Keep the old deprecated compatible strings still in the driver,
>>> to ensure backward compatibility.
>>>
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: herbert@gondor.apana.org.au
>>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> ---
>>>   drivers/crypto/qce/core.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
>>> index 63be06df5519..99ed540611ab 100644
>>> --- a/drivers/crypto/qce/core.c
>>> +++ b/drivers/crypto/qce/core.c
>>> @@ -291,8 +291,17 @@ static int qce_crypto_remove(struct platform_device *pdev)
>>>   }
>>>   
>>>   static const struct of_device_id qce_crypto_of_match[] = {
>>> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>>>   	{ .compatible = "qcom,crypto-v5.1", },
>>>   	{ .compatible = "qcom,crypto-v5.4", },
>>
>> This is okay, so there is no ABI break.
> 
> Great. Thanks for the confirmation.
> 
>>> +	/* Add compatible strings as per updated dt-bindings, here: */
>>> +	{ .compatible = "qcom,ipq4019-qce", },
>>> +	{ .compatible = "qcom,ipq6018-qce", },
>>> +	{ .compatible = "qcom,ipq8074-qce", },
>>> +	{ .compatible = "qcom,msm8996-qce", },
>>> +	{ .compatible = "qcom,sdm845-qce", },
>>> +	{ .compatible = "qcom,sm8150-qce", },
>>> +	{ .compatible = "qcom,sm8250-qce", },
>>
>> This is a bit odd... you have 7 devices which are simply compatible or
>> even the same. This should be instead one compatible.
>>
>> I don't really get why do you want to deprecate "qcom,crypto-v5.1".
>> Commit msg only says "we decided" but I do not know who is "we" and "why
>> we decided like this". If you want to deprecate it, perfectly fine by
>> me, but please say in commit msg why you are doing it.
> 
> I understand. This patchset has been in flight for some time and hence I 
> might have missed sharing some detailed information about the review 
> comments and rework done along the way (in the cover letter for this 
> series).
> 
> Coming back to your concern, here is the relevant background:
> - Please see: 
> https://lore.kernel.org/linux-arm-msm/20210316222825.GA3792517@robh.at.kernel.org/
> 
> - Rob shared some comments on the v1 series regarding the soc-specific 
> compatibles. He mentioned in the above thread that 'you should stick 
> with SoC specific compatibles as *everyone* else does (including most 
> QCom bindings).'
> 
> - So, while I had proposed "qcom,crypto-v5.1" (for ipq6018) and 
> "qcom,crypto-v5.4" (for sdm845, sm8150) etc. as the compatible(s) in the 
> v1 series, I shifted to using the soc-specific compatibles from the v2 
> series, onwards.

Then the reason could be - Reviewers preferred SoC-based compatible
instead of IP-block-version-based.

What is confusing is the difference between that link and here. That
link wanted to introduce 4 different compatibles... and here you have
even 7 compatibles being the same.

> 
> - Basically, since we are going to have newer qce IP versions available 
> in near future, e.g. "qcom,crypto-v5.5" etc, and we will have 2 or more 
> SoCs also sharing 1 version, these compatibles would grow and become 
> more confusing. IMO, having a soc-specific compatible in such cases is 
> probably a much cleaner approach.
> 
> Hope this helps answer some of your concerns and provides some relevant 
> background information.

Sure, but I still think you should have only one compatible in the
driver in such case. You don't have differences between them from the
driver point of view, so the devices seem to be compatible.

If not, what are the differences?

Best regards,
Krzysztof
