Return-Path: <linux-arm-msm+bounces-38626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A59D485A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1DA1F225A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104991C4A24;
	Thu, 21 Nov 2024 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZlWTr3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D126614EC55;
	Thu, 21 Nov 2024 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732175360; cv=none; b=pm3b8DDK4sp4+xxeemZ9A7ZxncrNjLjeGoUVJEh5Z198cLoqk4NvZdCQSc/23id4C1pkEMoDMzLa78CTR8w6h6Za7HdAI0F9qdZXHI2rRInEp39XxygyNhIRO/hF0QxRtRUHLLkLvE6Fe5gwlO64G6/9tccyhE4ElN20urZUt2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732175360; c=relaxed/simple;
	bh=4CkwEdrsvB8pjMup6oXE57MFNJnD4/M2mjHbPK09Stc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDHYEzEj7uN569OZlOgIVODf2ueCAhXaxjLlPKJhfjE57VHk7GcZfM/JoYWFRzjy0Sd01mtjMSEnmGu9tjNqBYGEzhb1yIzvQIKSm/pfBgEtVGih9DdBf1x+dMxxkzrBvIjzqbNpwd9EXyrJNaIHy4EsuJ5n0zqG0clo8rRQB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZlWTr3o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D189C4CECC;
	Thu, 21 Nov 2024 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732175359;
	bh=4CkwEdrsvB8pjMup6oXE57MFNJnD4/M2mjHbPK09Stc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DZlWTr3oLoGwyeRUh5amiaMkkIRRsfhg4C/vypWwJgAshIKG6HQe32Lm9lFPzjRlE
	 DSvjfMQj5LQge6X6Vb706HXUUXNDfBqiEuPM0vvlLFCOJdmAmY3sBqYFkL1W6D3EUq
	 5CHaUNmmdYkZWEz6Nz6X8Kb916TLSLleHCL1qEQ62FdRBc3fQ0Z0H+HGTUC03cRUwg
	 GopbviQCsr3zOT223eSqbUXvBW0KCKbz1Po1FeBPpgCQ8dlgafRMzZtAO7Bb5EMSkd
	 3VjzhSPpUJL9FkGLF7AAMFG+inmjAl/Kq5uKrveSgxuZlQhtKW56jKQkFcbTA+9rLU
	 kDV5KKbWKWXZQ==
Message-ID: <4c419118-83f8-4263-9d7c-8aef02908430@kernel.org>
Date: Thu, 21 Nov 2024 08:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
To: Cheng Jiang <quic_chejiang@quicinc.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_mohamull@quicinc.com
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-2-quic_chejiang@quicinc.com>
 <c8ae761a-732c-4def-ac6e-5e1b16a21ada@kernel.org>
 <0b0b55a2-ab80-4f6d-a4cf-c04acc94a989@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0b0b55a2-ab80-4f6d-a4cf-c04acc94a989@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2024 05:06, Cheng Jiang wrote:
> Hi Krzysztof,
> 
> On 11/21/2024 12:47 AM, Krzysztof Kozlowski wrote:
>> On 20/11/2024 10:54, Cheng Jiang wrote:
>>> Several Qualcomm projects will use the same Bluetooth chip, each
>>> focusing on different features. For instance, consumer projects
>>> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
>>> SINK feature, which may have more optimizations for coexistence when
>>> acting as a SINK. Due to the patch size, it is not feasible to include
>>> all features in a single firmware.
>>>
>>> Therefore, the 'product-variant' devicetree property is used to provide
>>> product information for the Bluetooth driver to load the appropriate
>>> firmware.
>>>
>>> If this property is not defined, the default firmware will be loaded,
>>> ensuring there are no backward compatibility issues with older
>>> devicetrees.
>>>
>>> The product-variant defines like this:
>>>   0 - 15 (16 bits) are product line specific definitions
>>>   16 - 23 (8 bits) are for the product line.
>>>   24 - 31 (8 bits) are reserved for future use, 0 currently
>>>
>>> |---------------------------------------------------------------------|
>>> |                       32 Bits                                       |
>>> |---------------------------------------------------------------------|
>>> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
>>> |---------------------------------------------------------------------|
>>> |   Reserved        |    0: default       | 0: default                |
>>> |                   |    1: CE            |                           |
>>> |                   |    2: IoT           |                           |
>>> |                   |    3: Auto          |                           |
>>> |                   |    4: Reserved      |                           |
>>> |---------------------------------------------------------------------|
>>>
>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>> ---
>>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>> index 7bb68311c609..9019fe7bcdc6 100644
>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>> @@ -110,6 +110,12 @@ properties:
>>>      description:
>>>        boot firmware is incorrectly passing the address in big-endian order
>>>  
>>> +  qcom,product-variant:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      specify the product information for driver to load the appropriate firmware
>>
>> Nah, you have firmware-name for this.
>>
> Currently "firmware-name" is used to specifythe nvm (config) file only,
> we also need to specify the rampatch file (TLV). 
>  
> Can we re-use the "firmware-name"? add two segments like the following?
> firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";
> 
> Or add a new property to specify the rampatch file? 
> rampatch-name = "rampatch_xx.tlv";
You can grow the property, it's a list. Order of items in the list must
be fixed (specific), though. See other Qualcomm remoteproc PAS loaders
which already use two entries.

Best regards,
Krzysztof

