Return-Path: <linux-arm-msm+bounces-37116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA99BE155
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73EE21F22EEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 08:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666EE1D54D1;
	Wed,  6 Nov 2024 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="DYhq2lNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66DD1922EF;
	Wed,  6 Nov 2024 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883224; cv=none; b=Uv+jVm1meBSW5W8D81sMiV3wRbajxVWRJBCtb+XTZR9YnwVfdovra/HZBOf0rF5taBM25uyLByyKy8vrha61x6pTzS+mUl2pZX+kuDMzw/TF/KXmsFTniTjD6CX690KRvKPBGA7DCUM/IC1HpswE2lF2mjFfuVXuoXZZo3ffG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883224; c=relaxed/simple;
	bh=oCMN3cBxlHj1BYfN99NGQKvB16Znqro3+q9AMHvUKYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kiayHb1PTGfoCBGng0Kq1WLI1MwuOD5Q4ewEtCdP3y9GApSLJE31nnIdL8Rhd9am8DBqd3vJq4bhqVerD7yXbKK+QmJ68ysMjUHk1q/oHi0l5RMM5RNN4NfG6kE6RnAPCO8oxFMDVKLmt5R/qohJace4g9Ba/l+preq3Xz1vYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=DYhq2lNn; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730883204; x=1731488004;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=oCMN3cBxlHj1BYfN99NGQKvB16Znqro3+q9AMHvUKYw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DYhq2lNnFSg+jqieWH/CzvfsS15tmT7O7p0kD7yOvjQ3RF/SS+wD37GE+BjFetvb
	 MHi+iKtSxumltVoo36uZOYzC3DCTtFMYP+WjEs3R4sv5R/VourzOUlTeolV82oalR
	 S+VO9zmTaCzDJYp+jjo4arD2qHB5XQ0UWuLpUaK14AtUJkGj1jGjGIct25LYtJhjb
	 qUSwsYDwYey9CbjMOaCiWBWtECfp78N7jCppEp4BqzQw0V9GyH1RV5rGpOpOQcYhJ
	 1fRaHSFfMD/f/XuhHvvg5Fk9YB86ov/yHQcWfV5bIJw1PkAKSRsD6zd6yuNzJVLRF
	 qq1OFgb3eTpceyafAQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKuGD-1tOtDt0nEb-00TQbR; Wed, 06 Nov 2024 09:53:24 +0100
Message-ID: <e13488a3-5f45-44b2-950d-5a29307d4ec4@oldschoolsolutions.biz>
Date: Wed, 6 Nov 2024 09:53:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 xlazom00@gmail.com
References: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
 <20241101-jg-blackrock-for-upstream-v7-3-8295e9f545d9@oldschoolsolutions.biz>
 <945f3eae-0a68-4738-af07-74e228039508@quicinc.com>
 <dd5bad7b-d062-4028-b78a-3888dec4f934@oldschoolsolutions.biz>
 <f8697f7f-f6ac-4b6d-954b-a0777770dc8e@quicinc.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <f8697f7f-f6ac-4b6d-954b-a0777770dc8e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zo4m0JyoMSCFitOflkdfGTjh/dyTQ3ARcYFfpnp/fINWJ0U4iB1
 cIUgnOZcS0RJYWT2bc9auS4vi/e/Ec1rE2MQCjhzgfeADSZBD6jzDNArt5Sws5xXndGEYSj
 KJ5mxKN51+gAuzM/NhlX7zuhiazwPOU7+y2VsR0q7vLAH9RsDVxSRzhsdP8lmTbdRwTgMXp
 8BrXj/uxB+hXTS7gIAY1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kmthrl3YMSI=;upKPsfLSvhA6X6z4Q2GZ+pnipmv
 TLdJmAi2wcz5iu3vQ79gtVEgVBa3cHnPpZ9c+GtGN2cdYa0HFxuYaSV8HVudO/L+ViHrxOsTR
 MaDbfBRmwvcDBinFCE/adelS5i9BDSKpdZOKl8yv+0lGnHfEi4/NdOszCFPmX2YOEH2gQ/UmQ
 Q6KidggjIx5rbLNsWzoX2fSgfealnhtIsqT/e0qs7NKRq0cKQY0lZ3zx+cLhODX3HtCIz1Kwh
 dvjoBk5bxqzDRZtbWlQoNNSEh/2ajwRW6JncwhbD4zTccNYXlP7FQXQl/4tQmWIitXa7cqYrS
 zDR7EDGx5x30TVus7JbYhBlK6tx59Z6Gxd1IlJJvHPTDahqxOdOKhLGaKjtrj9CPd+zwE45TN
 xOhxTNVxgY6t+J+xDULk+KR4v+uVFd8EdFFvtqqcVGjQRbI1s4r3mKbBz0nuo0dzSAvGW4SEj
 q4NYwCg3b4lZON9eWJ8nWmq66d0WsxFlM7OWvllo3tMMvlJWIpfrO2qPSa53X8BX4ybHwkD3t
 8SG6yonV8ElRXjR6896ygz2ZDtblZpJOxa+6015rz7p/pppoDNjNVVHldwvmzZj6zAkG2SBKh
 gNTw8AuLJNZHib4lSqf3haV9VqrOh5/8rWp4STyzxVmNd3k7wHE3SFGsmOienn8ZbzsuUR1xr
 dmbbJvwC6XZY85CfeFYYv9QTEgmLbxBFsDczVSMFmykh0Dc3818GCxWbMKe+ethjBxdId+6pF
 3718EVkvYSthqhsehj0dNCvJ3ZxDzSCMw==


On 06.11.24 05:46, Krishna Kurapati wrote:
>
>
> On 11/6/2024 12:57 AM, Jens Glathe wrote:
>> On 04.11.24 05:31, Krishna Kurapati wrote:
>>>
>>>
>>> On 11/1/2024 11:56 PM, Jens Glathe via B4 Relay wrote:
>>>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>>
>>>> Device tree for the Microsoft Windows Dev Kit 2023. This work
>>>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>>>
>>>> Original work:
>>>> https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6=
.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>>>>
>>>>
>>>> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
>>>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>>>>
>>>> Supported features:
>>>> - USB type-c and type-a ports
>>>> - minidp connector
>>>> - built-in r8152 Ethernet adapter
>>>> - PCIe devices
>>>> - nvme
>>>> - ath11k WiFi (WCN6855)
>>>> - WCN6855 Bluetooth
>>>> - A690 GPU
>>>> - ADSP and CDSP
>>>> - GPIO keys
>>>> - Audio definition (works via USB)
>>>>
>>>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>> ---
>>>
>>> [...]
>>>
>>>> +&usb_2 {
>>>> +=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&usb2_en_state>;
>>>> +=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
>>>> +
>>>
>>> On the blackrock platform, for this controller, are there all 4 ports
>>> given out for use or only one ?
>>>
>>> Because if all 4 are there, you might need to give all 4 pinctrls (one
>>> for each TS3USB221A mux select) here for usb_2 node. If only one port
>>> is given out for use on the platform, then only one phy (of the 4
>>> activated below) needs to be marked as active.
>>>
>>> In my case, in [1] on the ADP platform, I marked them as always on for
>>> all gpios on multiport controller since driver had no support added
>>> yet.
>>>
>>> [1]:
>>> https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@qui=
cinc.com/
>>>
>>>
>> Hi Krishna,
>>
>> thank you for the hints. Unfortunately, I don't have any schematics for
>> the box. But I tested out activation combinations for all the
>
> My point is little different.
> Third controller supports upto 4 physical ports. How many of them have
> been exposed on this WDK2023 ? Depending on that, the phys have to be
> enabled in DT.
>
Okay I took the jump and reduced usb_2_dwc3 to only one qmpphy and one
hsphy. It works, the USB nodes look the same and work. What an odd
design, though, but why not.

&usb_2_dwc3 {
 =C2=A0=C2=A0=C2=A0 phys =3D <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
 =C2=A0=C2=A0=C2=A0 phy-names =3D "usb2-0", "usb3-0";
};

I will do an amended V8 of the patch. Thank you for the hint again.

with best regards

Jens

