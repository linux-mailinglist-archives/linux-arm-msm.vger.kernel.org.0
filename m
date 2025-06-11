Return-Path: <linux-arm-msm+bounces-60916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2204AD4BB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 08:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE6981899A3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27D8225A39;
	Wed, 11 Jun 2025 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCik9PTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF528FD;
	Wed, 11 Jun 2025 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623439; cv=none; b=lUVGAuAou0iyXEBZc+4RC3AYTb7jFQzP+MIN2K+dZprnaNmjmicikoIH2MK9yD/LtQUL+oLr981h8QJYDKfRYNSPOJObDQqtkbs4/S7pw/BYqCzC7YnnmRbiMi6T0AvBzUdHAtn3BYozTu+IyhRcO3AkUwa2ovuKa1FKDvSan7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623439; c=relaxed/simple;
	bh=Eqwe71FwB2joW1I6Xy4GZaN1pBqXDrm63lZSn17aIOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhoB4Cdx5bGYAijgxBDGFR1uT+wSP/25LP44UAPAi6hEqADtGUONAJD+jLTJNzUOQ7r7zgc5C57y2NenjmmIWf8d3NL58NwDEdpHcIKCIA5T3opSJWH1sl6ZONGmr0fsaoxw7CfjwZt671s+wOD58v0SMJmixSUq1B6VdudgdQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCik9PTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B25CC4CEEE;
	Wed, 11 Jun 2025 06:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749623439;
	bh=Eqwe71FwB2joW1I6Xy4GZaN1pBqXDrm63lZSn17aIOo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rCik9PTQe0mWY83smq5T3YIS7kM2Q/SPiH0W/FEWNOq+eEq7xNl5k9ymbATz+Nq3x
	 10lRHm6KGjmIjspzqdlJm+4qK44ONtntHQubEGxoO0+CYswAA78HdJqpNi9fAF6fLy
	 HSYjK1rkJU/Cs7Ok+TnyMedLj10k2aFRmm6syUhlHhMQrKrhDVFCLmdq/XAlD3TT2d
	 u/3AFj15snkMwLA8qvOLtKXaqcB5BE3VBe61hXJAsz02clJs6puPFI30YHCIiYHHcS
	 pi40wIgZjYGiYGpL992HL+1khEMhZxGx8+FspmVu26hG2khWFYWwbSjNgCLIXxJ0Vf
	 dIc9J6lmyTM1g==
Message-ID: <717e3f5f-1753-4715-b569-3d7567508d76@kernel.org>
Date: Wed, 11 Jun 2025 08:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org> <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org> <20250521-psychedelic-cute-grouse-ee1291@kuoka>
 <aC-AqDa8cjq2AYeM@linaro.org>
 <20250523-markhor-of-fortunate-experience-1f575e@kuoka>
 <jvsdn67x2qm2avaktnpqzoixcd46xuuf6i5kpeolsnewgoqt6q@jid7unlmmu65>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <jvsdn67x2qm2avaktnpqzoixcd46xuuf6i5kpeolsnewgoqt6q@jid7unlmmu65>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 05:31, Bjorn Andersson wrote:
> On Fri, May 23, 2025 at 11:06:04AM +0200, Krzysztof Kozlowski wrote:
>> On Thu, May 22, 2025 at 09:53:12PM GMT, Stephan Gerhold wrote:
>>> +Saravana
>>>
>>> On Wed, May 21, 2025 at 11:20:40AM +0200, Krzysztof Kozlowski wrote:
>>>> On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
>>>>>>>>> The mailbox itself does not need any clocks and should probe early to
>>>>
>>>> ... so probe it early.
>>>>
>>>>>>>>> unblock the rest of the boot process. The "clocks" are only needed for the
>>>>>>>>> separate clock controller. In Linux, these are already two separate drivers
>>>>>>>>> that can probe independently.
>>>>
>>>> They can probe later, no problem and DT does not stop that. Linux, not
>>>> DT, controls the ways of probing of devices and their children.
>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>> Why does this circular dependency need to be broken in the DeviceTree
>>>>>>>> representation?
>>>>>>>>
>>>>>>>> As you describe, the mailbox probes and register the mailbox controller
>>>>>>>> and it registers the clock controller. The mailbox device isn't affected
>>>>>>>> by the clock controller failing to find rpmcc...
>>>>>>>>
>>>>>>>
>>>>>>> That's right, but the problem is that the probe() function of the
>>>>>>> mailbox driver won't be called at all. The device tree *looks* like the
>>>>>>> mailbox depends on the clock, so fw_devlink tries to defer probing until
>>>>>>> the clock is probed (which won't ever happen, because the mailbox is
>>>>>>> needed to make the clock available).
>>>>>>>
>>>>>>> I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
>>>>>>> them anyway, but fact is that we need to split this up in order to avoid
>>>>>>> warnings and have the supplies/consumers set up properly. Those device
>>>>>>> links are created based on the device tree and not the drivers.
>>>>>>
>>>>>> Does "post-init-providers" providers solve your problem?
>>>>>>
>>>>>
>>>>> I would expect that it does, but it feels like the wrong solution to the
>>>>> problem to me. The clock is not really a post-init provider: It's not
>>>>> consumed at all by the mailbox and needed immediately to initialize the
>>>>> clock controller. The real problem in my opinion is that we're
>>>>> describing two essentially distinct devices/drivers in a single device
>>>>> node, and there is no way to distinguish that.
>>>>>
>>>>> By splitting up the two distinct components into separate device tree
>>>>> nodes, the relation between the providers/consumers is clearly
>>>>> described.
>>>>
>>>> You can split devices without splitting the nodes. I do not see reason
>>>> why the DT is the problem here.
>>>>
>>>
>>> The Linux drivers for this particular mailbox/clock controller already
>>> work exactly the way you propose. They are split into two devices that
>>> can probe independently.
>>>
>>> The problem is outside of the drivers, because fw_devlink in Linux
>>> blocks probing until all resources specified in the device tree nodes
>>> become available. fw_devlink has no knowledge that the mailbox described
>>> by this peculiar device tree node does not actually need the clocks:
>>>
>>> 	apcs1_mbox: mailbox@b011000 {
>>> 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
>>> 		reg = <0x0b011000 0x1000>;
>>> 		#mbox-cells = <1>;
>>> 		clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>> 		clock-names = "pll", "aux", "ref";
>>> 		#clock-cells = <0>;
>>> 	};
>>>
>>> Without device-specific quirks in fw_devlink, the fact that these clocks
>>> are only used by an unrelated clock controller only becomes clear if we
>>> split the device tree node like I propose in this series:
>>>
>>> 	apcs1_mbox: mailbox@b011000 {
>>> 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
>>> 		reg = <0x0b011000 0x1000>;
>>> 		#mbox-cells = <1>;
>>>
>>> 		apcs1_clk: clock-controller {
>>> 			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>> 			clock-names = "pll", "aux", "ref";
>>> 			#clock-cells = <0>;
>>> 		};
>>> 	};
>>
>> Above code suggests that clocks are not needed for the mailbox at all.
>> You need to be really sure of that. If that's the case, then this
>> description looks like correct hardware description, more detailed then
>> the first case, though.
>>
> 
> I'm still sceptical here.
> 
> In the first snippet above, we describe a single IP block which provides
> mailboxes and clocks.
> 
> In the second snippet we're saying that the IP block is a mailbox, and
> then it somehow have a subcomponent which is a clock provider.
> 
> It seems to me that we're choosing the second option because it better
> fits the Linux implementation, rather than that it would be a better

I initially commented in similar way, however some more explanations
were provided.

> representation of the hardware. To the point that we can't even describe
> the register range of the subcomponent...

I did not check in any manual, so all my comments here are based on
above explanations and DTS.

Subnodes are allowed if they come with their own resources. You are
right there is no separate address space, so that's argument against
subnode. But there is separate clock, not needed for the parent (!!!),
which is an argument in favor.

> 
> 
> Can you confirm that this is the path we want to go here?

It is an acceptable solution to me, but I am not saying that every
device should be converted that way.

Best regards,
Krzysztof

