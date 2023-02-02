Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAA3687FC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbjBBOSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjBBOSm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:18:42 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6C38E4A3
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:18:41 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t18so1866521wro.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttSEnTottrKZm1E7G2kuvGf9dateQDdgPyCa0dPXd+Q=;
        b=K6YvDI92AaXEMxbJj33gtT2jWuHrEGJ8b7nIiKwjzaeaIUMysmq3wDc0hyE+VoKIZp
         I5GJ1BKIcVimRk6WIUE5CoRp2IVqYHjvJwSQc9koey1FO6cSU5HLEufl/H0El+gYKEO6
         nDd8nMogf+hlgtSZwEHbAd4alQ414Z3yZwOWEc4xvMxM7tRrQq6C1+QBhpiUeH/Qrwsj
         lLoyfCZ8N1httnb5EidHDYOcskW7D4VojFTHyGCHJZbfPoHMf6JPvVzVGZ4yDUc0sA7s
         l440seGbGL6+b8XxDVV3D8y2sUN0mDT4UqW3Hhaz5lIxvh+rqzPptgikAuFCeIIwJ1Z3
         Fe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttSEnTottrKZm1E7G2kuvGf9dateQDdgPyCa0dPXd+Q=;
        b=h9bRMP5g0/crmzJQYD2qi6Z2WkhMoEqz96IMEAV/+qw+xq1rhNiiOVOMQkv0u/TXHF
         4uHe0f68pyoNqpcRcw66cVfe464nXeqyFslbbfsyvtEYlEgNN/sg8yx+rZsrkvCVs2Qq
         TfHxkQs3t159gU32BrCSP86tbA3Sk9aNcb+L5g9rFL7sNipz75WMYOCNi1sJM9GNZXE+
         rrwvxN2XVkzfp3frec1ZqUqwdR3RpP/QlW4gaQC2H9fEL+96j+lywEc7Ka6KeGNh6CmO
         2Sra3FR5nbEXtbZqtVjzykM84D1GQftD46S1kawHMhQZtuqw41KZL9Qiv5zLNGvINpNB
         mysQ==
X-Gm-Message-State: AO0yUKXmP3bYWvmFxdJbmg0eoEtG/LOrKGYlpG7bY/pILFOh+xzzndHi
        1uqML4X31c5u4goQA9rD0atKtQ==
X-Google-Smtp-Source: AK7set9Q60cEqqppPw0PEy8qXlcVlYmUrzBgXh5SWaBayMsqjYjCWxTJ5CxFVsOr05Xi4ER+Jg9Ncg==
X-Received: by 2002:a05:6000:613:b0:2bf:c319:d1d8 with SMTP id bn19-20020a056000061300b002bfc319d1d8mr6369949wrb.42.1675347519746;
        Thu, 02 Feb 2023 06:18:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b002bdd8f12effsm19788655wrt.30.2023.02.02.06.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:18:39 -0800 (PST)
Message-ID: <b3992aee-4234-4060-5d62-197324654457@linaro.org>
Date:   Thu, 2 Feb 2023 15:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 6/9] dt-bindings: qcom-qce: Add new SoC compatible
 strings for qcom-qce
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <20230202135036.2635376-7-vladimir.zapolskiy@linaro.org>
 <0fc4c509-2db4-0bce-75c6-11835d6987d0@linaro.org>
 <65aefb8a-7384-ce0c-9aab-cb8fd38bc1c6@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <65aefb8a-7384-ce0c-9aab-cb8fd38bc1c6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 15:09, Vladimir Zapolskiy wrote:
> Hi Krzysztof,
> 
> On 2/2/23 15:57, Krzysztof Kozlowski wrote:
>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>>
>>> Newer Qualcomm chips support newer versions of the qce crypto IP, so add
>>> soc specific compatible strings for qcom-qce instead of using crypto
>>> IP version specific ones.
>>>
>>> Keep the old strings for backward-compatibility, but mark them as
>>> deprecated.
>>>
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>   .../devicetree/bindings/crypto/qcom-qce.yaml  | 19 +++++++++++++++++--
>>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>> index a159089e8a6a..4e0b63b85267 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>> @@ -15,7 +15,22 @@ description:
>>>   
>>>   properties:
>>>     compatible:
>>> -    const: qcom,crypto-v5.1
>>> +    oneOf:
>>> +      - const: qcom,crypto-v5.1
>>> +        deprecated: true
>>> +        description: Kept only for ABI backward compatibility
>>> +      - items:
>>
>> Drop items.
>>
>>> +          - enum:
>>> +              - qcom,ipq4019-qce
>>> +              - qcom,ipq6018-qce
>>> +              - qcom,ipq8074-qce
>>> +              - qcom,msm8996-qce
>>> +              - qcom,sdm845-qce
>>> +              - qcom,sm8150-qce
>>> +              - qcom,sm8250-qce
>>> +              - qcom,sm8350-qce
>>> +              - qcom,sm8450-qce
>>> +              - qcom,sm8550-qce
>>
>> Unfortunately my comments from v6 was not addressed, nor responded to.
>>
>> We already got a public comment from community that we handle Qualcomm
>> bindings in a too loose way. I don't think we should be doing this (so
>> keep ignoring ABI), just for the sanity of cleanup.
>>
>> It's fine to discuss it with me, but since v6 there was no discussion,
>> so let's be clear here - NAK on ABI break.
> 
> Can you please elaborate, what is the ABI break you find here?
> 
> As for me it looks like an incremental change, thus I don't understand
> your comment why ABI is broken.

Right, the driver keeps the old one compatible, I missed that, so it
actually implements what I asked for in v7. It's fine then from ABI
point of view.

The remaining trouble is that any user of DTS (other systems, firmware,
bootloader) is going to be broken when taking the new DTS. But it's not
critical.

Best regards,
Krzysztof

