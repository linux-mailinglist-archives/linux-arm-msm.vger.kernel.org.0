Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574156AC227
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 15:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjCFOE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 09:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCFOE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 09:04:27 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC3E1B540
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 06:04:20 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id n2so12819717lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 06:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678111459;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWRTdlHpgyAnKLxEj2H9HwDl4XdQfL0+b/sTa7A8fK8=;
        b=uN3BUmzqfupm/CDaSHZwd6ACmy1ANEZaPp9pOx2vZF2LkQe2wjp4ZmiQ/CnLVAt6zS
         B+Yggzdf3CXnsuw0JB9r6qOKTjsS2rL9KIjOgxQGGCZRN+CdshwozPPSWFOOT+08V86+
         1c0G8/wo5k2k0jkV7X1rbLmmI3v3a+ycD7olk5PqsKByQfQS0C2iafE9lbKi1Nhq2OH/
         CVzjGHR6n/CTs4osYqFcqEiWC27jZXfehdm6RJtetsi3x5yxfNEBSB1wpoT3UE4aumlM
         Pii2ZnfawDOKe/A40ld/1+j3euA/KtAZ/K2UTpvg1vleHq/Dr61ffs3drDRR0R9wScTv
         aqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111459;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWRTdlHpgyAnKLxEj2H9HwDl4XdQfL0+b/sTa7A8fK8=;
        b=poaOBSMOvCNaZlI6ZmOGT1ESGdfKw+EyLw29H0/S9q0zHtWlKtcD3W64VtUsfltTle
         GHIFljwnd5oJI9NnJxwPSQof0qyHp4wDO9kVpluGQHbwTkXJBT4BDKZ1SlhvtyQGku6w
         qRUgUMZTq+y6UWbh3Rj4/w+YYHHa01eeoTX9nLwvFyPznRwssKk7B6kJ0TGx/pjMWi1H
         cZ5NUeT055PbpEnaI7q32a6lyiLjkUvsit1N+OzHR1TF+03FyIKnbKA987NL+r6QMlfB
         ABpzQXgx/kZS9Mtl4efBm7Ylj6OdsLahYmKMZ+o8O2cbOWIgUBfefUGlDJZN4kMdS52L
         8hpw==
X-Gm-Message-State: AO0yUKVsQGEQNm4vvKtY0qYqYAoQ3yW25NsUrtmrxT2gTFUHFkEr4qfO
        gXjh7YlJ3SgqTKezTNzbUy68yQ==
X-Google-Smtp-Source: AK7set/OkOOsUmXuVK4imZlLDP1IyOB1m4u5y1VSrI+UbKHeFhKm5a+6WSZulwmwUQHUv3ET1yzvYA==
X-Received: by 2002:a19:5519:0:b0:4db:3847:12f0 with SMTP id n25-20020a195519000000b004db384712f0mr3452173lfe.50.1678111458925;
        Mon, 06 Mar 2023 06:04:18 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id q8-20020ac246e8000000b004b6efcb7bb5sm1651026lfo.169.2023.03.06.06.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:04:18 -0800 (PST)
Message-ID: <27109715-ffda-2a4a-ee67-886713103d49@linaro.org>
Date:   Mon, 6 Mar 2023 15:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT 03/20] clk: qcom: smd-rpm: Add support for keepalive
 votes
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
 <20230303-topic-rpmcc_sleep-v1-3-d9cfaf9b27a7@linaro.org>
 <CAA8EJpp6cxY5+L28qsTeXCmA31e4dv21u1Tz9SquAugaV+EqfQ@mail.gmail.com>
 <afa95a2d-dbf3-621e-a1ed-fa484d288432@linaro.org>
In-Reply-To: <afa95a2d-dbf3-621e-a1ed-fa484d288432@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.03.2023 12:28, Konrad Dybcio wrote:
> 
> 
> On 6.03.2023 02:21, Dmitry Baryshkov wrote:
>> On Sat, 4 Mar 2023 at 15:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> Some bus clock should always have a minimum (19.2 MHz) vote cast on
>>> them, otherwise the platform will fall apart, hang and reboot.
>>>
>>> Add support for specifying which clocks should be kept alive and
>>> always keep a vote on XO_A to make sure the clock tree doesn't
>>> collapse. This removes the need to keep a maximum vote that was
>>> previously guaranteed by clk_smd_rpm_handoff.
>>>
>>> This commit is a combination of existing (not-exactly-upstream) work
>>> by Taniya Das, Shawn Guo and myself.
>>>
>>> Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
>>> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
[...]

>>
>>> +
>>> +               ret = clk_set_rate(keepalive_clks[i]->clk, 19200000);
>>
>> Don't we also need to provide a determine_rate() that will not allow
>> one to set clock frequency below 19.2 MHz?
> Hm, sounds like a good idea..
Thinking about it again, I'd have to do it before the clocks are registered
and we'd either end up with 2 loops, one assigning the CLK_IS_CRITICAL flag
and the other one setting the rate.. Will that not be too hacky?

Konrad

> 
>>
>>> +               if (ret)
>>> +                       return ret;
>>> +       }
>>> +
>>> +       /* Keep an active vote on CXO in case no other driver votes for it. */
>>> +       if (rpm_smd_clks[RPM_SMD_XO_A_CLK_SRC])
>>> +               return clk_prepare_enable(rpm_smd_clks[RPM_SMD_XO_A_CLK_SRC]->hw.clk);
>>> +
>>>         return 0;
>>>  err:
>>>         dev_err(&pdev->dev, "Error registering SMD clock driver (%d)\n", ret);
>>
>>
>> I have mixed feelings towards this patch (and the rest of the
>> patchset). It looks to me like we are trying to patch an issue of the
>> interconnect drivers (or in kernel configuration).
> Well, as you noticed, this patch tries to address a situation where a
> critical clock could be disabled. The interconnect driver (as per my
> other recent patchset) also has a concept of "keepalive", but:
> 
> 1. not very many SoCs already have a functional icc driver
> 2. devices with an existing interconnect driver should also be
>    testable without one (through painful ripping out everything-icc
>    from the dts) for regression tracking
> 
> Konrad
> 
>>
>>
>> --
>> With best wishes
>> Dmitry
