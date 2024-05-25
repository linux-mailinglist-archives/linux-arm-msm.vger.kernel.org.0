Return-Path: <linux-arm-msm+bounces-20440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7B8CF02E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47ADB1F2126E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 16:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8335914A;
	Sat, 25 May 2024 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYX5D08o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EA0F4FC;
	Sat, 25 May 2024 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716655562; cv=none; b=fStTkuFQa8H6ctqpBVKj2UjguF7CaFa1FvgBlqlwsrIm1OqV8Uv51Afsvjf8OHzis7HMb7bPqX8uq8/M8tiyCX/53IfLWn1x29k7cCrbpD8gpFDmtV70IAVHlbYKSJgHE8spxfrNfG0dnVRicJjXU5WjF/OzRbAp239naRI/AVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716655562; c=relaxed/simple;
	bh=rpJb9ufSOqQvGtI1L3Z0XIm/GwLfEIO5aOLPxpga49w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlb2VunVICcI8j6s6pOpOJR8EOqPR1++NOGBq4jRugAdwgojrb7hQYLz5zQDj80JQmsK3wgQZM4CZbYlw6ohET7VVBoVM9ARAd/AiXNmoGO6tl2S5kDsdWiMBkCraA6xbx8MSf5twBCuswCTWYsE3txCe7N8wc6tXVMHc2Hc2Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYX5D08o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0742BC2BD11;
	Sat, 25 May 2024 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716655562;
	bh=rpJb9ufSOqQvGtI1L3Z0XIm/GwLfEIO5aOLPxpga49w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SYX5D08onJBpVQ0l1x8JMjv0c4uyhIDVRKjWvhX40JnIinzy9zsLG9+KIOqcxYTOb
	 gqtJGmLOl//Vxb+xZySwEn1BiGFqpUV2Gy8npwPOPeYmhO8BBy9PYQGJLwGRhxzXRP
	 VVKzo09UjONo82nh42uILilKpLIw8bha4Wsg13ce02UqWPCT7tUn2aXrOzzHI0Y1mm
	 NIoqZjiGTONCFignxTZ1wCYxvRVUvhqncPJQg5f2zQu4SxewOtu2Z4TVIKIqweZ0ZP
	 ged4LTMSWFkJMb4tLwu17bsbhk+yqLMEHpr62adXlIAhTMaNy3RB7HCaKi7a9q2dCa
	 HzJB9s2E2MNdg==
Message-ID: <27151624-0c3c-43da-9983-5de86f431d82@kernel.org>
Date: Sat, 25 May 2024 18:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] dt-bindings: remoteproc: qcom,pas: Add hwlocks
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-5-47a90a859238@quicinc.com>
 <3521519f-34b8-472d-be37-f0e64bba24fc@kernel.org>
 <a944418a-1699-44fa-bdfc-2e57129adea1@quicinc.com>
 <c9882ba0-bbbf-44ec-9606-ebe68bcb8866@kernel.org>
 <ZkzzY311XiRigJPt@hu-bjorande-lv.qualcomm.com>
 <92dcd555-69b1-4111-92dd-debe5107d526@kernel.org>
 <Zk4wab/NZOOZ3hA6@hu-bjorande-lv.qualcomm.com>
 <aed37430-7e87-4516-86da-3997c01a8aa8@kernel.org>
 <ZlDpFV8bL8/lwGOP@hu-bjorande-lv.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <ZlDpFV8bL8/lwGOP@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/05/2024 21:23, Bjorn Andersson wrote:
> On Thu, May 23, 2024 at 08:15:54AM +0200, Krzysztof Kozlowski wrote:
>> On 22/05/2024 19:50, Bjorn Andersson wrote:
>>>>>>>
>>>>>>> We did consider tying this to the SMEM instance, but the entitiy 
>>>>>>> relating to firmware is the remoteproc instance.
>>>>>>
>>>>>> I still do not understand why you have to add hwlock to remoteproc, even
>>>>>> though it is not directly used. Your driver problem looks like lack of
>>>>>> proper driver architecture - you want to control the locks not from the
>>>>>> layer took the lock, but one layer up. Sorry, no, fix the driver
>>>>>> architecture.
>>>>>>
>>>>>
>>>>> No, it is the firmware's reference to the lock that is represented in
>>>>> the remoteproc node, while SMEM deals with Linux's reference to the lock.
>>>>>
>>>>> This reference would be used to release the lock - on behalf of the
>>>>> firmware - in the event that the firmware held it when it
>>>>> stopped/crashed.
>>>>
>>>> I understood, but the remoteproc driver did not acquire the hardware
>>>> lock. It was taken by smem, if I got it correctly, so you should poke
>>>> smem to bust the spinlock.
>>>>
>>>
>>> The remoteproc instance is the closest representation of the entity that
>>> took the lock (i.e. the firmware). SMEM here is just another consumer of
>>> the same lock.
>>>
>>>> The hwlock is not a property of remote proc, because remote proc does
>>>> not care, right? Other device cares... and now for every smem user you
>>>> will add new binding property?
>>>>
>>>
>>> Right, the issue seen relates to SMEM, because the remote processor (not
>>> the remoteproc driver) took the lock.
>>>
>>>> No, you are adding a binding based on your driver solution.
>>>
>>> Similar to how hwspinlocks are used in other platforms (e.g. TI) the
>>> firmware could take multiple locks, e.g. to synchronize access to other
>>> shared memory mechanism (i.e. not SMEM). While I am not aware of such
>>> use case today, my expectation was that in such case we just list all
>>> the hwlocks related to the firmware and bust those from the remoteproc
>>> instance.
>>>
>>> Having to export APIs from each one of such drivers and make the
>>> remoteproc identify the relevant instances and call those APIs does
>>> indeed seem inconvenient.
>>> SMEM is special here because it's singleton, but this would not
>>> necessarily be true for other cases.
>>
>> I don't think that exporting such API is unreasonable, but quite
>> opposite - expected. The remote processor crashed, so the remoteproc
>> driver is supposed to call some sort of smem_cleanup() or
>> smem_cleanup_on_crash() and call would bust/release the lock. That way
>> lock handling is encapsulated entirely in one driver which already takes
>> and releases the lock.
>>
> 
> I don't agree.
> 
> SMEM does indeed acquire and release the same, shared, lock. But the
> SMEM driver instance on our side is not involved in taking the lock for
> the firmware.
> 
> There exist an equivalent SMEM driver instance in the firmware that
> crashed and that's the thing that needs to be released.

Then please include relevant explanation in the commit msg.

> 
> 
> We're also not tearing down, or cleaning up anything in our SMEM
> instance. It is simply "when remoteproc id N died, check if N is holding
> the lock and if so force a release of the lock - so that others can grab
> it".
> 
>> Just like freeing any memory. remoteproc driver does not free other
>> driver's memory only because processor crashed.
>>
> 
> That's a good comparison. Because when the firmware running on the
> remote processor crashes, it is indeed the job of the remoteproc driver
> to clean up the memory allocated to run the remote processor.


Best regards,
Krzysztof


