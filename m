Return-Path: <linux-arm-msm+bounces-36559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4E9B7BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 14:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203E41C21189
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 13:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DFB19D06A;
	Thu, 31 Oct 2024 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="gtlgxNme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A7195FF1;
	Thu, 31 Oct 2024 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381714; cv=none; b=sNtC1r5UX59b4r8x4c/s3unAIuzfMXBMCFQdb802167y5ghtb06KvuVi0y3ApOUJKbOX25wSs9CEcMmBEP3YAgM98jAy55TrYXo8FxNhBQsZg/5VNvYXURZ05aBZddyoJhAE05DziJeYF2QnkKpNSlVna4Zbl5KGPMPiNXoPEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381714; c=relaxed/simple;
	bh=4dbg22oJxgFIQr7IhM3WJb51OgVei87HnggpeB+27G4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJ6AxJMXusn/Kw6xKecTFvZ2gmqy7U324+BhnvGwMP+H2XkobwtdnECXPDO74xN19ZDO0l12l18fi4AUOL6kVfMxS6AC2VBNkkcOkaX2mX/sa1AVGJfoyoAfPdb1/JTAo219ZB3nZCFWiYcthvo5/WZuY7C2DU4MdcSDwnS1mK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=gtlgxNme; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730381688; x=1730986488;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=HnVIWYyh5SSTBuS05jlgSgBJMtjuDXUCz1fJ1wGiIIs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gtlgxNmeQiebV8mvjTD3OMgKGTEAt7mbAqT81+mzkdo1UWpZthAhNlcYqN7Wj93r
	 laka7XIqzrBIA/bVMcp+TlzOtSaWpP9RVgvIilnFB6Kgi/7GUezofEPnv35yHfQKy
	 yfEVFt64CLPSjB5YorGRiRPfEi48kA0k/r0J5Y5Jm6i4FbtkkDXFWD7OVAUKrgLaA
	 KzRWg4iCcUJIqKQgjael62+KzqJBf4AOHi6VVqG2OznePgGLDZPMMQ/M8++iV5Uln
	 ozl/OzqQxxX+NHlgKlgJQejUkKhx9b+SUEbFcgfAvY55Sdzul0UpTwXBkkzIAoOJT
	 DdmQ/4l3KbmQ6SNyXg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MILnm-1t3Fee2Afk-00A5KL; Thu, 31 Oct 2024 14:34:48 +0100
Message-ID: <01394872-50c6-4fe2-85c5-3d788a463434@oldschoolsolutions.biz>
Date: Thu, 31 Oct 2024 14:34:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows
To: Marc Zyngier <maz@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
 quic_jjohnson@quicinc.com
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
 <86y1251q3b.wl-maz@kernel.org> <ZyNR5MD/HAS5w7N/@linaro.org>
 <5d8ec8c4-f473-4849-a428-f7a7283ff478@oldschoolsolutions.biz>
 <86v7x81mmj.wl-maz@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <86v7x81mmj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pdti6fVNCb7qkzx6ySOznTh/4Czndr91ed0UhCW93w5Ejkl/9FU
 SpG1L/7uZfhXgpxxq8DoJC4xJsEji/DFgyg3kTsHvhCjO8hUuYEfMgOQDYWgpbjyji2NI+J
 hQtcDb3bbBLYo4YOjB89FKCqEUiL4JAWh+9NxmTrey5h9SVooKjF/adCMNuj73L2xHxI1Tu
 gEoDlYSJa8SX+SQYecG9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x3lYC06g+ZA=;4EptWSExEEx4nVqo5VPUlmN4tos
 5TOIoE6xl4ymXuXftA3SX3By8iskhnV2plPJlbXDY0Ve+YtPUpoob+MUTvgxMFMXQAxCV2awx
 YFlhkcM7BxIXw/Tu0uJnHCX2aJlDW/WcA3huysRzgPDM7G8NDEmSn1KyiGnqPz4jAg/1tN6L3
 kdDJly/9+GeDwx7zYfGJuhueQ2medi+/TSlcmh7QCIiaSsENIGY+VK2+R7pI0Eatds29E4uki
 nlOccYX8558JFmoRMxlBqWtAm0YmxitKwamxZ/4r8VkqWAYHEV4R/mfRq5RqfoHNHxONglRdn
 AIvoofMs2F/zEw45Z44Vojcj1ks1zKUuIvB4SnodHbefdUvNpTbsuXh8GvGl2TaxjoqcdmwsM
 tfkjVnceJo7ekGW7JXeFyHaR2kT7BdVs2oLRGS0YzK8ujQjI90VEKHpuaOTSarAyWElPK7DRW
 T+dyLY7kK1KmJhesBL3FScBDIQFQ5ag7wwsEEWC7Te0bnT8cElGriGWhNgL+4+Z4fFo1dIGQ4
 w85/sJHsVsf755sRVALBBUTH2DoQGGfATNbohr2uz89QI/xrYfLO24vXn5iK9LnH3VaK5aM9U
 9++Z0m/X1Hc90chNUY+B9W3t7dJ5+x2mX+zyceZAPkU7wcsHXTQ6UgD/X31KXQDiOFdvQDPwm
 I0rFeHFtwBbNdgo+1+ZH1h05f+6mYGlRapxuI8XGM2WyLtmCGYDq3jMLy7/oQZrN/mLMAjYEh
 xN9lqu8mKB5tm/9e/ppL5w0ZC9hKlHpBw==

On 31.10.24 13:29, Marc Zyngier wrote:
> On Thu, 31 Oct 2024 10:00:40 +0000,
> Jens Glathe <jens.glathe@oldschoolsolutions.biz> wrote:
>> On 31.10.24 10:46, Abel Vesa wrote:
>>> On 24-10-30 17:02:32, Marc Zyngier wrote:
>>>> On Fri, 25 Oct 2024 13:32:24 +0100,
>>>> Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>>>> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E0=
01DE
>>>>> is the speed binned variant of X1E80100 that supports turbo boost up=
 to
>>>>> 4.3 Ghz. The initial support includes the following:
>>>>>
>>>>> -DSPs
>>>>> -Ethernet (RTL8125BG) over the pcie 5 instance.
>>>>> -NVme
>>>>> -Wifi
>>>>> -USB-C ports
>>>>>
>>>>> V3:
>>>>> * Asked around and looked at the firmware, couldn't find a codename =
so
>>>>>     will keep it as DEVKIT. Will update it if someone from the commu=
nity
>>>>>     finds something else.
>>>> My machine has the following information as part of its DMI tables:
>>>>
>>>> Handle 0x0005, DMI type 1, 27 bytes
>>>> System Information
>>>> 	Manufacturer: Qualcomm
>>>> 	Product Name: Snapdragon-Devkit
>>>> 	Version: 2.1
>>>> 	Serial Number: 5
>>>> 	UUID: 63b5fc8b-9c50-89aa-fd0f-3fcef93dc291
>>>> 	Wake-up Type: Power Switch
>>>> 	SKU Number: 6
>>>> 	Family: SCP_HAMOA
>>>>
>>>> So I guess that Snapdragon-Devkit is another possible name. But given
>>>> that it is a bit of a mouthful, devkit, Devkit, or any other variatio=
n
>>>> on the case would work for me.
>>> The point was to have something unique A codename would be unique.
>>> Naming it Snapdragon-Devkit (or just devkit) will be confusing since
>>> there was already a 2023 devkit (from Microsoft) with the Snapdragon
>>> 8cx Gen 3, and probably the next compute platform will also have a dev=
kit
>>> as well. So probably "X Elite devkit" could be the right option..
> Odd, I didn't get that email.
>
> My point was the the HW already comes with a full description as part
> of the existing tables. If you really want something that is truly
> unique to that platform and that can be used by a tool (be it
> firmware, kernel or userspace) to understand what it is running on,
> then you cannot have *less* information.
>
> At the very least, you would need Manufacturer, Product Name, Version
> and Family.
>
> But does it really matter? I don't think it is *that* crucial. At the
> end of the day, this is only used to pick the correct DT out of a set
> for a given SoC, or worse case a family of SoCs that are closely
> related.
>
>> As for The Windows Dev Kit 2023, dmidecode says this:
>>
>> Handle 0x0009, DMI type 1, 27 bytes
>> System Information
>>  =C2=A0=C2=A0 =C2=A0Manufacturer: Microsoft Corporation
>>  =C2=A0=C2=A0 =C2=A0Product Name: Windows Dev Kit 2023
>>  =C2=A0=C2=A0 =C2=A0Version: 124I:00097T:000M:0200000B:07
>>  =C2=A0=C2=A0 =C2=A0Serial Number: 0F01C4F22373F6
>>  =C2=A0=C2=A0 =C2=A0UUID: e4a4662c-8367-75d0-a54f-1d04bd404860
>>  =C2=A0=C2=A0 =C2=A0Wake-up Type: Unknown
>>  =C2=A0=C2=A0 =C2=A0SKU Number: 2043
>>  =C2=A0=C2=A0 =C2=A0Family: Surface
>>
>> That's also really a mouthful. In my patchset for it there were some
>> name / path changes, microsoft/blackrock it is now. Would be cool to
>> have short and unique names. In the end, whatever works and is unique.
>> Like those UUIDs?
> Are those actually per platform? or per unit? On my box, the serial
> number is probably a dud. What does the UUID reports on your X1E box?
>
> Thanks,
>
> 	M.
>
Looks like the UUIDs are System UUIDs (unique). They are not the same as
/etc/machine-id either.

X1E DevKit:

Handle 0x0005, DMI type 1, 27 bytes
System Information
 =C2=A0=C2=A0=C2=A0 Manufacturer: Qualcomm
 =C2=A0=C2=A0=C2=A0 Product Name: Snapdragon-Devkit
 =C2=A0=C2=A0=C2=A0 Version: 2.1
 =C2=A0=C2=A0=C2=A0 Serial Number: 5
 =C2=A0=C2=A0=C2=A0 UUID: eadc72c0-a0bd-cced-025c-c3a1494d433c
 =C2=A0=C2=A0=C2=A0 Wake-up Type: Power Switch
 =C2=A0=C2=A0=C2=A0 SKU Number: 6
 =C2=A0=C2=A0=C2=A0 Family: SCP_HAMOA


Second Windows Dev Kit 2023:

Handle 0x0009, DMI type 1, 27 bytes
System Information
 =C2=A0=C2=A0=C2=A0 Manufacturer: Microsoft Corporation
 =C2=A0=C2=A0=C2=A0 Product Name: Windows Dev Kit 2023
 =C2=A0=C2=A0=C2=A0 Version: 124I:00097T:000M:0200000B:07
 =C2=A0=C2=A0=C2=A0 Serial Number: 0F004PD22363F6
 =C2=A0=C2=A0=C2=A0 UUID: 35b94307-ddb5-e0c5-1c9a-ffc43fdf60ba
 =C2=A0=C2=A0=C2=A0 Wake-up Type: Unknown
 =C2=A0=C2=A0=C2=A0 SKU Number: 2043
 =C2=A0=C2=A0=C2=A0 Family: Surface

Looks like maybe using the manufacturer for directory and product name
for subdirectory could do. But that long name everywhere?

with best regards

Jens


