Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCFE6586AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 21:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbiL1UYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 15:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiL1UYS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 15:24:18 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1600D1573C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:24:18 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id g14so17476069ljh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snr2mEVbtvt9/YULF8dU82exFUSnK9OhTwPmhp5otFw=;
        b=Vj/327wSacVZUKPPkf/g75nxhiAVAYMinU5wAxHVRxeBLQ6mC4TAGIAq1onOZZIg0G
         O9oV5YvhTLazpPDOTyRSv/LUhA4rY3MFMBjpBXtbSuFs2G0uotAm+M1mGqCuMZzMeggf
         HSvBhrEZtnHDTHEwlW6lau0/+/2hDl2BoDfjMrrLnyqzeTzF0trNDSJNKStT57q/pSg0
         LMGibMV/OkR2bTrrP5fEG1oJjNXrxiex9t+8IJpqlFD9MtbvLY4DUHe3ID/kqu7ML5QI
         VIjlQ2Ao/V/0ugR9+8MWMKR0OU9OQ3Qppo2SgdgN3cva1ndQ5v/7kOH7b5rzkYsorVaT
         2FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snr2mEVbtvt9/YULF8dU82exFUSnK9OhTwPmhp5otFw=;
        b=GfBI2miUoHH8rZUfUXbBvAglUgUgPyMl+BflX/Huw6sB459XcvwldcM30wmd04Ty09
         kkyIhFOkGVC8yIV7n4i1gdCFvqt+5bWYYT12T3RoWixkT4KyqGhZ6ItgY4H2p2lmj+vt
         9jD5JyIHIJwSy4KIy/TJyREGLkzxhd1yzso1auQgzbgb4dkwPszBp4bzzAjs4axeVwwX
         +sYbi934+wegFpBHWuRdMj6Hjmr8ZeUHsA/A7SkY4iDnzLnqZII5OsrFUARxUk3RZvNu
         i90kNLgebLSqaybmY80DlXHorxBArc1/Rr2BKZBcEYnYvsIpqQVRV7sgz6QTfzaWbizT
         zAMQ==
X-Gm-Message-State: AFqh2kpYUMbU8EwiUsySpr/Prmxwa4PvtQnQ33W5v0DIRNP3EJ9o0WUH
        kmaOfsfc8vE3YW0DYJ+UEEu11A==
X-Google-Smtp-Source: AMrXdXsgypinOeUbWGNon9W9+A8ZTrvB/pcXkb076Fan+JLA73XOIvGKp4+ftj0F8J22NgrYtqVUOw==
X-Received: by 2002:a2e:a311:0:b0:27f:b68e:9d99 with SMTP id l17-20020a2ea311000000b0027fb68e9d99mr4118205lje.32.1672259056362;
        Wed, 28 Dec 2022 12:24:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v11-20020ac258eb000000b004aa0870b5e5sm2791917lfo.147.2022.12.28.12.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 12:24:15 -0800 (PST)
Message-ID: <4b1c7bcd-b8e0-9405-c758-cc2294871b37@linaro.org>
Date:   Wed, 28 Dec 2022 22:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 03/12] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for APQ8084
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-4-dmitry.baryshkov@linaro.org>
 <dfc193df-a3ca-e03e-9fcf-b9d3f9fe76f6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dfc193df-a3ca-e03e-9fcf-b9d3f9fe76f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/12/2022 12:31, Krzysztof Kozlowski wrote:
> On 27/12/2022 02:32, Dmitry Baryshkov wrote:
>> Define clock/clock-names properties of the MMCC device node to be used
>> on APQ8084 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,mmcc.yaml  | 40 +++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> index e6d17426e903..fd926df80c64 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> @@ -137,6 +137,46 @@ allOf:
>>               - const: edp_link_clk
>>               - const: edp_vco_div
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,mmcc-apq8084
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: Board sleep source
>> +            - description: MMSS GPLL0 voted clock
>> +            - description: GPLL0 clock
>> +            - description: GPLL0 voted clock
>> +            - description: GPLL1 clock
>> +            - description: DSI phy instance 0 dsi clock
>> +            - description: DSI phy instance 0 byte clock
>> +            - description: DSI phy instance 1 dsi clock
>> +            - description: DSI phy instance 1 byte clock
>> +            - description: HDMI phy PLL clock
>> +            - description: eDP phy PLL link clock
>> +            - description: eDP phy PLL vco clock
> 
> This looks like exceeding constraints set in top-level (max 10).

Ack, I'll expand it for v2.

-- 
With best wishes
Dmitry

