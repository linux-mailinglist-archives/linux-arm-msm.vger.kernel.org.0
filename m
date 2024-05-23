Return-Path: <linux-arm-msm+bounces-20289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10758CCC2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 08:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888EA283956
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 06:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173E213B2B4;
	Thu, 23 May 2024 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G84jSHXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5D187F;
	Thu, 23 May 2024 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716445158; cv=none; b=GVJnkHZkoQ82/iwotY91ux1uSw2qPeqwAhsoYv2klmxlz7x9oMPvXNYmFzAPz24c+1C1QSQWpF904b5M/ZVxEx5EVTMTRK2DXE6aA8NS7YvStXjRcET1J29/p82aCipYB5TAwNhgS+wt+SmsYvGxAsNEzqfn4CTtXALHk/bLyok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716445158; c=relaxed/simple;
	bh=8zHA0HU2AbRI7s7cejYhTpjhS07bLPkgGzXqxwDglsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKsistQhql/D2Rou56c2hY7+DKuYbNk5bv0r1X2+o0w4GWzftFcuTz6ZvuvpieWP4iHcC1IgcR03RoQFE8f6z9guAH8vDkuCWPBoi5uwVp4Vh7snxfcW0C4fgE28jsiFQkK779BnGC5wezT+9a+6fq9QAm6T+HnTHL8yiwxPmuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G84jSHXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C20C2BD10;
	Thu, 23 May 2024 06:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716445157;
	bh=8zHA0HU2AbRI7s7cejYhTpjhS07bLPkgGzXqxwDglsw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G84jSHXZsPZbgtATo0PIlB91aprBi3Lig4z09Esp9z+lXtr9fLABITgYa8z38bGnX
	 q/eujJXu9dXdZAs3CajrXjzOFboP3p/29NBDnNfEkszkUcU9PfaRrri78EIRhc23tV
	 /g1jxjHBcZCDWOQjWVBcuTLXwiQkemvlPh4ZA64R9KxW8DaNAuy3IEIasFKWx8shzF
	 ZDYlsUo+upflB9MryCVxJqHCBSh32iGi7mgAIxLVU9B9z/Ph/hqJ5mFpQgLk47BUzu
	 0X5lPhI4Y/CZR/WOUxa6Xg7vlqVbkXXqkBPcaUVL2p4k6BNrNZdPMkE/5m0JSoKCMd
	 CBFsWctBcouBA==
Message-ID: <e4579702-089e-48cb-bf06-f8e4fb618050@kernel.org>
Date: Thu, 23 May 2024 08:19:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying
 mboxes instead of qcom,ipc
To: Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz>
 <6253429.lOV4Wx5bFT@g550jk> <aced3d43-5f79-4b57-8663-5762db1ad2f6@linaro.org>
 <5099926.GXAFRqVoOG@g550jk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5099926.GXAFRqVoOG@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2024 08:16, Luca Weiss wrote:
> On Donnerstag, 23. Mai 2024 08:02:13 MESZ Krzysztof Kozlowski wrote:
>> On 22/05/2024 19:34, Luca Weiss wrote:
>>> On Mittwoch, 22. Mai 2024 08:49:43 MESZ Krzysztof Kozlowski wrote:
>>>> On 21/05/2024 22:35, Luca Weiss wrote:
>>>>> On Dienstag, 21. Mai 2024 10:58:07 MESZ Krzysztof Kozlowski wrote:
>>>>>> On 20/05/2024 17:11, Luca Weiss wrote:
>>>>>>> Hi Krzysztof
>>>>>>>
>>>>>>> Ack, sounds good.
>>>>>>>
>>>>>>> Maybe also from you, any opinion between these two binding styles?
>>>>>>>
>>>>>>> So first using index of mboxes for the numbering, where for the known
>>>>>>> usages the first element (and sometimes the 3rd - ipc-2) are empty <>.
>>>>>>>
>>>>>>> The second variant is using mbox-names to get the correct channel-mbox
>>>>>>> mapping.
>>>>>>>
>>>>>>> -               qcom,ipc-1 = <&apcs 8 13>;
>>>>>>> -               qcom,ipc-2 = <&apcs 8 9>;
>>>>>>> -               qcom,ipc-3 = <&apcs 8 19>;
>>>>>>> +               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
>>>>>>>
>>>>>>> vs.
>>>>>>>
>>>>>>> -               qcom,ipc-1 = <&apcs 8 13>;
>>>>>>> -               qcom,ipc-2 = <&apcs 8 9>;
>>>>>>> -               qcom,ipc-3 = <&apcs 8 19>;
>>>>>>> +               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
>>>>>>> +               mbox-names = "ipc-1", "ipc-2", "ipc-3";
>>>>>>
>>>>>> Sorry, don't get, ipc-1 is the first mailbox, so why would there be <0>
>>>>>> in first case?
>>>>>
>>>>> Actually not, ipc-0 would be permissible by the driver, used for the 0th host
>>>>>
>>>>> e.g. from:
>>>>>
>>>>> 	/* Iterate over all hosts to check whom wants a kick */
>>>>> 	for (host = 0; host < smsm->num_hosts; host++) {
>>>>> 		hostp = &smsm->hosts[host];
>>>>>
>>>>> Even though no mailbox is specified in any upstream dts for this 0th host I
>>>>> didn't want the bindings to restrict that, that's why in the first example
>>>>> there's an empty element (<0>) for the 0th smsm host
>>>>>
>>>>>> Anyway, the question is if you need to know that some
>>>>>> mailbox is missing. But then it is weird to name them "ipc-1" etc.
>>>>>
>>>>> In either case we'd just query the mbox (either by name or index) and then
>>>>> see if it's there? Not quite sure I understand the sentence..
>>>>> Pretty sure either binding would work the same way.
>>>>
>>>> The question is: does the driver care only about having some mailboxes
>>>> or the driver cares about each specific mailbox? IOW, is skipping ipc-0
>>>> important for the driver?
>>>
>>> There's nothing special from driver side about any mailbox. Some SoCs have
>>> a mailbox for e.g. hosts 1&2&3, some have only 1&3, and apq8064 even has
>>> 1&2&3&4.
>>>
>>> And if the driver doesn't find a mailbox for a host, it just ignores it
>>> but then of course it can't 'ring' the mailbox for that host when necessary.
>>>
>>> Not sure how much more I can add here, to be fair I barely understand what
>>> this driver is doing myself apart from the obvious.
>>
>> From what you said, it looks like it is enough to just list mailboxes,
>> e.g. for ipc-1, ipc-2 and ipc-4 (so no ipc-0 and ipc-3):
> 
> No, for sure we need also the possibility to list ipc-3.

? You can list it, what's the problem>

> 
> And my point is that I'm not sure if any platform will ever need ipc-0, but
> the code to use that if it ever exists is there - the driver always
> tries getting an mbox (currently just syscon of course) for every host
> from 0 to n.
> 
> These are the current (non-mbox-API) mboxes provided to smsm:
> 
> $ git grep qcom,ipc- arch/
> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-1 = <&l2cc 8 4>;
> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-2 = <&l2cc 8 14>;
> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-3 = <&l2cc 8 23>;
> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:               qcom,ipc-1 = <&apcs 8 13>;
> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:               qcom,ipc-2 = <&apcs 8 9>;
> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:               qcom,ipc-3 = <&apcs 8 19>;
> arch/arm64/boot/dts/qcom/msm8916.dtsi:          qcom,ipc-1 = <&apcs 8 13>;
> arch/arm64/boot/dts/qcom/msm8916.dtsi:          qcom,ipc-3 = <&apcs 8 19>;
> arch/arm64/boot/dts/qcom/msm8939.dtsi:          qcom,ipc-1 = <&apcs1_mbox 8 13>;
> arch/arm64/boot/dts/qcom/msm8939.dtsi:          qcom,ipc-3 = <&apcs1_mbox 8 19>;
> arch/arm64/boot/dts/qcom/msm8953.dtsi:          qcom,ipc-1 = <&apcs 8 13>;
> arch/arm64/boot/dts/qcom/msm8953.dtsi:          qcom,ipc-3 = <&apcs 8 19>;
> arch/arm64/boot/dts/qcom/msm8976.dtsi:          qcom,ipc-1 = <&apcs 8 13>;
> arch/arm64/boot/dts/qcom/msm8976.dtsi:          qcom,ipc-2 = <&apcs 8 9>;
> arch/arm64/boot/dts/qcom/msm8976.dtsi:          qcom,ipc-3 = <&apcs 8 19>;
> 
>>
>> mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;

So which case is not covered?

Best regards,
Krzysztof


