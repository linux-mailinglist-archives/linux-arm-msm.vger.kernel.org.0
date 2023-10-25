Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF437D6767
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbjJYJrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234761AbjJYJrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:47:07 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87892D5B
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:45:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507b9408c61so7458180e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698227122; x=1698831922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsjAaqN9iQ0Nkn90LUrowVZcqqplmGKwBm93B8d6nXI=;
        b=eYx/Ztkj075Q2Aj1tMFuUrm3yql+Z0lI6yhW8XmEMhecZm5Yfd5tuaAT9wMkYpR225
         rUIC1PqKosX3wI5M/4k6ZTSBWgkyaOuPzQvjLxHPyqh8xfO/BQRtwPs6QwIr8Dw12tki
         FfHYoaEXghmZhUUZvSKXw3pkGuT54/2WPL4T7n62HMaBprMwT1WHo7F/nzTlBJz6FyHw
         PBYYWvYpjT6cbeY1Wkmx/EtwJGdFFQ0TlMFGKkB9H5qhEIbMu7eP9N/yLPkduFxN3ODo
         eFtvSNi3HAauxUfd5x3nge/hgOPqtsWPxiPtP7lYfjXtPn3dzwH23v2pZlsTsCk1WRv6
         5iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698227122; x=1698831922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsjAaqN9iQ0Nkn90LUrowVZcqqplmGKwBm93B8d6nXI=;
        b=MUDx9BTVQjM57toupn6OHJf2o0hukWbZKX5JmGCjKLElLFASVAAVVi2hbErPdhXmNd
         7VUgj4h5AWneGQZ7TaDhfSaORvx0O3eyiZix87lObgjcHvDEAeKWDW7L9jt2VAbDpwNi
         ZBZWaR8JgG5oDNN+U3UH3I54DggqaVICPaPP/SYtbBRSoO+//1kveEM4e8HCmzbDl3GI
         a4co9jjIaQE6iyfiw0rypekCMZB73UtyhIQe4tnsTsxeiceYvka0w8XirHHxcGDFeZDX
         kVWUMkh4WIA2jR8IM272JqxEFHFpdCmSpB4zh1Y5FzSY/aBE2jWCh2YM6U1gDYdLwKAK
         vIXQ==
X-Gm-Message-State: AOJu0YzEvw2yEAsYh8nG32t92zidSbYPPPTNQbcfPqgqCF1QPVK3QLm3
        k04Bf6t7G8iUN0wUJhHVVjJTnQ==
X-Google-Smtp-Source: AGHT+IEnEo1+RjkiO+az80sgQGWuS5PtpoiZ767Uk/FmfH696W7m+7r9mZZBsxcOs4GPycOhU6Z78w==
X-Received: by 2002:a05:6512:62:b0:503:385c:4319 with SMTP id i2-20020a056512006200b00503385c4319mr10767995lfo.19.1698227121559;
        Wed, 25 Oct 2023 02:45:21 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k6-20020ac24f06000000b005007fc9ccd0sm2461452lfr.113.2023.10.25.02.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:45:20 -0700 (PDT)
Message-ID: <6e4408d8-2270-4abc-b9a7-24cae489a08b@linaro.org>
Date:   Wed, 25 Oct 2023 12:45:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
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
 <a9c805b5-5c3e-9e25-ad82-021a421c309b@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a9c805b5-5c3e-9e25-ad82-021a421c309b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2023 13:08, Bryan O'Donoghue wrote:
> On 07/10/2023 00:45, Konrad Dybcio wrote:
>> On 4.10.2023 14:52, Bryan O'Donoghue wrote:
>>> On 04/10/2023 13:08, Dmitry Baryshkov wrote:
>>>> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
>>>> <bryan.odonoghue@linaro.org> wrote:
>>>>>
>>>>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>>>> must not be completely turned off. However its design has one major
>>>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>>>
>>>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be 
>>>>>> fully
>>>>>> switched off (and shared most of the implementation with
>>>>>> clk_rcg2_shared_ops). The major difference is that it requires 
>>>>>> that the
>>>>>> parent map doesn't conain the safe (parked) clock source. Instead 
>>>>>> if the
>>>>>> CFG_REG register points to the safe source, the clock is 
>>>>>> considered to
>>>>>> be disabled.
>>>>>
>>>>> Why not have a new bit in .flags ?
>>>>>
>>>>> Instead of lying about the clock being off, mark the clock as 
>>>>> "parked",
>>>>> or "safe parked" or whatever term we choose for it ?
>>>>
>>>> The main problem with adding flags doesn't fully scale. From the CCF
>>>> perspective, what should be the difference between parked and disabled
>>>> clocks? How should it treat the parked one?
>>>
>>> Exactly the same as a disabled clock, except you get a "parked" 
>>> instead of a "disabled" when looking up its state and you don't have to
>> The thing is that currently there's only the notion of "enabled"
>> or "not enabled".. Introducing a third state here would be the
>> jump from boolean to quantum logic!
>>
>> I think that abstracting this information away from Linux is not
>> an issue.. These clocks "can't be any more off", or the SoC will
>> explode badly and Linux will be unusable..
>>
>> Think of it like CPUs with a hypervisor, you shut them down, but
>> the physical number crunchers on the host CPU may not actually
>> get cut off from their power source, but there's no reason for
>> the VM to know that. That's probably what happens on our little
>> virtualized snapdragons anyway..
>>
>> Konrad
> 
> So not a state but a flag.
> 
> 1. The clock tree we declare _should_ be a fair and complete description
>     of the hardware clock tree.

Yes and no. We already have clocks not present in the tree for different 
reasons: being handled by the RPM(h), being critical to the platform 
integrity, being useless for Linux, etc.

> 
> 2. If we remove XO from some trees with the only indication of
>     differentiation being the callback you bind the tree to you need
>     someone reading the code both know about parking, derive that
>     information from reading the callback, which means you require that
>     person to read the code in detail and understand it.
> 
>     That's alot of tribal knowledge we are storing up there.

I think adding a huge comment should help. Because otherwise you sound 
like 'we should not expect kernel developers to read the code', which is 
not true.

> 
> 3. A different approach is to add a new CLK_DISABLE_PARKS_TO_XO - or
>     whatever name makes sense.
> 
>     a) The clock tree declared in the gcc, camcc, dispcc, videocc or
>        is correct and aligned with the documentation and silicon.
>        Right away this avoids patches sent to 'fixup' incomplete trees.
> 
>     b) When you look at a clock struct clk_branch_gcc.clk.hw.init.flags
>        there is a big dirty CLK_DOES_THIS_THING flag which doesn't
>        require a developer to have tribal knowledge about how we've
>        hacked up clock parking.

But the problem is that this flag is not generic at all. I think we will 
be damned and prosecuted if we try adding anything about PARK_TO_XO to 
<linux/clk-provider.h>.

And also there is always a question on the state integrity: if the clock 
is parented with the XO on the driver bootstrap, should CCF treat it as 
'parked' or as 'enabled, clocked by XO'?

> 
> My basic point here is the declaration of a parked clock should be 
> obvious, easy to understand and not lend itself to "helpful" patches to 
> "fix" the clock tree.

We already tried doing that... And it failed. For the PHY PIPE clocks we 
ended up doing exactly the same thing, because it simplified the code 
_a_lot_.

> Also consider precedent. When you want to quickly get your clock 
> controller up and running - you generally open existing upstream stuff 
> to clone and own as much as possible. A BIT_DIRTY_FLAG transmits more 
> information than a small callback with esoteric logic buried inside of 
> the disable path.
> 
> I agree with your point on a new state but similarly I think the 
> callback buries too much information away. IMO the top level clock 
> declaration - rather like the DT should as closely as possible declare 
> an accurate clock tree.
> 
> If we need to do special stuff to an individual tree, then CLK_FLAG it. 
> Are qcom clocks really the only clocks in the world that need to park to 
> XO on the disable path ?
> 
> Alternatively continue on with the callback but make the name more 
> instructive not "park" since we are dealing with people who have English 
> as a second language, third language. English is my first language but 
> still a "parked" clock means little to me except that like you and 
> Dmitry I work with qcom stuff so I understand it.
> 
> "disable_park_xo->clk_disable" or something - even still I think 
> removing XO from the clock tree is asking for trouble.

clk_rcg2_disable_parks_to_tcxo_ops ? Slightly ugly but I'm fine with that.

> 
> Start from the principle that gcc/camcc/dispcc clock trees should be 
> complete and work from there.
> 
> That's my 0.02 anyway.
> 

-- 
With best wishes
Dmitry

