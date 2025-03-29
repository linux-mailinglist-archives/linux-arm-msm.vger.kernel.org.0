Return-Path: <linux-arm-msm+bounces-52806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F1A75430
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 05:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F61818925A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 04:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE063595B;
	Sat, 29 Mar 2025 04:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZsDUrI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1283208;
	Sat, 29 Mar 2025 04:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743223687; cv=none; b=Wpz85uTh0VPqgHA68f7VH8M38nF1nqP6fBqLiJfpXlViAKptK1w3xfOfbeYWVhIBro6PeemnzkKKwcMQtpWpzjwFm64cKIqEbC98weR/S4wWk9I7MVzZMx/yelsTA2vYQe6HKkjD5JBzUOApo1dFbUyWrbfT7OPDU9rjuw2UNrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743223687; c=relaxed/simple;
	bh=qtQbSKTVK0pkTE7f/yrntIG8E5GlCocMcADgNGlg+Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRJd45mumVhCzPfzkpvg+FHz7jNHI80r3qeJfr4fKbAooPp5uJ1O78izjoch9AArMkk8KxJT9Jht6c+JPRr1eSFbxZEdf6ElSpqI7ePXzB+Ocio5GrovD5fCTVR+FfjR9ipC7/NIWU9+IwsDr4hnUug8PFiHGuoDlFx+F5rf+Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZsDUrI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A5CC4CEE2;
	Sat, 29 Mar 2025 04:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743223686;
	bh=qtQbSKTVK0pkTE7f/yrntIG8E5GlCocMcADgNGlg+Gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gZsDUrI7ldOi3vkvjWOf7DUko6rc8xVOPcvZCzUMLeDAVjUfGryoHqhl3fraSpLtu
	 1J12uxZiRx0dnljYLrAosZsVVwUSSSvoo6fXymPVvgGf0dpNx5kGtDCDMCAQj3cE0O
	 N0ubMSU1aV1RcPgHKGNK3dHdL6U/LyvOgM/7j9jJ0A8g3aRtB6E3ByhRVsiJxhGWpA
	 K02hn7TEH4FtlxpNr53SkDd4zu4rG6M2KYKuT/cbi7LTlrMWPPyvnmvMCJrRJMin+0
	 ov8FG/So8jNsjZyki1LFVhqUDRElw7r0kgosvN5McoUvrR2g4AUQokPqWZm+GD7jud
	 VlDhzuK9CbXwg==
Message-ID: <b46aad11-4787-49f9-ab4e-1737e583622f@kernel.org>
Date: Sat, 29 Mar 2025 05:48:00 +0100
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
References: <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
 <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
 <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
 <Z8AWHiVu05s0RJws@hu-wasimn-hyd.qualcomm.com>
 <a8991221-88b2-4a39-a51b-587c4cdeebe4@kernel.org>
 <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
 <Z8lb889QrqluPXXl@hu-wasimn-hyd.qualcomm.com>
 <e00a7061-5283-4809-b652-5f6c5e1e4496@kernel.org>
 <Z9v/z/i6OyWXXe7N@hu-wasimn-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z9v/z/i6OyWXXe7N@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2025 12:45, Wasim Nazir wrote:
> Hi Krzysztof,
> 
>>>>
>>>> Which piece of actual hardware is represented in qcom-ride-common?
>>>>
>>>
>>> All daughter cards like SOC-card, display, camera, ethernet, pcie, sensor, etc.
>>
>> No, I asked about the name of the hardware, datasheet, ID or picture.
>> Common DTSI represents somoething, not just because you wanted to add
>> something you had in downstream.
>>
> 
> Currently we don't have any datasheet or document which is publicly
> available, so I will try my best to describe our HW.
> 
> Ride is a modular hardware system with several smaller daughter cards
> connected to single backplane board and each daughter card is stacked on
> top of each other. I will try to explain each daughter card with HW
> components and how it is connected to construct the ride-hw.
> 
> Backplane board:
>   - It contains an MCU (Aurix TC397), CAN/LIN transceiver,
> 	Audio/GNSS/IMU-I2C signals, Fan header
>   - It holds & connects all the daughter cards.
> 
> SoC card:
>   - It contains:
>     - SoM:
>       - One of QCS9075M/QCS9100M/QAM8775p SoM.
> 	  - Each SoM is composed of either qcs9075/qcs9100/sa8775p SoC, along
> 		with DDR & PMICs.
>       - Each SoM can be mounted to same SoC-daughter card of ride-hw.
>     - In addition to SoM, it also has
>       - 4x UART, 2x USB 3.1 & 1x USB 2.0
>       - Memory: 1x OSPI, 2x UFS-3.1
>       - Debug: JTAG/QDSS header
>       - PCIe0, PCIe1 & Display signals
>       - Reset button
>   - It is connected to backplain board via B2B connector.
> 
> Display card:
>   - It contains:
>     - 4 eDP ports & 2 DSI-DP bridge
>     - I2C GPIO expander & I2C switch
>   - It is connected to SoC-card via B2B connector.
> 
> Camera card:
>   - It contains:
>     - 4 Quad DE-serializer, each supporting 4 MIPI CSI inputs
>     - Total upto 16 Cameras ports are supported.
>   - It is connected to backplain board via B2B connector.
> 
> Ethernet card:
>   - There are two variants of ethernet card each with different
> 	capabilities:
>     - [Ethernet-v1] card contains:
>       - 2x 1G RGMII phy, 2x 1G SGMII phy(enabled currently)
> 	  - Total 4 phy supported, only 2 phy are enabled and it is used in
> 		ride.
>     - [Ethernet-v2] card contains:
> 	  - 2x 1G RGMII phy, 2x 2.5G HSGMII(enabled currently) & 10G PCIe based
> 		MAC+PHY controller
> 	  - Total 5 phy supported, only 2 phy are enabled and it is used in
> 		ride-r3.
>   - Either [Ethernet-v1] or [Ethernet-v2] is connected to backplain board
> 	via B2B connector.
> 
> PCIe card:
>   - It contains:
>     - PCIe connections to SoC-card
> 	- NVME, 2x WLBT module QCA6696/QCA6698 (Wi-Fi & bluetooth solution) &
> 	  GNSS module
>   - It is connected to backplain board via B2B connector & PCIe signals are
> 	connected to SoC card via flyover cables.
> 
> Sensor Card:
>   - It contains 3-Axix compass & 6-Axis 3D IMU (accel/gyro) module which
> 	are communicating via I2C
>   - It is connected to backplain board via B2B connector.
> 
> Front panel card:
>   - It does not contain any active circuitry, only ports are available
>     - Audio-in/out ports
>     - USB hub ports
>     - CAN/LIN ports
>     - 12V power off switch
>   - It is connected to backplain board via ribbon cable.
> 
>>
>>>
> 
>>>> |             |                      | +-------------------------+-----------------------+-----------------< sa8775p-ride-common.dtsi           |
>>
>>
>> There is no ride-common hardware. If there is, send us any proof of its
>> existence. all your statements here show you want to create some
>> structure because you like it. I don't think you get my questions. You
>> painted diagram of DTS, not hardware.
>>
>> We talk about hardware. Not your DTS. Drop all DTSI, DTS, DTSO from here
>> and show us the hardware.
>>
> 
> Considering outlined h/w description, following are ride configuration
> variation each platform supporting:
> 
> Between qcs9075, qcs9100 & sa8775p ride/ride-r3 boards, SoM is changing;

Define these as SoMs then.

> And between ride & ride-r3 ethernet is changing.

Different ethernet cards can be also represented as cards - their own
DTSI. But there is no soc-card with one or other ethernet, so do not
create fake structure just because downstream had it.


> Excluding these differences all other cards i.e SoC, display, camera, PCIe,
> sensor, front & backplain are same and are refactored in ride-common.
> If any variant of these cards comes up in future we need to refactor
> ride-common accordingly. I will try to outline this as clearly as possible
> in next commit log.
> 
> Considering current outlines of all daughter cards, following defines
> ride/ride-r3 variant boards:
>   - sa8775p ride    : QAM8775p SoM + [Ethernet-v1] + other daughter cards
>   - sa8775p ride-r3 : QAM8775p SoM + [Ethernet-v2] + other daughter cards
>   - qcs9100 ride-r3 : QCS9100M SoM + [Ethernet-v2] + other daughter cards
>   - qcs9075 ride-r3 : QCS9075M SoM + [Ethernet-v2] + other daughter cards
> 
> Since we don't have a document yet which formally describes
> qcs9075/qcs9100 ride board with [Ethernet-v1] card, I shall be dropping
> this particular variant in next patch series and re-send after complete
> documentation is available.
> 
>>> Actually we are not including dts here instead *.dtso file will be
>>> overlayed to *-ride.dts to generate *-ride-r3.dts.
>>>
>>> Below is the correct arrow sequence.
>>
>> And the overlay represents what exactly? Different board? No, that's not
>> how overlays should be used.
>>
>> You have different board, you have different DTS.
>>
> 
> No the overlay is not a different ride board. This overlay represents
> [Ethernet-v2] card which is different than [Ethernet-v1] card.

Different cards is not an overlay. Overlay is for added cards, but you
replace here the card.

Best regards,
Krzysztof

