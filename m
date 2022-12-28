Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415326586AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 21:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbiL1UXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 15:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiL1UXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 15:23:21 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C87A1573C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:23:20 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f34so24983930lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpKCaW3wuzKUXhWkvFOm3Ad81fixeY/4fQoaCaSrMK4=;
        b=xdxWtCxyV0uRN+WWy2jdGw1ciyJ7Vdtr4SKvZE8dgwyYDKQoqFg0eSFRZVfoQ62mp3
         5oUW0Kb1xRsWdlozt7wkuTd4XYdxJ+70zQCfervo/KFqfvpQBe59MuepBdL5gxbf6/Ys
         bsFDzUKPpiHBXXdkCScW3Y8tX5r+jKkfGBFNUl4oGaCD4R7CppKRvBQBiiZ5b5J4XjF1
         6taYmKYHBfZaJbNPTb6LZYtQvUWU/rV1MGv/liN9BUYArP9Qjm/LRJPnLLiPk8Wl+ef7
         8tyNQT2++1uwzQTFOoGwM+Zzy8AFXX6tZWBL/QZcZDyY3btBjV8Z4VFoGFftrDA8+9BG
         TGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpKCaW3wuzKUXhWkvFOm3Ad81fixeY/4fQoaCaSrMK4=;
        b=xCQrKJfc3FoLo8HVx9Lp2k7T7mnnFvqCSmIXIHTQdbu568G5xtTSuaSokpqnTdnC5l
         bLeU1/Xxdm5C7KoTy7EOBHzkJPuJsaqu1D/TB6hSHhMUuiwD8ZEN7V9+J8t3COXWxiT4
         pEVhLG4GGC3wFdZoIWQR8DtKaNRq+b9crFs4edLIOcQlE6MP0vmiP2iCxN63B6qggwPI
         D7pRwfrkHn84tYbUGm/V3ESOtZBQS9/ApwLjqph0MzIq9xXdPnPmvfHXhKj5RT4sSybu
         roLUsE528U7bb/h23vBGqQ3BFVrpIJtme+e50ksM5xA8Yu7E1YmmT+GwKwOImOmAuHCA
         TlKQ==
X-Gm-Message-State: AFqh2kpr9bqsJpZZo9exiEpSJTVaM7zxrDjO5Is5JKNZIfn4jKBFzd2m
        I4/2wyKz1RvGTO9yAEhpjFqfng==
X-Google-Smtp-Source: AMrXdXtcG+rqV76g0AimrIZqhqVXm/gBj+9hdpMittqVzRFq7YWL5F3FWjCa7SIiArSZzfDedL+CIg==
X-Received: by 2002:a05:6512:1305:b0:4cb:e52:d1ac with SMTP id x5-20020a056512130500b004cb0e52d1acmr2498577lfu.20.1672258998655;
        Wed, 28 Dec 2022 12:23:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z12-20020ac24f8c000000b004b567e1f8e5sm2784966lfs.125.2022.12.28.12.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 12:23:18 -0800 (PST)
Message-ID: <41788ef8-8bea-6a9d-d8cd-0953ba0aafad@linaro.org>
Date:   Wed, 28 Dec 2022 22:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 01/12] dt-bindings: clock: qcom,gcc-apq8084: define
 clocks/clock-names
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
 <20221227013225.2847382-2-dmitry.baryshkov@linaro.org>
 <262fb9c4-c7d3-989f-c3fb-3e36da26b081@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <262fb9c4-c7d3-989f-c3fb-3e36da26b081@linaro.org>
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

On 28/12/2022 12:30, Krzysztof Kozlowski wrote:
> On 27/12/2022 02:32, Dmitry Baryshkov wrote:
>> Define clock/clock-names properties of the GCC device node to be used
>> on APQ8084 platform.
>>
>> Note: the driver uses a single pcie_pipe clock, however most probably
>> there are two pipe clocks, one from each of PCIe QMP PHYs.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,gcc-apq8084.yaml      | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> index 8ade176c24f4..02a856f14fbe 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> @@ -25,6 +25,30 @@ properties:
>>     compatible:
>>       const: qcom,gcc-apq8084
>>   
>> +  clocks:
>> +    items:
>> +      - description: XO source
>> +      - description: Sleep clock source
>> +      - description: UFS RX symbol 0 clock
>> +      - description: UFS RX symbol 1 clock
>> +      - description: UFS TX symbol 0 clock
>> +      - description: UFS TX symbol 1 clock
>> +      - description: SATA ASIC0 clock
>> +      - description: SATA RX clock
>> +      - description: PCIe PIPE clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: sleep_clk
>> +      - const: ufs_rx_symbol_0_clk_src
>> +      - const: ufs_rx_symbol_1_clk_src
>> +      - const: ufs_tx_symbol_0_clk_src
>> +      - const: ufs_tx_symbol_1_clk_src
>> +      - const: sata_asic0_clk
>> +      - const: sata_rx_clk
>> +      - const: pcie_pipe
>> +
>>   required:
>>     - compatible
>>   
>> @@ -38,5 +62,24 @@ examples:
>>           #clock-cells = <1>;
>>           #reset-cells = <1>;
>>           #power-domain-cells = <1>;
>> +
>> +        clocks = <&xo_board>,
>> +                 <&sleep_clk>,
>> +                 <&ufsphy 0>,
> 
> No IDs available yet?

No. I didn't add IDs to the UFS symbol patchset. And anyway apq8084 
seems to use different amount of UFS symbol clocks (4, while other 
platforms use just 3).

-- 
With best wishes
Dmitry

