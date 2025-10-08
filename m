Return-Path: <linux-arm-msm+bounces-76289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 837ABBC32D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 04:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F43189A74D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 02:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D40C29B8E0;
	Wed,  8 Oct 2025 02:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUPCSqTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB926260580;
	Wed,  8 Oct 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759892174; cv=none; b=t/SzSzQ3F+n5XVYzUcM0bteIPeE3m4DXVTGYlL79DsC7CNpyOFbpB1RMX8OlVXQS4k/N/ptDMB1DI6BBs72x8cv5Oh4iF2++LiAniMofqe2OLIpAjKH/IraPIxvEjwQPFlDZRDXgeWRyObSG6BeeOKwTrQOd9RsJmdCNiI1wOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759892174; c=relaxed/simple;
	bh=gkZN5Qc8iYn3DbePjFgVqCfPKhn+zqItH/K4bcNbwjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ogu/l1xQAFmJ0DKvrogq+iOdSXZApvIiRfhrZTzAf/NgCcraunvLK3c10xxdTQ/CtAR3iQnLwurUlBYW2XcGYM5Hyczfj3YQu4TWWEFFMWNDGk/01C46lsNV84E7EhOFGdc4G7Zyik0Rs1SaWDYz1qAkzgo6q7DzwUhatyAZ2Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUPCSqTs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3784C4CEF1;
	Wed,  8 Oct 2025 02:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759892172;
	bh=gkZN5Qc8iYn3DbePjFgVqCfPKhn+zqItH/K4bcNbwjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pUPCSqTsfm8bKOIrIPMkJFD4IKV7ka7RgVD3X+Y11cchONvW9lEWV+XJAs8FneirD
	 a2knDlDdTvR6Ua2xMYsKC4eG20DDf0YFtPDhx+CWFjD4Q7pB0dwyax5dyYoOYt+rVr
	 GMgQuimpfUT9XxmFHxwQkaDxOYwNN/emPVC5hSELoDvNQEZld0/4AJux/O/soWlCso
	 hAjPgPhg7p93LwUvcRwxqiN42U+1YxF/kDBDPsEk/BZaKb5RkxkjalR8RmfVZw1yxN
	 fja2IhhzuXTBD13wAR9tcG8rFl1T4UM29HPXUi0vtmReziOWT4oz1ZvHBI4yVuGeLj
	 1UpJ6jNTL5EOg==
Message-ID: <68a6d051-dd6e-4a02-b09d-de6a90b79c33@kernel.org>
Date: Wed, 8 Oct 2025 11:56:06 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: qcom,spmi-pmic: add
 qcom,pm4125-codec compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 christophe.jaillet@wanadoo.fr
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
 <20250915-pm4125_audio_codec_v1-v4-2-b247b64eec52@linaro.org>
 <20250918-wonderful-deft-jackal-7d3bbc@kuoka>
 <DDCKWVH8ORLM.357D9IKQK9YN8@linaro.org>
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
In-Reply-To: <DDCKWVH8ORLM.357D9IKQK9YN8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2025 11:18, Alexey Klimov wrote:
> On Thu Sep 18, 2025 at 3:03 AM BST, Krzysztof Kozlowski wrote:
>> On Mon, Sep 15, 2025 at 05:27:49PM +0100, Alexey Klimov wrote:
>>> Add qcom,pm4125-codec compatible to pattern properties in mfd
>>> qcom,spmi-pmic schema so the devicetree for this audio block of PMIC
>>> can be validated properly.
>>>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>>> index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..776c51a66f6e7260b7e3e183d693e3508cbc531e 100644
>>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>>> @@ -137,6 +137,12 @@ patternProperties:
>>>  
>>>    "^audio-codec@[0-9a-f]+$":
>>>      type: object
>>> +    oneOf:
>>> +      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
>>> +      - properties:
>>> +          compatible:
>>> +            const: qcom,pm4125-codec
>>
>>
>> Not much improved. Same feedback applies.
> 
> Around the time of sending this I thought to set separate follow-up patch
> that fixes the other part here -- pm8916-wcd-analog-codec.
> 
> At this point, is it fine to send follow-up patch that does smth like
> this:
> 
> +    oneOf:
> +      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> +      - properties:
> +          compatible:
> +              - enaum:
> +                - qcom,pm4125-codec
> +                - qcom,pm8916-wcd-analog-codec
> 
> ?
> 
> (I didn't check how if it will compile or pass checks)

You still propose something very different than I asked at v3. Drop the
$ref, you only want a compatible with enum. Look at
qcom,sa8775p-mdss.yaml (but you don't need contains). Or one of many MFD
drivers added last one year.

Best regards,
Krzysztof

