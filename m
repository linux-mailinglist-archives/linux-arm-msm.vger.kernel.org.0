Return-Path: <linux-arm-msm+bounces-87517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E31CF4543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CEC03021E44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488AE3093B8;
	Mon,  5 Jan 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iS2ZqRMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B603090E0;
	Mon,  5 Jan 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625752; cv=none; b=XWy0K328F+zuOIcgVHs4U7e6E/tNc9TyFMY6+UqQOofJ6ojY6lt9zez0ktqAvAU6HoAwVwUHa18u8wajh7ThiWTwP+0l4AzPNHvbDbzvRj4lE1CcLE3MozNTa89pYpEUsu6dUD5cUdE224PgZWaZyd0xDyOL862wB3bBnlCnkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625752; c=relaxed/simple;
	bh=I1d5FxAgc09CV6iIiWDT/isaABPEFpxSuyY5Qrewv68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKUuIltUZquwbaWy+hDune+FOF8DgqrDeHPbPgamFjItPAiAQN81SOJ0pUzXOdtF/JFbgaeaz8PoL9w0SDLLAvYfgpDg0Uk0TPhd3GN1llQwHkwOrQMIdTy+8n27+GdnFTpmO98Q4sUc/n3o8a4Sv7zFwoYpKY7ZSDGQrwP48/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iS2ZqRMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3A9C116D0;
	Mon,  5 Jan 2026 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767625751;
	bh=I1d5FxAgc09CV6iIiWDT/isaABPEFpxSuyY5Qrewv68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iS2ZqRMea5KagLUR55CU1bqkMjCePFWmxTVYGizGXLOH//MWvGjVbOLyAH9/fE/wk
	 mdsv0lOh1XdCevSUfmBnBeILfhd/IOfvJhXZpqloeVjaGuPkVlpai+9yHYywHuAxKn
	 ThCFx0m6P1A7W1wr8/TEVQeMz81JLzSGM2YzRBDzxWQXBI7ouuV/5TKmacx3nZLsaT
	 UJKQznLn3wDQnZqIyZ9YSsmaLK+QerHhSWKJowznAhJlyc69jLTu4SQKNqajlvaVPu
	 CIszaQ7QtNy+YX8TeDLKZrFPpat2l4DITEMpGQCiVQALXYUAqNSQmjfGDSo3DuRuuu
	 +e1El6ABiCBkA==
Message-ID: <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
Date: Mon, 5 Jan 2026 16:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
 <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
 <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/01/2026 06:36, Tingwei Zhang wrote:
> 
> 
> On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
>> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
>>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
>>>> On 29/12/2025 08:38, Yijie Yang wrote:
>>>>>
>>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>>>>>
>>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>>>>>>
>>>>>>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>>>>>>> the common components into separate files for better maintainability.
>>>>>>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>>>>>>> similar to you, but actually common parts.
>>>>>>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>>>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>>>>>>> has Hamoa on it.
>>>>>>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>>>>>>> actual feedback, not some other arguments.
>>>>>>>>>
>>>>>>>>> NAK
>>>>>>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>>>>>>> Krzysztof,
>>>>>>> Please let me know your opinion on this. This could be a common case for
>>>>>>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
>>>>>> It's not the same PCB.  You did not really respond to my first message,
>>>>>> so I responded to you - I do not speak about boards. Then again you did
>>>>>> not respond to it and brought some irrelevant arguments.
>>>>>>
>>>>>>> would reduce maintenance effort.
>>>>>> Does not matter, I do not question this. Why are you responding to some
>>>>>> questions which were never asked?
>>>>>>
>>>>>> DTSI represents actual shared physical aspect and you cannot share SoM
>>>>>> physically. It's not the same PCB, because you do not have a socket on
>>>>>> the SoM.

HERE - socket.

>>>>> x1e80100-crd and x1p42100-crd are different boards, yet they share the 
>>>>> same x1-crd.dtsi. Why can’t we apply the same approach here?
>>>>
>>>> You should ask the authors there, not me. I presume that the baseboard
>>>> is the same or very similar. Or pieces of the baseboard are re-used
>>>> which could be visible in the schematics (same MCN numbers etc).
>>> For me this sounds like a new rule, which didn't exist beforehand. We
>>> have enough foo-common.dtsi fragments, covering similar phones, but we
>>> never required the knowledge of those phones having the same PCB.
>> I am speaking about it since 2020? 2021? So how new? Other people in
>> other SoCs were sometimes speaking about it in 2016 or something
> There’s no doubt that using a common DTSI makes sense when the boards
> share the same baseboard.
> I think the real question is whether the baseboards are defined so
> similarly that they can be treated as the same.
> For example, would swapping to a different SoC—similar to the
> Hamoa/Purwa CRD scenario—still be acceptable?
> Would exchanging components such as the display panel, a single camera
> lens (not the sensor, as far as I can tell), or removing the 3D iToF
> module[1] still qualify as the “same” board?
> In other words, can we consider two boards identical if the underlying
> circuit board is the same but a few parts are swapped out?

I received IDs of the schematics for these boards, but they are called
"IPC BGA module" and what I saw usually is that BGA modules are not
mountable but solderable. This does not matter that much but should have
been said, because it might mean this is not even a SoM. There are many
SoMs which are BGA, not pluggable or pin-based, but I have just doubts
that authors share everything...

Anyway the BGA modules for Hamoa and Purwa have almost the same
schematics, indeed, except differences in PCI, APC supply and lack of
one PMIC.

If this was the same SoM, just with different SoC soldered, it would
have the same PMICs. Different PMICs means different SoM...

Anyway, I shared my opinion and I am not going to spend more time on
this. It should not be my task to go through schematics and prove that
PMICs differ. Authors should.

Best regards,
Krzysztof

