Return-Path: <linux-arm-msm+bounces-67575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B20B1932B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A221116BD6B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 09:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8AD286894;
	Sun,  3 Aug 2025 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw/j3Oeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85E2AD3D;
	Sun,  3 Aug 2025 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754212865; cv=none; b=b2UybWkUNW/LXMFYQua08spj9gnSSkOyRhLPE66PSkkWRz7Yii1pUPuEF0WnkDCUKhTP5pouhHoIUF0X5t3rEGD4ESja6V/fQPIUafpIDG/vTQnjXXmvOPKPkQBqxcTo+bv1a8ggjBuBCi/1HrLsY2deZUd7aUn1OgJWZ6UhqvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754212865; c=relaxed/simple;
	bh=6SiqmzgUPZiU3wRacVGyFYA2GVYo9ShBH5POmw4XLeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDixJWpfR2O4hsV3/PC2VeXjiLatlu4cHPXuHyghAcrrT/e1SSMge6oarIz/Ij5xx5vAt4Y+ZXa1qUtPhFd2SOUOckxRMc9EnnNAdr6yO9SUjH5cr5bm4u8sgcpUnolWNoTxZsYpvOGkibE8BAFQ0fDyZ59CBzfiWBOZ0xF9Wfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw/j3Oeq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF17C4CEF8;
	Sun,  3 Aug 2025 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754212864;
	bh=6SiqmzgUPZiU3wRacVGyFYA2GVYo9ShBH5POmw4XLeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aw/j3OeqjQ/iFCgHi/RWGqYq7syYaTdWk/XyaeXaSWa/9B/gULAeCtn3X6d553UIT
	 zis3vGT82aTx9/lCXCvzYcBu6UkuBARnGc3HWPN89gcd5+5AKhF/uOjCtMv7xIGNf+
	 6nr3x9rSCH6NIZ4Zu9h/+pq+ejCwjM6eVVraXwfbPEkoX4ERw9PLA5qrzxuXeZId1k
	 jizU6mOr5TVMPndjKUw94sL3dLiBKouEb3aDrUpApjcD3ItpNOso2S1yhNL+lSnWJr
	 /QYUSABbIQBwuVFEwEhHlWDn0e8liZTWYDl0K1HOfCZA1XFM6u1z8TXQGIN2fS1Uec
	 EZfHP5PhhuURA==
Message-ID: <00f6d696-a8d2-41a5-819a-dc1ed87d35bb@kernel.org>
Date: Sun, 3 Aug 2025 11:20:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alex Elder <elder@riscstar.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
 <20250527-topic-ipa_imem-v2-1-6d1aad91b841@oss.qualcomm.com>
 <97724a4d-fad5-4e98-b415-985e5f19f911@kernel.org>
 <e7ee4653-194c-417a-9eda-2666e9f5244d@oss.qualcomm.com>
 <68622599-02d0-45ca-82f5-cf321c153cde@kernel.org>
 <bf78d681-723b-4372-86e0-c0643ecc2399@oss.qualcomm.com>
 <62b0f514-a8a9-4147-a5c0-da9dbe13ce39@kernel.org>
 <747e5221-0fb1-4081-9e98-94b330ebf8c7@oss.qualcomm.com>
 <e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org>
 <f6b16d1d-3730-46d1-81aa-bfaf09c20754@oss.qualcomm.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <f6b16d1d-3730-46d1-81aa-bfaf09c20754@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2025 11:47, Konrad Dybcio wrote:
> On 7/30/25 3:14 PM, Krzysztof Kozlowski wrote:
>> On 30/07/2025 14:07, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>> Missing additionalProperties: false, which would point you that this is
>>>>>>>> incomplete (or useless because empty).
>>>>>>>
>>>>>>> How do I describe a 'stupid' node that is just a reg?
>>>>>> With "reg" - similarly to many syscon bindings.
>>>>>
>>>>> Is this sort of inline style acceptable, or should I introduce
>>>>> a separate file?
>>>>
>>>> It's fine, assuming that it is desired in general. We do not describe
>>>> individual memory regions of syscon nodes and this is a syscon.
>>>>
>>>> If this is NVMEM (which it looks like), then could use NVMEM bindings to
>>>> describe its cells - individual regions. But otherwise we just don't.
>>>
>>> It's volatile on-chip memory
>>>
>>>> There are many exceptions in other platforms, mostly old or even
>>>> unreviewed by DT maintainers, so they are not a recommended example.
>>>>
>>>> This would need serious justification WHY you need to describe the
>>>> child. Why phandle to the main node is not enough for consumers.
>>>
>>> It's simply a region of the SRAM, which needs to be IOMMU-mapped in a
>>> specific manner (should IMEM move away from syscon+simple-mfd to
>>> mmio-sram?). Describing slices is the DT way to pass them (like under
>>> NVMEM providers).
>>
>>
>> Then this might be not a syscon, IMO. I don't think mixing syscon and
>> SRAM is appropriate, even though Linux could treat it very similar.
>>
>> syscon is for registers. mmio-sram is for SRAM or other parts of
>> non-volatile RAM.
>>
>> Indeed you might need to move towards mmio-sram.
>>
>>>
>>>>
>>>> If the reason is - to instantiate child device driver - then as well no.
>>>> This has been NAKed on the lists many times - you need resources if the
>>>> child should be a separate node. Address space is one resource but not
>>>> enough, because it can easily be obtained from the parent/main node.
>>>
>>> There is no additional driver for this
>>
>> Then it is not a simple-mfd...
> 
> Indeed it's really not
> 
> I found out however that the computer history museum (i.e.
> qcom-apq8064-asus-nexus7-flo.dts and qcom-msm8974.dtsi) seems to
> have used simple-mfd, so that the subnode (syscon-reboot-mode) is
> matched against a driver
> 
> The same can be achieved if we stick an of_platform_populate() at
> the end of mmio-sram probe - thoughts?
You cannot (or should not) remove simple-mfd from existing binding. But
the point is that the list should not grow.

Maybe the binding should receive a comment next to compatible:
" # Do not grow this, if you add here new compatible, you agree to buy
round of drinks on next LPC to all upstream maintainers" ?

Best regards,
Krzysztof

