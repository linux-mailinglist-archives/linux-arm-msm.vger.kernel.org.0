Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80CC5A5CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 09:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiH3HRi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 03:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbiH3HRg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 03:17:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30A6C650C
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 00:17:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z29so5718664lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3O0C0ibabQ2kzRRob/kKyfutI+yQz7ByGXq7nhg3wpA=;
        b=BqOadVrMSHIuZzrHmIfEvLiCtkExRNhBc64IOGtdT5KGjR2WfTfkRzYiyzq+CVenV2
         kLtM+B3Mg9hhdvpQ03c1wYV4t/LASTo20Yu5YYsYtsMhcAxXYQ1oRSe6IOjPEAl3bk3X
         8NqLHuKCZx1r02PK9FNNgYi6QRnu9lGTgid/MtcN67KCWo8Nax0AVkj6PHc9C6a+Po5H
         JzDhUHJsJHVaKC4vhu8N8TFxs2RFyrdU+iVZ3PYtDlq2FM1C6HucTTr5KWH4i4HPEu0h
         MolkuWFaJpFflbVCDdKHmcEBircjLTa3057dxkL8i9OLsRZiYXKZRBrPnlTPoqnkuslh
         tA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3O0C0ibabQ2kzRRob/kKyfutI+yQz7ByGXq7nhg3wpA=;
        b=l8iNUgAQEeKb+kok10Mj8C/QxJd0Audn3yg05kv270hKrvEmRqplYxdSgqxxRFvbln
         6UR3aUiYpNM3f2TtxZaPhOnZhi6cf4vfyJkAIAhWE/prluX9hoye0vKGl00z7TIWLE7q
         hBXqX4Zkw1QZdKbbVxxGAZcLT66PHLNecLatO9AQGkudVhalLfG4DEVbOw5Pz4DrZybj
         qVBiekgj/VKOb1wwoeXY9Z/Pp3+h7K9WSZFaNPtipyH3ocAOg2mLQuLAmJJEWh7w+HCo
         EKd69znVzEvGyGqUUT5XwYUA49WGkWb8GpcFW6J31ctuRJxVcKynvbt1cSel/gGso+Fm
         lm0A==
X-Gm-Message-State: ACgBeo0Yr3tIxnueC6T+hty/19GG0uumv3NUpPieRkkMDzLQ86KU4Ulm
        kFKKGdtZnh00KTMI8v5GITxyGA==
X-Google-Smtp-Source: AA6agR5zbBki4lnt2t/PPoo8jW6J/wS2qXXubnvPEktay27HaFWdk/1m0muXhWDDMZyRf+HuGdfVAw==
X-Received: by 2002:ac2:4c50:0:b0:492:e648:5bc0 with SMTP id o16-20020ac24c50000000b00492e6485bc0mr5351406lfk.288.1661843853195;
        Tue, 30 Aug 2022 00:17:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a22-20020a2eb556000000b0025e428ba415sm1661411ljn.38.2022.08.30.00.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:17:32 -0700 (PDT)
Message-ID: <993d642a-29aa-1c98-bb2d-ddade46caad6@linaro.org>
Date:   Tue, 30 Aug 2022 10:17:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 02/15] dt-bindings: clocks: qcom,mmcc: define
 clocks/clock-names for MSM8960
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
 <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
 <21efbf73-74af-8f80-3577-b82f39e161e6@linaro.org>
 <CAA8EJpp+pTPjFnGXaWvjUBFc=B9b=OwnHYUP33MNQOsaxwqk4w@mail.gmail.com>
In-Reply-To: <CAA8EJpp+pTPjFnGXaWvjUBFc=B9b=OwnHYUP33MNQOsaxwqk4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/06/2022 03:00, Dmitry Baryshkov wrote:
> On Fri, 24 Jun 2022 at 18:57, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 23/06/2022 14:04, Dmitry Baryshkov wrote:
>>> Define clock/clock-names properties of the MMCC device node to be used
>>> on MSM8960/APQ8064 platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../devicetree/bindings/clock/qcom,mmcc.yaml  | 31 +++++++++++++++++++
>>>   1 file changed, 31 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>>> index d02fe6dc79b5..c13243682365 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>>> @@ -82,6 +82,37 @@ then:
>>>       - clock-names
>>>
>>>   allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,mmcc-apq8064
>>> +              - qcom,mmcc-msm8960
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Board PXO source
>>> +            - description: PLL 3 clock
>>> +            - description: PLL 3 Vote clock
>>> +            - description: DSI phy instance 1 dsi clock
>>> +            - description: DSI phy instance 1 byte clock
>>> +            - description: DSI phy instance 2 dsi clock
>>> +            - description: DSI phy instance 2 byte clock
>>> +            - description: HDMI phy PLL clock
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: pxo
>>> +            - const: pll3
>>> +            - const: pll8_vote
>>> +            - const: dsi1pll
>>> +            - const: dsi1pllbyte
>>> +            - const: dsi2pll
>>> +            - const: dsi2pllbyte
>>> +            - const: hdmipll
>>
>> The clocks are listed in properties, so they have min/max constraints
>> set implicitly. Are you sure this now works fine?
> 
> I mentioned this while listing dependencies in the patchset description (00/15):
> 
> Dependencies: [1] (whole series), [2], [3]
> [...]
> [2] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-2-dmitry.baryshkov@linaro.org/
> 
> This patch moves clocks/clock-names to the conditional clause.

Krzysztof, as now the dependencies have landed into Bjorn's tree, could 
you please take another glance onto the bindings?

-- 
With best wishes
Dmitry

