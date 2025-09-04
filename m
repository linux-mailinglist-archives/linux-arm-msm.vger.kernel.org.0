Return-Path: <linux-arm-msm+bounces-72051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F7B43C92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631143A814B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBB13002A8;
	Thu,  4 Sep 2025 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRNUGzUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD62FE05F;
	Thu,  4 Sep 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991271; cv=none; b=BLDJidbMVoBX0U49NtB8ARRSziRw97PoSU0J0sbAdZeApz1w9f6Wz4pNwh+O+MZs899cANEcWDRWXs8AME0k3Q6hVm3AFAbeV8L/pPdY6gcLlrOk0ybKMjau5Bv4R5L120GmWJSCJBII6VBpebI+DWsi6gbDa+XN8bTwE7LzJZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991271; c=relaxed/simple;
	bh=6e+AetaFHn7UAgXhVVTChTNxV2XEqTlGmei0BMQcBOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrVfuWzApiVaZ0dVnL46F2hARe2IaO98MPR8BvicjZUGNPeuk+1zs0gDOBD5GcUc2WnDTJIyT+OhDlwyudhuUOHJ/yAcwezTJDPT/opq3oun2sjlO8MwWmpebYWY6i86RDTU0R9DAzte2zQtwclU/mE4j8aOYxQtdKNL8GaG3rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRNUGzUc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F47C4CEF0;
	Thu,  4 Sep 2025 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756991270;
	bh=6e+AetaFHn7UAgXhVVTChTNxV2XEqTlGmei0BMQcBOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tRNUGzUciG9NuAXROKA+v9Qk3LDdSy6u7pRZOn0HHdrhlXfdKwlm6sooxnS8dDYYi
	 HZ2EBCiXnOSNmIJifI3un82iOQ67WKJva5dBf+CDGrLFhlj2hAFiVBWIcIP0LeZUYI
	 GqrBT+hUSiXDQwqrwnaMlSnwemWmW2suw1Bu7Q1H6J/h8LbKIXxXSum6mpvAAZtqSD
	 vwRAN3okhUGHHZG04i3RFPDU7vfSnkDucAMXFFSFGvbS52tV9OAz78+AbyOR2p3mql
	 YwR5Aab7PTFzWygxULG2q/pHwQ2E4z1niAd/IdZ60QUe/OeLDwYeByhLJJEfXWhS1q
	 kIUarmrNmSQQg==
Message-ID: <d2d9d5fc-27c4-4a5c-8ece-0f2e8b7030e2@kernel.org>
Date: Thu, 4 Sep 2025 15:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/4] arm64: dts: qcom: sm8550: Add max-sd-hs-hz
 property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <20250903080404.3260135-5-quic_sartgarg@quicinc.com>
 <6deac56f-e21a-4447-bfa7-a414084676b8@kernel.org>
 <be87fb2f-7036-4039-8ba2-63d54a9ae732@oss.qualcomm.com>
 <23c29fb7-c0a4-4519-9b8d-e68255b83a10@kernel.org>
 <a304ec1c-7364-4926-8763-8c731e461eb9@kernel.org>
 <d12957f0-f8b5-4b29-967c-576dadd565de@oss.qualcomm.com>
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
In-Reply-To: <d12957f0-f8b5-4b29-967c-576dadd565de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 14:27, Konrad Dybcio wrote:
> On 9/4/25 12:52 PM, Krzysztof Kozlowski wrote:
>> On 04/09/2025 12:51, Krzysztof Kozlowski wrote:
>>> On 04/09/2025 10:36, Konrad Dybcio wrote:
>>>> On 9/3/25 10:21 AM, 'Krzysztof Kozlowski' via kernel wrote:
>>>>> On 03/09/2025 10:04, Sarthak Garg wrote:
>>>>>> Due to board-specific hardware constraints particularly related
>>>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>>>> card in HS mode.
>>>>>>
>>>>>> This is achieved by introducing the `max-sd-hs-hz` property in the
>>>>>> device tree, allowing the controller to operate within safe frequency
>>>>>> limits for HS mode.
>>>>>>
>>>>>
>>>>> Probably we will now replicate the same discussion... And it will be
>>>>> happening every time you send the same and not reflect it in commit msg.
>>
>> Just to emphasize this - it will happen EVERY time.
>>
>>>>>
>>>>> Bindings say board setup, this commit msg says board config, but the
>>>>> patch says SoC. This is not correct.
>>>>
>>>> Both are correct, looking at the problem from two perspectives.
>>>>
>>>> The bindings description mentions board-specific limitations (e.g. because
>>>> "the board's electrical design does not allow one to achieve the full rated
>>>> frequency that the SoC can otherwise do, in a stable way")
>>>>
>>>> Here the author tries to argue that almost all SM8550 boards are broken
>>>> in this sense, because the reference design did not feature the required
>>>> passive components, making most (derivative) designs sort of "broken by
>>>> default" - and only some (if any?) vendors decided to go with the
>>>> additional components required to lift this limitation.
>>>>
>>>> This in turn makes it fair to assume the developer experience would benefit
>>>> from having the SD card high speed modes always work (with the slight speed
>>>> cap which may not be required for the 1 or 2 designs that took the extra
>>>> step) without each board DT creator having to track down this property
>>>> separately.
>>>
>>> And then if you send same v3, I will ask the same. Can the author
>>
>> v3 -> v6
> 
> So, would you be accepting of this patch if the commit message was:
> 
> arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default
> 
> Due to an implementation detail in this SoC, additional passive
> electrical components are required to achieve the maximum rated speed
> of the SD controller when paired with a High-Speed SD Card. Without them,
> the clock frequency must be limited to 37.5 MHz for link stability.
> 
> Because the reference design does not contain these components, most
> (derivative) boards do not have them either. To accommodate for that,
> apply the frequency limit by default and delegate lifting it to the
> odd boards that do contain the necessary onboard hardware.
Yes, it is an excellent explanation.

Best regards,
Krzysztof

