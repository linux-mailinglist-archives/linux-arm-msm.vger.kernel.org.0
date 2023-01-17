Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1EE5670B89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 23:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjAQWSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 17:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjAQWRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 17:17:14 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD36E3FF11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 13:58:41 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id v6so35720581ejg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txGdDzUac92pqSWXdQlchfy3R9bwdZSF7lrIlBLtnf0=;
        b=zvLJC9262oshfH0qHkMFmMxm+AP+JnbyhoYphCttXndwDgpsU++Fh8HyLEzzbV/Tcg
         GM7xOF0MQMeryLO78JsF0m+RFvR5S/LaM5g90QTQmw/JTmzWVdySK/6Z2N8XqK6ebrhK
         BgFgDSgzTejngffKJ4290DX/2wbmH1YIWgZiOXYkdGHF8IXTxvJ7yAj7JPT0h0o2xRGV
         VlePIyV1n2ka5uE4Hjo2SV+QwKPZ50wdZ5daSRGRzyEmz7fHTodemNZmQcZQMDvTedDb
         gyv+hyDLjyUorL5fw2Q4Q3iKSJZ7OR0yT6LK+V5MHk0YUdZBkQ5TZVxezdmD2wGt1W4o
         mQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txGdDzUac92pqSWXdQlchfy3R9bwdZSF7lrIlBLtnf0=;
        b=IUSD7WiyDddJMvPJdfrhACGgIAedQL3C3eyFkihlB1k6cf+7WWRFjAzAlCImD3Zw8s
         ++dWcJy6NkmvRLI8dM4NqqF7yrKNY54x4rOS/rn4EsQbuwd9jZJiyembLwP7id1MkJTH
         P7QryjXlLGAmgctnp9eyp4zMbnDWxGuionXcgk8NxxqOxtzA2z81OP/iVZ+kE+dG35MB
         k6khaI+jHsFsGjI/9hz6/Zik97IYu3lOfZwyVAIhmebWDSgbXeO+e2FIyNAnYRPuVEvv
         oqUBI8Q/ugk6/at0MWVtnBBlXpvywWbHEOmM3RRZjRPEA1buvrLNMDQGT6XxC/IqBuQq
         M9Ng==
X-Gm-Message-State: AFqh2kqikJp6mDSNOXCYd66lEWVTZfn1LKBKvG9xHgdc8mjDkEfxnp0x
        2+hmComEmaZMF/+5pekuc+7P25KBDIEkBxi3
X-Google-Smtp-Source: AMrXdXsKVD6gHfiuaL4Os5vPq+eVVULRrsLQxcntuwbs7qCmWl/JkyRQsk1P2JGnim+usLSjboxZBQ==
X-Received: by 2002:a17:907:1759:b0:85e:c4e4:cfbf with SMTP id lf25-20020a170907175900b0085ec4e4cfbfmr4575430ejc.15.1673992719265;
        Tue, 17 Jan 2023 13:58:39 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kz11-20020a17090777cb00b007aece68483csm13772544ejc.193.2023.01.17.13.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 13:58:38 -0800 (PST)
Message-ID: <3579f89a-895c-d0a0-ce86-4e66881f0c99@linaro.org>
Date:   Tue, 17 Jan 2023 23:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] dt-bindings: mailbox: qcom: correct the list of
 platforms using clocks
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
 <20230113090739.45805-2-dmitry.baryshkov@linaro.org>
 <aa5598ee-0dd1-caa7-c60d-5a409f039713@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <aa5598ee-0dd1-caa7-c60d-5a409f039713@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 13:34, Krzysztof Kozlowski wrote:
> On 13/01/2023 10:07, Dmitry Baryshkov wrote:
>> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
>> and qcs404. Correct the list of platforms in the corresponding clause.
>>
>> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/mailbox/qcom,apcs-kpss-global.yaml          | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> index 943f9472ae10..b8a44ef0540f 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> @@ -71,15 +71,8 @@ allOf:
>>           compatible:
>>             enum:
>>               - qcom,msm8916-apcs-kpss-global
>> -            - qcom,msm8994-apcs-kpss-global
>> -            - qcom,msm8996-apcs-hmss-global
>> -            - qcom,msm8998-apcs-hmss-global
>> +            - qcom,msm8939-apcs-kpss-global
>>               - qcom,qcs404-apcs-apps-global
>> -            - qcom,sc7180-apss-shared
>> -            - qcom,sdm660-apcs-hmss-global
>> -            - qcom,sdm845-apss-shared
>> -            - qcom,sm6125-apcs-hmss-global
>> -            - qcom,sm8150-apss-shared
> 
> And what in other case? Any clocks? They should be moved to their own if
> forbidding the clocks and clock-names.

Ack

-- 
With best wishes
Dmitry

