Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C78CD6CF42E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 22:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjC2UNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 16:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjC2UNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 16:13:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E754EE3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 13:13:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q16so21744689lfe.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680120815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQCrJvIAi8d5vr9Rmgb3GfKwe2GYjnRcMdwIw2E9S1Q=;
        b=PBm+HevLzaANAiaOKuKR9wz5q1jaq2klVC3G7CGePfsI7ciPdEvadZ/5ugn9pPydb0
         pNDZpqc06g+MopXZNlylyBEpMaYKY28YTsUkw92aGyY6ja2bQ/Q+J9M+ufP/UMVjkCxm
         b4yNpJ9yS52MpUN10wk7Ov2b1BIVxTky08nCz+k9D6osa5WWprSxkr9G2CpgJDzzcKvd
         wPp6nNA2zSQ1wNO/Hd38HMRKJc17t9ASWPVNjbub4COwB1sbNRnC6M6g6dxhSCE9yMBq
         Bpp61bKCtEk5V2PRtjf8ROQ+u2U8Z3zLbszk47VsZYuAAW89YJCx7wdPC6uSIvruvxOG
         9qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680120815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQCrJvIAi8d5vr9Rmgb3GfKwe2GYjnRcMdwIw2E9S1Q=;
        b=W/dcdJEA7Ys7ei8IsOFSuxP/1/Apjs7Qg0bhyBdWNEi5hdKZvjlz6DU5BhIGQ8Hv+4
         Q1nEgBtwUEpWOclBWf8F8Hifb2dYJhD0/ulcVP2IDwLxtdCBkaSlHRGbaemV1obI8bJK
         LTqqA8yQ/gxFbA138q+CzBriESoOkB9P404QE9LvvoIuLLqWBA8SjUePJlUDVXdEts0K
         acienUOespbx9A9jpuT0rGH1QUkTKc7Wa6IpYJjTt+bGsh+FmrMEVVhRE4qqM3kZTiq7
         1iCnUR8S6gasyrJrE6hR3fGWP6ad2H/AKGrFVqBt9dDGLqXMgjPjJyxPUDEXX+PQV4AP
         Nx1Q==
X-Gm-Message-State: AAQBX9ffJ3Xtx3VS74bE4QgNaeveNQFoXz5USyNvKzKgfugL6fnf9Waf
        GdYoDZO5LK9WuBGGj3BETqvB2g==
X-Google-Smtp-Source: AKy350bqFBR1/bLn2+h5C96CNiXHrwe4VeVDilWwnXSAsd4PHM96EcS8ugCMls5mi4Wc9S4QapkSIQ==
X-Received: by 2002:a19:ad48:0:b0:4ea:f6ad:2975 with SMTP id s8-20020a19ad48000000b004eaf6ad2975mr5918334lfd.60.1680120815483;
        Wed, 29 Mar 2023 13:13:35 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h18-20020a197012000000b004e95a1aca1bsm5581253lfc.87.2023.03.29.13.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 13:13:35 -0700 (PDT)
Message-ID: <420b5400-844f-4ca9-a4e3-1f5f6536f7a2@linaro.org>
Date:   Wed, 29 Mar 2023 23:13:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
Content-Language: en-GB
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
 <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/03/2023 22:52, Rob Herring wrote:
> On Tue, Mar 28, 2023 at 5:38 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>
>> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
>>> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
>>>
>>> This patchset is based on the SM8450 display support serie at [1].
>>>
>>> In order to work, the following patchsets are required:
>>> - PM8550 LDO fix at [2]
>>> - DISPCC driver at [3]
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [2/7] dt-bindings: display/msm: document DPU on SM8550
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4557e40338d2
>> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e4205eb8663
> 
> And now failing on linux-next just as my bot reported:
> 
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:24:18:
> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
> directory
>     24 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:419:
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb]
> Error 1
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:25:18:
> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
> directory
>     25 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Please fix. And quickly please. Fixes in the DRM tree seem to take
> forever to get in...

I pushed the fix, so it will arrive in linux-next tomorrow or the day 
after tomorrow. Please excuse me for breaking it again. I checked that 
the patches were merged, but didn't notice that the header name was 
changed in the process. Mea culpa.

-- 
With best wishes
Dmitry

