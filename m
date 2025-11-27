Return-Path: <linux-arm-msm+bounces-83668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E55C9006F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 20:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB48F3AA607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2443E2EBDF2;
	Thu, 27 Nov 2025 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="xKHxy324"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA161E1A17
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764272029; cv=none; b=NpG5h5v9pL42wJuZrALQMs0HsMCEG/Dsjfs5OyiRySHeH7eU1/NaE2lrFD5tcqCBVEda0lv7mhUUloOdW24MupyAotSbRUv1UClHHLlfZ9bTPMz3vI2NNqjQ361PuprOskqpWWVBW3nK2Am9nQtBcRvTz38dwcUY5Bx+SnUcEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764272029; c=relaxed/simple;
	bh=fs9vnPDceBUMF0spi5bUKF/L+DAeC19uipcq7XjRaUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgfuIJPBpY9Gky3RF+8s4v1Fg5zClGx+3+RFGs4iqnBXF45CrEjxN8h+okp/M5oS2HPlKq3Rz0aNbOaFK0RwiCObOdoz88o6RJfljc9RcYPexu22RgDaJaLZdjRY8PPPUwDviNs0uuEr5hYDFMy0yoklOmqQVH6jHrXcyuDes3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=xKHxy324; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <f820c42b-4cd9-430f-a1ee-4f380dc9ca8a@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1764272024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twC3DgrcBjAoJ79kbEz8s5y7IoW5MR+ZajnMa5xe4b4=;
	b=xKHxy324q+linhDJBQ/dINfLg8h80Jwpo+VGm6Yw74EQCGPnLNvAQiRk60QYPEhWCHNXSq
	zAyWxxytNjsqv/XlJGtAIaLn+hvABnNyqnpcRRkVH3J8/y5Tb0CX/t3HliwOF8QNkQidvg
	7SOA7pQapN8eX6LcBhX+Mgb5c+aOJIY/bz5vzLBQl86IhQht90t+Mb7I705rxEGkAo/Vyk
	dLvXMkPEf+d02luwf1lAmPhrX9m4aWA5KNHKXSu/V9b1duG1+sEqsC6eBm6MWyMpnA8Y9C
	h5IqyC7TutmKbhY6Ubv6RujIEGgxp9ykAZCCD3AFhx6Fi1eWRzqXwdrd9myd0Q==
Date: Thu, 27 Nov 2025 16:33:29 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
 <3b609409-e19f-4685-848d-807a4e840ad8@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <3b609409-e19f-4685-848d-807a4e840ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/27/25 10:47 AM, Konrad Dybcio wrote:
> On 11/26/25 5:14 PM, Val Packett wrote:
>> Hi,
>>
>> On 11/25/25 10:20 PM, Vladimir Zapolskiy wrote:
>>> The reported problem of some non-working UHS-I speed modes on SM8450
>>> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
>>> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
>>> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
>>> SDHCI SDR104/SDR50 on all boards").
>>>
>>> The tests show that the rootcause of the problem was related to an
>>> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
>>> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
>>>
>>> Due to a missed setting of an appropriate SDCC clock operations in
>>> platform GCC driver the workaround of dropping SD card speeds from UHS-I
>>> to high speed was spread to SM8550 and SM8650 platforms, and since
>>> the fixes in the clock controller drivers are ready [1], it should be
>>> safe to remove the speed mode restrictions from SM8450, SM8550 and
>>> SM8650 platforms.
>>> [..]
>> I see you have tested with dd on the raw block device, but have you tested hotplugging SD cards that have partition tables and filesystems on them?
>>
>> We have this kind of issue on Hamoa where we get I/O errors early, right after the card is inserted and the partition table / filesystem headers are being read:
>>
>> [  714.057106] mmc0: new UHS-I speed SDR104 SDXC card at address 0001
>> [  714.060567] mmcblk0: mmc0:0001 EC2QT 59.6 GiB
>> [  714.503873] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
>> [  714.505660] Buffer I/O error on dev mmcblk0, logical block 0, async page read
>> [  714.513632] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
>> [  714.516469] Buffer I/O error on dev mmcblk0, logical block 0, async page read
>> [  714.516512]  mmcblk0: unable to read partition table
> Before we start debugging, could you please confirm it's using the internal
> (&sdhc_2) MMC controller, and not one connected over PCIe, like it's the
> case on the Surface Laptop?
Of course it is. I'm quite familiar with the DTS on this device, I 
pushed it over the finish line into upstream myself :)
> Are the regulators supplying vmmc and vqmmc in high power mode?

Yes. regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>; and no 
allow-set-load / allowed-modes (..hm, maybe we can actually add those to 
save power since sdhci-msm *does* do regulator_set_load..)

But turns out this is not a consistent problem with every card!.. At 
least *now* one of the two Kingston Canvas Select Plus cards I have 
attaches perfectly every time. (Another one of those though often fails 
to probe with "error -84 reading general info of SD ext reg" and 
sometimes has an early I/O error, but exFAT mounts even after that error 
— but this seems like just a "microSD cards are crap" thing.)

It's the Samsung Evo Plus card that consistently has early I/O errors 
preventing the partition table scan from succeeding (or if that 
succeeds, prevents the exFAT mount). There is a *card compat* issue here 
for sure, as the card is not corrupted, it mounts every time on a 
different laptop with a PCIe card reader [1217:8621] in the same SDR104 
mode. But consistently has these errors on sdhci-msm.

Thanks,
~val


