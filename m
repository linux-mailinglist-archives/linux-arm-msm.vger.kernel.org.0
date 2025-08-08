Return-Path: <linux-arm-msm+bounces-68110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58914B1E5B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A6FA170C0A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C2724E01D;
	Fri,  8 Aug 2025 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qomvNQ/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179BD2AE74;
	Fri,  8 Aug 2025 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645966; cv=none; b=nHXSWggWkFWzIvqZA4+FeAbeRzZIXFQHiKdItbEY4eTHMeHPdHJUwjMrlReCVxdMAbZD79ROr7WFuN0iNds99R0l/AcSyVfINiHbe/zgV0tIZLMW+hlNacoyQJvKBOU+P9SjyyqkNwpgR4pRbCI6A+RoprsCXtXSbBSdC29hoDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645966; c=relaxed/simple;
	bh=2ZfGe5j/wyjBFLdMrPOZgs+eBxwkgsC8XOn4yjPUPlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdI98rh0GJA9+J30LGyQ/k9jKNfnJVCA22XgQkRfkvespHIYipEd94zVPKwxnBL+3DHo/N7e/bdbT3fSh5OGmitb7b0uZoT8u+kzfnLFbcimyqpbToqekoFtuvV5A49m7QysrlP2Zg1nYqHJqM3bmQ8qzoU6eE4KIW6VcJ/jrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qomvNQ/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF30C4CEED;
	Fri,  8 Aug 2025 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754645965;
	bh=2ZfGe5j/wyjBFLdMrPOZgs+eBxwkgsC8XOn4yjPUPlc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qomvNQ/NxywIDtXIjXPrrQ03yu9zW+90DeVin/d5GWQ4L+isCsmjrubnkqMOQbNWF
	 J/6tokkj2r0/6P5PCy7kynjBGwhd8jCn7iszKchLdwyJfGP5MS3tiqDjlrKLCLiTr3
	 YI2F5EbIBu6OMZwlamL/dGJClQvAda+Hw8cxWSB/JIVH8sw1wuLLY3TIMCDBfrMdQ2
	 8IP1SUsDxEBuC+1qCunTZPk3PwGHjJH8mqNPN5ghjLEGCG4fNCWDkQLXwGRd2kCnZX
	 XuCW+KcAjh9bJgwfo0jNYANdUokXDEvJFglQGLw9RAA3DJS7xUMnmAiyaCbFKrgNGI
	 KJp6L2SH93mIQ==
Message-ID: <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org>
Date: Fri, 8 Aug 2025 11:39:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for UFS
 PHY and PLL supplies
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
 conor+dt@kernel.org, bvanassche@acm.org, andersson@kernel.org,
 neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
 <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
 <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
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
In-Reply-To: <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2025 10:58, Konrad Dybcio wrote:
> On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
>> On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
>>> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
>>> the UFS PHY node in the device tree.
>>>
>>> These properties define the maximum current (in microamps) expected
>>> from the PHY and PLL regulators. This allows the PHY driver to
>>> configure regulator load accurately and ensure proper regulator
>>> mode based on load requirements.
>>
>> That's not the property of phy, but regulator.
>>
>> Also reasoning is here incomplete - you just post downstream code. :/
> 
> The reason for this change is good, but perhaps not explained clearly
> 
> All of these values refer to the maximum current draw that needs to be
> allocated on a shared voltage supply for this peripheral (because the


It sounds very different than how much it can be drawn. How much can be
drawn is the property of the regulator. The regulator knows how much
current it can support.


> supply's capabilities change depending on the maximum potential load
> at any given time, which the regulator driver must be aware of)
> 
> This is a property of a regulator *consumer*, i.e. if we had a chain
> of LEDs hanging off of this supply, we'd need to specify NUM_LEDS * 
> MAX_CURR under the "led chain" device, to make sure that if the
> aggregated current requirements go over a certain threshold (which is
> unknown to Linux and hidden in RPMh fw), the regulator can be
> reconfigured to allow for a higher current draw (likely at some
> downgrade to efficiency)


The problem is that rationale is downstream. Instead I want to see some
reason: e.g. datasheets, spec, type of UFS device (that was the argument
in the driver patch discussion).

The only argument here for given value is: downstream has it.

Best regards,
Krzysztof

