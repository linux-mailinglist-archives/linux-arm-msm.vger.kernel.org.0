Return-Path: <linux-arm-msm+bounces-83609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF09C8EAFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170E13BCF9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E130833437B;
	Thu, 27 Nov 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSEe7iWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1297332ED1;
	Thu, 27 Nov 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251783; cv=none; b=B0MvB0TZA9d9HSI7S0wZh+M/77NPWJ/mRqVcTkQ0Iq4uAMFBG+suEvozC1V4TeqMZNsYjRi/MMr7X5KG0PinVNU6PHznVL5L8JBnJIQCwYCVyKtwZKDxWyNAIiSk6QqByz2pfFcl00UKwUNlzgt2BqaBNps/V0gpFlEV/vhZLRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251783; c=relaxed/simple;
	bh=9OLyfVO/1eNfRbEqh+BqqV2AQYFykwdWc7Y+7PlW/6c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UDIEOkwdv82nBvrsS1126AxQfje/IW/6iViZ1sG8YjmS5GTVNFuGJzdntZNUtTLDvfPvQXzGEBfH4gDb4ql7GqwNT849Ul/m/iU8bKlhEPyVu5RxmaZZf1PKteohFbXUIrtyq0Mkz6ykGqOAFpMWr/hvu+JhiWBkLc1XeCuZgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSEe7iWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF1DC4CEF8;
	Thu, 27 Nov 2025 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764251783;
	bh=9OLyfVO/1eNfRbEqh+BqqV2AQYFykwdWc7Y+7PlW/6c=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=eSEe7iWwWHP2esgh+sw9sF6uGmzgDZ69/dPyKTCCco6WWtKkQhqy7zbjZwSwLLM2i
	 N9fd6nnWD6bUXjzJYVgy8NUsHCtLlXkEwPBjUcdPE/dRyprjdQGYYL4GzTZrfUAyjS
	 3/v9B8qSIq2ogTPPoD8ScpkFcxIl4ReG/TmzYmnJgDIeYgcZGoeBxpv5RQPc60EATw
	 ONV4g6nAaDuqSYUBYOYhcR2xZzHjR62kM5kZbFDoyoEZnNZ9UqMxPXVIUpqogDcO0G
	 IbwX3UzLmREko9hLFoIzNLDW2nEAe8myXU1atkVALMxk7Mtz7PkJ5xOFny4tscPVu/
	 xWsngWdq368tg==
Message-ID: <44593251-795c-4009-8202-06688027e150@kernel.org>
Date: Thu, 27 Nov 2025 14:56:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add support for
 firmware-managed resources
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sriram Dash <sriram.dash@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
 krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
 <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
 <e9363a14-183e-4d12-91b0-1ac5655e6e90@kernel.org>
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
In-Reply-To: <e9363a14-183e-4d12-91b0-1ac5655e6e90@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2025 13:13, Krzysztof Kozlowski wrote:
> On 27/11/2025 11:31, Sriram Dash wrote:
>> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
>> interconnect, resets, regulators and GDSC are configured remotely by
>> firmware.
>>
>> PM OPP is used to abstract these resources in firmware and SCMI perf
>> protocol is used to request resource operations by using runtime PM
>> framework APIs such as pm_runtime_get/put_sync to signal firmware
>> for managing resources accordingly for respective perf levels.
>>
>> "qcom,snps-dwc3-fw-managed" compatible helps determine if
>> the device's resources are managed by firmware.
>> Additionally, it makes the power-domains property mandatory
>> and excludes the clocks property for the controller.
>>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 173 +++++++++++++--------
>>  1 file changed, 111 insertions(+), 62 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> index 8cee7c5582f2..d2d1b42fbb07 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> @@ -12,68 +12,65 @@ maintainers:
>>  description:
>>    Describes the Qualcomm USB block, based on Synopsys DWC3.
>>  
>> -select:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        const: qcom,snps-dwc3
>> -  required:
>> -    - compatible
> 
> I wonder why do you think dropping some code is fine...
> 
> 
>> +      - items:
>> +          - enum:
>> +              - qcom,sa8255p-dwc3
>> +          - const: qcom,snps-dwc3-fw-managed
> 
> No, you cannot keep coming with more generic compatibles.
> 
> If you want generic a compatible, you already have - qcom,snps-dwc3 -
> and that "generic" part already said that everything is compatible with it.
> 
> Now you claim that existing generic compatible qcom,snps-dwc3 is not
> generic enough and you need one more generic compatible.
> 
> Next year you will say that two generic compatibles are not generic
> enough and you need third generic compatible.
> 
> In two years we will learn that three generic compatibles are not enough...
> 
> I think I was complaining on the lists a lot on this, so I am surprised
> it is still coming back.
> 
> So no, you cannot claim that you need more generic compatibles because
> one generic is not generic. NAK.


What is even weirder is that other patchset for the same SA8255 FW
managed IP block correctly ignored generic compatible:
https://lore.kernel.org/all/20251114145646.2291324-3-ram.dwivedi@oss.qualcomm.com/

so somehow you should meet and align on common understanding of things.
Please do not send completely different patches for the same problem.

Best regards,
Krzysztof

