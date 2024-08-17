Return-Path: <linux-arm-msm+bounces-28871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A3955771
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 13:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2694FB21569
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B624148855;
	Sat, 17 Aug 2024 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxOeo0/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7001C32;
	Sat, 17 Aug 2024 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723894340; cv=none; b=M2B+I+RlVVhXJ2+9oQdKGjYu+LOwehlvncGAMIfgsNp9GlYImmWUtKBn7qBOV5xaZiKC2bVC/u/+altxlQgXrsHtZGJ2RvXWJAs3H7N3dvgu+THLMgeNgWwkixN1GPXJ9z4iuOmSRdjzRNUfY6wU8fmOeajHJ4v63kBZ9vwdXTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723894340; c=relaxed/simple;
	bh=WPi/0xKBeUVZfXJccLvpi5U+6P6UdVWcEVoeDHhgO7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNtLMh7dFN+SnEZgk81yBEqKVHOKrTZ4wf50RmYW9reyLb2zswWCHMXzundPobfkS3X9cqRExfkwqwIpahk41AJpFfym0sMlGqIqAV6ufJ7jx88TlVGuubI+WdqMRQgJSTsbjSC+fI9Nih9lAa0SoWTu0/m4Dp2Pbct5DjAdbSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxOeo0/b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E54C116B1;
	Sat, 17 Aug 2024 11:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723894339;
	bh=WPi/0xKBeUVZfXJccLvpi5U+6P6UdVWcEVoeDHhgO7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MxOeo0/bxo8xsivJgCM4DVofw/hjy7d079G+29OSWivJctC7s4byJjcskgfcLbAYp
	 cceorbq6LpNYvaMjriPMbb2/DaMR95twWKDxgS177ka+zIQBOFD9jzHtRNqcuN8hcZ
	 ndqJ/RtXHs/AQo2NW52Z4tPm5ega4Uenm8AkdQGhVXp1bLigHP+Zh2sSud+z/YKez2
	 PKrLc8H2otLba8Uqu20Lt/Su9yuiM9CxRuCWXQt9Du0InXSC6MThn+36Bs5qMZueKG
	 nO3lYmXPYe4nh9gKeufwyHFK9KWocCaIUMEejPQrqhVxVUl+xEanfhxB2v0Nkfrgjm
	 ce6tIzxp4qZIg==
Message-ID: <9c731c93-772e-409e-b7e5-ae36af402c76@kernel.org>
Date: Sat, 17 Aug 2024 13:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Add USB Multiport
 controller
To: Song Xue <quic_songxue@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krishna Kurapati <quic_kriskura@quicinc.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
 <20240809-topic-h_mp-v1-2-3c5f468566d8@quicinc.com>
 <21fffb71-d559-4973-8028-d9c9b9f67001@quicinc.com>
 <3077d600-c570-407a-87eb-6926a67636f9@gmail.com>
 <81b60725-f744-4b40-9450-e881397c2ddf@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <81b60725-f744-4b40-9450-e881397c2ddf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 1:56 PM, Song Xue wrote:
> 
> 
> On 8/14/2024 6:24 PM, Konrad Dybcio wrote:
>> On 14.08.2024 12:08 PM, Song Xue wrote:
>>>
>>> On 8/9/2024 9:18 PM, Konrad Dybcio wrote:
>>>> X1E80100 has a multiport controller with 2 HS (eUSB) and 2 SS PHYs
>>>> attached to it. It's commonly used for USB-A ports and internally
>>>> routed devices. Configure it to support such functionality.
>>>>
>>>> Signed-off-by: Konrad Dybcio<konrad.dybcio@linaro.org>
>>>> ---
>>
>> [...]
>>
>>>> +
>>>> +                phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
>>>> +                       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
>>>> +                phy-names = "usb2-0", "usb3-0",
>>>> +                        "usb2-1", "usb3-1";
>>>> +                dr_mode = "host";
>>>
>>> Why do we add the dr_mode definition in dtsi file rather than in corresponding board dts file?  Could we follow the node "usb_1_ss1_dwc3"  in x1e80100-crd.dtsi?
>>
>> That is because the MP controller is host-only and it doesn't make sense
>> to ensure the OS of that in each board file separately. That's also how
>> it's done on other platforms with a MP controller description.
>>
>>>
>>> BTW, how do we verify the function of  multiport controller？From my test on x1e80100-crd,  the eusb6 which is from usb_mp_hsphy1 attaches the third-party repeater, do we need a new repeater node/driver to verify the function of eusb6?
>>
>> I have a X1E Surface Laptop 7 with a USB-A port with a NXP PTN3222 in
>> front of it. Tested with a smoke test, with both SS and HS USB-A devices.
>>
> What is detailed information on smoke test.
> From my end, I also have two questions.
> 1. I found the usb_mp_hsphy1 is using the driver "phy-qcom-snps-eusb2". However, the driver requires a repeater node from DT. At present, we don't have the node or driver for NXP repeater and it is not working on eusb6 to detect the NXP repeater. So, is it possible for us to have complete function involving with MP DT and repeater node for CRD board, and then we push patches together?

I believe you're a bit confused about the upstreaming process. Describing
hardware in Device Tree vs doing the same plus enabling it on some upstream
board are of equal value, and this patch is very much in the spirit of
"release early, release often".

There's no need to delay patches that are correct within their own
confinement (which they should be [1]) just so that the series is bigger.
That may even be discouraged by some folks..

> 2. The usb_mp_dwc3 node has four phys. When enabling the driver for the node, we must need enable all four phys in borad's DT. Howerver, if the board is only using one phy like eusb6, is it suitable to enable other three phys?

Yes, they will simply be registered, configured and since there won't
be any interrupts (as the pins are N/C, it will not do much). But
these PHYs are physically on the SoC regardless of them being
connected, so I see no issue.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes

Konrad

