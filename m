Return-Path: <linux-arm-msm+bounces-64249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C7AFEAC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 15:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 023BF1C80573
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068482E265B;
	Wed,  9 Jul 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qvcq9pcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1D2E1C7C;
	Wed,  9 Jul 2025 13:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069076; cv=none; b=ev3TENt2/P0t1BV11JBLsBDtGhmTFXOd25PHr823MkCOgYY8gkr4qLclg+aU68+UiIdjbFOdLLWbGdilYbJJ6VzrD2GmZC1V28cmj9zUTaxOKNbDdxhWtrMk9mcRbJY8J/dwcC+1P0gqQ/O1T70xNE1YZXZkVRKZd7sZ/n2DHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069076; c=relaxed/simple;
	bh=7fDy/IDtzY+P10jh2FH05bGuxkbANfM+VBCgF1upyb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zsq3tDrsfKNDFyoDG3hoiWk23JcFO612FTRj5qOwxk6QIyezlP8gdSjI/yXnNguo98pEk9xaVjmgQPXPeguimhe/In9IZRCfvawXurwZtqL6FGG1AuNQifxN7z4ZrejJpNoOtXiRS9Izgu8qHwJcpAIm84SxfxqrUy8gi8xmdUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qvcq9pcz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B24C4CEEF;
	Wed,  9 Jul 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752069076;
	bh=7fDy/IDtzY+P10jh2FH05bGuxkbANfM+VBCgF1upyb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qvcq9pczvwZs/pgT3fBuh6JlQaf/4U/OlntMStbs5+RnniDq9sAMJ0yG2swfAxW39
	 y8Ewv6JQ0cKwsYiM5F5CFarb2VMl1A4Zz9KOnwbrN6g4zlxdy8SMvF0tZHkYUBIY9o
	 T49meZ/NxJJH4QX6FgjKQYG/APVEpS2B+Ra3KZvbSBjQ/tupkP1RJ8w7ENyy3dt091
	 iZc/Xmsg/6I7DASsMa+V8/BbXXEWCcvEKGG0dY9VvrSyEouwfma5wrA0tZQejNbXaY
	 SuOk9fsXN/Ixn+BtgZQnMpWD1yOioXiEdNUuJ9UCjVttI4b7Za77oLNX+nUAh27cLe
	 DJjV2polVNeKQ==
Message-ID: <eda9bf92-c5f7-4f3f-92e9-9749fbb67493@kernel.org>
Date: Wed, 9 Jul 2025 15:51:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Document
 qcom,tune-res-fsdif
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-1-19d85541eb4c@fairphone.com>
 <20250708-unicorn-of-ancient-excellence-e8945c@krzk-bin>
 <20250708-stoic-slim-bison-ac55ee@krzk-bin>
 <DB6J86NHFTNT.31MFYDTZ6B4O0@fairphone.com>
 <DB7FBNQ0TYFZ.3GGPN8XXJXGRW@fairphone.com>
 <1c7fdeca-d531-4f90-9e4c-4d8bfac67fae@kernel.org>
 <DB7IRWJ1AFCT.2CVF97683XYEO@fairphone.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DB7IRWJ1AFCT.2CVF97683XYEO@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/07/2025 14:22, Luca Weiss wrote:
> On Wed Jul 9, 2025 at 12:16 PM CEST, Krzysztof Kozlowski wrote:
>> On 09/07/2025 11:40, Luca Weiss wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue Jul 8, 2025 at 10:31 AM CEST, Luca Weiss wrote:
>>>> On Tue Jul 8, 2025 at 10:21 AM CEST, Krzysztof Kozlowski wrote:
>>>>> On Tue, Jul 08, 2025 at 10:13:24AM +0200, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Jun 25, 2025 at 11:14:56AM +0200, Luca Weiss wrote:
>>>>>>> Document the FS Differential TX Output Resistance Tuning value found on
>>>>>>> the eUSB2 repeater on Qualcomm PMICs.
>>>>>>>
>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 6 ++++++
>>>>>>>  1 file changed, 6 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>>>>>> index 27f064a71c9fb8cb60e8333fb285f0510a4af94f..6bfd11657e2992735998063b3ca390e04a03930d 100644
>>>>>>> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>>>>>> @@ -52,6 +52,12 @@ properties:
>>>>>>>      minimum: 0
>>>>>>>      maximum: 7
>>>>>>>  
>>>>>>> +  qcom,tune-res-fsdif:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>>>>>> +    description: FS Differential TX Output Resistance Tuning
>>>>>>
>>>>>> Resistance is in Ohms, tuning could be in dB, so I wonder what are the
>>>>>> actual units here. Neither commit msg nor this description helps me to
>>>>>> understand that.
>>>>>
>>>>> I checked and the values are in Ohms.
>>>>
>>>> Yes it's Ohms but not 0x00 = 0 ohms, and it's also an offset in ohms
>>>> from the nominal value according to the Hardware Register Description I
>>>> have, e.g. 0x7 = -12.1ohm from the default
>>>>
>>>> I can try and create bindings using these Ohm offset values, I didn't
>>>> worry about it too much since the other tuning values in these bindings
>>>> are also just register values, presumably from before Konrad had access
>>>> to the docs.
>>>
>>> I've taken some more looks, and checked how similar tuning is handled in
>>> qcom,usb-snps-femto-v2.yaml and phy-qcom-snps-femto-v2.c, and changing up
>>> the concept of tuning in the eUSB2-repeater bindings+driver is not a
>>> trivial task.
>>>
>>> Since this is adding just one more property in-line with the already
>>> supported properties in the bindings+driver, can we get this in as-is,
>>> and deprecate all 4 qcom,tune-* properties later with a replacement that
>>> describes the values better?
>>
>> This is a new property, so other existing properties do not matter here.
>> We cannot take new code which you already think should be deprecated.
>>
>> register-like values are acceptable for vendor properties, but that does
>> not make them usually more readable. The question is whether this should
>> be more readable for hardware engineers or anyone writing/validating
>> DTS. Is the actual resistance important or no one ever cares because you
>> paste whatever qcom told you and you do not know what should be actually
>> there?
>>
>> I can imagine the first - that some document explains you should have
>> resistance of foo because of bar, which would mean the property should
>> be more readable. But I can also imagine the second. Make your claim in
>> commit msg.
> 
> Would this text in the commit message work for you?
> 
> ---
> Document the FS Differential TX Output Resistance Tuning value found on
> the eUSB2 repeater on Qualcomm PMICs. The tuning values have special
> meanings, being different offsets of the resistance to the default value
> in Ohms but the exact meaning is not relevant here, as the correct
> tuning is determined by hardware engineers to make sure the electrical
> properties are as expected.
> ---
> 
> I'm trying to avoid resending the whole series if we're not yet aligned
> on the wording.
Sounds fine.

Best regards,
Krzysztof

