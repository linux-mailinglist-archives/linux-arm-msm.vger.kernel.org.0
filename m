Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4C859E477
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbiHWN2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 09:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232577AbiHWN1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 09:27:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966B8153D2D
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 03:27:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id s6so7811558lfo.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=c1dA5oASWGj0rrUZ/WWyyCO38Uiq0TAfsSxGYmfkPlY=;
        b=pJou0ZXsL1X+99tYH/vTpA2PAeq8TQDtnnogZ2rT/Gn4lNZu9+uWGqmUq28zaFjoW6
         1Xv2tfJrgzApfi1rTqb+a4Kb3sH2AsyD34KBsrjbLezWjFOzFxhW1Ts93ES6j9z4evOD
         2Otl/3yI1hHdn+tr0dvn+QQbGkfb5V+/i6E8YbbghU0fchDUg5GRjmNWLW+0+QS6LLr9
         qpR9XOygAvLdBbbQgd2azeymUwWj4VSagVxzULPtVjIdlmLU1Op5nj+empBcEx3R27ym
         GlZt6nWioLJSfZaizWat8u6OoABAC2mQKeXUD9ryImR8pgT2FoHeWfUyvLdEMUCTHj0g
         /CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=c1dA5oASWGj0rrUZ/WWyyCO38Uiq0TAfsSxGYmfkPlY=;
        b=FagTQqy69BH4wYv+n+SV6/tdrIXklsJPcWzJoV40X+5NDAJnihT7zCLo16GjA9tWfp
         aMYCndlqacHu3eDmIFqS1GtG26KQOSW0SQV2Do0oyb0jBjf5hBpb9Sxb1Emx6uRBOFUI
         uJ9cK8lhwaSKBd69HIKciUQXywajN7exMMu4eP+I853RrIrv7cz/f4PdjFCUHqrfe3nh
         epuZ6dhjmkqywQMbA+YXm/z3uV6PCV2A0wxSY1OucB/iQ2qwE4PWX8f52vm4q2N/1YNx
         ylRM859Ik1ZMtcom1HF6A1uq2FZCW7LivI+M+KCdI66A0UUNnif6mQTFpBNsLE3/oWUX
         SEQA==
X-Gm-Message-State: ACgBeo3PlGWjXARGzTnasoJ32E5aRaAlZBGYoG5uM8PZWufX8I/Zz5HB
        aOTupzBgVyO/fB9GbPcu+iT+rQ==
X-Google-Smtp-Source: AA6agR7wM+x9s2G0l80E0LnJODLA/PG74+Qk16IJ5VwKsCc/MbDJLPh5C/Qmli+xGAgcR8f845D2Tw==
X-Received: by 2002:a05:6512:258b:b0:492:f472:3058 with SMTP id bf11-20020a056512258b00b00492f4723058mr857168lfb.337.1661250377095;
        Tue, 23 Aug 2022 03:26:17 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id a16-20020a056512391000b0048aa9d67483sm2437921lfu.160.2022.08.23.03.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:26:16 -0700 (PDT)
Message-ID: <2d6a6603-ae0b-6874-d92a-eeebef6abf17@linaro.org>
Date:   Tue, 23 Aug 2022 13:26:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] dt-bindings: display/msm/gmu: account for different
 GMU variants
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
 <7b504ecb-b05a-549e-e2ce-18c539f68655@linaro.org>
 <a3a917b3-5dfc-761e-e5f6-5955c89db4a4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a3a917b3-5dfc-761e-e5f6-5955c89db4a4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2022 20:58, Dmitry Baryshkov wrote:
> On 06/07/2022 18:52, Krzysztof Kozlowski wrote:
>> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>>> Make display/msm/gmu.yaml describe all existing GMU variants rather than
>>> just the 630.2 (SDM845) version of it.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
>>>   1 file changed, 146 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> index fe55611d2603..67fdeeabae0c 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> @@ -20,35 +20,24 @@ description: |
>>>   properties:
>>>     compatible:
>>>       items:
>>> -      - enum:
>>> -          - qcom,adreno-gmu-630.2
>>> +      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>>>         - const: qcom,adreno-gmu
>>>   
>>>     reg:
>>> -    items:
>>> -      - description: Core GMU registers
>>> -      - description: GMU PDC registers
>>> -      - description: GMU PDC sequence registers
>>> +    minItems: 3
>>> +    maxItems: 4
>>>   
>>>     reg-names:
>>> -    items:
>>> -      - const: gmu
>>> -      - const: gmu_pdc
>>> -      - const: gmu_pdc_seq
>>> +    minItems: 3
>>> +    maxItems: 4
>>>   
>>>     clocks:
>>> -    items:
>>> -      - description: GMU clock
>>> -      - description: GPU CX clock
>>> -      - description: GPU AXI clock
>>> -      - description: GPU MEMNOC clock
>>> +    minItems: 4
>>> +    maxItems: 7
>>>   
>>>     clock-names:
>>> -    items:
>>> -      - const: gmu
>>> -      - const: cxo
>>> -      - const: axi
>>> -      - const: memnoc
>>> +    minItems: 4
>>> +    maxItems: 7
>>>   
>>>     interrupts:
>>>       items:
>>> @@ -76,6 +65,9 @@ properties:
>>>   
>>>     operating-points-v2: true
>>>   
>>> +  opp-table:
>>> +    type: object
>>
>> instead: opp-table:true
> 
> Wouldn't this allow e.g. using just 'opp-table;' as a flag?

You're right and Rob also corrected me. Your original patch was correct
(type:object).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
