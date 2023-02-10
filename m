Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545B9691E05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjBJLRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbjBJLRm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:17:42 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3AC3BDAE
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:17:26 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lu11so14956546ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676027840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aezVSxJ46OjzjaqgPkeYoeGbwBe2zO4fLCrZB2BY/og=;
        b=ooO7l0hGVnz/F4hX+nsq/R15dmokH73APhqZAa7eFE6+UR+mEm0lSteXP+VzV1mkul
         NqbT799XeR2F26VyAX4CwYVrqJIn5rs5Gxtc0Tgf9hNN8cM16ikWY8q7sAccD0ZNyHUv
         qlJI2WzqpPkhrQ52oTsqupvrzn7T+luyQV2mcdStVEnbNGz5Iajc1wErji6ot2JHLbBB
         rOWok2ABJPiYNxsDjwBOxBhPlK09hXDVithExTM8z5MPT9Zy5qI7k9BhKMVMAWnnszXn
         0GFDr0j7uQWxzmpO9EPx2BqbRLKQw5zFs1g+utM1bN7kl+ncw+m78UMy3izOjqBQyCuE
         FBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676027840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aezVSxJ46OjzjaqgPkeYoeGbwBe2zO4fLCrZB2BY/og=;
        b=gb6O4gkaU8xIDBqTVbgPtuRr09sgD7yF1Rxk0dOZVIZDt1GkY/SOmatl1TM988bsnr
         Mf3mkqvekGgd8fFN2RpjfFoHFp8te54X0h8qSHjrJZsXIqM0fjlyglz9gQ6H9PLt18t2
         sG1pH5coctFrKKDTkL7owqOpz2NSkQM1KebkYv91dPfvsOOwmernnPXrcU+/y74JKVhC
         47r/ojGnkZEwRJlnEORbjsGw7dBGLlrl/jzE4QRu2nNEIjnudiVdRuAy6PtpH5G+W9pL
         AcTZdkwP1Dj08UnndIf0roynYxbLUTU+08cv4TjxXQSQA+xvy/S7VgnpbBIcPpv6+fFg
         UuwA==
X-Gm-Message-State: AO0yUKWOX8jbbjA3Yzf4EETTq0pwajXGk157JiPqZnAx+ZZNu4EL4zpW
        1dwHQHHcg5MMQxVk+dvu8g8flQ==
X-Google-Smtp-Source: AK7set8NkHKvtt8ANyqJ3Y2tcUCj/pPJEHc8nsiYaAnl2rX6HI9NEO85ZQo3APey5JONQ5qv3hErcA==
X-Received: by 2002:a17:906:5349:b0:889:d24e:6017 with SMTP id j9-20020a170906534900b00889d24e6017mr13083721ejo.3.1676027840433;
        Fri, 10 Feb 2023 03:17:20 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906c08d00b00878003adeeesm2250686ejz.23.2023.02.10.03.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:17:19 -0800 (PST)
Message-ID: <5e419feb-8219-61d5-8e4b-f96c5f382a64@linaro.org>
Date:   Fri, 10 Feb 2023 13:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v9 06/14] dt-bindings: qcom-qce: document optional clocks
 and clock-names properties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <b2d75c0a-a9f3-3d28-5e05-25fe3a18dcfb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/9/23 11:20, Krzysztof Kozlowski wrote:
> On 08/02/2023 19:37, Vladimir Zapolskiy wrote:
>> On newer Qualcomm SoCs the crypto engine clocks are enabled by default
>> by security firmware. To drop clocks and clock-names from the list of
>> required properties use 'qcom,sm8150-qce' compatible name.
>>
>> The change is based on Neil Armstrong's observation and an original change.
>>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/crypto/qcom-qce.yaml      | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> index f6f1759a2f6e..d0f6b830a5dd 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> @@ -79,11 +79,22 @@ properties:
>>   required:
>>     - compatible
>>     - reg
>> -  - clocks
>> -  - clock-names
>>     - dmas
>>     - dma-names
>>   
>> +if:
> 
> This should be in allOf, like I wrote in last discussion.

In the last discussion you shared two options, and I got an impression
that adding a new "non-clock-requiring" compatible is a better option,
in this series it is "qcom,sm8150-qce".

So, do you wish to see an added allOf: on top of a single if: anyway?

--
Best wishes,
Vladimir
