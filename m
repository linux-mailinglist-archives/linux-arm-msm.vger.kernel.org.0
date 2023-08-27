Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129A3789D30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjH0LNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjH0LMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:12:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E8C13E
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:12:44 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so3070271a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693134763; x=1693739563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2+EX0RxcwVmnF7KHWv8zJjpyFDFi3H3CVaoC8lb4p8=;
        b=pFmKBWqmn5K2ttU0UcnGUxoxg3z7pP1aXqMIx8/KmC9yb/7+zEqhlMXuS9eC/LrWgY
         utvNQ5jo9LT6Aq0rYc3ZjWBaVaOHgnyPcCFaXqCEq7ogGYdR8WP0JulcTeXbjYRkdkz+
         aQL0ZOPfKQzDiDiMj672bEF2bgfOnl/JLm1CJL2rKqihklcIYKoWck2J4xY9FMp4oRJc
         V+NA6hw6IS92G//nvNXTITyBOVfCmrqzfHEkG7w3wVusC/ZG0TsnpLggxjzvZkP0YO7T
         aQf5SOKPm3fxMySn+R105FyIPukUl2Y3O+5U3OGmMabAT9qGOqWzEWjtCidiBMgjyrfg
         uChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693134763; x=1693739563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2+EX0RxcwVmnF7KHWv8zJjpyFDFi3H3CVaoC8lb4p8=;
        b=bsh2KtCvu9DADmHEzYljp/G69z6oRf6X1hFiGGaIEdZ2v/R7IZMjs5GUdqTQs9i1T/
         F9/JIi7Q/j5Cm1I2H+B5/TTJAXM0FccEwi6i+Z2G+CUlFQKZfUiqLHtAaxpsQMqAob27
         W8axyAdlsuVTePOgVAQginS0xu6EAqLlg9clDlJHMIyzNPxG3Q2CGoCWZCjCOnWuU/zg
         izy6jM3eEnXzTJop2JiwuULFW/KB9yWh6tsWNUjJm+1+KM6U7o6BNSuqHFyrcWghsSw8
         arS11n3n7W1kXlnWKi2K52afQlMtGgDKXjUzu33byURGH2+U3S9V3Fw7YAUqE1HEd6xN
         XyQg==
X-Gm-Message-State: AOJu0Yw54jZDF2exT3waYQQQZfLUQKwMlfCI+oztIe24Wv2WDoeqZ5jY
        7E3T2LC3UbhGi8wq3S61vVeWRQ==
X-Google-Smtp-Source: AGHT+IFSDj8zGhF5GgWY46a+LzcuxyHxjOFJBWGa4tDlI3RKCWeWMy3xezYz3PlJ+XcfBQsNxmnCRQ==
X-Received: by 2002:a17:906:5daa:b0:99d:d4ec:6c5d with SMTP id n10-20020a1709065daa00b0099dd4ec6c5dmr17311263ejv.73.1693134762696;
        Sun, 27 Aug 2023 04:12:42 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id sd26-20020a170906ce3a00b00997d76981e0sm3309881ejb.208.2023.08.27.04.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 04:12:42 -0700 (PDT)
Message-ID: <74dcc5b4-dda2-5de7-9e58-4191a0fb7972@linaro.org>
Date:   Sun, 27 Aug 2023 13:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 03/38] dt-bindings: mfd: qcom-pm8xxx: allow using
 interrupts-extended
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
 <20230827005920.898719-4-dmitry.baryshkov@linaro.org>
 <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
 <CAA8EJppw0Kxo3W560ucWey959368M1c8BFnvF4Ggi5XKCOfesw@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppw0Kxo3W560ucWey959368M1c8BFnvF4Ggi5XKCOfesw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/08/2023 12:42, Dmitry Baryshkov wrote:
> On Sun, 27 Aug 2023 at 11:35, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 27/08/2023 02:58, Dmitry Baryshkov wrote:
>>> Allow using interrupts-extended, which is a preferred form of interrupts
>>> specification compared to the interrupt-parrent + interrupts pair.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>>> index 7fe3875a5996..33d9615e63c8 100644
>>> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>>> @@ -37,6 +37,9 @@ properties:
>>>    interrupts:
>>>      maxItems: 1
>>>
>>> +  interrupts-extended:
>>> +    maxItems: 1
>>
>> The entire patch is not needed. At least should not be needed. What
>> problem are you trying to solve here?
> 
> The main problem is the next chunk, which (currently) explicitly
> requires `interrupts' property. My goal is to allow
> `interrupts-extended' in addition to `interrupts'.

They are allowed. Why do you think they aren't? That's why I don't
understand what real problem is here.

Best regards,
Krzysztof

