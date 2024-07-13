Return-Path: <linux-arm-msm+bounces-26079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90F93055E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 13:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F44128155A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 11:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D9D7345F;
	Sat, 13 Jul 2024 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="LOToYWnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E260263;
	Sat, 13 Jul 2024 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720868846; cv=none; b=aB+etZbE5ctBWR8e80Ki+JEWuYglzezbCCxa4pU1n7CvtcJFVCR2xp6sAthm2z5qmFVmaPVg9MYLlK+IzPUBiFpJoqBpYgo4lFYF9aVPUR8m3vMbIwyFH/0Zdf6KC8ZF+7OBtjM0x4AuHTgiETlihT38o0nbwwovCnVUKyUmjIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720868846; c=relaxed/simple;
	bh=3mTFMJlpx5m4tXLwWSbFf0lMMLkxSNmyYiSErMFgFGE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XjmqU8dtfIVxvUZ0r1JlAidlq+Bi2FMdrAFNLmv1OgPPRi58GMsQ8W5kdlNqiyIO4my5MwCrW+AqRr3GLiLBjHnWc8ztSqxGpooPZfh7aSx+U6jrBrp8LZRntP5TVwqy6/8D7dHOuTR3q4AEfsl/53t9ti6u8kPul2onRtVFRSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=LOToYWnQ; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 36A9642824;
	Sat, 13 Jul 2024 16:07:16 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720868838; bh=3mTFMJlpx5m4tXLwWSbFf0lMMLkxSNmyYiSErMFgFGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LOToYWnQyIVBCUGlDSfLM2aVnUqMIcnpPKDC0utLRJq9NSogTSLLc5baWWv+w4B2Y
	 uK1BMCcSD+6KgbFtAy3UC+pWzCwcXDw4YaIZBKxtz5uPaJ2YFAOzsOhhu9WOBE9txv
	 f0RCTX0G4ObwWYw55sKkAdQL34841hsy6875QkkgN9NCMff29IjC+hvRqNzULXt3LI
	 CHdTf1jdV49zX1U3w5ITc8n9j0JVQzvSQAhIQY+Uz12PNQJ0Bbaqf+ILyUtZU7UMjD
	 2qzEpypd02g2AGvLMH5TiGgT7J6ja/aRFC2h+tGNOHg6WkTNuRlM10Hc3eaI9cJy/0
	 vR64LWzVo3ZyA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 13 Jul 2024 16:07:13 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?Q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
In-Reply-To: <28e2dc758c8867693a183d758a9dad6a@trvn.ru>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
 <f377a55c-4a74-4555-926d-afb7dd813e00@kernel.org>
 <28e2dc758c8867693a183d758a9dad6a@trvn.ru>
Message-ID: <932efd4bd08a2877ee1e7c7409ff1512@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nikita Travkin писал(а) 13.07.2024 15:37:
> Krzysztof Kozlowski писал(а) 13.07.2024 15:02:
>> On 12/07/2024 18:04, Nikita Travkin wrote:
>>> From: Adam Słaboń <asaillen@protonmail.com>
>>>
>>> This commit introduces multiple hardware variants of Lenovo Vibe K5.
>>>
>>> - A6020a40 (msm8929-wingtech-wt82918hd)
>>> - A6020a46/A6020l36 (msm8939-wingtech-wt82918)
>>> - A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)
>>>
>>> These devices are added with support for many features, notably:
>>>
>>> - Basic features like USB, mmc/sd storage, wifi, buttons, leds;
>>> - Accelerometer;
>>> - Touchscreen;
>>> - Sound and modem.
>>>
>>> Note that "HD" variant of K5 is based on msm8929 which is a lower bin
>>> of msm8939 SoC. A simple dtsi is added for this soc along with the new
>>> devices.
>>>
>>> Unfortunately, despite the heavy similarities, the combination of minor
>>> differences between variants make them incompatible between each other.
>>>
>>> Signed-off-by: Adam Słaboń <asaillen@protonmail.com>
>>> [Nikita: Minor cleanup, commit message]
>>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>>>  .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
>>>  arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
>>>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
>>>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
>>>  .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
>>>  6 files changed, 311 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index fd4c7c41ddc4..48ec781fa1d8 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -58,10 +58,13 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
>>> new file mode 100644
>>> index 000000000000..f9a358e852f8
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
>>> @@ -0,0 +1,17 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "msm8939-wingtech-wt82918.dtsi"
>>> +#include "msm8929.dtsi"
>>> +
>>> +/ {
>>> +	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
>>> +	compatible = "wingtech,wt82918hd", "qcom,msm8929";
>>> +	chassis-type = "handset";
>>> +};
>>> +
>>> +&touchscreen {
>>> +	touchscreen-size-x = <720>;
>>> +	touchscreen-size-y = <1280>;
>>> +};
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
>>> new file mode 100644
>>> index 000000000000..c3d1d1ace2f6
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
>>> @@ -0,0 +1,5 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +&opp_table {
>>> +	/delete-node/ opp-550000000;
>>> +};
>>
>> That's a very odd SoC DTSI.
>>
>> SoCs DTSIs are not meant to be included as complementary, but rather as
>> full DTSI.
>>
>> IOW, this is very confusing code and will confuse everyone reading it.
>>
> 
> I think Adam wanted to keep the common device dtsi based on msm8939.dtsi to
> simplify things a bit. I was also a bit unsure if I should change how it's
> done but decided to keep it as it was. I will rework the v2 so:
> 
> - msm8929.dtsi includes msm8939.dtsi
> - devices .dts include needed soc.dtsi, then include the common.dtsi
> - common.dtsi doesn't include any soc.dtsi
> 

(...) except gah this makes things quite a bit more complicated since the
device makes use of the "generic design" msm8939-pm8916.dtsi and duplicating
that would be quite silly IMO...

I wonder if we can clarify things without making everything too complicated 
by calling that dtsi "msm8929-opp.dtsi" and keeping it as extension for now,
then if we find that msm8929 has more differences - we can unfold and refactor
everything.

What do you think?

Nikita

> Thanks for the review!
> Nikita
> 
>>
>> Best regards,
>> Krzysztof

