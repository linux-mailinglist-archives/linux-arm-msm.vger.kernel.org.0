Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E2E79363F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 09:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjIFH2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 03:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbjIFH2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 03:28:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01626E4A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 00:28:16 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bed101b70so501102766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985295; x=1694590095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqwk42h/BlKX2LsT6UvwnsUuC24eIDeLQPg8FqsYzu0=;
        b=VHFxTh8VG8VFSZt4hnECwfgrFePGe8x7nC5/jjATBjvnzaUh6dwEHc7urduLCkhdkU
         b1d7ap1Beq6G9PXQIgRk2UJImJmCor7UcYUoX6JY3odYE6chL3r+k/SFBHCTkgazWHax
         SB3RuSlyOrTE8DlDP7VuUg2FAz3NFl/OTHfSI0BSMdr0aiqhZ7mOl/U3lIf6rpLQ3kdJ
         VTXgZS/97tnyoD0hVVAIwC9rdmS0GY6sqteIJ5KRjwPOdLF4awn6iHE2Os50rLtVrd0S
         gva/90U1R9ZpVO+lnWcxcUMmse114tZY8a6BSXX/9/RmgzL0KFTTHy99MvlfEZhDma7M
         UJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985295; x=1694590095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqwk42h/BlKX2LsT6UvwnsUuC24eIDeLQPg8FqsYzu0=;
        b=hSdyGBkCrO47zx0nWZ+KfpdlxyINwug73x9w9bzZ6Q9Db+ByPAAnI1Bcqkxb0lI/s/
         9AmUsfTm/c9pXEKDb68LLXTL6b73BnfznyuN58eWxTX7fUAbsVesy8mISgDsGY7AAjJd
         YhOMvhxq1Yg1iOuCjpCcgkoMJCjgp58tYwaJKBrxndbsARdsLKcXmhgwlGlXTb5J3uXk
         xvfvrUe6+zLqIteMqh4qk3mRwYNLCbb9zomN24AsPWJCDju1RH0RzuGnqhRtyg1nbY1d
         lrAnI6TUN8LGPJ6YtbBn/lJZ25Ri4HY9v17Oc8CdwylBKSQBFL+LOonn2TL49rhZXZBA
         UnTg==
X-Gm-Message-State: AOJu0Yx5z2UQELSV08vte266jPjn336D9FDvPgjQomWMvisn30rx1/+C
        TeIZ+hgWcccKa5x0O7vejdKQfg==
X-Google-Smtp-Source: AGHT+IHDuDDnNXenFKxKy/6354sLozj9niWUIRxDaM9QPfc6o+XHQQk7J8bBvisdOAXsCSeTZ0a6+g==
X-Received: by 2002:a17:906:8469:b0:99b:627b:e96d with SMTP id hx9-20020a170906846900b0099b627be96dmr1536471ejc.44.1693985295400;
        Wed, 06 Sep 2023 00:28:15 -0700 (PDT)
Received: from [192.168.37.236] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id w22-20020a170906131600b0099d9b50d786sm8638988ejb.199.2023.09.06.00.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:28:14 -0700 (PDT)
Message-ID: <4a6238f0-5c91-4fd9-9e02-38766778e2a4@linaro.org>
Date:   Wed, 6 Sep 2023 09:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add magic
 tuning overrides
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230830-topic-eusb2_override-v1-0-ab23825385a8@linaro.org>
 <20230830-topic-eusb2_override-v1-1-ab23825385a8@linaro.org>
 <20230905163821.GA3500273-robh@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230905163821.GA3500273-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5.09.2023 18:38, Rob Herring wrote:
> On Wed, Aug 30, 2023 at 04:40:15AM +0200, Konrad Dybcio wrote:
>> The EUSB2 repeater requires some alterations to its init sequence,
>> depending on board design.
>>
>> Add support for making the necessary changes to that sequence to make USB
>> functional on SM8550-based Xperia 1 V.
>>
>> They all have lackluster description due to lack of information.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/phy/qcom,snps-eusb2-repeater.yaml      | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>> index 029569d5fcf3..83fd6f936bf9 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>> @@ -32,6 +32,27 @@ properties:
>>  
>>    vdd3-supply: true
>>  
>> +  qcom,tune-hsdisc-value:
> 
> Is '-value' redundant?
> 
> '-thres' or '-threshold' would be more descriptive.
All these names are essentially qcom,register-name-value

But I do see your point, it probably makes sense to make it
more human-readable.

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    description: High-Speed disconnect threshold
>> +    minimum: 0
>> +    maximum: 7
>> +    default: 0
>> +
>> +  qcom,tune-iusb2-value:
> 
> -amplitude?
ack

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    description: High-Speed trasmit amplitude
transmit*

>> +    minimum: 0
>> +    maximum: 15
>> +    default: 8
>> +
>> +  qcom,tune-usb2-preem-value:
> 
> We have 'hs', 'iusb2', and 'usb2'. Can you be consistent?
Again, this is taken from register names. I can use 'usb2'
everywhere if you wish.

Konrad
