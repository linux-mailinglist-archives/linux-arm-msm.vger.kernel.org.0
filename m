Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41C2662500
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 13:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbjAIMGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 07:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbjAIMGl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 07:06:41 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D19663E9
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 04:06:39 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu8so12602172lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 04:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joP/xe0vBLETwzOfevjnNpLhtrO+p4Lr0/GxR/2WnIA=;
        b=XkM5f1ykYr0v3urWCm5lYhpRdOGphKNr1rly+eLH/2nLEJuYH2n9A3Ls8544BvXfcj
         HD5dLIJYwam8xP/IB0nqLKxix8IJQOTJ8oh4dzMKFwVBqclsYJd/eI05ILGcMoaGMON/
         6+67ed139DRScELgGsXk+6tVEk8PCeibFqScGraJNpPNRXq7WmDEKYl38lq4tScVfNgX
         ui0va4aWNBiEmr0wtHVqfcsuy3OJCuPKGF35pLFyA+1FAFOURk2/EMksa6gACGW5SOBe
         sPnUdh+SGRDGon7vloYrCAY761MDW7V250E7u5ZNPq+LQTTY2J0J1sHtLvfJufPSaFfc
         t95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joP/xe0vBLETwzOfevjnNpLhtrO+p4Lr0/GxR/2WnIA=;
        b=4XqBX4kp4K+/F5IVwPX/iV7xsuCpXa6PWmsAZ5JVgLvPoDcW2gaUODXpeI8/tpW50f
         tMsT6LRmvnIoKwO9fygG7OXD9dM8s74N8I6kX4NR8aoUM3uYLrAfAq5tRF/HPKB5qkSb
         i4ewimS1a5wIOPQo6s2Gx+JX8T8d1DQzAG4Ael/PXKRxhvF4nDGdUSfTtJIXavUDbuBJ
         nAFb3kcW7l2cuXs+2utHGiKe/UqtMzyMn/Amp7TTOGTyuJnC9oY2pWSaRIvi8LWkGSI9
         AHY2pZr9ekbt0LRJHLcLNR/1ENfPrHhFC/pdyH7HxxJadmAYcYlxiBDIPh3AbCU0q1C3
         1jww==
X-Gm-Message-State: AFqh2kq4rIIq2jQDepJx3uKOg/Rr+uCphUDFbVIwU3dbQ5PJvrf7KZ92
        UT4KKyYy64ronWInyNuyMwIUklT5Wrd3Xg5G
X-Google-Smtp-Source: AMrXdXtnFmJ4+luNKLROf+VCWUG7lrP8/p1JWvEsR948akalVLAopUpQKtw5rLGynf7gAKm1sQt/JA==
X-Received: by 2002:a05:6512:b25:b0:4b4:b8fc:4ac5 with SMTP id w37-20020a0565120b2500b004b4b8fc4ac5mr19850723lfu.3.1673265997851;
        Mon, 09 Jan 2023 04:06:37 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g12-20020a0565123b8c00b004aa543f3748sm1576310lfv.130.2023.01.09.04.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 04:06:37 -0800 (PST)
Message-ID: <8c3d50bb-68a7-ebde-8d9d-4a416bfe3636@linaro.org>
Date:   Mon, 9 Jan 2023 14:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: add core clock to the
 mdss bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
 <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
 <3414e686-9f8d-a29d-6cc1-f073b70a9f1c@linaro.org>
 <5a58eabc-08ba-57da-290d-b432f3f99268@linaro.org>
 <0b630735-c3fd-d71f-ce90-f20046c38879@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0b630735-c3fd-d71f-ce90-f20046c38879@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 13:20, Krzysztof Kozlowski wrote:
> On 09/01/2023 11:51, Dmitry Baryshkov wrote:
>> On 09/01/2023 12:35, Krzysztof Kozlowski wrote:
>>> On 09/01/2023 01:52, Dmitry Baryshkov wrote:
>>>> Add (optional) core clock to the mdss bindings to let the MDSS driver
>>>> access harware registers before MDP driver probes.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>>>>    1 file changed, 26 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>>>> index ba0460268731..0647fc5a7d94 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>>>> @@ -45,17 +45,11 @@ properties:
>>>>    
>>>>      clocks:
>>>>        minItems: 1
>>>> -    items:
>>>> -      - description: Display abh clock
>>>> -      - description: Display axi clock
>>>
>>> Not related to this patch, but it is a bit surprising to see AXI clock
>>> optional.
>>
>> Hmm, There is one defined downstream. Probably we should fix that (but
>> yes, it's a separate issue).
>>
>>>> -      - description: Display vsync clock
>>>> +    maxItems: 4
>>>>    
>>>>      clock-names:
>>>>        minItems: 1
>>>> -    items:
>>>> -      - const: iface
>>>> -      - const: bus
>>>> -      - const: vsync
>>>> +    maxItems: 4
>>>>    
>>>>      "#address-cells":
>>>>        const: 1
>>>> @@ -69,6 +63,30 @@ properties:
>>>>        items:
>>>>          - description: MDSS_CORE reset
>>>>    
>>>> +oneOf:
>>>> +  - properties:
>>>> +      clocks:
>>>> +        minItems: 3
>>>> +        maxItems: 4
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 3
>>>> +        items:
>>>> +          - const: iface
>>>> +          - const: bus
>>>
>>> BTW, sc7180-mdss uses here ahb name and calls it "AHB clock from dispcc".
>>>
>>> SM8250 won't match here either. Maybe this should be reworked to specify
>>> limits here but not the names and actual clocks? IOW, drop entire oneOf?
>>
>> SC7180 and SM8250 use platform-specific bindings (qcom,sc7180-mdss.yaml
>> and qcom,sm8250-mdss.yaml). This file is used only for older platforms
>> (msm8916, msm8996, etc).
> 
> Ah, right. It's a bit confusing to have bindings split into files:
> 1. mdss-common
> 2. mdss
> 3. device specific
> 
> but I guess fixing this would be another chunk of work.

It comes from the history of display devices on Qualcomm platforms. 
Older platforms used single compatible entry: qcom,mdss (and qcom,mdp5 
for the corresponding MDP/DPU device). Then at the sdm845 point there 
was a change: per-SoC compatibles for both MDSS and DPU. But older 
devices still have the qcom,mdss compat string.  Moreover this change 
also introduced a shift in the DT (some properties were moved from MDP 
to the MDSS device, e.g. interconnects and iommus). So the mdss-common 
lists common properties of new-style bindings, but it is not applicable 
to old platforms.

Thus we ended up in a situation where we have:

- qcom,mdss for old devices. Maybe it better be renamed to qcom,mdss-other?
- qcom,SoC-mdss + mdss-common

The same situation applies to the MDP/DPU:
- qcom,mdp5
- qcom,SoC-dpu + dpu-common

> 
>>
>>>
>>> There were a lot, a lot of changes to MDSS/DPU bindings recently, so I
>>> am really loosing track what is done where and when.
>>>
>>> There are also few separate patchsets from you on the lists. Could they
>>> be combined into one cleanup?
>>
>> Ack, I'll merge them into a single patchset.
>>
>>> I understand that sometimes new cleanup is needed after old cleanup
>>> finished (I had the same with pinctrl), so it is not a complain.
>>>
>>> Another problem (and this time I complain) is that several of your
>>> patchsets were sent, discussed and then without any notice applied. No
>>> message that a patchset was applied to some tree. Look:
>>>
>>> https://lore.kernel.org/all/20221124001708.25720-2-a39.skl@gmail.com/
>>> https://lore.kernel.org/all/09ed16e1-4af2-8fce-dab4-f6c0f09e688c@linaro.org/
>>>
>>> Nothing. Silent application. If you are the maintainer which picks up
>>> the patch, please always, always send message that they are applied.
>>> Patchwork does it automatically, b4 can do it easily as well. If you use
>>> other tools - use other tools for sending it. Otherwise things are
>>> discussed on mailing lists, receive several comments and there is never
>>> a resubmit but instead they show in the tree.
>>
>> Unfortunately freedreno uses patchwork-fdo, which doesn't send
>> notifications. And the fdo fork is not supported by b4. I checked what
>> would be necessary to enable support in b4. Unfortunately several API
>> changes would be necessary. So this is a long process. But we are open
>> to any suggestions on how to improve the process. Currently all three
>> maintainers (Rob, Abhinav and me) keep the patch status in the
>> patchwork, but that's all.
> 
> And how other freedesktop.org patchwork users notify? Manually or is
> there some hook? I notice only Exynos DRM where maintainer sends manual
> "Applied" messages.

I fear there are no other good options. I picked up maintenance 
practices from Rob, who doesn't send `applied' message. Maybe it's 
something to change.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

