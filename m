Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B981056D877
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 10:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiGKIlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 04:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiGKIk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 04:40:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8C52182B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:40:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y11so994876lfs.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yHvdNmX8cwqCqH9wxQy8kt6GWFeeNK1eN99DTgUy0Bk=;
        b=HK/wlAHnZtrYUvscxl/4v9EvKJ4m+uwt5yBONVp+CoVH9hw54jrOWBU9GKHNMMjCAk
         XLXp1viXF3DhYFqk0z4/R+mlDOgqIZRLwrTFr5uc4kzGUdec4xqTagNMabEJ5kQxxTHO
         1FG1gO99AHs9QW80FOs7xlufqcB/KwZj1u4U3A/aq7GTqAOLhYt5R+Fu8dvs1a4XOipT
         MnXyfWPqs8vJiUe96+5RWMA3y+zzG8skJM4aiRMoXe0TvtCblZbsTrGoE7LcJnCO1DcU
         E2m7Bcw/4LiqpHP2z60CnBQ8EUcrcmuAXtt4X9YzsBXwwOoSB2C00y22fG7OLkA3U6P5
         g22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yHvdNmX8cwqCqH9wxQy8kt6GWFeeNK1eN99DTgUy0Bk=;
        b=yHVdm67W9ahBJPLqqJuzbRKk0Hdx1jSLAAoXhKp0y+d/pEw6ooa1aMOel7vWx92C/g
         iU8NXaXwi+gdEEwFlQOYhAs44YGpLJjvs5HC8/v47B01AdjHQ7naU8Y1VkkcHZnYBxTC
         eqVGIqjA2um+dMYqBGxW8a3yjhn5WvQn8O3Qg6cW3VT1oBy6qlA88p5dN93tbS/gs/su
         wb0CdbjnND1IYgAv6ScoaSTXjiStUb5rX9KISsIX1FZg2QE2RKZaforWAg+QaE7spl+s
         RcwyfO4FOqhC9AgXclhaaAOOuhRX5oKmKjziPLYUioJCZffPAxvPDdISBv/cH047Jcnr
         64qg==
X-Gm-Message-State: AJIora9NIjWJ+intuMffNKRRmxLki0crP7ORcVS2fYZJF/wlB/RWfJFV
        VlNGNjtXSevOpzlit7xDmYhBgw==
X-Google-Smtp-Source: AGRyM1s0qou7Yi6cagSjEwRSsglNTS0WLIizq0UPV9g/NKHdLl0xZBL1KPkY2d0+WVAVkxIAwkxSIw==
X-Received: by 2002:a05:6512:b1c:b0:481:618f:ec9 with SMTP id w28-20020a0565120b1c00b00481618f0ec9mr11425375lfu.217.1657528828279;
        Mon, 11 Jul 2022 01:40:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o15-20020a05651205cf00b00488d0e38283sm1404426lfo.153.2022.07.11.01.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 01:40:27 -0700 (PDT)
Message-ID: <fa238328-37b7-9898-179a-719281248a97@linaro.org>
Date:   Mon, 11 Jul 2022 11:40:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
 <a7f2e673-a732-d06c-e17e-746cedf42c7a@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a7f2e673-a732-d06c-e17e-746cedf42c7a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2022 22:47, Kuogee Hsieh wrote:
> 
> On 7/8/2022 12:38 PM, Abhinav Kumar wrote:
>> + kuogee
>>
>> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-07-07 20:46:43)
>>>> On 08/07/2022 04:28, Stephen Boyd wrote:
>>>>> Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
>>>>>> The p1 region was probably added by mistake, none of the DTS files
>>>>>> provides one (and the driver source code also doesn't use one). 
>>>>>> Drop it
>>>>>> now.
>>>>>
>>>>> Yes, looks like the driver doesn't use it.
>>>>>
>>>>>>
>>>>>> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 
>>>>>> 1 -
>>>>>>    1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git 
>>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> index 94bc6e1b6451..d6bbe58ef9e8 100644
>>>>>> --- 
>>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> +++ 
>>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> @@ -29,7 +29,6 @@ properties:
>>>>>>          - description: aux register block
>>>>>>          - description: link register block
>>>>>>          - description: p0 register block
>>>>>> -      - description: p1 register block
>>>>>
>>>>> The p1 registers exist on sc7180. They start where the example starts,
>>>>> at 0xae91400.
>>>>
>>>> Do they exist on e.g. sc7280? In other words, should we add the region
>>>> to the DTS? For now I'm going to mark it as optional.
>>>>
>>>
>>> Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
>>> can you confirm?
>>
>> P1 block does exist on sc7280 and yes its address is same as the 
>> address mentioned in sc7180. So its not a typo.
>>
>> Yes, we are not programming this today but I would prefer to keep this 
>> as optional.
>>
>> I did sync up with Kuogee on this change this morning, we will check a 
>> few things internally on the P1 block's usage as to which use-cases we 
>> need to program it for and update here.
>>
> P1 block is for dp MST application.  This allow two dp streams can be 
> mux into same DP phy.
> 
> We should keep it since we may support MST later.

Thanks for the confirmation. Next question, does it exist on eDP 
controllers?

> 
>> The idea behind having this register space listed in the yaml is thats 
>> how the software documents have the blocks listed so dropping P1 block 
>> just because its unused seemed wrong to me. Optional seems more 
>> appropriate.
>>
>> Thanks
>>
>> Abhinav


-- 
With best wishes
Dmitry
