Return-Path: <linux-arm-msm+bounces-67232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2ACB16DDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2609C1C20207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D721021931C;
	Thu, 31 Jul 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot9m3uLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE71DA5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753951541; cv=none; b=YPBR3Xv1aVDAFmf9JmD6ZVN3tbZNjCQuK3y30e15f6CzDap+vYwaUpo/R1jOyGT7Kh9J8temlmj8SKt9vjUU73wIKZEG08nJQvzbaJ8Hn+pAgc1F6E0gpCl1WfVy3d0rsJCIA+fcJ4JHsQuDMICsN7DbuVzai+APJ4qQ8dG0Kds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753951541; c=relaxed/simple;
	bh=18D46RaLmbTlUnUGui7/qF33DpRxEz3EaP4PJ+ve7B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6cSfyxwzybSg1X74YWl0ox85TI+MoIgXIrcu0pksJ//yGNNM9xmBIftdQIGrYl7DR3dhscajKsyLr3cqh/vDNxbmN4uThSLsSmcFR8Eq0HWeFJPB3zrmcV2KosejZXOb6s38HJmj9GMYijhNc6EiBXEcNo25j6iDpiXR9sMc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ot9m3uLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fj6D022981
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 08:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXRoKDrQ98QDaWIGvaODl1kClGzq84AWkTwEHfO4DTA=; b=ot9m3uLMrt8Swrv2
	JW6MQcgM+0WjzL5mck7edWratKuyybPRZeNAfc3SyrqVrtLZDM8fMs7XpT3ssBWc
	1NRs+IhVfiN2TO299ROTelBckYrboEaCP5p0iYOFYBDFHEPcnMQX5oTjCiWjs518
	u7KPkCb72yI3w6af6yAxCEdpXPollx/q4b5zcKfGDDJf2S1NtB0x3iNueuAF4x6r
	iagv5OryYRO03kfTDGO5PqCNy5qTdjN40+bgs4wF8gJenf2X81Fyru/mPA2HHpQa
	iaYQ6Vf62yDneMHbLrlWdJ4JNjk8nRMCgoRm+u4cFOGwUF0yT22PjLWA48wXaiVF
	p/lvSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu7cgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 08:45:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b42249503c4so1004498a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 01:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753951538; x=1754556338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXRoKDrQ98QDaWIGvaODl1kClGzq84AWkTwEHfO4DTA=;
        b=TgqPfeOFjKhT7IJXQMDUXJFG/RJUQ4xHnA7LHPt6sgaccXg+F4bThWkvp7KQorBEbo
         ExaL701gbknOIj0Si+uUSFh7+Ke/wvTqNatjZwPuN20Gi2B5zLv2qay9vdw4QKHty0P7
         +kyumMmh/oY2uqnCvFJmQc1fux1Qy3DQ2bxyuaY/y5BTMgN8Y+YCX54s/5bWX2ZLtvS0
         RJcTqs5w5D2BXX1vNWtHJ8azwt1MlL83559kVyqocgvjnYyia/PaDBQPvKXk0Tuo+Cz5
         1CQg7sigvnBek/62QThmpqqOLVb2LYo74ZKzUx3dtIGJGdGpNYN6jGIJgNXmpbf3K3Pw
         fezA==
X-Forwarded-Encrypted: i=1; AJvYcCUiCt3rZLtPLOaJMkk+GL/G5ZejUBmbE2TamxFJgqdDY9Bo5MZ9s4TD+WR8C6apLlSJo54UbDQc5mox2yri@vger.kernel.org
X-Gm-Message-State: AOJu0YwWORFSgjNgikQr4V+OmaTJzTvZtt9SH3B8iGcGFFMq3VsQ/JI9
	wu/4DuFKVqKDLj115hGr9ooKbbC2SlIrw3xx02oE/vd8ixxUaflYCN0UQMYrToEgwBtQvQLIlyx
	qS4YnAhnB4IGb+kruF/AchVE8dwopZgBsoGntYumTPzUX6AheF55Od+eslIlr2TtA543c
X-Gm-Gg: ASbGnctvfN4u5mwI1vv7V7OWdoVbab48v0cO+Bad5BV0AIMDUUIfKQ6djpPFMLW3Yqd
	3O6QYCQ4aDEVr5xqT5xbLXqG8IgoORjkJWOA+Y0ilui8o+nEKD4dg+sV7QQYQQCMifay8XEiK2t
	AMbjiIhWp4is4TtODoKMwHgimOioX78dijpwnDspWCBYph6OehCSnP6nfzFWCcuTqcp/Jk2kHrB
	pB/tvNRhaNXAZnIGxT84ukgAtxAcDuHIJCt8ox0FDa1UENYK7bJ6TlrM9DVTJDE8mBe70xAKZ2s
	Qv3x+xWiRjN+68r1Nmj/N0zNOUeml4dcgoBiAKgc6B4BUNj2k/iazAqTjDdmPDbAQmCAAQXFiq5
	ASTsmAyi/3pmMyW22CxhDcg4fSEIG
X-Received: by 2002:a17:902:ecc4:b0:240:4d19:8774 with SMTP id d9443c01a7336-24200d6b5a3mr17928105ad.24.1753951538156;
        Thu, 31 Jul 2025 01:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxMh58HMEu0FMobtYPpOQsJHvULEpFZ2FEA2ttpq4ZgGpHgUPWBls1eoQk0R3ywX13zcmFSQ==
X-Received: by 2002:a17:902:ecc4:b0:240:4d19:8774 with SMTP id d9443c01a7336-24200d6b5a3mr17927845ad.24.1753951537675;
        Thu, 31 Jul 2025 01:45:37 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aca205sm11696515ad.193.2025.07.31.01.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:45:37 -0700 (PDT)
Message-ID: <391b8214-37f2-460d-94d0-3bd0daa00066@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 16:45:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
 <pbvyog477v32s4lu72z52dhsond5yud5w3nxmcouvr6ljlndlh@ws46dncy35c6>
 <b4a3f568-f41f-4141-b421-8b158973f810@oss.qualcomm.com>
 <cawg456ucsvssm2ngbcjvpprxke7s3sfqf4fzoj5dtfj2flnzw@2e3h5ojgn4s5>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <cawg456ucsvssm2ngbcjvpprxke7s3sfqf4fzoj5dtfj2flnzw@2e3h5ojgn4s5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _lhOtXFQhZM__2sDjpOgBcIx3ViLKufl
X-Proofpoint-ORIG-GUID: _lhOtXFQhZM__2sDjpOgBcIx3ViLKufl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA1OCBTYWx0ZWRfX2DKVRAKq4gL7
 LhttCWIdnq+Ku6l4hhJpS+/nSC6l/Lg1BRk7Tw6MOcaAMW4FIndiQZTk6RNbl1+AItnxVpPbdKD
 oeg0nviLCPzWonfVEEtyQtrkUdF28Z8PXsIMIUqPk49YE/5eo2Ff9usxwAnlnTO2cObAr6UUPCa
 h3tRayJ2bH6SIx2buBKBiX1OYHPR82xdLPsbKJSMzSNJJoaysqWeQ9WVscOAiQMPi0YlhMSjTB4
 XLfFGa/CtiP107hl6HNnyDR0j2JPi7VW//pUwi9SXKVXFMER06ZbxzxFBREkY2vLMcsSyM0ZYVv
 HM7FkO8BW1JjhnWWkpE2LnqTWWUg7GPrW9F3uVd9NQ3S62x7AjwQVwDOd9p/4lC2zjGFnilerds
 geYZ7Am0qcph48xKC4GlWk4yy8faj94bIv95LXAXbmMolasMqJC8Nz/PMkI6qjMzC54heaTc
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688b2d33 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Uz-00NkV9YIIZGY-jFMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310058



On 2025-07-31 02:42, Dmitry Baryshkov wrote:
> On Wed, Jul 30, 2025 at 02:28:25PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-07-29 18:37, Dmitry Baryshkov wrote:
>>> On Tue, Jul 29, 2025 at 09:32:00AM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> This change enables and overlays the following peripherals on the carrier
>>>> board:
>>>> - UART
>>>> - On-board regulators
>>>> - USB Type-C mux
>>>> - Pinctrl
>>>> - Embedded USB (EUSB) repeaters
>>>> - NVMe
>>>> - pmic-glink
>>>> - USB DisplayPorts
>>>>
> 
> 
>>>> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
>>>
>>> Hmm, so there are regulators for the retimer, but they are not used.
>>> Could you please point out, why?
>>
>> According to the schematic, there is a regulator and a retimer (PS8830).
>> However, as mentioned above, the retimer is not connected to USB 0 and is
>> therefore not used in the EVK. As a result, the regulator is left unused in
>> this context.
> 
> What is connected to the retimer then?

All data lines are broken, except for some power lines.

> 
>>
>>>
>>>> +		compatible = "regulator-fixed";
>>>> +
> 
> [...]
> 
>>>> +
>>>> +	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
>>>> +		mode-pins {
>>>> +			pins = "gpio166";
>>>> +			function = "gpio";
>>>> +			bias-disable;
>>>> +			drive-strength = <2>;
>>>> +			output-high;
>>>
>>> What does this pin do? It's not recommended to set GPIO values through
>>> pinctrl.
>>
>> It is used to switch data lines between USB Type-C orientation detection and
>> DisplayPort AUX channels.
> 
> I don't think I follow it here. Which data lines? Type-C orientation
> detection uses CC1 / CC2, DP AUX use SBU lines.

I made a mistake here — this pin switches between two data sources: one 
is DP AUX, and the other is a GPIO pair configured with the function 
usb0_sbrx/usb0_sbtx. Both data sources originate from the SoC and are 
routed to the USB0_SBU1 and USB0_SBU2 lines of the USB Type-C connector.

> 
>> When this GPIO is high, USB0 operates in
>> orientation detection mode.
> 
> What does this mean?

This means the switch will select the GPIO pair configured as 
usb0_sbrx/usb0_sbtx.

> 
>>
>>>
>>>> +		};
>>>> +
>>>> +		oe-n-pins {
>>>> +			pins = "gpio168";
>>>> +			function = "gpio";
>>>> +			bias-disable;
>>>> +			drive-strength = <2>;
>>>> +		};
>>>> +
>>>> +		sel-pins {
>>>> +			pins = "gpio167";
>>>> +			function = "gpio";
>>>> +			bias-disable;
>>>> +			drive-strength = <2>;
>>>> +		};
>>>> +	};
>>>> +
>>>> +	wcn_bt_en: wcn-bt-en-state {
>>>> +		pins = "gpio116";
>>>> +		function = "gpio";
>>>> +		drive-strength = <2>;
>>>> +		bias-disable;
>>>> +	};
>>>> +
>>>> +	wwan_sw_en: wwan-sw-en-state {
>>>> +		pins = "gpio221";
>>>> +		function = "gpio";
>>>> +		drive-strength = <4>;
>>>> +		bias-disable;
>>>> +	};
>>>> +
>>>> +	wcn_sw_en: wcn-sw-en-state {
>>>> +		pins = "gpio214";
>>>> +		function = "gpio";
>>>> +		drive-strength = <2>;
>>>> +		bias-disable;
>>>> +	};
>>>> +
>>>> +	wcn_usb_sw_n: wcn-usb-sw-n-state {
>>>
>>> What does this pin do? Using pinctrl to set GPIO values is not
>>> recommended AFAIR.
>>
>> This pin functions similarly to usb-1-ss0-sbu-state; it controls the data
>> switch between signals from the USB connector and WLAN data.
> 
> Could you please explain it? Does it toggle USB2 signals(you've added it
> to the USB2 PHY) being routed either to the USB connector or to the WiFi
> card? Or do you mean something else?

Yes, that's right. It routes signals between the USB connector and the 
M.2 Wi-Fi card.

> 
>>>> +&usb_2_hsphy {
>>>> +	phys = <&eusb5_repeater>;
>>>> +
>>>> +	pinctrl-0 = <&wcn_usb_sw_n>;
>>>> +	pinctrl-names = "default";
>>>> +};
>>>> +
>>>> +&usb_mp_hsphy0 {
>>>> +	phys = <&eusb6_repeater>;
>>>> +};
>>>> +
>>>> +&usb_mp_hsphy1 {
>>>> +	phys = <&eusb3_repeater>;
>>>> +};
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


