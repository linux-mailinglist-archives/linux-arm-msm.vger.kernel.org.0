Return-Path: <linux-arm-msm+bounces-41980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EB9F0A5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D8D281C29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3E61C3C1C;
	Fri, 13 Dec 2024 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4PpMeEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F211C3C0C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087861; cv=none; b=IRZiBlkVVOa0OAyEIISuiKJRAu0AHwzsJ1nZi505x5qjoA3bPIgnrx2eDLASiyo71oHGm/P6IPt2Fq9iJVM6Ml4xiNQIj78tTHvKvyGCApTPAwd0v405P1eJDiojacknxOHNcEr5zYFs5yStlFO35zYESKT+PU4fSv/9ysVSoWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087861; c=relaxed/simple;
	bh=8feasqDMNRGSqXgnrXNVRMsBVCYovHpwXdrFnhXAPTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDudwHu9f2FpnOQO6E86rzvn4H7isYPmYgw5u+RB3/dilmejWaf+V4kTC+HlwIt6azug3NiQ3AOy6qUnF4r0wUba9Z/FStDnxPCgpxSLlQG2FJiaoP1QQ9ECMW7KXJM9WGwHIFyVigS6P8q/x/T9MPdkIuHVX/j/XnXOuudWCd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4PpMeEk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA7Ojo030152
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zf5tcpszL0I6CSUFS4CayyJ0mUkMjSZvXwP8wY2d3NI=; b=T4PpMeEkja7PnlT3
	+PpeEFsTfsHV/LSfhm2TmHzVGk2uD+sCCourRojmAidHaOKTqfix2KPxdFlYEFBg
	BGYjkFDMRXoNYxrYBfPbrBJTDZXhlSykITPKSG35qncG2PmOWb8yByzvtS6VXgJF
	a7SBKri4J37oUvKL4zG+q86fusOdY3KPALdQ81Q/BD48wAX9NpoaTo0Cvs43tiJE
	qW9W9yRN4t9hIYsVnCAhLU+P8AdlApbz7t2I2Nq7Hk1OLTTysGdn4rhIG8+Pjpeo
	9f3EZJgSMNwDKQJn93x2bts4ap4KV95rV9XtLh5VXROM256Ut096IC9YMZ/1JggW
	dJveUQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekku1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:04:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6db1009a608so2889886d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087857; x=1734692657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf5tcpszL0I6CSUFS4CayyJ0mUkMjSZvXwP8wY2d3NI=;
        b=dx5HILY/JVxUV/qgIeFqAXCtzSuFbPqpL2X55SWnWY+E2SB6wrNpFuGoRTD7u+c8//
         1RzSZNtxcr/cLMK8114H2+sCKzuRfoD5lE+xaChLKaHiFdfBwo0ef91eT1yQcEMQ7QnY
         ieI8lE2Xwpogqgvhv0tZbV1T6aE0ILuHiwexnozuUkeZjPmO5UzY21ERS7E+eSY0BFbX
         iWHxhasDMeDEigckWeR94sDPOv8X4WOctaFN2pqrKWjmp7dvbg13dbULnMG3rsd0pGwG
         tig0I+yPsXiN+8rMiKZVJ9mi9VOVe5Ll55ySsA6aIV01Xk4pnGt10khlw8vUYqngj+y1
         dUTw==
X-Forwarded-Encrypted: i=1; AJvYcCWlgJ9PMB+babqShYS62gdhTv1vIYw9Y82l6ftaQRMKCKQFh6S710jvnTMumqTilJhMGWW+4W+DyzOGe31m@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bASyIFL2S3kWg/TMeac5BOucAME0TY0l3mI3v9IvwL+tx5kS
	JwXSuniuON4dOkW2JTecQkNKiDs7vlnbBZYb2JlUirdBY1awVKuZ3nx85WCjlv8HK85Radw2g0K
	wWHRqDD6AAvgUhOZbFefrrnHzvd3+XRt6ZSXqIjbAEYdm/JZ+HqRXcWsP4+DgVosE
X-Gm-Gg: ASbGncsMknlyufoaXOpOV388ffeAXIU/sTAncHj7vCzTBvbKffXk0S2RhQLJfoE4KUq
	SfB9ZR4+Zx3NULPnGL23eqlk+kaSuzvGcX3FI6gR4ai3dOOs6rt87jrB7Op4xesOrxF7pToWzP8
	a8wUjE+MnyP1yRw9YHu9G5jJXv/IL8dxoBjrxhFA3HxfVqZaUOzYcTfOK0xrxQhudxkpbbhfg9e
	cfnWtixRYHdXSHetyKh8n5yjRX04NuntbvFKFOopFKFZdBoWQvlI0+zAdxJxc5Xm7/qus49sUBp
	4ZrNfly6d0f3AVVzaGc3wQZoODGtS/wPslUo
X-Received: by 2002:a05:6214:528d:b0:6d4:1bc2:386c with SMTP id 6a1803df08f44-6dc8ca88c66mr12119876d6.6.1734087857090;
        Fri, 13 Dec 2024 03:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwU07CFAexr1Cwdav3EaM4qqvfC+IfOGzgD65mUO8CZKe+Bc/O5r+o5/bbUyKkdi+zvUmNPA==
X-Received: by 2002:a05:6214:528d:b0:6d4:1bc2:386c with SMTP id 6a1803df08f44-6dc8ca88c66mr12119636d6.6.1734087856602;
        Fri, 13 Dec 2024 03:04:16 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66f90d5f8sm833016466b.202.2024.12.13.03.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:04:16 -0800 (PST)
Message-ID: <5b5ad9f7-5071-4b4e-940d-aedecf179600@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 12:04:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, gty0622@gmail.com, johan+linaro@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <d5813d64-0cb2-4a87-9d98-cebbfd45a8c0@oss.qualcomm.com>
 <20241213085100.564547-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213085100.564547-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O22vcdwXuhBgutlyauU8UxirNl2_EKfB
X-Proofpoint-ORIG-GUID: O22vcdwXuhBgutlyauU8UxirNl2_EKfB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130075

On 13.12.2024 9:50 AM, Pengyu Luo wrote:
> Oh, I sent it by gamil wrongly(forgot cc to), I resend it by git send-email again
> 
> On Fri, Dec 13, 2024 at 1:13 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 11.12.2024 4:37 PM, Pengyu Luo wrote:
>>> Add an initial devicetree for the Huawei Matebook E Go, which is based on
>>> sc8280xp.
>>>
>>> There are 3 variants, Huawei released first 2 at the same time.
>>> Huawei Matebook E Go LTE(sc8180x), codename should be gaokun2.
>>> Huawei Matebook E Go(sc8280xp@3.0GHz), codename is gaokun3.
>>> Huawei Matebook E Go 2023(sc8280xp@2.69GHz).
>>>
>>> We add support for the latter two variants.
>>>
>>> This work started by Tianyu Gao and Xuecong Chen, they made the
>>> devicetree based on existing work(i.e. the Lenovo X13s and the
>>> Qualcomm CRD), it can boot with framebuffer.
>>>
>>> Original work:
>> https://github.com/matalama80td3l/matebook-e-go-boot-works/blob/main/dts/sc8280xp-huawei-matebook-e-go.dts
>>>
>>> Later, I got my device, I continue their work.
>>>
>>> Supported features:
>>> - adsp
>>> - bluetooth (connect issue)
>>> - charge (with a lower power)
>>> - framebuffer
>>> - gpu
>>> - keyboard (via internal USB)
>>> - pcie devices (wifi and nvme, no modem)
>>> - speakers and microphones
>>> - tablet mode switch
>>> - touchscreen
>>> - usb
>>> - volume key and power key
>>>
>>> Some key features not supported yet:
>>> - battery and charger information report (EC driver required)
>>> - built-in display (cannot enable backlight yet)
>>> - charging thresholds control (EC driver required)
>>> - camera
>>> - LID switch detection (EC driver required)
>>> - USB Type-C altmode (EC driver required)
>>> - USB Type-C PD (EC driver required)
>>
>> Does qcom_battmgr / pmic_glink not work?
>>
> 
> Unfortunately, different from many sc8280xp devices, device(PMGK) _STA is
> Zero,
> this device is quiet strange, also, it has no PM8008,
> nor PMIC Battery Miniclass(PMBM), etc.

So it's not used on windows.. but have you tried checking if it's
still provided by the firwmare?

[...]

>>
>>> +     chosen {
>>> +             #address-cells =3D <2>;
>>> +             #size-cells =3D <2>;
>>> +             ranges;
>>> +
>>> +             framebuffer0: framebuffer@c6200000 {
>>> +                     compatible =3D "simple-framebuffer";
>>> +                     reg =3D <0x0 0xC6200000 0x0 0x02400000>;
>>> +                     width =3D <1600>;
>>> +                     height =3D <2560>;
>>> +                     stride =3D <(1600 * 4)>;
>>> +                     format =3D "a8r8g8b8";
>>> +             };
>>> +     };
>>
>> This should be redundant, as you should have efifb
>>
> 
> I think no, it won't boot up without it(stuck at EFI stub: Booting Linux
> Kernel)

Do you have CONFIG_EFI and CONFIG_FB_EFI enabled?

(also, your email client does something funny and posts 0x3d, which
is ASCII for '=' after that symbol)


> 
> [...]
> 
>>
>>> +
>>> +     wcd938x: audio-codec {
>>> +             compatible =3D "qcom,wcd9380-codec";
>>> +
>>> +             pinctrl-names =3D "default";
>>> +             pinctrl-0 =3D <&wcd_default>;
>>
>> Please follow this order throughout the file:
>>
>> property-n
>> property-names
>>
> 
> Do you mean I should arragne as following? If so, I actually keep
> reference devicetree untouched. x13s and crd are written like this.

Yeah, we try to unify the style as we progress and we still haven't
gotten around to cleaning up files that have been in the tree for
years..

> 
> pinctrl-0 =3D <&wcd_default>>;
> pinctrl-names =3D "default";

Yes please

[...]

>>> +     gpio-keys {
>>> +             compatible =3D "gpio-keys";
>>> +
>>> +             pinctrl-names =3D "default";
>>> +             pinctrl-0 =3D <&mode_pin_active>, <&vol_up_n>;
>>> +
>>> +             switch-mode {
>>> +                     gpios =3D <&tlmm 26 GPIO_ACTIVE_HIGH>;
>>
>> This could use a label too - "Tablet Mode Switch", perhaps?
>>
> 
> This part I follow Lenovo Yoga C630 one (see [1]), it doesn't use it,
> and this node is not referenced.

So "label" could mean

label: node-name@unit-address {
	property = "value";
};

when talking about DT nodes, but here I'm speaking of the
"label" property (which you set to "Volume Up" in the node below).
That is read by Linux and provides a nice human-readable name to
the userspace.

>>
>>> +
>>> +             /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
>>> +              * there is no calibrate data for huawei,
>>> +              * but they have the same subsystem-device id
>>> +              */
>>> +             qcom,ath11k-calibration-variant =3D "LE_X13S";
>>
>> Oh, this can be taken care of! See [2], [3].
>>
> 
> I have a glance, now I know we should extract something or it won't be
> there.
> Question is how can I extract them? I have a quick search, got no luck.
> As for windows drivers, in the folder
> 
> bdwlan.e02
> bdwlan.e07
> bdwlan.e1d
> bdwlan.e1e
> bdwlan.e23
> bdwlan.e26
> bdwlan.e32
> bdwlan.e47
> bdwlan.e81
> bdwlan.e84
> bdwlan.e85
> bdwlan.e8c
> bdwlan.e8e
> bdwlan.e9f
> bdwlan.ea3
> bdwlan.eb8
> bdwlan.elf
> bdwlan.elf.g
> bdwlang.e8b
> bdwlang.e9f
> bdwlang.ea3
> bdwlang.eb8
> bdwlang.elf
> Data20.msc
> Data.msc
> m320.bin
> m3.bin
> qcwlan8280.cat
> qcwlan8280.inf
> qcwlan8280.sys
> regdb.bin
> wlanfw20.mbn
> wlanfw.mbn

Adding Dmitry who has gone through this multiple times and may be
able to help

Konrad

