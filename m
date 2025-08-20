Return-Path: <linux-arm-msm+bounces-69978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB92CB2DD5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 15:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34FF55C41A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0860B31A057;
	Wed, 20 Aug 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpVkkvsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F04242D9E;
	Wed, 20 Aug 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695328; cv=none; b=U9Gp5Sq4U86SICJYUSy33kkQubHwSgg7BW90BYJo9ukRN7JKp2fA8xjUu69NhsBmduH3WbsKe4X7TclhEG1p76WLa/7XMcUF7zsepOwjTmsMP2EbFpfj7o47x7KqNMOcCshJHiYqXgoCF5b7zVARMxDfMp5EQIRra9EBh7Y4DLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695328; c=relaxed/simple;
	bh=ZMa6c5IXXc7FTpDi4XwZl4jGC7UySzLS0/LL8shetd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQmUW/aSQzwrWI8OVPWmrC0KFOJrEKHUO1yb7X99erHL7yNWU/TnKtMfnSe8rqLE/RMkIxdsgd7PPrl2NGu1EqXsNHEyPoBDat8bpXF2c+H8gyhc9y6+69aifFBu9GzOZaK9VumZW6uXzsCN+R4O//r/7GkySEjzhS7+G4n+eRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpVkkvsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694ADC4CEED;
	Wed, 20 Aug 2025 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755695328;
	bh=ZMa6c5IXXc7FTpDi4XwZl4jGC7UySzLS0/LL8shetd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CpVkkvsC4Vdv5Os71gtsmYfUWJ/rB6peVMstYHp5nr3ZjHT69/1UcRQkYkQivO91T
	 KUhGyRC/fEzdupijaiv00W2E9JW+8j4yidXGgkxBv4kTCAHnzeNGn3PPfSwEZN8CME
	 eplaQVTvPWKk8Y4qoCgUuT3u/UoBx+I2yBQrvFx19SqJtfIwJY8GrxtWEBpV1j9SFM
	 tFJXq8X1TUEGQNSo6cGUEhyoiWUBt+NhAvMIN5CTmZrcEDGGRRGMOFD/bLTfz0MWMW
	 f6XWwNgGzj5RWmo7/Ulc8XR/ARkOSfSD39yIiFL5ubzLt6YY0D5OzdOyHPFp8XUsaK
	 kYUpvn33knZ5Q==
Message-ID: <9fe9d86e-0d24-4877-aefc-438248d7024e@kernel.org>
Date: Wed, 20 Aug 2025 15:08:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
To: Yijie Yang <yijie.yang@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable+noautosel@kernel.org,
 Yijie Yang <quic_yijiyang@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
 <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
 <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
 <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
 <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
 <b1eb2ed6-9743-465e-9b2e-75d5a06c1497@oss.qualcomm.com>
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
In-Reply-To: <b1eb2ed6-9743-465e-9b2e-75d5a06c1497@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/08/2025 10:57, Yijie Yang wrote:
> 
> 
> On 2025-08-19 17:08, Krzysztof Kozlowski wrote:
>> On 19/08/2025 11:04, Yijie Yang wrote:
>>>
>>>
>>> On 2025-08-19 15:15, Krzysztof Kozlowski wrote:
>>>> On 19/08/2025 08:51, Yijie Yang wrote:
>>>>>
>>>>>
>>>>> On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
>>>>>> On 19/08/2025 08:35, YijieYang wrote:
>>>>>>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>>>
>>>>>>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>>>>>>> functionality.
>>>>>>>
>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>>> ---
>>>>>>
>>>>>>
>>>>>> Why do you mix up DTS and net-next patches? This only makes difficult to
>>>>>> apply it, for no benefits.
>>>>>
>>>>> The DTS changes and driver code modifications work together to achieve a
>>>>> single purpose, so I included them in one patch series. Should I
>>>>> consider splitting them into two separate series?
>>>> Of course yes. You are just making difficult to apply this. Patches are
>>>> completely independent and even your internal guideline asks to NOT
>>>> combine independent patches.
>>>
>>> The challenge with splitting this series lies in the fact that it
>>> attempts to reverse the incorrect semantics of phy-mode in both the
>>> driver code and the device tree. Selecting only part of the series would
>>> break Ethernet functionality on both boards.
>>
>> And where did you explain that? Anyway, you did not achieve your goal,
>> because you broke the boards still.
>>
>> Your patchset is not bisectable and does not follow standard submission
>> guidelines. DTS is always independent, please read carefully the docs.
> 
> The approach I'm taking will inevitably make the series non-bisectable, 

The series are non-bisectable now!

Do you understand the concept of commit and how patch is applied? How
splitting this patchset per two changes ANYTHING in bisectability?

And you keep arguing on this...

Best regards,
Krzysztof

