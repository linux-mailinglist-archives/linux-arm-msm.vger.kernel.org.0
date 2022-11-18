Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F5362FA2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 17:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbiKRQYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 11:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbiKRQYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 11:24:52 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D49490AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 08:24:51 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id l8so7354021ljh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TyvEqZNJ/MRi1G8+a46Jw9oIBcHIz45goT0ItOFpL6k=;
        b=AZVccVwGjF3Vxy7sxVUW8prhfRscUTczTjzZe6fpzB+s12ve3OBjdTgsekqRUV3dUY
         du3wJD+Atk+RcvhaG3hEPj+8BUQlM+jopsSOS2DYixYFbH9ub4f7yKQX8b+2V/moKpg4
         Zw+u5UbXccgPVhjzpNoJNUO10H9Th8+JSUmXEsjF9uqeBSdDkKNTaQ9p+yGGwc9Fcu1q
         jYdNYkwfHy2wg815374Dze6x98QYVcn9z5fRR8h+WkimYLPHnh2je8825+gtKamGn6FK
         Sss+xcIulhWWFxreh7RKC2LQi2cgf+3tuHUiAZQoiwEG6HPD1pm8p0avBF9aK7ySOgPN
         Hkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyvEqZNJ/MRi1G8+a46Jw9oIBcHIz45goT0ItOFpL6k=;
        b=dpkhScv6daKkXYpIc0JtAdK9QMjowQjbjFlIgRd8tkkL5mrPH6FEhzdWxaS6qBlEA1
         Cb5E6381K2GkLZAUihq9zNiUox4vrO8MEOhPurA3BYRy8YIug9v/TvfIwkpKSEh7DG8R
         SFoziOgBKfQKeSuodSXxEP76Rm2Dd5pJlpKgtmFXwy15dhMg0VBvQ5DK5gxiYrbKaQDa
         JA6QYDP8KNwrRQlc5c9dwYuJVyoHWgWL5llf9mTXUZn1hGw6q7l1r7aoKW7toiB6UQrJ
         p6SkhInADEbKwrsIG2w/Yp6Atisk+35mYsgf7UM5OwkvDMH3G+nVsUpZPxH8rOyRdWFZ
         m9yQ==
X-Gm-Message-State: ANoB5pmGzovBVJ5ZsJvYAJxXsPGVFKGE7wtCXtEvJ3C7s5BYvIK8DZ3F
        pxa/HIyqIFLF+t4PYWYTL6sS7A==
X-Google-Smtp-Source: AA0mqf4rJCEmefb/9vbDfhMOh/I4HZfeXCgo54yyLoE8CtCIOwEz8eHs4DpWhU8WfEwaQUk5zP+9WQ==
X-Received: by 2002:a2e:bd0c:0:b0:277:10c2:e7ce with SMTP id n12-20020a2ebd0c000000b0027710c2e7cemr2918150ljq.370.1668788689586;
        Fri, 18 Nov 2022 08:24:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t7-20020a056512030700b004979ec19380sm714550lfp.285.2022.11.18.08.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 08:24:49 -0800 (PST)
Message-ID: <d2fac789-4064-2c8a-5527-0da5b348a29d@linaro.org>
Date:   Fri, 18 Nov 2022 17:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add SM8550 pinctrl
 bindings
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20221116105724.2600349-1-abel.vesa@linaro.org>
 <20221116105724.2600349-2-abel.vesa@linaro.org>
 <368cd281-b461-e668-0b57-cbb83f5b8086@linaro.org>
 <e825bfbb-dc77-016a-3f56-9474aef06085@linaro.org>
Content-Language: en-US
In-Reply-To: <e825bfbb-dc77-016a-3f56-9474aef06085@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/11/2022 17:10, Krzysztof Kozlowski wrote:
>>> +
>>> +  "^.+-hog(-[0-9]+)?$":
>>> +    type: object
>>> +    properties:
>>> +      gpio-hog: true
>>> +      gpios: true
>>> +      input: true
>>> +      output-high: true
>>> +      output-low: true
>>> +      line-name: true
>>
>> Keep properties sorted by name (just like gpio-hog.yaml).
>>
>> I wonder if we could add this to the common TLMM schema. It will appear
>> in multiple places.
> 
> Answering to myself - this would require moving the 'state'
> patternProperties part to the common schema, so maybe later... Looks
> fine with changes about ordering.

If Rob likes my solution here:
https://lore.kernel.org/linux-arm-msm/20221118162101.145267-1-krzysztof.kozlowski@linaro.org/T/#u

then please go with similar way. It allows to skip listing the properties.

Best regards,
Krzysztof

