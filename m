Return-Path: <linux-arm-msm+bounces-50906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FDA5BA50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B54CC3A5F06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 07:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCC5222572;
	Tue, 11 Mar 2025 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwBw/X5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCF360;
	Tue, 11 Mar 2025 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741679961; cv=none; b=K2kGRlNrUO1ls3A1dhQzh1hfdsjT75kLODmV2p3vZuuziotxPrYzJvON8VXYHPA9Fgrzc3iajfR6dlb8SR4c7sA/e/U/lpR+H+Mgz5z95/lplK8An1pxadnKpIZNlT0vaEzbX7aIa/SOK2FvJKWV2iCIibCelNKhOTb10qhe4wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741679961; c=relaxed/simple;
	bh=lVxPN8WE7T2o7rpe7aTu0Mo4GEzROYSX14bI6LflcP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek9M3FswaCTUk4ddVk1j+K3Vm28DthnD3ZDu3SQ79oErXaYCvX1CjXoU1Vqjm4zQ6w8NDfBjukWsQvB4xT1/RiEis0vnLnQvB4NfM7xe9O0VgOWsrDx2Co6LtjMfls9tbZyyUfDgndRTj800Dxp6w59fTbZoPHZnOBcfJCic87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwBw/X5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778FEC4CEE9;
	Tue, 11 Mar 2025 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741679960;
	bh=lVxPN8WE7T2o7rpe7aTu0Mo4GEzROYSX14bI6LflcP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JwBw/X5t06/ItCAxQOTa7ggRW5RunQzCg85Cp9TFaEv26DhAmIsEnjoutSsuvaP24
	 uuEk5o12XTAWDTtxHy54Q9x/S7fsaWmHGNB101hYxsfj2kDNOue4MBqhpaBn8WrYnz
	 Jt7QrTDc7DM1Zl07xm2tbvPgmGkxlcY3Eg2ax0+/LJK+atsTE+wY8VdwoqbF/vGCs4
	 ZRLdjP9kkvhl20RY6eM3RLsOrYV8bK6RnyJQasnkxqpKmCaPHwHOO1XVWmtlu+3Rri
	 JAdqjo1t5ZjqZ7Nh75wW50NQP9PE/NB18Znusae5DP9tnwwF/mXeLP+mZ81njT05vF
	 mHKqWvm3sb7dA==
Message-ID: <0b90b304-4ecb-4f08-8135-4ca20fe46dc0@kernel.org>
Date: Tue, 11 Mar 2025 08:59:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
 <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
 <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
 <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
 <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
 <Z8AWHiVu05s0RJws@hu-wasimn-hyd.qualcomm.com>
 <a8991221-88b2-4a39-a51b-587c4cdeebe4@kernel.org>
 <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2025 09:17, Wasim Nazir wrote:
> On Mon, Mar 03, 2025 at 08:46:55AM +0100, Krzysztof Kozlowski wrote:
>> On 27/02/2025 08:37, Wasim Nazir wrote:
>>> On Wed, Jan 15, 2025 at 09:35:34AM +0100, Krzysztof Kozlowski wrote:
>>>> On 15/01/2025 06:48, Wasim Nazir wrote:
>>>>>> The the SoC, I am asking about the board. Why each of them is for
>>>>>> example r3?
>>>>>>
>>>>>> So this is not sufficient explanation, nothing about the board, and
>>>>>> again just look Renesas and NXP.
>>>>>>
>>>>>
>>>>> Hi Krzysztof,
>>>>>
>>>>> sa8775p(AUTO), qcs9100(IOT), qcs9075(IOT) are different SoCs based on
>>>>> safety capabilities and memory map, serving different purpose.
>>>>> Ride & Ride-r3 are different boards based on ethernet capabilities and
>>>>> are compatible with all the SoCs mentioned.
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>>> Compatible? What does it mean for a board?
>>>>
>>>
>>> Ride board is based on multiple daughter cards (SOC-card, display,
>>> camera, ethernet, pcie, sensor, etc.).
>>>
>>> The SOC is not directly soldered to Ride board, instead SOC is soldered
>>> on SIP (System in Package) card which can be mounted on SOC-daughter card of
>>> Ride board.
>>> 	- SoC => SIP-card => SOC-daughter-card (Ride)
>>
>>
>> So basically pretty like other designs using SoM.
>>
>>>
>>> Together with SIP cards and other daughter cards we are creating different
>>> <soc>-Ride Variants with differences in memory map & thermal mitigations.
>>>
>>> The SIP card consists of SOC, PMIC & DDR and it is pin compatible to the
>>> SOC daughter card of <soc>-Ride board. Only SOC is changing accross SIP
>>> cards, except an additional third party SIL-PMIC for SAIL, which is not
>>> present in QCS9075 Ride.
>>
>> Just like every SoM
>>
>>>
>>> Other daughter cards remains same for <soc>-Ride variants, except
>>> ethernet card which is different for <soc>-Ride rev3 variants.
>>>
>>> So the Ride board (combination of daughter cards) is same across the SIP,
>>> while SOC on SIP card is changing which can be sa8775p, qcs9100 or qcs9075.
>>>
>>>> Third time: did you look how other vendors do it?
>>>>
>>>
>>> Yes, we have reviewed other vendors. However, please feel free to share
>>> any specific reference you would like us to follow.
>>>
>>> Here are few reference files we found from other vendors where similar
>>> tasks are performed which includes code refactoring and HW modularity:
>>>  - Freescale: fsl-ls208xa.dtsi, fsl-ls2088a.dtsi, fsl-ls2081a-rdb.dts
>>
>> That's an unexpected choice - I would rather look at dozen of SoMs for
>> iMX platforms.
>>
>>>  - Renesas: white-hawk-common.dtsi, r8a779g0-white-hawk.dts
>>>  - Rockchip: px30-engicam-common.dtsi, px30-engicam-ctouch2.dtsi,
>>>    px30-engicam-px30-core-ctouch2.dts
>>>
>>> In our case along with describing the HW, code refactoring is also done
>>> which might be causing confusion, but we are ready for any inputs for
>>> correction.
>>
>> I don't understand why this was not properly described since beginning.
>> You had the hardware in your hands and went with incomplete or even
>> incorrect hardware description.
>>
>>>
>>> Putting this pictorial diagram for updated DT structure depicting our HW.
>>>  - qcs9xxx-module.dtsi specifying QCS9xxx based SIP card/module having
>>>    SoC, PMICs, Memory-map updates.
>>>  - qcom-ride-common.dtsi specifying ride daughter boards, here we are
>>>    doing code refactoring also as this is common for all ride boards.
>>>  - qcom-ride-ethernet-aqr115c.dtso specifying ethernet overlay board which
>>>    uses 2.5G phy and can be overlayed to ride boards to get ride-r3.
>>>    By default ride uses 1G phy.
>>>  - qcs9075-iq-9075-evk.dts is the new name for RB8 as per new product
>>>    name. We will be changing this in next patch series.
>>>
>>> +-----------------------------------------------------------------------------------------------------------------------------------------------+
>>> |                                                                                                                                               |
>>> |                                                          sa8775p.dtsi                                                                         |
>>> |                                                              |                                                                                |
>>> |                                    +-------------------------+-----------------------+                                                        |
>>> |                                    |                         |                       |                                                        |
>>> |                                    v                         |                       v                                                        |
>>> |                             qcs9075-module.dtsi              |                qcs9100-module.dtsi                                             |
>>
>> So this is the SoM?
> 
> Yes this is SoM.
> 
>>
>>> |                                    |                         |                       |                                                        |
>>> |                                    v                         v                       v                                                        |
>>> |                                  (IOT)                    (AUTO)                   (IOT)                                                      |
>>> |                                    |                         |                       |                                                        |
>>> |             +----------------------+                         |                       |                                                        |
>>> |             |                      |                         |                       |                                                        |
>>> |             |                      | +-------------------------+-----------------------+-------------------< qcom-ride-common.dtsi            |
>>
>> Which piece of actual hardware is represented in qcom-ride-common?
>>
> 
> All daughter cards like SOC-card, display, camera, ethernet, pcie, sensor, etc.

No, I asked about the name of the hardware, datasheet, ID or picture.
Common DTSI represents somoething, not just because you wanted to add
something you had in downstream.


> 
>>> |             |                      | |                       | |                     | |                                                      |
>>> |             v                      v v                       v v                     v v                                                      |
>>> |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
>>> |                                    |                         |                       |                                                        |
>>> |                                    | +-------------------------+-----------------------+-------------------< qcom-ride-ethernet-aqr115c.dtso  |
>>> |                                    | |                       | |                     | |                                                      |
>>> |                                    v v                       v v                     v v                                                      |
>>> |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
>>
>> I think I gave already few times that answer: No. You cannot reference
>> from a module.c another .c file. You cannot reference DTS from DTS.
>>
>> Strictly speaking you can, of course, but you must not. That's not how
>> source code is done to be manageable and readable.
> 
> Ah the arrow is leading to confusion.
> 
> Actually we are not including dts here instead *.dtso file will be
> overlayed to *-ride.dts to generate *-ride-r3.dts.
> 
> Below is the correct arrow sequence.

And the overlay represents what exactly? Different board? No, that's not
how overlays should be used.

You have different board, you have different DTS.


> 
> |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
> |                                    |                         |                       |                                                        |
> |                                    +-------------------------+-----------------------+---------------------< qcom-ride-ethernet-aqr115c.dtso  |
> |                                    |                         |                       |                                                        |
> |                                    v                         v                       v                                                        |
> |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
> 
>>
>>> |                                                                                                                                               |
>>> +-----------------------------------------------------------------------------------------------------------------------------------------------+
>>>
>>>>>
>>>>> With the combination of these 3 SoCs and 2 boards, we have 6 platforms,
>>>>> all of which we need.
>>>>> - sa8775p-ride.dts is auto grade Ride platform with safety feature.
>>>>> - qcs9100-ride.dts is IOT grade Ride platform with safety feature.
>>>>> - qcs9075-ride.dts is IOT grade Ride platform without safety feature.
>>>>>
>>>>> Since the Ride-r3 boards are essentially Ride boards with Ethernet
>>>>> modifications, we can convert the Ride-r3 DTS to overlays.
>>>> How one board can be with multiple SoCs? If it is soldered, it's close
>>>> to impossible - that's just not the same board. If it is not soldered,
>>>> why you are not explaining it? What is Ride board? What is there? What
>>>> can go there? How it can be used in other SoCs? Or for which SoCs? Is
>>>> there a datasheet available?
>>>>
>>>
>>> As our SoC is based on SIP card and SIP card is compatible with Ride
>>> board, we could able to use same Ride board (which is combination of
>>> multiple daughter cards) with multiple SIP cards.
>>> These SIP cards can be of sa8775p, qcs9100 or qcs9075 SOC.
>>
>> Describe properly the hardware - if you have a module or SIP if you
>> decide not to use industry-standard naming (but why...), then describe
>> it in DTSI.
> 
> We refer to it as ‘module’ in our datasheet, so I use the same term
> here. Thanks for pointing it out; we can proceed with the SoM name.
> 
> Below is the updated diagram:
> +-----------------------------------------------------------------------------------------------------------------------------------------------+
> |                                                                                                                                               |
> |                                                          sa8775p.dtsi                                                                         |
> |                                                              |                                                                                |
> |                                    +-------------------------+-----------------------+                                                        |
> |                                    |                         |                       |                                                        |
> |                                    v                         |                       v                                                        |
> |                             qcs9075-som.dtsi                 |                qcs9100-som.dtsi                                                |
> |                                    |                         |                       |                                                        |
> |                                    v                         v                       v                                                        |
> |                                  (IOT)                    (AUTO)                   (IOT)                                                      |
> |                                    |                         |                       |                                                        |
> |             +----------------------+                         |                       |                                                        |
> |             |                      |                         |                       |                                                        |
> |             |                      | +-------------------------+-----------------------+-------------------< qcom-ride-common.dtsi            |
> |             |                      | |                       | |                     | |                                                      |
> |             v                      v v                       v v                     v v                                                      |
> |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
> |                                    |                         |                       |                                                        |
> |                                    +-------------------------+-----------------------+---------------------< qcom-ride-ethernet-aqr115c.dtso  |
> |                                    |                         |                       |                                                        |
> |                                    v                         v                       v                                                        |
> |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
> |                                                                                                                                               |
> +-----------------------------------------------------------------------------------------------------------------------------------------------+


Several companies solved it - most of NXP vendors, many Renesas etc. I
really do not get why this needs so much talk and you cannot learn from
their architecture how SoM should be represented.

Best regards,
Krzysztof

