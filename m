Return-Path: <linux-arm-msm+bounces-41466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150F9ECA6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 11:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC61188CF44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8055E1FDE00;
	Wed, 11 Dec 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUeGxr/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517831EC4FF;
	Wed, 11 Dec 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733913305; cv=none; b=D3pVx1RARRIToWYydE9h9YlbPnxi+9DoyduuIjC/Gy+4TJmL4EYqp2RkwlhtX8B44sbyBa/44ANB0jb2TULxvHqwquSJALipcuPPTS4y8rHF5x39RAz9pg7R87H5TlJHkMnoIGXv9dr6UZrcdlmb2CWfr4HKOqcEpCN7QE20y88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733913305; c=relaxed/simple;
	bh=PifCWoxA41DNQhBe6905odZu+s/j0m25J2naw6/B7nQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O0hF+6ZuKxKLKPv2C1T2bXw47qsAE7SA2wUek6pX/U+9BGwrluoTVXzQRn9bEd7siGclYadbKEaCG6UzlqdbGu4pnT/es6yS+u2+ib/Bgi1ejp8aM61q600U8ZlY18SFlF84oV6s5++ch4PLqNy8AYQkQregEj54CEWT/KEBuwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUeGxr/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02434C4CED2;
	Wed, 11 Dec 2024 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733913304;
	bh=PifCWoxA41DNQhBe6905odZu+s/j0m25J2naw6/B7nQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=RUeGxr/m9s/dSkYW7+Ydh8aBk14fUAhaFmzWAA56kIv4TNuTkqqrCfF+n1aosk0ow
	 FMmtfAHb8X1cYQSjMF65VBH23ymeTkjqBal0zhUxSuZuh0+iN0PGDZ6BIXNIfSFWjW
	 hGydlTxJAeFX8jLYbN3W9z5CJAInMtQFiKiAFLJHeNFjTpbQleBjYfInsA4G0nGIy4
	 9acT7zBhA3eC7/WCM6eqSHW+UIOmC/0TjdBz8bdyGC5G/zF105MhH2Rwtp70UMqBwi
	 yuY8c42XebqdjCB3CYFjpQwYzeqWR1PdpXGlAsx9Ow0aoRM+/c3ocpmhAzPvmTa03G
	 3MTi8HshPgjAQ==
Message-ID: <4f722a25-65f3-49cd-9c45-8710e8242248@kernel.org>
Date: Wed, 11 Dec 2024 11:34:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional current
 load properties
From: Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <3c7ddb08-38db-44b3-a7a7-ec7b270a408f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2024 10:52, Krzysztof Kozlowski wrote:
> On 11/12/2024 09:24, Manivannan Sadhasivam wrote:
>> On Wed, Dec 11, 2024 at 09:09:18AM +0100, Krzysztof Kozlowski wrote:
>>> On 11/12/2024 07:20, Manivannan Sadhasivam wrote:
>>>> On Thu, Dec 05, 2024 at 11:23:11AM +0100, Krzysztof Kozlowski wrote:
>>>>> On Wed, Dec 04, 2024 at 06:52:47PM +0800, Ziyue Zhang wrote:
>>>>>> On some platforms, the power supply for PCIe PHY is not able to provide
>>>>>> enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
>>>>>> set current load to vote the regulator to HPM mode.
>>>>>>
>>>>>> Document the current load as properties for each power supply PCIe PHY
>>>>>> required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
>>>>>> vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
>>>>>> set appropriate current load during PHY power on.
>>>>>>
>>>>>> This three properties are optional and not mandatory for those platforms
>>>>>> that PCIe PHY can still work with power supply.
>>>>>
>>>>>
>>>>> Uh uh, so the downstream comes finally!
>>>>>
>>>>> No sorry guys, use existing regulator bindings for this.
>>>>>
>>>>
>>>> Maybe they got inspired by upstream UFS bindings?
>>>> Documentation/devicetree/bindings/ufs/ufs-common.yaml:
>>>>
>>>> vcc-max-microamp
>>>> vccq-max-microamp
>>>> vccq2-max-microamp
>>>
>>> And it is already an ABI, so we cannot do anything about it.
>>>
>>>>
>>>> Regulator binding only describes the min/max load for the regulators and not
>>>
>>> No, it exactly describes min/max consumers can use. Let's quote:
>>> "largest current consumers may set"
>>> It is all about consumers.
>>>
>>>> consumers. What if the consumers need to set variable load per platform? Should
>>>
>>> Then each platform uses regulator API or regulator bindings to set it? I
>>> don't see the problem here.
>>>
>>>> they hardcode the load in driver? (even so, the load should not vary for each
>>>> board).
>>>
>>> The load must vary per board, because regulators vary per board. Of
>>> course in practice most designs could be the same, but regulators and
>>> their limits are always properties of the board, not the SoC.
>>>
>>
>> How the consumer drivers are supposed to know the optimum load?
>>
>> I don't see how the consumer drivers can set the load without hardcoding the
>> values. And I could see from UFS properties that each board has different
>> values.
> 
> 
> Drivers do not need to know, it's not the driver's responsibility. If
> these are constraints per board, then regulator properties apply and
> there is no difference between this "vdd-max-microamp = 10" and
> "regulator-max-microamp".
> 
> If this varies runtime, then your property is already not suitable and
> very limited and you should use OPP table.
> 
Plus let's recap the commit msg which is supposed to fully explain the
hardware:
"the power supply for PCIe PHY is not able to provide
enough current"

Well, that's 100% property of power supply - so the regulator node in
PMIC, not the UFS device (consumer).

With that commit msg it is clear the properties are placed wrongly.
However maybe just commit msg is wrong, but then how could we possibly
know what is the real hardware, right? :)


Best regards,
Krzysztof

