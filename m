Return-Path: <linux-arm-msm+bounces-62807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE2AEBA5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69029189F29E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13902E7644;
	Fri, 27 Jun 2025 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luh7io+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1A2E7625;
	Fri, 27 Jun 2025 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035827; cv=none; b=MF5Mbys5dsOUPFQVj+nMU6eCl/Rd3RPkuRyf+KIVWkZDbZWJ8x5/BoXpuzRm/g25ZSvnKsJtTi1523iTP6u6C19JdcuHkQuK6hK7H0psaMKSfOVs3zmmgIsC5deKUPxG3dgJaOa4W944k3jdoM02YKpTWJwCokrxfF1P4XZJjws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035827; c=relaxed/simple;
	bh=aklOxKn5K1qbnDT1A0s34OV2xT/E3aOxdSRZaysAFI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mey5StEIRvzIU3KwNwmf7FrgUCHnE8A8y8rLiMOxkCenaCASVY/yZebkw7MzI0YCykCcwClTiyjaJe+g8Sj5lpkKztzDJPJc/u3WQPdhbmJS/OrbRBtWOL2TFNFRgIrTzWfYeUtqKi/+VNZe65vRKnhGX+Kr7bjH2CCWYeupCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luh7io+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DF9C4CEF1;
	Fri, 27 Jun 2025 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751035827;
	bh=aklOxKn5K1qbnDT1A0s34OV2xT/E3aOxdSRZaysAFI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=luh7io+vB8HPILa9XHwV/e0UFC4RpcBJwS9l1F7vhbzNpKUyyDnzrC9rV6jlQNhnY
	 zy+peYkcQcEk9ys/JGdIuiYlpB45HvdHwvbMQr7HkJGpW15tGCjjSybu/VDFPpysd1
	 vieV8NUULFMWbIge4DeXH1oM0nO42B83Mf2+5d2pDQHGKSPInWpmDup79r0TeQkOw4
	 EP1+Si7d/uk+IWrH6q5k5eMU+n8fO2aBqJz/AHr0rpXvsKtm4+TVfB9Ab3MuIgnnfz
	 /1+Ms0hpyyYRGzyO6IWl9YofEV28jDExrj8L/2heEZBXoKeNa6UlRf1cSQPxHX8j9b
	 qOn1iHpjhbsZQ==
Message-ID: <627428b1-7381-44bf-9d66-f185f2e216f6@kernel.org>
Date: Fri, 27 Jun 2025 16:50:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Ram Prakash Gupta <quic_rampraka@quicinc.com>,
 Sachin Gupta <quic_sachgupt@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com,
 quic_mapa@quicinc.com, quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
 quic_sartgarg@quicinc.com
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
 <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
 <99b9e6aa-36b4-456c-ba46-6e1207cc1019@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <99b9e6aa-36b4-456c-ba46-6e1207cc1019@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2025 15:57, Konrad Dybcio wrote:
> On 6/26/25 7:42 PM, Krzysztof Kozlowski wrote:
>> On 26/06/2025 16:16, Ram Prakash Gupta wrote:
>>> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>>>> On 22/01/2025 10:47, Sachin Gupta wrote:
>>>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>>>> and HS200 modes.
>>>>>
>>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>>> index 8b393e26e025..65dc3053df75 100644
>>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>>> @@ -133,6 +133,11 @@ properties:
>>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>>  
>>>>> +  qcom,dll-hsr-list:
>>>>> +    maxItems: 10
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> uint32 has only one item. Anyway, there is already DLL there, so don't
>>>> duplicate or explain why this is different. Explain also why this is not
>>>> deducible from the compatible.
>>>
>>
>>
>> Timeline still amazes me. I will be grumpy on this thread.
>>
>>> I will change it to reflect array from uint32.
>>> There is change with artanis DLL hw addition where it need total of 5 entries
>>> (dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
>>> for each HS400 and HS200 modes, hence the new addition in dt. And these values
>>> are not fixed and varies for every SoC, hence this needs to be passed through
>>> dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.
>>
>>
>> Eh, no. That's not a valid reason. It's still SoC deducible. Don't bring
>> your downstream practices here, but remove EVERYTHING from downstream
>> and start doing things like upstream is doing.
> 
> QC SoCs have between 0 and 4 SDHCI instances, each one potentially requiring
> different tuning, let's keep this data in DT


OK, this should be explained in commit msg.

Best regards,
Krzysztof

