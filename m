Return-Path: <linux-arm-msm+bounces-84346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A039CA3416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B2A53027A28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6BC2EDD6B;
	Thu,  4 Dec 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5rIHxY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980B2E8B75;
	Thu,  4 Dec 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844879; cv=none; b=MD4eC5hY4aPMXD0F3wl7RSHaXnHE6N9dEnB+FsXjiCXuOWjbyf36H9eGLD257LeZGUqxvTI0ht1dGtVslPBNEce3IM4WNpu1LcVUC31/tXcSRi+8QNZa5ErNTezUZ5pUqImgDnWv+A3A/tJ6yantY3XKLl2j1VdAueG+FB5Qi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844879; c=relaxed/simple;
	bh=aqeR/1x+0daaeZWxz3FScYcM9slnxWtY0Vk5BXDZ1MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3thoWS45Igc7VGDw4EXWFHIL18onhJW5DY7JSxnwvJpOTBNafFqbCg3Ycu+ExcbzFNykNOpi0+0MTTp8HJSylkYzxMI5kNTFWSuGowF0hCR2XLvVCTrf/SzUpwUIXURbnIXb4yVtTfwMEOlz1tA0v3HqNajVBljyDdVRUZLp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5rIHxY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC511C4CEFB;
	Thu,  4 Dec 2025 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764844878;
	bh=aqeR/1x+0daaeZWxz3FScYcM9slnxWtY0Vk5BXDZ1MM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f5rIHxY3qqIxhId0qRD+wHS2HlZ1aslUodDTnrOBj8aBqKcj4ao0/FSWqCLjrv1U+
	 z9VwFHr96GJQTWqHEtk5uOVlM/OsKkuA1sk1hzY4B+xzi1uR2wQI/chNTbwz/nC1fl
	 OohvObEbT1uPgCbPuFqjbjSSX+mnY/Xh/uDriMKmVgvgDNySaBirz+DCg2TGD0dAiK
	 +3RSipyT6SsVQyD3GVI+cnPnBIuC//AJ0lJwizoXjqyQitz/Ns656hr1+6Yc3DHhej
	 6HWljHk8TqZgrDnGuCpfJO4hEUGuUmSDPP1vLh1H+dhyJCexaJwNMo3Y7p9AHhuxj5
	 HC32DouvJSg7Q==
Message-ID: <2fa188c3-f5c3-4145-9cae-3587f3bb23cc@kernel.org>
Date: Thu, 4 Dec 2025 11:41:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
To: Pavel Machek <pavel@ucw.cz>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
 Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Manish Pandey <manish.pandey@oss.qualcomm.com>,
 Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
 <aTB8++UtSrhwtqdY@duo.ucw.cz>
 <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>
 <db113021-f5be-4559-8ea5-719f8d7ec3ee@kernel.org>
 <aTFP1w48bWgto7wr@duo.ucw.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aTFP1w48bWgto7wr@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/12/2025 10:09, Pavel Machek wrote:
> On Wed 2025-12-03 19:41:59, Krzysztof Kozlowski wrote:
>> On 03/12/2025 19:40, Krzysztof Kozlowski wrote:
>>> On 03/12/2025 19:10, Pavel Machek wrote:
>>>> On Wed 2025-12-03 18:31:11, Krzysztof Kozlowski wrote:
>>>>> On 02/12/2025 19:21, Pavel Machek wrote:
>>>>>> Hi!
>>>>>>
>>>>>>> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
>>>>>>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
>>>>>>>
>>>>>>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
>>>>>>> and QRD (Qualcommm Reference Device) are splited in three:
>>>>>>>
>>>>>>> - 1-3: MTP board boot-to-shell with basic function.
>>>>>>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
>>>>>>> - 17-20: Multimedia features including audio, video and camss.
>>>>>>
>>>>>> Thanks for doing this. I assume there devices available with this are
>>>>>> quite expensive/hard to get at this point?
>>>>>>
>>>>>> Please cc phone-devel@vger.kernel.org with phone related patches.
>>>>>
>>>>> That's not even a phone, anyway contributors should not cc lists which
>>>>> are not relevant to the posting and not pointed out by maintainers. You
>>>>
>>>> People should Cc relevant lists, and yes, if it is called "Mobile Test
>>>> Platform", it is relevant to phone development.
>>
>> ... and btw, I know what MTP and QRD is and MTP IS NOT A PHONE. I work
>> on this, I upstream this and it is not a phone, regardless how you call
>> it. Just because we call our evalkit like that, does not make it a
> phone.
> 
> So what is it?

evalkit for SoC. Just like every other NXP evalkit board is.

> 
>>> new-hardware-devel or whatever. No. People should use tools, not guess
>>> the cc lists. Fix the tools if you miss any Cc.
> 
> No.

Then do not impose additional rules to cc foo-devel just because you
want the patches.

Best regards,
Krzysztof

