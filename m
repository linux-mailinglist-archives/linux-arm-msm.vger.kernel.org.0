Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F680730AF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 00:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbjFNWuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 18:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbjFNWtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 18:49:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3DE1FFA
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:49:48 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b344476595so18507441fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686782987; x=1689374987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLDzJSxQZskr0Cl4XkH1ZSWbdavJeb1yjH9huK60JGU=;
        b=iFNpS9TkjHbDcvpZX8+Kh6A/ZKdU0v8OccZXmYrctkpTbWirXpm74PxldYCTNEf79q
         uBI/OPJQjWU+k6qvYvOEaAuWfmX+8h2K5+mJgxmVqXlT0oWB++ZgFmSU92hg6z708TDD
         fRpAvQErMSVxFiED7s2t3lVr1jd/y3Je4i7GrLmBmqpzH5AOyvwaJX3mA+2IdMxq/+D0
         Gpz7t/6DsFpARW3dGvjihmwJUGxkuZwwYIzhzUB6USvtbyjoSzRU11XuN5QNB6VJl+SB
         t3PM0Cdbq3yAHMcMrXFucWy4yjAyPI1lvlGmKR5fJJ+PmyHvSH0US8YV+Cy0YH+PkLMh
         taOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782987; x=1689374987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLDzJSxQZskr0Cl4XkH1ZSWbdavJeb1yjH9huK60JGU=;
        b=jjcqzeH0kD6qBwXTQtncvQvynzsqkF+/6bSD/lU1H+jhmxqKHhnXyUdKUXRVrn8QK8
         3qhmOHAy+ALd1+HQ66J+d4Avd3GUy2/TcL5nn9pSsaAaoYW5398OAyaThBEGZvCzsIgu
         19eKwfOoCFegqv/HIskeDSgS4byBymE4eJpv0nzLIqPSGla2ML+hvT+XndfZmq9dFLr3
         DUx2MlJhZPPcDEycn4ukEOUXET7dzf3kAs8pmvgv1onJE4lAIpUZapP6dW93DsOlhNzQ
         wEhLGrHFtnIVVcjk9Co/eevG9t0f8DVvPYt75o5yuK6vP7Pqa73bRfOrBes//JF1utKK
         DVbQ==
X-Gm-Message-State: AC+VfDySQnuxphvdc2s9vFuszNvRZQigCRO4jSbdHrSi+364MwQ5emDq
        ZM0mJBMp8Vlm7HnV/fXp/ojGpA==
X-Google-Smtp-Source: ACHHUZ4+0MirKpPxCOYertoARVhJCSV5Rvf1vp9RpZH7q+j92Tud1zhaLDAPPNMsAEIXsHfR0m5mcw==
X-Received: by 2002:a2e:3305:0:b0:2af:2466:1c18 with SMTP id d5-20020a2e3305000000b002af24661c18mr7682604ljc.18.1686782986787;
        Wed, 14 Jun 2023 15:49:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j14-20020a2e824e000000b002b1a4238c96sm2765969ljh.128.2023.06.14.15.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 15:49:45 -0700 (PDT)
Message-ID: <e70520a9-6c97-07b3-326a-6fa80aad0d6a@linaro.org>
Date:   Thu, 15 Jun 2023 01:49:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/18] dt-bindings: soc: qcom: qcom,saw2: define optional
 regulator node
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
 <20230612053922.3284394-4-dmitry.baryshkov@linaro.org>
 <e48f6153-0485-9fb9-5fe0-145251a8b367@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e48f6153-0485-9fb9-5fe0-145251a8b367@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 19:05, Krzysztof Kozlowski wrote:
> On 12/06/2023 07:39, Dmitry Baryshkov wrote:
>> The SAW2 device can optionally provide a voltage regulator supplying the
>> CPU core, cluster or L2 cache. Describe it in the device bindings.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,saw2.yaml | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
>> index a016242367b9..b809a9cc0916 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
>> @@ -47,6 +47,10 @@ properties:
>>         - description: Base address and size of the alias register region
>>       minItems: 1
>>   
>> +  regulator:
>> +    $ref: /schemas/regulator/regulator.yaml#
> 
> There was such property in the binding (and DTS!) but a bool. Previous
> patch silently dropped it, so re-introducing it with different type is
> confusing.

Could you please propose a better name here? saw-regulator? Or maybe 
regulator-saw? (as we might get regulator-avs at some point).

-- 
With best wishes
Dmitry

