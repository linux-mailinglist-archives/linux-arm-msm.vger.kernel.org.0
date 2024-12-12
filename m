Return-Path: <linux-arm-msm+bounces-41663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 340299EE041
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6025C281BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC83F84A35;
	Thu, 12 Dec 2024 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZgcWHW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6A25949C;
	Thu, 12 Dec 2024 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988655; cv=none; b=oVZDVa+Ofbv4cJOcxI7hQmwpuq3qF8M0OSFqfgHhaw55VXZyqW5SBX9ho/HRuM+QoCCGMwASO0aih/MF+L8vBNvqaMQytJXYyxce941tySbeFI4VBb1xgYX6VKSBNX8fWp6ikk5LMW/05wO8Nj2C3OkEhE+mt9FfqRwU4Mnxios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988655; c=relaxed/simple;
	bh=02WbMay/6n5pohBRn8sk6qrHHfJNfrDwwyguwwmAKAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC59AqXJ/vGK501Mb1qTrkmTq01rf6mmnpqLy0lxtgOpYqvV/QBKhIl4IQ7hiW9azfXZta3/aMOUGdEOMaQJGNTQ1yrT6TbBineC343Ekcq872SJBcJtiPQjEeZLWOiCAHStBniE36TMRcDNRuO0EWLuP8o+B0zPBdmmmtE3TkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZgcWHW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9C5C4CECE;
	Thu, 12 Dec 2024 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733988655;
	bh=02WbMay/6n5pohBRn8sk6qrHHfJNfrDwwyguwwmAKAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZgcWHW7Lkvf1rxORFRhk+WEP1WFSaMGKTWXUJH3hcjNCgtDC6/TKVsdy1li+T0l7
	 GF0PHqs8U+07bPDWM1z0HhOLuAiiyokHVnsMjsdqpxly2MoxM5h5Usugk2TbNTncex
	 Lwkmdbxc93zARixUd7vMeFRlM6uiH3hmD9zRwCursOGO4OU3RKUQ3z+bo1y2ku4QaD
	 kYT0df8yZlhG5qqZ5oI1KWlQMgbMprxx2qi43SAuqCpiiylafLpcwhBJ3z/rxe+afC
	 t//FPlai/oEEoy7+GixsITRgn6k+DgJmRl2iVYpIDIHh7iHu3AGrEvg22k9sXtMGgM
	 sv9zQRltecDbQ==
Message-ID: <6030c66b-b6fe-4a9f-a766-cbea8b3ad2d0@kernel.org>
Date: Thu, 12 Dec 2024 08:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional current
 load properties
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
 neil.armstrong@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>
 <qvjtwilukxbeaxnbyzfkdsfkktm6p4yv3sgx3rbugpb6qkcbjy@rohvixslizhh>
 <20241211062053.vxdpovlmetvyx3za@thinkpad>
 <33697bd9-02f4-4a9a-b8c0-4930d7fdaee2@kernel.org>
 <20241211082404.p7fbmhooikmipxvm@thinkpad>
 <3c7ddb08-38db-44b3-a7a7-ec7b270a408f@kernel.org>
 <20241211115034.4hrpmninbx5uryev@thinkpad>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241211115034.4hrpmninbx5uryev@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2024 12:50, Manivannan Sadhasivam wrote:
> On Wed, Dec 11, 2024 at 10:52:11AM +0100, Krzysztof Kozlowski wrote:
>> On 11/12/2024 09:24, Manivannan Sadhasivam wrote:
>>> On Wed, Dec 11, 2024 at 09:09:18AM +0100, Krzysztof Kozlowski wrote:
>>>> On 11/12/2024 07:20, Manivannan Sadhasivam wrote:
>>>>> On Thu, Dec 05, 2024 at 11:23:11AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Dec 04, 2024 at 06:52:47PM +0800, Ziyue Zhang wrote:
>>>>>>> On some platforms, the power supply for PCIe PHY is not able to provide
>>>>>>> enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
>>>>>>> set current load to vote the regulator to HPM mode.
>>>>>>>
>>>>>>> Document the current load as properties for each power supply PCIe PHY
>>>>>>> required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
>>>>>>> vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
>>>>>>> set appropriate current load during PHY power on.
>>>>>>>
>>>>>>> This three properties are optional and not mandatory for those platforms
>>>>>>> that PCIe PHY can still work with power supply.
>>>>>>
>>>>>>
>>>>>> Uh uh, so the downstream comes finally!
>>>>>>
>>>>>> No sorry guys, use existing regulator bindings for this.
>>>>>>
>>>>>
>>>>> Maybe they got inspired by upstream UFS bindings?
>>>>> Documentation/devicetree/bindings/ufs/ufs-common.yaml:
>>>>>
>>>>> vcc-max-microamp
>>>>> vccq-max-microamp
>>>>> vccq2-max-microamp
>>>>
>>>> And it is already an ABI, so we cannot do anything about it.
>>>>
>>>>>
>>>>> Regulator binding only describes the min/max load for the regulators and not
>>>>
>>>> No, it exactly describes min/max consumers can use. Let's quote:
>>>> "largest current consumers may set"
>>>> It is all about consumers.
>>>>
>>>>> consumers. What if the consumers need to set variable load per platform? Should
>>>>
>>>> Then each platform uses regulator API or regulator bindings to set it? I
>>>> don't see the problem here.
>>>>
>>>>> they hardcode the load in driver? (even so, the load should not vary for each
>>>>> board).
>>>>
>>>> The load must vary per board, because regulators vary per board. Of
>>>> course in practice most designs could be the same, but regulators and
>>>> their limits are always properties of the board, not the SoC.
>>>>
>>>
>>> How the consumer drivers are supposed to know the optimum load?
>>>
>>> I don't see how the consumer drivers can set the load without hardcoding the
>>> values. And I could see from UFS properties that each board has different
>>> values.
>>
>>
>> Drivers do not need to know, it's not the driver's responsibility. If
> 
> What? I think there is a misunderstanding here. The intention of these proposed
> properties is to allow the PHY driver to set the required load of the regulator
> using regulator_set_load() API. As per the API description:

This makes sense. I referred to property description to learn what it is
really doing. I found nothing, because it is empty, so that's how we
waste time...

> 
> 'Consumer devices notify their supply regulator of the maximum power they will
> require (can be taken from device datasheet in the power consumption tables)
> when they change operational status and hence power state'.
> 
> IIUC, your concern is that the devicetree shouldn't specify the load for each

My concern is that Qualcomm put here regulator constraints and call them
device load. And empty property name does not help me to think other way.

How can I verify the number that it was taken from UFS device manual,
not from PMIC?

> consumer but just the min/max load of the regulator. And the consumer driver
> should figure out the load and set it accordingly.

With your above explanation I think the actual consumer load, if it is
depending on the board, have place in DT. But:

> 
> Correct me if I'm wrong.
> 
> In that case, I was wondering if the load set by the driver is going to vary
> between platforms (boards) or not (question to Ziyue Zhang). If it varies
> between SoC, then we can hardcode the load in driver based on compatible.

Yeah, maybe each  it is implied by compatible and not board dependent.
Then just like everything implied by compatibles: should not be placed
in DT.

We already follow this approach for several other Qualcomm drivers, e.g.
display.

> 
>> If
>> these are constraints per board, then regulator properties apply and
>> there is no difference between this "vdd-max-microamp = 10" and
>> "regulator-max-microamp".
>>
> 
> There is a difference. Regulator properties are just threshold. So unless the
> consumer sets the load, they won't take effect. I think you got confused by the
> 'max' wording in the proposed properties?

Yes and confused by its description in the binding.

> 
>> If this varies runtime, then your property is already not suitable and
>> very limited and you should use OPP table.
>>
> 
> The consumer driver may request different loads based on their operational
> state.

Then anyway maybe this should be OPP table (assuming it is board specific).

Best regards,
Krzysztof

