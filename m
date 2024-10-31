Return-Path: <linux-arm-msm+bounces-36601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B250F9B834E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7192D283029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 19:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BFB1CB32B;
	Thu, 31 Oct 2024 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="t0aZx8n5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969191CB316;
	Thu, 31 Oct 2024 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730402665; cv=none; b=aUdaK8PaisiFW1JGUj2DZN3uTogcQrXgD4322xhcg82ht1wZH4YVe2q/E2ET6in6xp8OXpnlnrsTE1rRkuc1Ig3xXYVLWJLSmR8I9mWAcsN2g1sijlV6Hil/sWGhU6r0RfuGIlX3/wKxugyn7AkO4G3YcZaFMDJBCCw2SgdFSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730402665; c=relaxed/simple;
	bh=Z0OXm8zr7PBtjSI2zcACzeGQatvaS4IUl5PQ4yPa3GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LApMkX6AbsVugOsT0BZcz9ZTg7jplrwlbJtZxStsjAaU//FCiGz7DLZO8KWyNLVbrVJmOn0Un5fOQ0T++btlozQ8SgClHblJ1VIESSpga22XM5wQH/agQaw8oV9ZihZnzXVnEXegEkygVVOblAs1z7V48g4IkResf4ENvNW8Cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=t0aZx8n5; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730402652; x=1731007452;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Z0OXm8zr7PBtjSI2zcACzeGQatvaS4IUl5PQ4yPa3GM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t0aZx8n5LhpSehLErr/x+289ycoOMQUqIIQJjeFkpsOp2U33m46TAsmBJsygsYx+
	 XuVkwGTjOmcSnVbIkT8EsMGWSau/ZeKVmZ7YCT+unBKpDn/HeDVvKMBMB/glU3Cwy
	 bBviNQp1y18nXXfx/HDMaXqNg/XItYaA67ETJcTXvE2mlsCAPgRoIjtV5cgomTN/4
	 6CWJhzEx4qCmrabJcCkusxx9r9p1NPKkUe3Y8VXs27pt8CC22RuoZTYB//GmPBagA
	 AfEHYrV+VtVegHXgJBvVURO7iVNiJbLMGOf/tFI2t72crvn4TV2gI0bxo051qc4Mf
	 kk8V3g0H/WllUHCWZg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7yz7-1trybX0CJf-010XIE; Thu, 31 Oct 2024 20:24:12 +0100
Message-ID: <6b5591ea-b575-4118-85f3-11c64dd9f449@oldschoolsolutions.biz>
Date: Thu, 31 Oct 2024 20:24:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v6-3-7cd7f7d8d97c@oldschoolsolutions.biz>
 <5a9e97ad-0f84-4e0c-85e6-5ed0a4d20568@quicinc.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <5a9e97ad-0f84-4e0c-85e6-5ed0a4d20568@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wP0AGbYNFvFC/WG14B0BL2KWGrDNWfSq/jWOqKMef4NbZe+tk9k
 k5Ni2JDOPbXlBoqK9AXhWqeAOmB+KOVTuJ/NbIVsHIChwSc8t303xK2UnrY+aTDoMTeFDh4
 cZnIt5oH5iOkowY1unZNn782l9U/SnhTIspERknuUD/BvkKNhbov0In2Xb6zRtjDxUKxNDa
 PYjpJ30mLHr7/u7BIvMEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pIPv8XQmrdU=;Cx+fvPQdY5tEOX5F261EyO4XFIp
 3apqfI7s1BlA975DfjZcsSYuHj8CQzdts6yAl0bJDrUfVe9vPquoj8MYRS5k0R14XNX9h1Wu7
 nshHHuwGc+HDov30hPqZsnTc+pe4DN0w8MlnxoBhOvP3AU0ns3BRF/O9gNHofmTn9WayPTMIm
 PPhSqk44mOKTvzc67liV2OGhekZJDrCaxtG3B+IiG1P97yhEhxtorI9FRq96gNmW36802g7nd
 hAaMv/0LQCthcpz7SLhyd0v01p0ijMY6Fbc4yUi7Ye5I0Umsghu17/h3LQZsTNE5RNTOcb8RU
 nHSxJG469Ec5oBRz0MJyFs3QiUpvCngKRpLTGPVQn/AinECOzs4oG340+jw+c5GegzzXfginL
 nEDqJ0KkbBQdV+qfGdpfJJrHZV5hytopkOfLIw4rzg9Z+yhVEloJ5Cztlv01kDER4ObO62v/q
 BHVvzWgwR3+FADigGkAaQF8+wDoJvBCaPJ4ytkpITg/3oreigrSWbW7H0cMG/jK54lwDbe6wJ
 npTcsMnY+9+AN2RqHwAU5feFs3EhsNfT8+NL7czINIDWEoF5vKRw8OYuVbh+rmpA4q9eNjt3N
 CaJJS3lPewnY39FAyrMPjkgu9yczyb3hetvqzculY591eFLfepaY/kcMYGtXKpfcgm45zGOkv
 81ypx8PPccQdyf2TYnXceLifwr1JyU4TnVisF03LwfT+uwT3XtDBjdVP1CRlxicTc6EWVmh8V
 bsRoWSUYFta6CaPxB3sMYkFzG4/MJHiLQ==

On 31.10.24 19:54, Krishna Kurapati wrote:
> On 10/30/2024 4:32 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Device tree for the Microsoft Windows Dev Kit 2023. This work
>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>
>> Original work:
>> https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3=
.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>>
>> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>>
>> Supported features:
>> - USB type-c and type-a ports
>> - minidp connector
>> - built-in r8152 Ethernet adapter
>> - PCIe devices
>> - nvme
>> - ath11k WiFi (WCN6855)
>> - WCN6855 Bluetooth
>> - A690 GPU
>> - ADSP and CDSP
>> - GPIO keys
>> - Audio definition (works via USB)
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>
> [...]
>
>> +&usb_2 {
>> +=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&usb2_en_state>;
>> +=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +=C2=A0=C2=A0=C2=A0 dr_mode =3D "host";
>> +=C2=A0=C2=A0=C2=A0 phy-names =3D "usb2-port0", "usb3-port0";
>> +=C2=A0=C2=A0=C2=A0 phys =3D <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>
> From what I remember, the phy names for multiport must be "usb2-X"=C2=A0=
 or
> "usb3-X". The above notation might compile but If I am not wrong, the
> phys won't be active. How was USB tested in this case ?
>
All 4 type-a ports are working at full capacity, I assume the phys are
up. On one of these is the internal r8152 adapter. Actually when I
started with the WDK the type-a ports were the most reliable ones. The
box is my daily driver, so its extensively tested for ~18 months now.

> Moreover just marking status as "okay" for usb_2 must work like done
> in [1] and [2] and there is no need for explicitly marking dr_mode as
> host again and refactoring the phy-names.
>
> [1]:
> https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@quici=
nc.com/
> [2]:
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240501065641.=
965-1-johan+linaro@kernel.org/
>
> Please fix this up.

will do, thank you for the hint.

with best regards

Jens

> Regards,
> Krishna,

