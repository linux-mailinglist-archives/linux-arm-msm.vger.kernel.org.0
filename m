Return-Path: <linux-arm-msm+bounces-66656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12641B119C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9B9B4E23CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967672BEC2F;
	Fri, 25 Jul 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1YjeCSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0E192D97;
	Fri, 25 Jul 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431932; cv=none; b=mmH/Gz0kNrf5nVNqTqweaF9E8eQ0neQuSkkBvskQbEzQTTuzwSzb6BL9w6pKWphrLLlt4NzbWmfM7U8YwvPeh5b6V1IVGsyl8715g6SWm1q8tWiuHHSd/0HXT1s4G/j5dETZy541dmZl0OHihV/GPsH0CAg8+G/OSFlKi4nDCi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431932; c=relaxed/simple;
	bh=krpIjOaqUHNMs7CG0BnniYF6YeO3nrPtzg9ZDTYXMzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUgDUYmk8NvY0ZihmrrdZs2klCpg6ul9Lg5KOu9Xd+SkB1jAVN7UiOxYLvNH2mcJcd6guMuSLLjTDrcvFZtvI0R1pnIZ6w2Ir5tR4BYN2JWHgbmoXYQNDlodA0jAbYshwOJ4FL5HwuHiXKZh2IMtYDaYgm7Ld8nb7uKbaPRIloA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1YjeCSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D35C4CEE7;
	Fri, 25 Jul 2025 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753431931;
	bh=krpIjOaqUHNMs7CG0BnniYF6YeO3nrPtzg9ZDTYXMzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M1YjeCSf5Ym2wtanJ9iH8FX09JuCQ+sS7neUVAUVBAKAxc9Yd+moeYyVXl5gyL6c9
	 ZpEMHjwpsZlj+quWaNb0nkq9K1h2vVNKonSoa8PupH8dxaNqG8QvdhdHhfB7imkJ3V
	 P2qEIqJ3kzLpliYFrqKEzoHQmJQZ/zmSBtM2mLBvtWOrQwvtgL0fxqmwJNqjg+eVmq
	 Tq+1gPCDGBppQ74oeICL8nLkr39oCK3Kgc+hIbvbfM5Yg9NDX/xX5rNzdc1BFf7Y/Z
	 BUDPA9c8I5yo+D4Lb/1RaT9R6awJlyFvC+Q+hpQLQRxAX1XFbM0sMe1d6rcV2krgK2
	 J/Lgo/CJbO5tg==
Message-ID: <aee74e0f-c957-437d-ab48-3977013c3116@kernel.org>
Date: Fri, 25 Jul 2025 10:25:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
 <20250724-hamoa_initial-v2-1-91b00c882d11@oss.qualcomm.com>
 <d49d2755-2967-4bb9-b789-8be5f138d4cd@kernel.org>
 <3803aed8-3b32-4a7b-860f-8fe049f5ddee@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3803aed8-3b32-4a7b-860f-8fe049f5ddee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/07/2025 10:03, Yijie Yang wrote:
> 
> 
> On 2025-07-25 14:55, Krzysztof Kozlowski wrote:
>> On 24/07/2025 10:15, Yijie Yang wrote:
>>> Document the device tree binding for a new board named "EVK" based on
>>> the Qualcomm Hamoa-IoT platform.
>>
>> What is hamoa-iot?
>>
>> Later patches claim this is a SoM, so explain here why you are not
>> expecting it to be used outside of EVK (not following standard SoM rules
>> like every other vendor)?
> 
> The SoM can be used outside of the EVK. Regarding the standard SoM rules 
> you mentioned—are you referring to the expectation that a SoM should 
> have its own compatible string, such as 'qcom,hamoa-iot-som'?

Yes. We already discussed this with qcom last time for other soc/som.
Just look how all other vendors do it.

> 
>>
>>>
>>> The "hamoa" name refers to a family of SoCs that share the same silicon
>>> die but are offered in multiple speed bins. The specific SoC used in
>>> this board is the x1e80100, which represents one such bin within the
>>> Hamoa family.
>>
>> Isn't this obvious from the schema?
> 
> This is the first patch set where the Hamoa code name is introduced, so 
> I’d like to clarify the relationship between the Hamoa family and the 
> SoC ID. Additionally, I want to explain why the compatible string 
> includes both the board’s code name and the SoC name.

There is no SoC name here. The SoC name stays the same and you do not
change it just because your internal policy changes every X years.

> 
>>
>>>
>>> Although "qcom,hamoa-iot-evk" is introduced as the board-specific
>>> compatible, the fallback compatible remains "qcom,x1e80100" to preserve
>>> compatibility with existing in-kernel drivers and software that already
>>> depend on this identifier.
>>
>> Not relevant. This is x1e80100 SoC. We do not explain that
>> microsoft,romulus15 is using fallback x1e80100, do we?
> 
> Same as above.
> 
>>
>> You explain less relevant topics but you do not explain the main
>> concerns here. It does not matter how you name your board. Can be hamoa,
>> can be lemans - we don't care about board names.
>>
> 
> I will add more details to describe the relationship between the board 
> and the SoM. This is what people are most concerned about, right?

No. Drop all references to Hamoa because it is irrelevant. You do not
get to change existing bindings or existing meanings just because you
decided to use some other model names.

Best regards,
Krzysztof

