Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F04665D0D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 11:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbjADKpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 05:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbjADKpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 05:45:51 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DDFF35
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 02:45:48 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so49831791lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 02:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cg4BC+vc4cMgNMH7aEk78TMLGpHpjUUBSbYyFixGuO4=;
        b=e4yVbFlHwU9Jfjm1orGT0XQq7QzJwb+hfN6FVW8KujVyaQxPeWAg8czESdb7jpL0pg
         0iSLVXwxZU14KxGTVJ3XvS6JhgKw1hHlxEVfJg54irc2UOdtBENvxpO8YhgRKVTglh+Z
         phnBEbtzY1CC4/4sMmzo0ZVYz2V4ZGH+CdJCFsvJ7NZVcX1dbYCG6OXlKZtbCTXQtRBX
         adFswxqMUJYUhj3lWQaH1qO3drBQeSCPum3Zcq5OVLLKw8xSDHoKc69E6DZo1h7f6Tss
         xNN0mduhZ+FjwD/W9up4sxCUtEnQqFpNg1H/sKo+oWisuL2FMN2uy1X+WThrzmWQc0KJ
         GXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cg4BC+vc4cMgNMH7aEk78TMLGpHpjUUBSbYyFixGuO4=;
        b=RVBtL7QOXgRvN7St2dbkg/FwvaxsDPagqL9DDm73uhD4vmqJcbEAzdYREhV/hH1TwB
         o5Yhxmia8ttlIESeIoJgcGAAjA4dNtjk9SK4HAtVrE79riqaTb7axfmpPZipoDTbSm/K
         jXUFr/m52YW5W2YfsiqwUDzvv2HYiEicZCOGvi+XjTc7xVvHJfI6Sjb63kahM2idwMWe
         zVk4XGtZ9B39m1PTq+fnsZD6R8mS3F8mqQpJaMEX2hYe11YezdPxyqbIC8Fg+vabGjz9
         knbha3+xMyPuPgB+UV05r2emBRNwiNNHJY3NxPcdRGv55IikHO3rwcEIi58KFHZ4uwJv
         dRfA==
X-Gm-Message-State: AFqh2kpT2Bx9CygpP0LI7ik4Hbsh+nAogZwrBAxQt7iEoFPWHnCiNLWN
        c/3XS8RmMgEzYXS3EU0dWtBWQg==
X-Google-Smtp-Source: AMrXdXuSgV9Ik7Vl3wECpAIG5u4xVuxXxkhfzzYDNDQgqJSE5ER0jqkeg9X6FBdjufyfYOJ3u/hXGQ==
X-Received: by 2002:a05:6512:340a:b0:4b4:f212:6173 with SMTP id i10-20020a056512340a00b004b4f2126173mr12896360lfr.4.1672829146604;
        Wed, 04 Jan 2023 02:45:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q6-20020ac24a66000000b004b59b43ec61sm5120846lfp.179.2023.01.04.02.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 02:45:46 -0800 (PST)
Message-ID: <bd1c3325-2bac-7b3e-89be-b78cdf9d874d@linaro.org>
Date:   Wed, 4 Jan 2023 12:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/16] dt-bindings: clock: qcom,mmcc-msm8998: drop
 core_bi_pll_test_se
Content-Language: en-GB
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-6-dmitry.baryshkov@linaro.org>
 <CAOCk7Noa1A4mBqg3OAxk3hnnUg-qjCeCE0tyhq3ktbFcETicqw@mail.gmail.com>
 <cf1f65e4-338a-c519-1401-91e13b5fd937@linaro.org>
 <CAOCk7NrrwF8mO4tE3GG2KjajehuC7QthHjNjurZWCSXccZ=LVA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAOCk7NrrwF8mO4tE3GG2KjajehuC7QthHjNjurZWCSXccZ=LVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 18:31, Jeffrey Hugo wrote:
> On Tue, Jan 3, 2023 at 9:09 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 03/01/2023 17:38, Jeffrey Hugo wrote:
>>> On Wed, Dec 28, 2022 at 6:33 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> The test clock apparently it's not used by anyone upstream. Remove it.
>>>
>>> IMO, NACK,
>>>
>>> This is not a valid justification.
>>>
>>> The DT is supposed to describe the hardware, and should be complete in
>>> that regard.  This clock exists in the hardware, so it should be
>>> described.
>>
>> Most of Qualcomm clock controllers can input clocks from
>> core_bi_pll_test_se. But we are listing them only for a small number of
>> them. And even on these platforms nobody provides this clock.
> 
> IMO the Qcom bindings could use some more rigor, I just don't have the
> cycles to help there.  The ones I've looked at appear to be written
> from the perspective of "what does the linux driver need" and not
> "what do we have in the schematic".  Often "what does the linux driver
> need" changes over time, which means the binding needs to evolve,
> which breaks the interface.  It's entirely valid to not use something
> in the Linux driver, especially as the platform implementation is
> probably minimal during early bringup, but such things are expected to
> be implemented eventually.

Well, the problem is that not all of us have access to lowlevel 
documentation, thus we have to resort to the information provided by the 
vendor kernel. Sometimes our approach to platform implementation changes.

> 
> There is a huge set of existing platforms where we probably can't go
> back and fix them since the binding is already defined, but going
> forward, new platforms can do better.

Bindings can change (especially if the change is backwards-compatible). 
We are finishing one of such migrations (to use DT to bind parent clocks).

If you have anything particular in mind, please don't hesitate to 
describe your ideas.

> 
>>
>> Maybe you shed some light here, what is the source of this clock? Who
>> provides the clock, e.g. on msm8998 platform?
> 
> It is an external input to the SoC, similar to CXO.
> 
> On the laptops, TP88 (test point) on the main motherboard is routed to
> the SoC pin.  I don't have schematics for every platform in the wild,
> so I can't say if that is the norm.

Ack, externally supplied clock. That's great. Thank you.

Let's leave the question of having core_bi_pll clock to subsystem 
(Bjorn and Stephen) and bindings (Rob, Krzysztof) maintainers.

-- 
With best wishes
Dmitry

