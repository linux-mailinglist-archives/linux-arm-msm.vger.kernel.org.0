Return-Path: <linux-arm-msm+bounces-52776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB7A74CCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9E23AD18A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 14:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDA31B4257;
	Fri, 28 Mar 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRMLU2dQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08701B0F33;
	Fri, 28 Mar 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172407; cv=none; b=Y5kCc7A34fm9siDf8sCTLau8o46XDtIIeqxr9glrzAlZZdYdGashIv3sXA+Ycb7kR7kAUbtQYtFDuPKvHB2DlksBV8UjDavWVfug7x6/DMzCqmeNasF2oE4cEN5EVQC4PE5esglrDb0oRZvVrzqS3LP+6DRbdBRDX9Hk50/yf8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172407; c=relaxed/simple;
	bh=sF3tJHSziQD5AA7cOPlYPBrdvLxoYRT3GRg4H0Au7yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBgDTSgDNb8fTcaleMfJUe0hjLz2g7nWBhnQh4AzRmU+4fRW7nU7xOXVsW+mw7ZdMaxopL6DFKOoJGey6Noxgw7tK1zrD7jutwJo/TnuRwZn9oNrnxLnIrus84P+mtyp2VKsDf0h6fTO1n1Y1XmPkP5XMsHyBjaOj9YgbaQ72NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRMLU2dQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C3AC4CEE4;
	Fri, 28 Mar 2025 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172407;
	bh=sF3tJHSziQD5AA7cOPlYPBrdvLxoYRT3GRg4H0Au7yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iRMLU2dQLM58a8dfdSf36UYDIW3nIdzAau0oAmAWE49Z0bv/Vox9l+kFPP3sYV4cL
	 AKefUbRCcq4RJoqQiuzZN+bkBgMwMdi95TUop/7LzuO/uqSnJZX+FRmKYAAQAiX1wx
	 fMwk28l5REC6yampCFF3uXXw7Z/1WuT8NqZ3jE2V4iUEjIPJIku7DTgrD6xhUFvDPJ
	 /cbdVDYVjq/uBkP5X5JoQAONdNBDoUljNn31SFEEURFqoBSAfb5Q+xDQw4XepRKyIy
	 fEhRoNS5aR0uC69YPQzr3uT/jx4vw3KbvybxLB6+f02vezW+iGiufpzeQ+7QFIvix/
	 XOpwfgCQIRs1Q==
Message-ID: <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
Date: Fri, 28 Mar 2025 15:33:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
 linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 15:28, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof for immediate review !
> 
> On 3/26/2025 7:53 PM, Krzysztof Kozlowski wrote:
>> On 26/03/2025 15:16, Mukesh Kumar Savaliya wrote:
>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>> the necessary documentation and properties required to describe the
>>> hardware in the device tree.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   .../bindings/i3c/qcom,i3c-master.yaml         | 60 +++++++++++++++++++
>>>   1 file changed, 60 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>> new file mode 100644
>>> index 000000000000..af6b393f2327
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>
>> Naming: nothing improved.
>>
> Sorry, i didn't get exactly. To your comment "Filename matching 
> compatible." i have Changed the compatible string to "qcom,i3c-master" 
> and now it's matching to file name.
> 
> shall i make filename as qcom,i3c-master-qcom.yaml ? If this is wrong, 
> please suggest.
> 
> Removed "bindings" from the subject line too. I have removed "master" 
> from the description, shall i remove from subject also and keep only 
> controller ? I kept master controller thinking it may be good as "master 
> controller" instead "controller".

I still see the "master" in the compatible and filename.

> 
> 
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Geni based QUP I3C Controller
>>> +
>>> +maintainers:
>>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> +
>>> +description:
>>> +  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
>>> +  bus mode (I2C and I3C target devices on same i3c bus). It also supports
>>> +  hotjoin, IBI mechanism.
>>> +
>>> +  I3C Controller nodes must be child of GENI based Qualcomm Universal
>>> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
>>> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
>>> +
>>> +allOf:
>>> +  - $ref: i3c.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,i3c-master
>>
>> And this got worse. It makes also no sense either: how can you claim
>> that this covers all possible future I3C masters from Qualcomm?
>>
>> What was the resolution of previous discussion?
>>
> Below was my understanding and reply.
> "
> I think i should remove const. kept it for now as no other compatible to 
> be added as of now.
> let me remove const.
> SoC name is not required, as this compatible is generic to all the SOCs.

I don't see any talks about const, what are you referring to?

> "
> 
> But i realized i missed to remove const, sorry for that.
> 
> 
> I have also checked for qcom,spi-geni-qcom.yaml, it has below :
> properties:
>    compatible:
>      const: qcom,geni-spi
> 
> Let me know if i can correct for SPI in separate new patch ?

I love such arguments - let's find whatever old bindings and whatever
antipattern.

What was the outcome of the discussion? I think was about geni, no? What
did Rob write? So how did it became i3c-master?

Best regards,
Krzysztof

