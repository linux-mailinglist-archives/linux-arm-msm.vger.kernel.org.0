Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF1B59E4BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 15:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239778AbiHWN4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 09:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240407AbiHWN4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 09:56:25 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43D31D1B1C
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 04:01:36 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z20so13161000ljq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=478xp+xXVm6+LQ5Y3hKJmtg5OeuY/mk2KivYHfJ1FyI=;
        b=Nq2gKwXPYd00IQHol2CzP6IXX2LeLm7uHOotL89KBXhS6ZS5av7WLktBWQ7iJB6mEC
         br9dan6yynV7jbA4OkT9Q1ztA/vTFwmKfm1uPbH5k9Og+YfRXKeE7ElBkyrdmuRXix8i
         8Z7mWfODgyJ/8zCDULxA5X2aOBSHuSGz5R+W1HBOKXA1bhsr+v+jFJyuc29IuIiguhxf
         Q1MEGYyObdn/bW/UKnJttO+tR5lCBjbiDOUBFqOcWglnaQ3hx3twJ/9X5GSAExlv4ymo
         tTc6nUAnH7sSlz5JUTOhnjbZG25MIrh9s3dwIgxbY8z2eEz0lIKzBDl2+MI/JlXbNnL7
         4BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=478xp+xXVm6+LQ5Y3hKJmtg5OeuY/mk2KivYHfJ1FyI=;
        b=NjTrz8abe31yocGJwPIVt5A6s+75yJJjSfX+TVZN4UNpo8VJgKu7Pq+hhK8/BR/F0I
         pJ1Sx4GiWnFcoQj3T9ySkG/xYeStVgHqvRNtrfNN1HjqSmhltWxf1IgI3+LNS4wXEzfi
         BLIDw9mIdGTmme/YOZeAF882okdiNuho2370BqD5f0KImFNgnriCFCj9NQKaIkNjiVnv
         +srDPVXYxZo7r7mXuWoJOdUgDg/PysK640Z3ba2ufoy9DI5MUTrWYqpgBGxSfJELoXml
         q2m7eHXRa1EIv9uGK0kwc1OuZx9qMFbaWMslnhXQkN5CDes5hmhDHQCChCrIZgo4U/m1
         eHvQ==
X-Gm-Message-State: ACgBeo2fFJbmAxLKWybtKvY1F4RouAwUJmi0HHlAFQaop2Aqh8SHRsKK
        xaoCMzPxn3DrZO6vd7ErxqyHWA==
X-Google-Smtp-Source: AA6agR6pHuA/Pqmja0Nyf2X+bxQ8qNJYXHFv0dFuO3RrNLaLnxBp429/iBJM6FMXPPiiCSEkUiu4KQ==
X-Received: by 2002:a05:651c:12c4:b0:25d:d71c:e249 with SMTP id 4-20020a05651c12c400b0025dd71ce249mr6320800lje.17.1661252455406;
        Tue, 23 Aug 2022 04:00:55 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t2-20020a19dc02000000b0047f8d7c08e4sm2449095lfg.166.2022.08.23.04.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 04:00:54 -0700 (PDT)
Message-ID: <b59fad42-5217-8c96-a43a-d6f036766371@linaro.org>
Date:   Tue, 23 Aug 2022 14:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/11] dt-bindings: display/msm: move qcom,sc7180-mdss
 schema to mdss.yaml
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
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
 <37bf0f7f-e555-7ae9-7d2b-e05a9e8db6a4@linaro.org>
 <76c05290-d957-b1ec-fa4d-1074c42979a8@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <76c05290-d957-b1ec-fa4d-1074c42979a8@linaro.org>
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

On 22/08/2022 22:04, Dmitry Baryshkov wrote:
>>>   required:
>>>     - compatible
>>>     - reg
>>> @@ -177,7 +204,19 @@ patternProperties:
>>>       # TODO: add reference once the mdp5 is converted
>>>   
>>>     "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
>>> -    $ref: dpu-sdm845.yaml
>>> +    oneOf:
>>> +      - $ref: dpu-sc7180.yaml
>>> +      - $ref: dpu-sdm845.yaml
>>
>> I don't think this is good approach. These are strictly tied, so you
>> should have rather per SoC MDSS schema pulling in:
>> 1. common MDSS
>> 2. specific children schemas
>>
>> This makes it quite obvious and specific. Your setup now allows putting
>> sc7180-dpu under sdm845-dpu.
> 
> Then we should probably also use very specific $ref and compat check for 
> all other entries in this file too. I understand your concern, however 
> I'd prefer to have the working schema which is not tight enough compared 
> to set of schema files that completely do not work.

Why they cannot be tight and working?

> And current 
> dpu-*yaml do not work as they allow just the display-controller beneath 
> the mdss node.

Sure, this can be fixed but not really in a relaxing way.

> 
> If you absolutely insist on me making the binding tight enough, I'll 
> rework the bindings to clearly specify which SoC has which nodes.

I do not see the drawbacks of specific/tight approach, so yes, please
make it tight.


Best regards,
Krzysztof
