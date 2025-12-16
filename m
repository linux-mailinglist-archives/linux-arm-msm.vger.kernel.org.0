Return-Path: <linux-arm-msm+bounces-85392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C33CC4364
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E88FD304744A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7D52586E8;
	Tue, 16 Dec 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jo/szr80"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCD23B609;
	Tue, 16 Dec 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765901032; cv=none; b=KQDedjJcT8twNmBpqob2nbu15q78SCA+/I10fAoeA722LD16/OdBjeMqyIH3fVkvnW+20EU/HWoKx8JLBbHOm1BffM2WSGc0n8kDWfgPWv0n6T/6jyrdl5gFAfIrf2ppqnJU1yAef5kjIUsE0wbqOhdiRlQrWwJMoD05Sju3S7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765901032; c=relaxed/simple;
	bh=nYwX+wSueMVMR+YGKaee6e2rV3N20IPf57KZu6XHhT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+zRrElwFfENXZ5PrQ2y8nfKc+JAKTeKJnVNoMDgYqgO4HpPZrLZOgDZ7naHwaTJvxpp9fL3cLFFDRTkJpkqf9WGd5PCZyXAHTNlXn6OWRxB4Xl0p2kzdyYZgQo1yJShi+FWTD3EKCK8UFiFnlRTo9Bshyiv4gKuw4h9UT11O6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jo/szr80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96014C4CEF1;
	Tue, 16 Dec 2025 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765901032;
	bh=nYwX+wSueMVMR+YGKaee6e2rV3N20IPf57KZu6XHhT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jo/szr80KKyxE6l8ve0Uy6xDQf7Z5qBbnDyUES6ZkSDebN/+9Q8gsVzgdDDW1Eurs
	 Dun0oF5mZBbqlpn2CKBF0AW1gn0V/OqK9hNskwxOeRHOwRLAnkdXgKlwbCpMpKV7TO
	 DUoEv1qne2ysffrpjmnJP4kagP4pNRtblHlx0PARMAUYnrHpajg+YQqKsft1S0wmR1
	 xs9rT8E+shj3dk96bO6U7VDrQgkqesZrkc5eLZasj9iNB+MuqwSc8dsRm33vGIKnpF
	 pXsReKoCkdrsxg4QBlOEcMYJV5hHZyHwwPObFLKsSCEnNa8GsaorMfOmiHiLZiOKwu
	 FIk3zTA+HSbmA==
Message-ID: <5c82a8d7-6632-4d3a-a6de-ad9b1641c074@kernel.org>
Date: Tue, 16 Dec 2025 17:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: mmc: Add dll-presets values for HS400
 and HS200 modes
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-2-quic_rampraka@quicinc.com>
 <03819cd6-9f19-4c28-806b-17c7596e5299@kernel.org>
 <1fc9ac39-231b-4fce-a354-22a21d126363@kernel.org>
 <00485066-d537-4f8f-a579-efa33e69a56f@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <00485066-d537-4f8f-a579-efa33e69a56f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2025 13:51, Ram Prakash Gupta wrote:
> 
> On 12/15/2025 5:41 PM, Krzysztof Kozlowski wrote:
>> On 15/12/2025 13:06, Krzysztof Kozlowski wrote:
>>> On 15/12/2025 13:00, Ram Prakash Gupta wrote:
>>>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>>
>>>> Document the 'dll-presets' property for MMC device tree bindings.
>>>> The 'dll-presets' property defines the DLL configurations for HS400
>>>> and HS200 modes.
>>>>
>>>> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
>>>> different tuning.
>>>>
>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> index 938be8228d66..a1a16e6e12ce 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> @@ -140,6 +140,11 @@ properties:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>  
>>>> +  qcom,dll-presets:
>>>> +    maxItems: 10
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description: platform specific settings for DLL registers.
>>>
>>> So look at your DTS - this is clearly incomplete now. So obvious. I
>>> don't understand why you were hiding the DTS change, you just make
>>> review more difficult.
>>>
>>> Anyway, your DTS says you replace some other DLL properties and nothing
>>> in the binding or commit msg explains that. Neither the reason nor the
>>> impact.
> 
> Sorry dt change was not pushed earlier, will add dt change as well
> going forward.
> 
> The existing qcom,dll-config or qcom-ddr-config are not deprecated,
> but certainly I will add below in commit regarding the issue as well
> which is observed without this change as below:

No.

You need schema for this. Actually for both cases - replacing properties
and defining the list.

> 
> "Document the 'dll-presets' property for MMC device tree bindings.
> The 'dll-presets' property defines the DLL configurations for HS400
> and HS200 modes.
> 
> It have 2 arrays of 5 elements each for HS400 and HS200 mode.
> The 5 elements are DLL_CONFIG, DLL_CONFIG_2,DLL_CONFIG_3, DLL_USER_CTRL
> and DDR_CONFIG.
> 
> dll-presets fixes instances of CRC error observed with targets having
> artanis dll.
> 
> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
> different tuning using dll-presets."
> 
>> Plus it looks like you are adding some meaning to the entries, judging
>> by the DTS. DTS suggested something here is e.g. DLL_CONFIG, so that
>> meaning - including different modes - needs description in the schema in
>> items.

Here I wrote it already. Don't ask for repeating.

>>
>> Best regards,
>> Krzysztof
> 
> I will update the schema description as well with the 2 modes and 5 elements

I did not say description. I said you need schema.


Best regards,
Krzysztof

