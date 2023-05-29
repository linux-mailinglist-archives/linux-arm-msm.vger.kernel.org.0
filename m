Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23B5715269
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 01:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjE2XrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 19:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjE2XrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 19:47:24 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFECC9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 16:47:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4060123e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 16:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685404039; x=1687996039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KksDJiPehvkAehMey594LHHeO0S0qiD/74RAy1ncX20=;
        b=Wjh1XeibYGOcuXpSpjleavimti87a29KpU8h4c2ujfQBJnFblS65GsguvZlLm8ztYp
         nGLySLSfR1kuswi5790jyAukoC78yO1k2nBRsv+qJJWW+2uLLkMpCtNsChamEsTbMMRM
         NU6dzLAcrwMy+B6Bpo19xPbPTwPqa58TBfw8PvYWViU42QAy1uxFHUx61irKgyq4UU7L
         ONQpmCZkSYyPEtHVzMEja2TMrCaEmhvGxILkD8PAAk2tiVuTEGKwittHQTM6ciQX1+Xk
         wHXN6JF6dMhd2yUffILZ8JNNvrXvK/QttFvC64zBZaPRx/IiFqsNdz4ppNrbz5Jt3rpv
         R5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685404039; x=1687996039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KksDJiPehvkAehMey594LHHeO0S0qiD/74RAy1ncX20=;
        b=cXPQC5fs2QZishGnOyWaDzS2JUBrlLmYj4CFGwn9ildAVTCWOH8vQAk151F0LzGLV8
         BbfDziu8X1e0WujyLo1DMVe65uB6iHrZDdzhsxX28eD/GDXJEilz+y7MTQxLczuaoBCw
         fMftCN16ix6sEEp3Tp/0wy9v193rjIwOHTMvCX+j2Y0V1wO8Umoh2uXMt0iwQ6kMryrE
         d9pz6/7juCnxOBoPT+E5zFKfpdjdathQhRnio1G5cxJnqhGDdTDfdUJT/qw6Seckm+PF
         2J1nMBvO1wnNa0Nq1EI5P5S44y+DoBA4eP/FL+bHJjnO5CAWTnlbvmQqOnj94U4mN/Jb
         zkZA==
X-Gm-Message-State: AC+VfDynPgBdEOm3YO8yawMsC9y5AaBwJntIuZnBNbqNj/CaoEwrRdY6
        Sz2nawhsOhRPpbSQ300Scjoz/P/ljr9mWOJKfo8=
X-Google-Smtp-Source: ACHHUZ6ajtqYPSD7aDQff1OU2KWegonez+0cK/al21X0T5/5kIlO0VeQxeRzM79iIh6GKdWvIlAWOg==
X-Received: by 2002:ac2:5292:0:b0:4f2:5c4b:e69b with SMTP id q18-20020ac25292000000b004f25c4be69bmr75003lfm.67.1685404039605;
        Mon, 29 May 2023 16:47:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t19-20020ac25493000000b004f13ca69dc8sm148539lfk.72.2023.05.29.16.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 16:47:18 -0700 (PDT)
Message-ID: <d4e8f17b-78a2-b6c6-36e2-ccc526430df1@linaro.org>
Date:   Tue, 30 May 2023 02:47:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <20230509055044.GA4823@thinkpad>
 <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
 <20230511081504.GA12021@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230511081504.GA12021@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 11:15, Manivannan Sadhasivam wrote:
> On Tue, May 09, 2023 at 02:20:07PM +0300, Dmitry Baryshkov wrote:
>> On Tue, 9 May 2023 at 08:50, Manivannan Sadhasivam
>> <manivannan.sadhasivam@linaro.org> wrote:
>>>
>>> On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
>>>> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
>>>> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
>>>> flags to PWRSTS_OFF_ON.
>>>>
>>>
>>> What does "stop working" implies? Does it work during boot and randomly stopped
>>> working or it stopped working after resume from suspend?
>>
>> It stops working during the boot. I observed the MDP not starting up
>> properly. Mea culpa, I did not look deep enough into the details, just
>> stomped upon this change which fixes the problem for me.
>>
> 
> IIUC, GDSC will be transitioned to retention mode only if the parent domain goes
> to low power mode. So if the MDSS GDSC goes to retention mode during boot, then
> it suggests that the parent domain is not voted properly. Unless I misunderstood
> something...

Not sure, what is the parent domain here. Note, it is a pretty old 
implementation.

> 
> Or is the GDSC behavior changes between RPM and RPMh?
> 
> - Mani
> 
>>>
>>> Even though reverting to non-retention mode works, I think the issue might be
>>> somewhere else. Like the vote might be missing to get the GDSC out of retention
>>> mode.
>>
>> I don't think there is a vote missing. The driver votes on MDSS_GDSC
>> before enabling access to any of the registers from the MDSS region.
>>
>>>
>>> - Mani
>>>
>>>> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
>>>> index aa29c79fcd55..277ef0065aae 100644
>>>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>>>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>>>> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>>>>        .pd = {
>>>>                .name = "mdss",
>>>>        },
>>>> -     .pwrsts = PWRSTS_RET_ON,
>>>> +     .pwrsts = PWRSTS_OFF_ON,
>>>>   };
>>>>
>>>>   static struct gdsc camss_jpeg_gdsc = {
>>>> --
>>>> 2.39.2
>>>>
>>>
>>> --
>>> மணிவண்ணன் சதாசிவம்
>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry
> 

-- 
With best wishes
Dmitry

