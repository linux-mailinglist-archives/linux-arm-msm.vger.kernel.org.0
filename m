Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7B163767D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 11:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiKXKag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 05:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiKXKaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 05:30:12 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC948B876
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 02:30:05 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so1894290lfv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YGzB1m+A8t24Wyv5LyOx5oUGq5pgFjmcOjHEeeQKKE=;
        b=P4r8ejXZ4Eg9YNX6ILD2RSHKALTZZ8W/0BRIkyRGGH0Te77UjQKe0yFJNG2u0iOytO
         P7Ou21TenDgggLj4HVD7H2Wi64jHe369AGMSZ0VC6897W7apN0DYRll4z5n4FKNs0eAZ
         8h7iQ4ZS7/zSNWfM0Dm9da7UIN8QMhUmEb6w5uDidqX+x1wGVONjkS4wivwkV4jBKayp
         PJKNHH+CMVoBYIi1BGBZ+c+2k3GmTbqyPe5JMwjcTTf9CiGRc3kLtJeSMaG8QMtY1zD/
         MhGeJgyoyrNErWBwfhZBs1ByXh6bEAjqob0yVnNjl8krHAcPZJLfrUBo1mnvJJgnJqfe
         nw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YGzB1m+A8t24Wyv5LyOx5oUGq5pgFjmcOjHEeeQKKE=;
        b=5fq6NdcI408F2BMKf6SC40lb7J/ypiB8BX3DW/vPjdYwihcGdWQr1Rvit4W0Ii5Qk1
         MJiIfh0pefyeRbAvqQvfnV4ZmeQqUVUyN5lRb5XxmN5oyW34vkeLTdlZzuOyU5VTJmFo
         bMmr4cotJfTWsUxCZKy6FllKDkcbnT015wGAgfXoiJwiWucLFXk6ivkEyW/Q5L94zAph
         900TRfYkxcXDilN+UjbZU8k7VwevTe7WDcI9kKMqyxIkcDNska0QtWorzItKOkiyRNQ2
         LocrgS1Og1do52rbyYeyA1/dKvnCkN8GCGc91wRSm6pnG69hCziRoqCV62+z0/pIfGRh
         QHBQ==
X-Gm-Message-State: ANoB5pmXP9sOjBYGxSBjdTF0IYA+/XEBkk0o/20MlO/NKsXeLcIl/Ice
        B/8jOanLgQxKTqnoWg0W0g1xfg==
X-Google-Smtp-Source: AA0mqf6s5rfKEkFzvxg78RSbw5JHvfM0tIBJH7b0tkR3JUz6rMn6ooziH19gylVOxdcjatJAbJ3jhQ==
X-Received: by 2002:a05:6512:3da3:b0:4aa:f992:28aa with SMTP id k35-20020a0565123da300b004aaf99228aamr4887349lfv.459.1669285803993;
        Thu, 24 Nov 2022 02:30:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u21-20020a196a15000000b00498f570aef2sm78922lfu.209.2022.11.24.02.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 02:30:03 -0800 (PST)
Message-ID: <333a240a-2c97-8b19-91d1-315d00e1f438@linaro.org>
Date:   Thu, 24 Nov 2022 11:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] dt-bindings: interconnect: Add rpmh virt devices
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118182245.31035-1-quic_molvera@quicinc.com>
 <20221118182245.31035-2-quic_molvera@quicinc.com>
 <536af0d9-aa00-ddf1-753d-670ec2adef91@linaro.org>
 <3ada611b-96e0-5cf0-d79d-b90ca4202ddb@quicinc.com>
 <b7cc4f5d-c1d6-919c-9604-7855ea802d17@linaro.org>
 <e6ae7c01-47ca-f1da-3b0b-1f17d9e862bf@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e6ae7c01-47ca-f1da-3b0b-1f17d9e862bf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/11/2022 18:57, Melody Olvera wrote:
>>>>> +
>>>>> +maintainers:
>>>>> +  - Georgi Djakov <georgi.djakov@linaro.org>
>>>>> +  - Odelu Kukatla <quic_okukatla@quicinc.com>
>>>>> +
>>>>> +description: |
>>>>> +   RPMh interconnect providers support system bandwidth requirements through
>>>>> +   RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>>>>> +   able to communicate with the BCM through the Resource State Coordinator (RSC)
>>>>> +   associated with each execution environment. Provider nodes must point to at
>>>>> +   least one RPMh device child node pertaining to their RSC and each provider
>>>>> +   can map to multiple RPMh resources. Virtual interconnect providers are not
>>>>> +   controlled by AP and do not support QoS; they should not have associated
>>>>> +   register regions.
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: qcom,rpmh-common.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - qcom,qdu1000-clk-virt
>>>>> +      - qcom,qdu1000-mc-virt
>>>>> +      - qcom,sm8450-clk-virt
>>>>> +      - qcom,sm8450-mc-virt
>>>> You should also move qcom,sdx65-mc-virt, qcom,sc8280xp-mc-virt,
>>>> qcom,sc8280xp-clk-virt and more.
>>> Ok. I wasn't sure since some of these entries don't seem to conform to
>>> these bindings, even though it seems they should.
>> I have impression that devices I listed conform to these bindings, this
>> is why I listed them. But if you are sure that they do not, then they
>> should not be moved.
> 
> You're correct; those you listed do conform to the new bindings and should be moved.
> I also caught qcom,sc7280-clk-virt which needs to be moved. I'll add to the new bindings.

Actually let's wait a bit with this. For SM8550 we had an idea to move
interconnect to their own bindings file, because they will grow a bit
with allOf:if:then clauses.

Maybe SM8450 and QDU1000 should also go to their own files which will
describe all their interconnects (the virt and the ones requiring clocks)?

Apologies for bringing it late for your patches, but SM8550 is also
happening right now, so new things pop-up :)

Best regards,
Krzysztof

