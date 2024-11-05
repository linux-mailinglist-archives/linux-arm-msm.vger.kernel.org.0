Return-Path: <linux-arm-msm+bounces-37085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7C9BD622
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 20:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3BC1F2339A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 19:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D9A213153;
	Tue,  5 Nov 2024 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="SZ9iZapw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC321314B;
	Tue,  5 Nov 2024 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730836401; cv=none; b=UL6t7As4nwKEOkj5RxFiH2eq019iCSO8+mSyMJ+Kb1MMn1XdSMqAbN6JZU2YFRI0qkyytYuXOLIxjGup1FII7EY3Lc+0hrg1sYza95mNiMFlE+zBvn1fe9mtKKqiYIkGvuRAN2fopjeSaGPhiLE3X2rZp5ARCu/PMORqoYRzYoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730836401; c=relaxed/simple;
	bh=A8sY0W3/xH15Ghe7igmFjisVKhZ0uB8+fwINpSSIbL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yhi430Pf6U39oUZwLODA14HKos2NWHL4KUKb/43mCUGq6YbberCxYhlY9Qbhn6MQdOZkwl/u2G5FSKXov/dJixJTqNN2fsfozCjFq5qR3WweGGic1DruQnPUmMMwOdDUCiJU54PgWhkYZJQ5iiWgu4rYwAToQahIZ78EttokJSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=SZ9iZapw; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730836391; x=1731441191;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=A8sY0W3/xH15Ghe7igmFjisVKhZ0uB8+fwINpSSIbL8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SZ9iZapwhiqR7ZdytEKm+h21pFY1iWpRTsq70+wUk4/f9oxeXZNr5SBKz47eVaHB
	 lZWoVOFXfLgJIIb9J9LWRqeM6UNGEdYyF6nTp70pGuhdC7IMSPCtmaniVFYup18i0
	 tcAhxMv+dc8nslereXronTEyir1WxlatJMeo0CuckbgIyul9dwaAa4idAK924nwws
	 5eWskr81BaNtadRsH4lbzopUMBBA1V8MH7ovjTDWORSdbfutcRe18upmVByKb+8y0
	 0eMgpanlF70CGwYcm02ze7VxMjg805omUocH0VzpWdIXIvHOoenrJvE9fVh4vGXzG
	 u5X1Gw1FLC/2OY+HRQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MEmIl-1t1UOJ2CPD-007mpn; Tue, 05 Nov 2024 20:27:20 +0100
Message-ID: <dd5bad7b-d062-4028-b78a-3888dec4f934@oldschoolsolutions.biz>
Date: Tue, 5 Nov 2024 20:27:19 +0100
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
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <945f3eae-0a68-4738-af07-74e228039508@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oHZwOWfWPJYJHONEoS+B+Po6BnPWWhoS5QkGiZ+0Ogh1S+XW33e
 Y6dYvD/PBeALXhPRKkol3oWmlsWpnEg6jfe+4zo4KsepjXKVUjTLbaBycKev2NEnKPPVKUf
 HkwmStYlkXn9uwI8xCzrAHIECmXJLMyu4UgMBYutAQSClf/7TZNO0hXs3DRaaiUi/+3+tJp
 8WGB5RlBWczAGrB3GXOJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OmPmKdgqu3k=;4DGAUmM2cgZck8LnScFr2wIoCrT
 HAEnrfMaD5gShbtlkRY9d29YcHV6Q7pEdYf87ywyMG1/Kz90fMhhMzHNjYBR6T21C7BkENsCj
 d1Hdok7HIAoYf9ZGNff7SlW82caw9cMPngQh6CtYIbYiOcsn210+JP1GWSpIlznnPFNypYYkt
 qpMwmhS/XhaQ3Di4NrKBLPV76LW8AwfXVFzf0qLMHKTAVWx/UwZ8gasceDPIZxGIonHn+aNHK
 9vpV7JedKMcwRiGtu3GKkF+9hRPyz4mzdF283JVSdARA7TPhgEcIsApQO5t8575b8TIZlWdUc
 7XaW53WQamWBXJnX34ml7KzMpPnYkJgRdAh8XaoYwf+JRkAL4YZMK9cxFuYDrbR53UVWs1Cry
 V3oh0O59uCHSxow2GP25rcxbnJNY/T5HMYMATCSbY5QLsauN9/o9DrqxjFnAWEzFvM1f+JfYP
 azyBHmH5t1xRSQtsTw4mwbWNUB18vH146FFOolfDhtq9EHl35mxQv5+b1fSkZi+ddUckEZqgu
 XYKl8T8JKoe6LI1yE4SUZApmY9PXt2X7qJjLmRENJVBYAQ6r378OgP1BBIQ/DJkzKFN9fok/K
 5qL/datSyZEERTTwpHhEuu/x4AjAY4nnwyh1ZnTKs78iS9wPmTNttoQU66J/5iTUJ9iOe4xry
 IgvP25T5dFmrdGg4mPGSq5iaC5M3EiAi+kG5p9hTmysFiQD7evPET75ikPVSPaHIrYXAXYVsY
 UpissMEOF/Lyqxr+0fFPxbXHi22NxhVTQ==

On 04.11.24 05:31, Krishna Kurapati wrote:
>
>
> On 11/1/2024 11:56 PM, Jens Glathe via B4 Relay wrote:
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
>
> On the blackrock platform, for this controller, are there all 4 ports
> given out for use or only one ?
>
> Because if all 4 are there, you might need to give all 4 pinctrls (one
> for each TS3USB221A mux select) here for usb_2 node. If only one port
> is given out for use on the platform, then only one phy (of the 4
> activated below) needs to be marked as active.
>
> In my case, in [1] on the ADP platform, I marked them as always on for
> all gpios on multiport controller since driver had no support added yet.
>
> [1]:
> https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@quici=
nc.com/
>
Hi Krishna,

thank you for the hints. Unfortunately, I don't have any schematics for
the box. But I tested out activation combinations for all the
usb_2_hsphy and usb_2_qmpphy listed. All of these are also listed in the
usb_2 node in sc8280xp.dtsi. And they all need to be activated to get
the whole usb_2 node up. Leaving out one lets the whole node vanish.
Maybe it is possible to define fewer phys in the usb_2_dwc3 node, I
don't know. The definition as it is now appears to be a safe bet.
What I noticed in the tests was that the pinctrl usb2_en_state had no
effect here. Although, it apparently was required when it was introduced
[1] by Merck Hung and xlazom00@gmail.com. Therefore I am hesitant to
remove it. Also, there may be a hint that it is the enable pin of a hub:

$lsusb -tv
[...]
/:=C2=A0 Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/4p=
, 480M
 =C2=A0=C2=A0=C2=A0 ID 1d6b:0002 Linux Foundation 2.0 root hub
 =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub=
/4p, 480M
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID 045e:0c5f Microsoft Corp.
/:=C2=A0 Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/2p=
, 10000M
 =C2=A0=C2=A0=C2=A0 ID 1d6b:0003 Linux Foundation 3.0 root hub
 =C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub=
/4p, 10000M
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID 045e:0c60 Microsoft Corp.
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |__ Port 001: Dev 003, If 0, C=
lass=3DVendor Specific Class,
Driver=3Dr8152, 5000M
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID 045=
e:0c5e Microsoft Corp.

For the IDs 045e:0c5e..045e:c60 there isnot much info, only that its
usually a 10/100/1000 r8152 ethernet adapter, and a USB3.2 /USB2.1 4
port hub. How this is wired, though, no idea. In the face of this I
would suggest to keep the definition as it is now.

[1]:
https://github.com/linux-surface/surface-pro-x/issues/43#issuecomment-1536=
848253

>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_hsphy0 {
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l1b>;
>> +=C2=A0=C2=A0=C2=A0 vdda18-supply =3D <&vreg_l1c>;
>> +=C2=A0=C2=A0=C2=A0 vdda33-supply =3D <&vreg_l7d>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_hsphy1 {
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l8d>;
>> +=C2=A0=C2=A0=C2=A0 vdda18-supply =3D <&vreg_l1c>;
>> +=C2=A0=C2=A0=C2=A0 vdda33-supply =3D <&vreg_l7d>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_hsphy2 {
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l10d>;
>> +=C2=A0=C2=A0=C2=A0 vdda18-supply =3D <&vreg_l8c>;
>> +=C2=A0=C2=A0=C2=A0 vdda33-supply =3D <&vreg_l2d>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_hsphy3 {
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l10d>;
>> +=C2=A0=C2=A0=C2=A0 vdda18-supply =3D <&vreg_l8c>;
>> +=C2=A0=C2=A0=C2=A0 vdda33-supply =3D <&vreg_l2d>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_qmpphy0 {
>> +=C2=A0=C2=A0=C2=A0 vdda-phy-supply =3D <&vreg_l1b>;
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l4d>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_2_qmpphy1 {
>> +=C2=A0=C2=A0=C2=A0 vdda-phy-supply =3D <&vreg_l8d>;
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l4d>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>
> [...]
>
>> +=C2=A0=C2=A0=C2=A0 usb2_en_state: usb2-en-state {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* TS3USB221A USB2.0 mux se=
lect */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pins =3D "gpio24";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 function =3D "gpio";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drive-strength =3D <2>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bias-disable;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output-low;
>> +=C2=A0=C2=A0=C2=A0 };
>> +
>
> Regards,
> Krishna,

