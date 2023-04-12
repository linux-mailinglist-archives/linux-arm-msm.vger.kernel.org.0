Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E996DF214
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 12:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjDLKfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 06:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjDLKfB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 06:35:01 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A63F59ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 03:34:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t20so14035699lfd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681295697; x=1683887697;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4HYP1E62hZMod1XVNBzfyD/sK2aIAa5ZCyJ04UGDkE8=;
        b=MXIhSo/wAmI6d3Prg/WfOICdVN4TkNa/122j2dZPh703T6YEtMk8tdP20jFagefEHS
         53M7rK/CD1hDdlV8naz1A4ijkp8BpWou9r3icDTH5vDOMeuhpcR+dGqLOZcBE2fpQxVS
         R3gaICweFaG244TfSAU1YKelRJTJXaYRCbh7I1WE6MIUh6Ctk+z4i5cWTsLYnjEp1w18
         LmEiN03r9dLBnQR47Ii1d79Wz0aXFPuuLg0fTygtDLoIKwfRUgcpEvwZxvgqAYzfSsOm
         LZ7Ahbe1GFvg7Hiusf0L93G6Mw1k7O3UdpL1vNeFN2Kc/4rd+F7hriniQL1AgP+MPDi7
         Nh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681295697; x=1683887697;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HYP1E62hZMod1XVNBzfyD/sK2aIAa5ZCyJ04UGDkE8=;
        b=L1im6B3ntSO/XP/03TuHmNPvpVsqYmbri1C9jkQy8Viv41PskNgXbiM1KLZoGpxEa9
         c9mmYqQgWmmNyC1dh4ofpWw8Seh++qFmI3XVwOyA2JjsWs7JDIKePXj2p2IgrpeERu5N
         7Ax1IQ+XMq7Li67VmKTzeCfIy5mzrylTqpumSNsdTa65f3E5DkH22sa73eLUbHIdc+JO
         S3X4Kq114Tlq+QXnHsViuJfh/rgext2BlYL453ID9kBNF6a3FdaDWBO+Tod/M22W8cDk
         y3sCDZoAgIUL0Mk0/FXWuU3WY0a39Ge+7rfbLDr8HHEsfkbyDUROSknoMl5IyjTCj7uJ
         0qkQ==
X-Gm-Message-State: AAQBX9dzRdPssXsNDXq7S7Rxuw5WjjPkX89LYlVeTHVjomCCe4+FxRis
        9N2czkNuTKy0vpAVZ6HexT2wqA==
X-Google-Smtp-Source: AKy350Y/y0xS8SNG2pWuCP31NpheHI341wXm1QiuOUJaGfor+CBT+sfNXYDCnxVWvKbYdnxxgeAQng==
X-Received: by 2002:ac2:5e91:0:b0:4eb:29b0:1ca4 with SMTP id b17-20020ac25e91000000b004eb29b01ca4mr474557lfq.8.1681295697594;
        Wed, 12 Apr 2023 03:34:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id t11-20020a19ad0b000000b004dc4d26c324sm2935225lfc.143.2023.04.12.03.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 03:34:57 -0700 (PDT)
Message-ID: <40ccea6a-c536-82ba-3f97-634cbc9a5869@linaro.org>
Date:   Wed, 12 Apr 2023 12:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom,gcc-sc7180: document CX
 power domain
Content-Language: en-US
To:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230408134820.76050-1-krzysztof.kozlowski@linaro.org>
 <20230408134820.76050-2-krzysztof.kozlowski@linaro.org>
 <4757c33c-7e71-262d-a51a-c5f9fb53ff41@linaro.org>
 <d4a8054c-443e-d9ba-9641-ff721254d254@quicinc.com>
 <c70c1a4d-50c5-2b50-18c9-7c46c3803cd4@linaro.org>
 <2f9f9cdd-cfbe-ca22-7308-d6b1f0c1c455@quicinc.com>
 <6406469d-289b-af4e-83f8-8259f5dcaf00@linaro.org>
 <40854a28-3f64-c0fd-9b77-db92cb0fbe13@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <40854a28-3f64-c0fd-9b77-db92cb0fbe13@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.04.2023 07:42, Rajendra Nayak wrote:
> 
> On 4/11/2023 7:15 PM, Konrad Dybcio wrote:
>>
>>
>> On 11.04.2023 15:31, Rajendra Nayak wrote:
>>>
>>> On 4/11/2023 4:57 PM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 11.04.2023 06:56, Rajendra Nayak wrote:
>>>>>
>>>>>
>>>>> On 4/8/2023 7:33 PM, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 8.04.2023 15:48, Krzysztof Kozlowski wrote:
>>>>>>> The GCC clock controller needs CX power domain, at least according to
>>>>>>> DTS:
>>>>>>>
>>>>>>>      sc7180-trogdor-pompom-r3.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>>>>>>>
>>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> ---
>>>>>> +CC Rajendra (author of 5d6fc6321db1 ("arm64: dts: qcom:
>>>>>> sc7180: Add required-opps for USB"))
>>>>>>
>>>>>> Rajendra, shouldn't SC7180 GCC have PM ops to make sure a vote
>>>>>> is only there when AP is active?
>>>> So IIUC, CX is never supposed to be shut down?
>>>
>>> Atleast sc7180 and sc7280 do not support full CX shutdown (or power
>>> collapse as its called), it only transitions to a Retention state
>>> and even that in the system-wide suspend path only
>> And won't outstanding votes on that resource prevent the system
>> from entering a system-wide low power state?
> 
> I think most of what you are asking was discussed at https://lore.kernel.org/all/5ff21b1e-3af9-36ef-e13e-fa33f526d0e3@quicinc.com/
> 
OK so 7[12]80 never actually power off CX fully. Understood.

> Are we seeing something broken on sc7180/sc7280 platforms?
I don't know, I don't have any devices. I'm just asking questions
to make sure things weren't unintentionally broken.

> If there is an outstanding vote on CX it would prevent CX from
> going down, but ideally we should not have an outstanding vote
> from USB (atleast) since we now support RET for the USB GDSC.
> If there is some other GDSC (within GCC) thats left turned ON,
> yes, that would still prevent CX from going down.
Makes sense!

Konrad
> 
>>
>> Konrad
>>>
>>>>
>>>> Konrad
>>>>>
>>>>> hmm, I am not quite sure why we would want the performance votes
>>>>> from peripherals dropped when CPUs go down in idle?
>>>>>
>>>>>> Are all GDSCs powered by CX?
>>>>>> If not, wouldn't this also need power-domain-names to
>>>>>> facilitate e.g. potential MX-powered ones?
>>>>>
>>>>> For sc7180 GCC, yes.
>>>>>
>>>>>>
>>>>>> Konrad
>>>>>>>     .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml         | 7 +++++++
>>>>>>>     1 file changed, 7 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>>>>>>> index 06dce0c6b7d0..8bf9b6f49550 100644
>>>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>>>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>>>           - const: bi_tcxo_ao
>>>>>>>           - const: sleep_clk
>>>>>>>     +  power-domains:
>>>>>>> +    items:
>>>>>>> +      - description: CX domain
>>>>>>> +
>>>>>>>     required:
>>>>>>>       - compatible
>>>>>>>       - clocks
>>>>>>> @@ -45,6 +49,8 @@ unevaluatedProperties: false
>>>>>>>     examples:
>>>>>>>       - |
>>>>>>>         #include <dt-bindings/clock/qcom,rpmh.h>
>>>>>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>>>>>> +
>>>>>>>         clock-controller@100000 {
>>>>>>>           compatible = "qcom,gcc-sc7180";
>>>>>>>           reg = <0x00100000 0x1f0000>;
>>>>>>> @@ -52,6 +58,7 @@ examples:
>>>>>>>                    <&rpmhcc RPMH_CXO_CLK_A>,
>>>>>>>                    <&sleep_clk>;
>>>>>>>           clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
>>>>>>> +      power-domains = <&rpmhpd SC7180_CX>;
>>>>>>>           #clock-cells = <1>;
>>>>>>>           #reset-cells = <1>;
>>>>>>>           #power-domain-cells = <1>;
