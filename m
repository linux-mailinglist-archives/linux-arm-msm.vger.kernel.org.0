Return-Path: <linux-arm-msm+bounces-36541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CD9B783B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 11:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D02128805E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 10:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618701991CF;
	Thu, 31 Oct 2024 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="FvFtVW8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC91991BE;
	Thu, 31 Oct 2024 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368868; cv=none; b=mpeDGDxwe6e4czKyS05yWSHlguwx5+fTObpR9NG+4wdJSM6kPjv4iSmCBQepHMWhacwrx5Wzb+KSTpP6Ju+x2zJdPjmgiMbOTUzMNnqSlYkaZhdJuXtsMmr0RCuVwv/0NGCQMPClk/YfPio7OMcdLaRF40ScXP6Ree/hUFTyJgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368868; c=relaxed/simple;
	bh=cFDTkS/Sa+PzAEz7WhmTzdLNszjGc6G/uOYhgfigvhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5nKP5IOklR8b9kRPXY1doZVO7MrGg495mTBvvT+/OQYCi4zByAdQJ0jKr9E3uhfzh42qPusbBKZJgdGKYJV+ZR1fFdLJoKqAht2zps+Zh/IR137Ph6G8rQONpFJeuk5eV3THk8M6SHM7304MshozOQ5zDdA9zp8rPT7SWN4P3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=FvFtVW8d; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730368843; x=1730973643;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=w6KxghVJUqBJRJO3HvVS8uKSOJoergi/DuFpwoGgi7M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FvFtVW8dGneQNojsB2SOOoe8FADGFj0gBGE3V+YVKj1xo7sxV7G4wx3tinbih3+1
	 WAhvJxIiE02mfw3seH2ni1++OfIR9FJMT6/ZrmYYkJjpNl87q4Wh7lIQJGctrV6Jh
	 35obAz7TBMpjvprIr8mHlNZEeWl1TB6g40o1WJ9YsbT9yK2ioCuQxZ03Yq5e/fAmD
	 y9ode3lkxCUXrSrgQ5q6wEph52qCgpWA98kVD1WJFWjoFXT+GG88/GNFPOiWFrqxy
	 D61LVp8QkzVfezu9rdIbs+XPpoW0fDDxUSd6umLOqp+08Yt+SxRZ5mc+0b/FGjqlm
	 OqpiNLDqORCgthuMkA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MuUWi-1twlgW3ZgY-00xZEv; Thu, 31 Oct 2024 11:00:42 +0100
Message-ID: <5d8ec8c4-f473-4849-a428-f7a7283ff478@oldschoolsolutions.biz>
Date: Thu, 31 Oct 2024 11:00:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows
To: Abel Vesa <abel.vesa@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
 quic_jjohnson@quicinc.com
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
 <86y1251q3b.wl-maz@kernel.org> <ZyNR5MD/HAS5w7N/@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ZyNR5MD/HAS5w7N/@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DE26g/zePNYl7lt3v0o9/f8BjRVz9bk0Vw03sLytJZszJHXgnNP
 9VIPB6kK+G6UxA8R03AIqL6jsTKMRwlMKlMLuA4qUAkrx/WYgnO1Jdm0TW73O/T8wEkF2O7
 grjD7Z6v6KiX9ULuX5iUgZ8vCZN9YBK5FFjBnMokqKcQBNOJerLoQgdUnPDTcYwCdWFmlyN
 LeVt4gmN2clnKIVk1Xqxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MTf5hyfXXWA=;wXxb0MhGplrUnuMDME6kxlFa8qN
 yXjJWsFLiAuV7z/FK10V5sv2pqx7VP14GS78j/y6ONJzaiQgnPrWSAMsVxHGlxYbt8DWFaMmh
 9wzexyxzcYgZqkpKsyuqDyV+AqvU6XWs+9eDVseHE7TIDK0Zpp+pw2cR0b3PFn46av+dA12Pb
 apjVZaR2eZCEL9todm467T/EKb0GOHTMJfyEI5M/aBWsRY8wej7E+immnkNdyD0mfRpVEfXca
 SD0K/xhCtWVK7D11aMzuIvf5zEDbzx5xGGi47oy7t+45kGooUDhSnHdUPPnI7K/rP9r5p1fqH
 mP6x8DKsVt3n9ZnydFNGIoFoQhkV8rNXp1cWAj6Z5lW3JYjO6/K+dx6WaH2aQ5nB7nWBnVWRw
 le0Ului5bxMviIN/RMU61vlzT56DRip+g7etGMPHDOe9Hu1uFbaTHU4L2dr4sEfcX/UP9M5LD
 Q2Y2tNqvyKuPKX3K8/mt51sFJUxTTrVi8nshrRWD6Ks8UjyLHgW5+ayWpnloP/p5M786ulEwn
 7zMoPViydnxwPPTEe0oQb7yEpgWbvfRfrtjZffmZuRRrfR0ypvrKyZtDqmZwTpydXeSVUnDLY
 s+luIOo+SQwQFYfCDhWflskxQ01TsOhM7qN1R7yQVv7VF8gXskNbTm8HAg9wHwq6FfiNfsUQ1
 DOGnB8gNBAdvwriOBzkKXHiOEMw6o7GwJ27pq+wYRhnHdXCP762DFLY4uwmlw99rS57kmLHJ0
 zSL/3KR1KEmyJcelqJaj9Gf4Pb+cXNWUg==

On 31.10.24 10:46, Abel Vesa wrote:
> On 24-10-30 17:02:32, Marc Zyngier wrote:
>> On Fri, 25 Oct 2024 13:32:24 +0100,
>> Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001=
DE
>>> is the speed binned variant of X1E80100 that supports turbo boost up t=
o
>>> 4.3 Ghz. The initial support includes the following:
>>>
>>> -DSPs
>>> -Ethernet (RTL8125BG) over the pcie 5 instance.
>>> -NVme
>>> -Wifi
>>> -USB-C ports
>>>
>>> V3:
>>> * Asked around and looked at the firmware, couldn't find a codename so
>>>    will keep it as DEVKIT. Will update it if someone from the communit=
y
>>>    finds something else.
>> My machine has the following information as part of its DMI tables:
>>
>> Handle 0x0005, DMI type 1, 27 bytes
>> System Information
>> 	Manufacturer: Qualcomm
>> 	Product Name: Snapdragon-Devkit
>> 	Version: 2.1
>> 	Serial Number: 5
>> 	UUID: 63b5fc8b-9c50-89aa-fd0f-3fcef93dc291
>> 	Wake-up Type: Power Switch
>> 	SKU Number: 6
>> 	Family: SCP_HAMOA
>>
>> So I guess that Snapdragon-Devkit is another possible name. But given
>> that it is a bit of a mouthful, devkit, Devkit, or any other variation
>> on the case would work for me.
> The point was to have something unique A codename would be unique.
> Naming it Snapdragon-Devkit (or just devkit) will be confusing since
> there was already a 2023 devkit (from Microsoft) with the Snapdragon
> 8cx Gen 3, and probably the next compute platform will also have a devki=
t
> as well. So probably "X Elite devkit" could be the right option..
As for The Windows Dev Kit 2023, dmidecode says this:

Handle 0x0009, DMI type 1, 27 bytes
System Information
 =C2=A0=C2=A0 =C2=A0Manufacturer: Microsoft Corporation
 =C2=A0=C2=A0 =C2=A0Product Name: Windows Dev Kit 2023
 =C2=A0=C2=A0 =C2=A0Version: 124I:00097T:000M:0200000B:07
 =C2=A0=C2=A0 =C2=A0Serial Number: 0F01C4F22373F6
 =C2=A0=C2=A0 =C2=A0UUID: e4a4662c-8367-75d0-a54f-1d04bd404860
 =C2=A0=C2=A0 =C2=A0Wake-up Type: Unknown
 =C2=A0=C2=A0 =C2=A0SKU Number: 2043
 =C2=A0=C2=A0 =C2=A0Family: Surface

That's also really a mouthful. In my patchset for it there were some
name / path changes, microsoft/blackrock it is now. Would be cool to
have short and unique names. In the end, whatever works and is unique.
Like those UUIDs?

>>> * Update type c roles as reported by ucsi. [Dmitry]
>>> * Update THUNDERCOMM to Thundercomm. [Dmitry]
>>> * Update regulator names and sort Order. [Dmitry]
>>> * Add x1e001DE devkit to the safe list.
>>> * Mark regulator-nmve as boot enabled.
>>>
>>>
>>> V2:
>>> * Fix Ghz -> GHz  [Jeff]
>>> * Pick up Ab tag from Rob.
>>> * Use Vendor in ADSP/CDSP firmware path [Dmitry]
>>> * Fix reserved gpios [Dmitry]
>>> * Only port0 supports DRD update the dt accordingly [Dmitry]
>>>
>>> Sibi Sankar (3):
>>>    dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>>>    firmware: qcom: uefisecapp: Allow X1E Devkit devices
>>>    arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
>>>
>>>   .../devicetree/bindings/arm/qcom.yaml         |   6 +
>>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 814 ++++++++++++++++=
++
>>>   drivers/firmware/qcom/qcom_scm.c              |   1 +
>>>   4 files changed, 822 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> FWIW, I'm running this as part of my KVM test rig with minor changes
>> to expose the SMMU and allow the ITS on pcie5, and things work as well
>> as you can expect. FWIW:
>>
>> Acked-by: Marc Zyngier <maz@kernel.org>
>> Tested-by: Marc Zyngier <maz@kernel.org>
>>
>> 	M.
>>
>> --
>> Without deviation from the norm, progress is not possible.

