Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06456353014
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhDBUBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBUBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:01:41 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A648DC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:01:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id f16so6629225ljm.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ggENvzBGhy5Uy3EO9ZvTQ8VoeyQCyEJdNWvfmoN10l8=;
        b=wTgM79IKq+PFcpwa+/wEy6Lk0ReC0TXW1uoFbqarFQxko93+lHvjo5WXBB/KdNS9yO
         xlvbebvm5ITjmDzQ7jDqAQOilDjrGh4cJyDEOO2lA258k8P4hf2elmG/QzaI9fHhUnQs
         YroLb93aSlDFfYetzx3Vt20Z2cynxlX18/L9H7hsjadL1YB9+AQM2Kx8knvmrzn+X3ja
         QTe35miSO8uqR3AmguKiPIvhylwZ0jcZp2j6/H4QgM3AWK61b6/g/J7SaFYBDRRAP1bV
         fF05Pr1ZElI2rkyRqCMnbBNSJR8Z5Mdqrzh8CMyBzzqRgrJ23JFF+LPk7lO9byLZM9Qn
         9FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ggENvzBGhy5Uy3EO9ZvTQ8VoeyQCyEJdNWvfmoN10l8=;
        b=VTi9k1ZdPkaZgz/MPOUXo6k1AwLdf1dNy3flWwMos3jrEbyarHkUYOWc/nxHfvN5uK
         I8FcI0y1wRW8WQXkdp9/9XisV7vn2m/5aIJOIa/afvmZM7LlCYAxsIC0sRp6JHqyXK5y
         7q55x13fDjFjTdOjzdaURJ2TWqgdr78/i9PRUKXrp2DNG9hr+71i6HnBNu3+B9aek2n9
         lqYZEN2vYAEJ1SqW8tevGLAyEq2s/S4JjlDQiuMMYN6WUY8KnTCt6e71/z9ksFFdkD6X
         2bkPv0MRHWRzH5oY8PrQmoBoWRy8mrr0CFTkr3ZSp8oOqErtoSEPtQ7HWvHfuxRmjtdr
         rKJg==
X-Gm-Message-State: AOAM531JXISDtwohUKpP4XIRjI+u6MFQrXEYQR1G1OT0OXfpoQhOb4pb
        od6W8kt1MMMW+YIQDRQ6CPxLaI/j1oVHAQ==
X-Google-Smtp-Source: ABdhPJx0OpqrG6kXuGq7wvYCQV2LeaY2f63PsbAFSxJRpGqh0DpJesEbBV4do7KK6tCrCytf6OTvEA==
X-Received: by 2002:a2e:b0cd:: with SMTP id g13mr9255210ljl.166.1617393697738;
        Fri, 02 Apr 2021 13:01:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n5sm944883lfd.52.2021.04.02.13.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 13:01:37 -0700 (PDT)
Subject: Re: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported
 clock sources
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-14-dmitry.baryshkov@linaro.org>
 <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
 <c92f7a04-f010-4c63-4b39-482a5581317a@linaro.org>
 <161738488399.2260335.10137992073962455023@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <228529e0-bf14-d272-7c61-9fe508bf92c6@linaro.org>
Date:   Fri, 2 Apr 2021 23:01:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <161738488399.2260335.10137992073962455023@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2021 20:34, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2021-04-01 18:49:37)
>> On 02/04/2021 04:23, Taniya Das wrote:
>>> Hi Dmitry,
>>>
>>> On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
>>>> video_pll0_out_even/_odd are not supported neither in the upstream nor
>>>> in the downstream kernels, so drop those clock sources.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/videocc-sdm845.c | 8 +-------
>>>>    1 file changed, 1 insertion(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/videocc-sdm845.c
>>>> b/drivers/clk/qcom/videocc-sdm845.c
>>>> index 5d6a7724a194..7153f044504f 100644
>>>> --- a/drivers/clk/qcom/videocc-sdm845.c
>>>> +++ b/drivers/clk/qcom/videocc-sdm845.c
>>>> @@ -21,24 +21,18 @@
>>>>    enum {
>>>>        P_BI_TCXO,
>>>>        P_CORE_BI_PLL_TEST_SE,
>>>> -    P_VIDEO_PLL0_OUT_EVEN,
>>>>        P_VIDEO_PLL0_OUT_MAIN,
>>>> -    P_VIDEO_PLL0_OUT_ODD,
>>>>    };
>>>>    static const struct parent_map video_cc_parent_map_0[] = {
>>>>        { P_BI_TCXO, 0 },
>>>>        { P_VIDEO_PLL0_OUT_MAIN, 1 },
>>>> -    { P_VIDEO_PLL0_OUT_EVEN, 2 },
>>>> -    { P_VIDEO_PLL0_OUT_ODD, 3 },
>>>
>>> These are supported from the design, please do not remove them. It is
>>> just that in SW currently it is not being used.
>>> But SW can decide to use them as they want. As said earlier these are
>>> defined in the HW plans and thus do not want them to be updated manually
>>> to create a mismatch.
>>
>> The problem arises during conversion of these drivers to use parent_data
>> instead of parent_names. You see, video_pll0_odd/_even are clocks which
>> should be referenced using .hw (and thus defined inside the videocc
>> driver) as we do for "video_pll0" parent. However there are no clk_hw
>> entities defined for those clocks. For now I'd just use the { .name =
>> video_pll0_out_odd" } entry for those clocks, however I still think this
>> is not correct.
>>
> 
> Yes we shouldn't be adding .name anymore. Can we add the
> video_pll0_out_{even,odd} clks? Or if they're not used then can we
> remove them from the parent_data and leave some sort of comment
> indicating that they may be there?

Downstream kernel provides no information regarding these clocks. I'll 
just leave them commented out (but inplace).

> 
>>>
>>>>        { P_CORE_BI_PLL_TEST_SE, 4 },
>>>>    };
>>>>    static const char * const video_cc_parent_names_0[] = {
>>>>        "bi_tcxo",
>>>>        "video_pll0",
>>>> -    "video_pll0_out_even",
>>>> -    "video_pll0_out_odd",
>>>>        "core_bi_pll_test_se",
> 
> Looks like in this case it would be OK because the array would be length
> 2 instead of length 5.
> 
>>>>    };


-- 
With best wishes
Dmitry
