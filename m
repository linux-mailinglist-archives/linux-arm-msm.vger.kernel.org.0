Return-Path: <linux-arm-msm+bounces-80412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A9C34AB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4F31883E76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8DC2E54AA;
	Wed,  5 Nov 2025 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI/2gs+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB23F9FB;
	Wed,  5 Nov 2025 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333390; cv=none; b=a6JlBH6kZ+KUrERO4NcQ57SVo0MWsxiZ2gb7k5B4z3W2VMM4W+e4JbU8qbs2NVvd4LExlNJ4H6CYM4/ijUWfjZi1l+hamYuzGyb+v6ogj2XCpvkpdUqc40AVXh0DAO9gBLGrTP34j7g1MDQrUiO4ucokTNeLO5bqTmkpb3NgWTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333390; c=relaxed/simple;
	bh=hQ/jGydxUaD/JpGjbYckC8YXEagYSitACWYk/eSODd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFQ4bBBE2c0DdNGNIF3eM2cIMDsP5S0OWYTT2Xl/nKbtFty2yps+dU487VUBX3y2um/zGBiqb49VTBOzIrfa/45tqmm53UPm7VmJOdzKXxISXoH1HR3uiZNI0GWZAuHocs88wuhkTZl8s1mzXtb1wLxPmoG9qlPKO6q580f5uwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI/2gs+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BE1C4CEFB;
	Wed,  5 Nov 2025 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762333390;
	bh=hQ/jGydxUaD/JpGjbYckC8YXEagYSitACWYk/eSODd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YI/2gs+0AWGiBduFomCc+RSz1PCliizkdX1DVBz+qdRtB9QHQQlvuvravV0A+hm6Y
	 ycTn1M9KZzRuZMz7gB5uMs7MsAQvhmziwe3rlInOFvLpQUzlJQTsuY5c104zvEuoxo
	 3PlPRyS3XQuTDMfwJylcUp/NXIjsh8qSiRhz+kLr7LGN7G9HzijAeWQShxUJNg9v7Q
	 zzVixHEinoDnPZ3y05mHfFklPh8ujBSlB1JmIOrQyd+nnuBhz8US5fu3yBfHsd6fP2
	 NUHT9+mZDjkEy4cA0w2m1GLt9Jboh4Abz5kU29UCjPR4wRojFiUtOMKGfCLtC8J/rK
	 6lS6a34xQoImQ==
Message-ID: <38452e04-255e-477d-8262-53aeb3c87a01@kernel.org>
Date: Wed, 5 Nov 2025 10:03:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
 kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
 <20251105-industrious-oxpecker-of-valor-af17fa@kuoka>
 <746b292f-fc3a-43a8-89b1-76f61ccc0630@oss.qualcomm.com>
 <7ba7e32b-f00a-4f77-88da-047126a8c3f9@kernel.org>
 <b9e7f8ba-a629-4316-a6dd-d765ed0037ee@oss.qualcomm.com>
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
In-Reply-To: <b9e7f8ba-a629-4316-a6dd-d765ed0037ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/11/2025 09:49, Songwei Chai wrote:
> 
> On 11/5/2025 4:15 PM, Krzysztof Kozlowski wrote:
>> On 05/11/2025 09:11, Songwei Chai wrote:
>>> On 11/5/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Nov 03, 2025 at 10:40:37PM -0800, Songwei Chai wrote:
>>>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>>>> sequences within a specific region of the System on Chip (SoC). Once
>>>>> configured and activated, it monitors sense inputs and can detect a
>>>>> pre-programmed state or sequence across clock cycles, subsequently
>>>>> producing a trigger.
>>>>>
>>>> I do not understand: You got review which you ignored and then you
>>>> removed pieces of this code to make it incorrect. Go back to previous
>>>> versions so you won't waste our time re-doing review.
>>> Hi Krzysztof,
>>>
>>> The previous reviewed-by is no longer applicable because in this
>>> version, we moved
>>>
>>> the driver from /drivers/hwtracing/coresight/ to
>>> /drivers/hwtracing/qcom/. This means the
>>>
>>> required compatible has changed from "/qcom,coresight-tgu/" to "/qcom,tgu/".
>>>
>>> Since this involves changes to devicetree binding, i didn't not carry
>>> over the previous review tags.
>> And which part of changelog explains the exact reasons to drop review
>> tags? Not mentioning that changelog is almost impossible to find, buried
>> under 10 pages of some repetitive introduction
>>
>> Did you read submitting patches?
> 
> As I mentioned above, the |compatible| string in this version has 
> changed compared to
> 
> the previously reviewed binding. Therefore, I believe it's a default 
> rule that the previous
> 
> |Reviewed-by|tags are no longer applicable. If the community requires a 
> note in the changelog to explain this,
> 
> I will make sure to include it in the next version.
> 
> 
> “
> 
> Did you read submitting patches?
> 
> ”
> 
> Yes, the explanations in the cover letter were written by me, so I have 
> definitely read them. All of these explanatory documents are
> 


Heh, why I am even reviewing this... you indicated in your address list
that you do not wish review from me, so I will keep that in mind and not
provide review.

Best regards,
Krzysztof

