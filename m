Return-Path: <linux-arm-msm+bounces-27096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709193D578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 16:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D1E283B45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6B413A240;
	Fri, 26 Jul 2024 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRXO0Utw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE21DDF5;
	Fri, 26 Jul 2024 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722005894; cv=none; b=WqqbaVuX1/lp4V+M3Va94Y4PD8GIijUbFgLgM6TAyTnCRj9FJFp4cY3U6wSRKDdrMbZkOS6sc1he9MR50VpzkKrIvzfJzMYkA5kw1jiBlfdTK5m5yvcobHN6LJvPg1eWf8H6zEv3QFPezCOGx73mrC4M2GymtiEqGiKEqcpcmsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722005894; c=relaxed/simple;
	bh=NPnM9e8k0C+8kTKyPn/tkANgPWrPcrT63X9TENF5JJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouyhi29aFKOBBF1icfBpc91Dbuh5DN6yRXVIA+8eFyz03LcECbxMKH6dls73/REjDAE+Zje296Jrw9LlryRy8I4uFfKCgHmj6LubCAlzFpld6sSfg82gsT/hHy3KtqyfcScZMSrq0xlkAnZgoaucCA4hoW2fSqHWuCNCp7UbT88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRXO0Utw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F97BC4AF07;
	Fri, 26 Jul 2024 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722005894;
	bh=NPnM9e8k0C+8kTKyPn/tkANgPWrPcrT63X9TENF5JJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IRXO0Utws2Gt4FdbvFH6LlWzVUhxqLClibgS+lxPs6FKX1i0CvtSdxCUGu2IL+b1N
	 EMIJDcFr62oOX6VYKEdqplsuUktJYlN4lvJfBcNBuXJtofVGl4IMq7xxPIVkk4XKb2
	 oR+DrzFDQJ3xduLDNViJY7fjtufJi85z2tcBaPgcfhRDHdx4NrdjoiesvY3oltT7bE
	 yFHBceHrklAcTEpeWupP4rZAFq8EkKNZPrH8sP5Ab3Ia2EUVT2l/H0IdnbF6SmUBtm
	 j82nvCw48qOcF3QqjE4ehE/iMT/57Q8Eq2Cu23gdYwGg2sX0yLZGGklprulMPfJ5Gl
	 KBD14de8kKu6w==
Message-ID: <3bc186e8-40fc-4c92-affa-0e0b6cf25153@kernel.org>
Date: Fri, 26 Jul 2024 16:58:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das
 <quic_tdas@quicinc.com>, Satya Priya Kakitapalli
 <quic_skakitap@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>, kernel test robot <lkp@intel.com>
References: <20240720052818.26441-1-quic_jkona@quicinc.com>
 <497c9438-5bb3-42d9-9df9-661235a556d2@kernel.org>
 <14f57121-46f1-4dbe-92fd-e840705b771b@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <14f57121-46f1-4dbe-92fd-e840705b771b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/07/2024 16:30, Jagadeesh Kona wrote:
> 
> 
> On 7/24/2024 1:38 PM, Krzysztof Kozlowski wrote:
>> On 20/07/2024 07:28, Jagadeesh Kona wrote:
>>> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
>>> sufficient for clock controllers to operate and there is no need to specify
>>> the required-opps. Hence remove the required-opps property from the list of
>>> required properties for SM8650 camcc and videocc bindings.
>>>
>>> This fixes:
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
>>> 'required-opps' is a required property
>>>
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
>>> 'required-opps' is a required property
>>>
>>> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
>>> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>> Changes in V2:
>>>   - Made required: conditional and dropped required-opps from it only for SM8650 platform
>>>   - Dropped Krzysztof Acked-by tag due to above changes
>>>   - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/#r
>>>
>>> .../bindings/clock/qcom,sm8450-camcc.yaml     | 26 +++++++++++++------
>>>   .../bindings/clock/qcom,sm8450-videocc.yaml   | 25 +++++++++++++-----
>>>   2 files changed, 36 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>>> index f58edfc10f4c..8698c801ed11 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>>> @@ -21,9 +21,6 @@ description: |
>>>       include/dt-bindings/clock/qcom,sm8650-camcc.h
>>>       include/dt-bindings/clock/qcom,x1e80100-camcc.h
>>>   
>>> -allOf:
>>> -  - $ref: qcom,gcc.yaml#
>>> -
>>>   properties:
>>>     compatible:
>>>       enum:
>>> @@ -53,11 +50,24 @@ properties:
>>>     reg:
>>>       maxItems: 1
>>>   
>>> -required:
>>
>> You cannot remove required block.
>>
>>> -  - compatible
>>> -  - clocks
>>> -  - power-domains
>>> -  - required-opps
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: qcom,sm8650-camcc
>>> +    then:
>>> +      required:
>>> +        - compatible
>>> +        - clocks
>>> +        - power-domains
>>> +    else:
>>> +      required:
>>> +        - compatible
>>> +        - clocks
>>> +        - power-domains
>>> +        - required-opps
>>>   
>>>   unevaluatedProperties: false
>>>   
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>> index b2792b4bb554..2e5a061f33d6 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>> @@ -40,15 +40,26 @@ properties:
>>>       description:
>>>         A phandle to an OPP node describing required MMCX performance point.
>>>   
>>> -required:
>>
>> No, you cannot remove required block.
>>
>> To clarify: there is almost no single binding using your style. Even if
>> there is one, then 99 others are using it differently. Do not implement
>> things entirely different than everyone else. This is the same for C
>> code you send upstream. No difference here...
>>
> 
> Thanks Krzysztof for the explanation.
> 
> Hi Dmitry,
> 
> As we discussed during SM8650 camcc and videocc changes, the MMCX rail's 
> minimum voltage level from cmd-db is adequate for these clock 
> controllers to operate on SM8650. So, we removed the 'required-opps' 
> property from their DT nodes.

Not sure with whom you discuss. With Dmitry or me. Anyway, I said
nothing about required-opps, but the "required:" block.

> 
> Although 'required-opps' will remain in the properties list, it’s not 
> mandatory to be present in 'required:' list, as it is dependent on 
> cmd-db minimum level. So, can I please go ahead and update these 
> bindings to remove 'required-opps' from the 'required:' list, as done in 
> v1 of this series.
> 
> It seems unconventional to make 'required:' conditional based on the 
> platform type.
> 

Obviously. But nothing stops you - and there are plenty of examples - of
requiring one particular property based on the variant.

Best regards,
Krzysztof


