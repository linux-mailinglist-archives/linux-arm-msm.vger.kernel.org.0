Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D50691E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjBJLaN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjBJLaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:30:08 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE8D6CC65
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:30:07 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so3820117wmb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlEJ/WfDgVsG5Jb5+gK1awECrjW76DF3jnb3j/ziMb0=;
        b=cW0o0oQZSWAA3U2o7l1kIz3vFte0XTNZ/TMisF+941/AjmgwA+Y7FAPEKcbhFnjRWi
         hb2u80wFItn3QQtrY2Q3exVol8MK6L2M43NGzl6lWkYuSqMAs9kwFwU8NKLp3KY2XmfI
         Q65Xn2z0efUwBibWo/p5oAOLqbnBw0aUAWp4IO8HJ7aTujoo7d+osMPWzNi9xeiUM01B
         r4HvujFSoh0yq1E51+uSvolsI5+j5tuy3xl94I/rpjd4QoDV+iCMelcbLYZsbuHF9QLf
         doy5sDhcN6yJzKx5KReTj8ZhuyE5ATpFPqngNGYe+jP8xKUJ/JdZskTw07hpKAnqroi7
         388w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlEJ/WfDgVsG5Jb5+gK1awECrjW76DF3jnb3j/ziMb0=;
        b=LAX0lrmdhhuDbl7qTYzd91fnnuxziaok4Ali8vkdr2VaYE6XfNENvh51ZyEYbqDoZw
         GFuiY2W6ocQf4DvGhnI/roS6kyogoa2BBK/ZMod5tk+JFZm3ffxHzIWFGn5jAN1x5xoh
         NaW5PK5u/EOlKM4oCZm6MSUBlEekk3FQfW7f0hcIWSoawD8Ti70FmWcjOVzQ+Zfqv3GT
         IxuQtemm/BlfwB7OS9KdRtpXTsIRaFzvg6/KFBa4EhUGnRYK+TJIoEVjIouUnAHyn5WP
         Crxv8oWPtlGd1Zzg1cck+yxxwlaqpTRV1Kjfiro5I1dH545+KcOUmyFHTDcLGOO5OCN6
         bgyg==
X-Gm-Message-State: AO0yUKWQJywHvNWMMYR7kRIBgxumBfBGlyPXU55qgr8pQ0Am3RR4jF24
        ArIGTwmk2wWIf+m7Am7fV3C6Qw==
X-Google-Smtp-Source: AK7set8xtx+hZ40vxoTceinSRqg/H4ZPYcEgJV2IHxmtnqjkAb1898qYQiF9lMN+sNISWqnJM848TA==
X-Received: by 2002:a05:600c:43d5:b0:3d9:e5d3:bf with SMTP id f21-20020a05600c43d500b003d9e5d300bfmr12841619wmn.32.1676028605783;
        Fri, 10 Feb 2023 03:30:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f21-20020a05600c43d500b003dc522dd25esm4570298wmn.30.2023.02.10.03.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:30:05 -0800 (PST)
Message-ID: <bee0e5be-6092-3656-72d2-ff9602563435@linaro.org>
Date:   Fri, 10 Feb 2023 12:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 06/14] dt-bindings: qcom-qce: document optional clocks
 and clock-names properties
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
 <20230208183755.2907771-7-vladimir.zapolskiy@linaro.org>
 <b2d75c0a-a9f3-3d28-5e05-25fe3a18dcfb@linaro.org>
 <5e419feb-8219-61d5-8e4b-f96c5f382a64@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5e419feb-8219-61d5-8e4b-f96c5f382a64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 12:17, Vladimir Zapolskiy wrote:
> On 2/9/23 11:20, Krzysztof Kozlowski wrote:
>> On 08/02/2023 19:37, Vladimir Zapolskiy wrote:
>>> On newer Qualcomm SoCs the crypto engine clocks are enabled by default
>>> by security firmware. To drop clocks and clock-names from the list of
>>> required properties use 'qcom,sm8150-qce' compatible name.
>>>
>>> The change is based on Neil Armstrong's observation and an original change.
>>>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>   .../devicetree/bindings/crypto/qcom-qce.yaml      | 15 +++++++++++++--
>>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>> index f6f1759a2f6e..d0f6b830a5dd 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>> @@ -79,11 +79,22 @@ properties:
>>>   required:
>>>     - compatible
>>>     - reg
>>> -  - clocks
>>> -  - clock-names
>>>     - dmas
>>>     - dma-names
>>>   
>>> +if:
>>
>> This should be in allOf, like I wrote in last discussion.
> 
> In the last discussion you shared two options, and I got an impression
> that adding a new "non-clock-requiring" compatible is a better option,
> in this series it is "qcom,sm8150-qce".

It's unrelated topic. What compatibles you use in what setup is one
thing. The syntax is second.

> 
> So, do you wish to see an added allOf: on top of a single if: anyway?

Yes, because it will grow and then you have useless reindent.


Best regards,
Krzysztof

