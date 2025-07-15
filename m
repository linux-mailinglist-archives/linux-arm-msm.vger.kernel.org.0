Return-Path: <linux-arm-msm+bounces-65090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5AB06705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CBEF4E6893
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB5A279910;
	Tue, 15 Jul 2025 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="stWIe/UT";
	dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="YgRWi9Mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.adomerle.pw (mail.adomerle.pw [185.125.100.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7E19CCF5;
	Tue, 15 Jul 2025 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.100.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752608275; cv=none; b=Y/m+gW3Sb0qL62lNCYBwBU5PXss1jqFC9qoTBZ2rJPlGQDwX7zjO4nDzvjjYuI2WOI9SH6dfOkpCZXJuMEwfyE3YEjZ1g35OT0ZlC1cloCjdks1ld5p87d3jb7t1fZRVCc7hrHt7gB1DR0Awn105F+Gkp7zkiLNCg9angFnw9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752608275; c=relaxed/simple;
	bh=2E5K0Uumqiga4LpRxHq8vS+GbVv2yKHJ93bnP1ib5aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdnTK1oa7RZ2yn1g2EW9DZOGmqQ0jpbtK0uKGK7r0pUm9s2MYLRIMtdsnKwOPuggm9wguTIpLFjaNzh62eUw8wHVLr1i/HDZXoGwAAJ/fwvYknxzt8JwqxbD/e16hgnzmPSJoqjLFaP1nGbYcplrzbSjSI59q3xMFOZLU0bktwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw; spf=pass smtp.mailfrom=adomerle.pw; dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=stWIe/UT; dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=YgRWi9Mr; arc=none smtp.client-ip=185.125.100.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.pw
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1752608259; bh=nKkiuhTdwFVu7pDYCp/hO2p
	vX3R4CyflLRRoDtiQreA=; b=stWIe/UTlZaXABkqj/jLoQxJhZ+IxszPi/JklJyrFM2K5oyZTm
	On4OXzbI3NXZs6jyiXk0d8XvLjJsHuCM9uRk/0oiFqte701Y9WLUVL/WoMP3EO1ZmjxSXuZRqMx
	Y4FF4p8RPHmw3YYT7aAU8D6Qy2PvUEBd2BNcxo9PXoM2dpz5bsKkmA8jW//ti+4bAJ1Zhiaw+mm
	0rIaMywnhB87EDi+9ryEd+mCBwi7DP/n553TgqnpPwRFBRivaxX2BcpVo38+So5QUI5wy5ACUIv
	BOYAl3YmR/7czocrOcUwg/cMGr/paLtz2G82XK7P6BiIbgkZ8gWOw6xispeQm4w+vuw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1752608259; bh=nKkiuhTdwFVu7pDYCp/hO2p
	vX3R4CyflLRRoDtiQreA=; b=YgRWi9Mrt398qGPtCReD0jj9pvP9jR35dgFJCmbDmBvCiVi2J3
	3WUlvzm9LikuSr3o+scJpGm0WEFbBtFvzbAA==;
Message-ID: <493da354-2c86-452b-b343-c9ecd3ff84e3@adomerle.pw>
Date: Tue, 15 Jul 2025 23:37:37 +0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent
 hardware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250715185636.21758-1-me@adomerle.pw>
 <uvw7usijkllom6cox4fkhrxpckqf7gk65b4hn244hpmj62utyt@zlbxwwmj5t6u>
Content-Language: en-US
From: Arseniy Velikanov <me@adomerle.pw>
In-Reply-To: <uvw7usijkllom6cox4fkhrxpckqf7gk65b4hn244hpmj62utyt@zlbxwwmj5t6u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 15.07.2025 23:22, Dmitry Baryshkov wrote:
> On Tue, Jul 15, 2025 at 10:56:36PM +0400, Arseniy Velikanov wrote:
>> PM8009 was erroneously added since this device doesn't actually have it.
>> It triggers a big critical error at boot, so we're drop it.
> Might it be that there are different SKUs?
Well, while it's in dts, but it was disabled in the kernel config:
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/pipa-t-oss/arch/arm64/configs/vendor/pipa_user_defconfig#L413

Maybe they just forgot to remove it from dts (I still don't understand 
why it is displayed in i2cdetect though).
>
>> Also it looks like the fuel gauge is not connected to the battery,
>> it reports nonsense info. Downstream kernel uses pmic fg.
> Separate commit, please.
>
>> PMIC fuel-gauge driver uses mixed stats about dual-cell battery,
>> so I combined it into one.
>>
>> Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
>>
>> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Please remove empty line between tags (i.e. between Fixes and SoB).
>
>> ---
>>   .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 95 +------------------
>>   1 file changed, 5 insertions(+), 90 deletions(-)
>>
>
---
Kind regards,
Arseniy.


