Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F426887EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 21:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbjBBUAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 15:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbjBBUAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 15:00:30 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04308003D
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 12:00:25 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id m8so3182967edd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 12:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NoqwPWGdPAAWq3tFe6UZV9Xjkz8TFbiEHT4UnURl68=;
        b=Tn28cTUSKVUffrD7pCt/S1MhVB2RkrGSUwZX/JySWEYfCCwjY0OGIbyUa/ZCwJFffY
         apfQkcw3TMBqChoq4X37lw40vtgOLTx0jwMxK7xd21TYs7M7uNtqkxqK6tJTIA4jbk3F
         lr0s8xjSde00oNu5sxyac8YAn4DJakT1oN6Njx39tGn6hpYtheIen5hx2aqhR6Q6XWgZ
         JJBKXwZVfTZd4jDAnnZFQ26FFZJYJz5Xq7PSi5/c9He0Q22yjnj0KWOcTs5yvPthItKq
         kNmTSaCq/aB65gkTgiS8uHjYmW/GwH25E6jurgCa8WKKM7cVdmra1RyC1mbhWMD2PaVB
         mOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NoqwPWGdPAAWq3tFe6UZV9Xjkz8TFbiEHT4UnURl68=;
        b=dfzpfVgTxapyKH5oqRoDHIDuhiOl1g/yMvU+LI0N2YDHGWxUzTzq0PV+8707F03KZT
         aL0RHRcm0HFcQRWi2xXiWU6jqlNahIwRJWW3CiX73JUrFAcmJnSiQUKwEN8PYd/3r5Tz
         zd2+RDF/f/uL56MQDqWLmDjAk7j1iB6aDrS/jSJMvFCc2bt8cXdGEM38Te3cEJx7hmh3
         fWsG8IMofWe/YOtEREkSjc+WthHZ9S9s0+3XdAfwiCjLZV0eLvVjXcFQMc2Ia92eK/oj
         iO1xH6fBHWJ8w1kMmKlol57N4QQk0F3/uyvELjjAOce3kR6bbG2CUlt43YO/EZiJDXHr
         FQLg==
X-Gm-Message-State: AO0yUKWYn42MMTtmw9sj8acW4ZUxCb6f9VmYCejhd6YdHvybWiA1eZcu
        jCqP8ngGl2pEad3gpf0KtDqAUA==
X-Google-Smtp-Source: AK7set+rkkWRJNhGP6gyYP8lfc64qT2+M4TGBD1kvog85pXPp56JMHboaZCnQxFv3pufpNjZiZNnxQ==
X-Received: by 2002:a05:6402:5288:b0:49d:a87f:ba7b with SMTP id en8-20020a056402528800b0049da87fba7bmr7635461edb.39.1675368024344;
        Thu, 02 Feb 2023 12:00:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id el8-20020a056402360800b004a2470f920esm160692edb.25.2023.02.02.12.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 12:00:23 -0800 (PST)
Message-ID: <8766f07e-a5d2-b59c-d130-f8cc2da64556@linaro.org>
Date:   Thu, 2 Feb 2023 22:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/6] dt-bindings: mailbox: qcom: add compatible for the
 IPQ5332 SoC
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-5-quic_kathirav@quicinc.com>
 <3a346606-576b-ab89-78f5-5bbaca729090@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3a346606-576b-ab89-78f5-5bbaca729090@linaro.org>
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

On 02/02/2023 17:35, Krzysztof Kozlowski wrote:
> On 02/02/2023 15:52, Kathiravan T wrote:
>> Add the mailbox compatible for the IPQ5332 SoC.
>>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
>>   .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> index 943f9472ae10..8d8cd1bbe67e 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> @@ -18,6 +18,7 @@ properties:
>>       oneOf:
> 
> - items:
>      - enum:
>          - qcom,ipq5332-apcs-apps-global
>      - const: qcom,ipq6018-apcs-apps-global
> 
> and drop the next patch

Is it still ok even if the two devices are not fully compatible (iow, 
using different PLL types)?

-- 
With best wishes
Dmitry

