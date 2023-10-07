Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9167BC6A2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Oct 2023 12:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbjJGKIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Oct 2023 06:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234148AbjJGKIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Oct 2023 06:08:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9996592
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Oct 2023 03:08:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5041cc983f9so3559418e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Oct 2023 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696673308; x=1697278108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H03AGC3mY8S2A5kkALRELBA0XRYLcrppA+IjF5hoOWI=;
        b=ce6DohzcxJmCs/FIa8rAs20mTBjP/U9JvRJhxRw4h1L7YnqLWuX7rfw/TbxLvW7R7x
         aTjQBl5kZ7HIH2j7Ml/RHBkkriM2/INCqkUUA1j2rKClU/IpYRuLEACII763JUM1uu3M
         u0LTLh8mnZQovHu/Kr4O4B8kD05ns7U8yPIjtcliFoqtn+/21jPnkQ9tTAbU95b+Gzwc
         yO8J8OW3MY3EGWmu0c3dahVabiibLmvTGW6b3fHYb7BnN7Up0MnSY2ikn8nxNeynX/aG
         FYewRpIVij9vSj0AMB9GLLwuwt59u9g/oTEArwXpNHmIMlPnn16FLVOCyFZo+fFEnBXP
         quLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696673308; x=1697278108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H03AGC3mY8S2A5kkALRELBA0XRYLcrppA+IjF5hoOWI=;
        b=f5wZuehdu4SZ5RDTWV6huyehQa9LUcNg25JGjtrZZGQWsRoBOhtcsZWH8sw1uqaMp8
         5gLyhYjW1hQatM6n4RB8oU7JI3dgPyuFTPZd+N9I6hSJ+YXfUyfobFq497UV6KlUnR4L
         Iz1vz5n20VqWTnyUrXb11kmo37sVYcUhX7ytxjlkSTzuIhK0kzyFc7qFWCtUKHfFFCBg
         ixEuQMc5vlsJqtT9PfPoxSxKKbn2x+BMAtl1tEPPYj9rixgd0klWArd9GPM+Bpplx1Mp
         hxuuVuWFVm9ZmFEZ/p8oVOzwdtX3E+I9BWTftuR4sUWO018I8O81xxZFcH5hjAUo0RYM
         1s8Q==
X-Gm-Message-State: AOJu0YyfQKwExye53cLdGlZClt50oB7nBJQWV9brQgZADdJQeLIwEUw7
        Q87cv1C+kVboEbeSf6CUVJ4jNQ==
X-Google-Smtp-Source: AGHT+IEHXMeiMRMehN1vthTqQFQXS3bmSjNSlXv1jgvT+p5vqLnnp//aevTDSF+zzxLFw5ARAvYaUg==
X-Received: by 2002:a05:6512:220b:b0:500:a66b:b189 with SMTP id h11-20020a056512220b00b00500a66bb189mr11437022lfu.51.1696673307672;
        Sat, 07 Oct 2023 03:08:27 -0700 (PDT)
Received: from [192.168.100.213] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003fee8793911sm5725072wml.44.2023.10.07.03.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Oct 2023 03:08:27 -0700 (PDT)
Message-ID: <a9c805b5-5c3e-9e25-ad82-021a421c309b@linaro.org>
Date:   Sat, 7 Oct 2023 11:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
 <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
 <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
 <55293371-9d7c-404b-a969-81248bf55e24@linaro.org>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <55293371-9d7c-404b-a969-81248bf55e24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2023 00:45, Konrad Dybcio wrote:
> On 4.10.2023 14:52, Bryan O'Donoghue wrote:
>> On 04/10/2023 13:08, Dmitry Baryshkov wrote:
>>> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
>>> <bryan.odonoghue@linaro.org> wrote:
>>>>
>>>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>>> must not be completely turned off. However its design has one major
>>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>>
>>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>>>> switched off (and shared most of the implementation with
>>>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>>>> parent map doesn't conain the safe (parked) clock source. Instead if the
>>>>> CFG_REG register points to the safe source, the clock is considered to
>>>>> be disabled.
>>>>
>>>> Why not have a new bit in .flags ?
>>>>
>>>> Instead of lying about the clock being off, mark the clock as "parked",
>>>> or "safe parked" or whatever term we choose for it ?
>>>
>>> The main problem with adding flags doesn't fully scale. From the CCF
>>> perspective, what should be the difference between parked and disabled
>>> clocks? How should it treat the parked one?
>>
>> Exactly the same as a disabled clock, except you get a "parked" instead of a "disabled" when looking up its state and you don't have to
> The thing is that currently there's only the notion of "enabled"
> or "not enabled".. Introducing a third state here would be the
> jump from boolean to quantum logic!
> 
> I think that abstracting this information away from Linux is not
> an issue.. These clocks "can't be any more off", or the SoC will
> explode badly and Linux will be unusable..
> 
> Think of it like CPUs with a hypervisor, you shut them down, but
> the physical number crunchers on the host CPU may not actually
> get cut off from their power source, but there's no reason for
> the VM to know that. That's probably what happens on our little
> virtualized snapdragons anyway..
> 
> Konrad

So not a state but a flag.

1. The clock tree we declare _should_ be a fair and complete description
    of the hardware clock tree.

2. If we remove XO from some trees with the only indication of
    differentiation being the callback you bind the tree to you need
    someone reading the code both know about parking, derive that
    information from reading the callback, which means you require that
    person to read the code in detail and understand it.

    That's alot of tribal knowledge we are storing up there.

3. A different approach is to add a new CLK_DISABLE_PARKS_TO_XO - or
    whatever name makes sense.

    a) The clock tree declared in the gcc, camcc, dispcc, videocc or
       is correct and aligned with the documentation and silicon.
       Right away this avoids patches sent to 'fixup' incomplete trees.

    b) When you look at a clock struct clk_branch_gcc.clk.hw.init.flags
       there is a big dirty CLK_DOES_THIS_THING flag which doesn't
       require a developer to have tribal knowledge about how we've
       hacked up clock parking.

My basic point here is the declaration of a parked clock should be 
obvious, easy to understand and not lend itself to "helpful" patches to 
"fix" the clock tree.

Also consider precedent. When you want to quickly get your clock 
controller up and running - you generally open existing upstream stuff 
to clone and own as much as possible. A BIT_DIRTY_FLAG transmits more 
information than a small callback with esoteric logic buried inside of 
the disable path.

I agree with your point on a new state but similarly I think the 
callback buries too much information away. IMO the top level clock 
declaration - rather like the DT should as closely as possible declare 
an accurate clock tree.

If we need to do special stuff to an individual tree, then CLK_FLAG it. 
Are qcom clocks really the only clocks in the world that need to park to 
XO on the disable path ?

Alternatively continue on with the callback but make the name more 
instructive not "park" since we are dealing with people who have English 
as a second language, third language. English is my first language but 
still a "parked" clock means little to me except that like you and 
Dmitry I work with qcom stuff so I understand it.

"disable_park_xo->clk_disable" or something - even still I think 
removing XO from the clock tree is asking for trouble.

Start from the principle that gcc/camcc/dispcc clock trees should be 
complete and work from there.

That's my 0.02 anyway.

---
bod
