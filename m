Return-Path: <linux-arm-msm+bounces-67287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22234B17AFF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 03:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA161C25FC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 01:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A9B487BF;
	Fri,  1 Aug 2025 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvYg8V0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE6279FE
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 01:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012902; cv=none; b=RSOpm41xs2wUFLNrkccjvxsSL6KA9CNb6stl+OPRv1ZGTuPymqf5ToSW0JxT5MFXaSg3OQLbtLicuGALxPr+kFVcfxMs6DotDzVCIQHIWholr9yVLm1KfWr2UNHchUVkyEfTKUlccz8hbd3dmOpau1ZeFPqneyJuoarIpKAVylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012902; c=relaxed/simple;
	bh=KRuekgrMrF6UAyFVyK3Cpo0WfdbUcU53SJ/g/6ry/lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0vlZUQ2IuhaGE+9nzdy4t8kvEe89m/oCAWCPFf+zuIRagBa3ug+ZpTsMarUG9JJUL3X5JiCiqhsAVSRAQOKHmQzVoBQs8oJDBFv5pywfSm0K+UPZp06jAMLFyiwoDRmnH8y/WMAtg/HFgyweknkZLb8MBYPpMytGfigVZSKxKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvYg8V0e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57114L5Q031947
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 01:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNInZAfYSGZWtKe3J1Eh4Aj6vBV2EvRQhMkFQ1vljM8=; b=cvYg8V0eO73JLRQ5
	vmUt/rvb+BWB2PzmF7Lx5MxZ1Scy2Ew27avItgIJSSIol2X4VrGCrQcghGS8VqNR
	4tgfnBAUoB+YUx/tuM2r0EyoyuA0NHfP1hNHGqDDPJT7jbGyhQ80JVjCvOBd3zcN
	yE15NjIj/ii/9LKTaCCjk3jPUFXpf0OBtQw5gUqoH1BoLWdbunAmXdTHwm2j0lS8
	MiCUvNJ6LdzRO2jAkutYWu7+z5tDF68oM/wHbvxkZECwzBxb4SxsTFOeWqJZ4HuZ
	yf6FiStSCdMDd5cC3KsQ1aPj1MfpHh62AlPFD/kkb+UP7rVPIC/fRLL3MyZA4JnE
	Wjg0aw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwexbm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 01:48:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23fc5b1c983so30902875ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 18:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754012898; x=1754617698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNInZAfYSGZWtKe3J1Eh4Aj6vBV2EvRQhMkFQ1vljM8=;
        b=sXFDipznmf/vpbaaCbrFQR5NZaB51QrbvZf8+OG7U0bPdzIJdx8qd538XdJqGhWijd
         e4fFbYG8ne0O3Z3W/NQsrCvU7PC0xPWdeumWUNrKZi1wmnM7p74KhKEAI3iyCaIqgJxj
         G2SFPB69g74S6JVsoNsRcgu7jkG00FBa6KZ0F2alHX5jPnLC5vK6oUnWaprPC+uKwaz3
         D4Ecae++FCNpiQGcsK1WCJlD8PXpfLcGfzkokcMMeH0lqashG3L2j9+9QIYyNHTcv2pF
         vsQ8U2cgfY1PoRIVkxI+JK2W8lbiavpd/Ludse4jypTZLVl+h3M2jbQMII7Er4iiHZ2t
         7l2w==
X-Forwarded-Encrypted: i=1; AJvYcCWZq5UAemmuID5WCn19ZXMvtrSI/HF6XutNVokt+gC5jhH24PLGi5CwG2YQZ3xWlJzwmQX0vxW/nJYlcOKG@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUWmKg+sE3A/+seWpvMAUj+NywfLpYesHHCBD9a6AN6p856GJ
	rCdNb7oyOYSBw5qnC7xQsdhcKPr79/JOTeJWW8UMi947Gl6IKGo8Sno8hXeUJS2IynKHGBd5d8v
	1Pj3Xs0IyYRH3gO8SA5lTwDEc1tF6mX4a0TdgtxRxU8rtR1AivP6icNq806RaTFW6URvj
X-Gm-Gg: ASbGnctfNBm6qhcEreMz6Yst4yw9LbYlgX8/ayUcCGhUzB/cqJ04+BX0t2PzP6i7fGl
	YUoSUELCojJO0ROFe4xtn8hMddYIyZRofOuAS9IA3yc4OXKqqwUbGwRbQSc4WJVySun1WhpCFua
	/X0XiWLSKzH26jbrKsg0m7jCPJP0aa1T+JFyyrMyEPhpQrLQy9JjuDKaGFLsEp2AIOLQHOQEnlG
	alHimQMBq54dM4FOEYz26AdK/OCCMHj+Vra5YX4Q7lT5NDcoQNwM8dF/hOsAAnOskCqxD5z1P20
	gicXLwxEygzV6BkqAd8h8peRg7wTt8B1g7N6w23PDgnlx/e+yT7gIc1aiSjZwXNvDRUYtBVRR91
	drTvIKyR5dnviV6kyriaBxYDDM+nz
X-Received: by 2002:a17:902:c40c:b0:236:71a5:4417 with SMTP id d9443c01a7336-24200a169edmr69232985ad.5.1754012897901;
        Thu, 31 Jul 2025 18:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK6KSss2CH+ayYNqcDNgoqegrMLwfuGOYHThCBtyOsAD4mdcJRiG0GhFPdzUasJYVPtViyjA==
X-Received: by 2002:a17:902:c40c:b0:236:71a5:4417 with SMTP id d9443c01a7336-24200a169edmr69232625ad.5.1754012897451;
        Thu, 31 Jul 2025 18:48:17 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899d272sm28911325ad.135.2025.07.31.18.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 18:48:17 -0700 (PDT)
Message-ID: <31b03c1b-513a-4eae-9233-568aab12e0c8@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 09:48:10 +0800
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
 <391b8214-37f2-460d-94d0-3bd0daa00066@oss.qualcomm.com>
 <mlbutlxudl5i32zrqegxiefaa2sbkntriwdftn7hxo4khidtf2@oiljtmtktovu>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <mlbutlxudl5i32zrqegxiefaa2sbkntriwdftn7hxo4khidtf2@oiljtmtktovu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dWxMKAP8MNkeQJOoJMfmT9t0H99jXBgx
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688c1ce3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=oVAvm5E0DutlCjUowHsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dWxMKAP8MNkeQJOoJMfmT9t0H99jXBgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAxMSBTYWx0ZWRfXwQ22LVwmipkJ
 P3pfEqtcU5ZmaFucN3LZh/CUZdiVhxdRk9kR7/Clq2wrKoF2jMkSJIm1dAbw4sxLkBsQtL7pWaI
 fbbzpJBG+gphpe9SXg7Ex1XhpbhyKrTZ7/dGQSKt/4YYfWvngolX4yU4A44f/A2K0KTndBTlBK1
 EwMTs9f6i0vM0rEdv+UeG2gngaLlS48wvITZSJzY6fxgHTEqnh3fBsCGfp1J8ZM8fXu3cy95E8k
 kRWvTOO9U6+ln2bf4R39SG/+SIjLsjhVZ5E9vZCR3lwfuTamBoeW/buhaED+ySIOdvzSqb32ua6
 PMmqmHBAOWLEC9ddpVKM1xnJMUH38D7TtWIc9dGbydLMPnUu7vy8oOZAh8JpgRyz1+VfgkU92fV
 /JvvmL5XSRRga4djH5OrUReZR8Uhvn7ycWIq7uGHFcGJmGjGxabCBBe5xPR/fHRoqhBXeuta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010011



On 2025-08-01 04:22, Dmitry Baryshkov wrote:
> On Thu, Jul 31, 2025 at 04:45:33PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-07-31 02:42, Dmitry Baryshkov wrote:
>>> On Wed, Jul 30, 2025 at 02:28:25PM +0800, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-07-29 18:37, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 29, 2025 at 09:32:00AM +0800, Yijie Yang wrote:
>>>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>>>> embedded system capable of booting to UART.
>>>>>>
>>>>>> This change enables and overlays the following peripherals on the carrier
>>>>>> board:
>>>>>> - UART
>>>>>> - On-board regulators
>>>>>> - USB Type-C mux
>>>>>> - Pinctrl
>>>>>> - Embedded USB (EUSB) repeaters
>>>>>> - NVMe
>>>>>> - pmic-glink
>>>>>> - USB DisplayPorts
>>>>>>
>>>
>>>
>>>>>> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
>>>>>
>>>>> Hmm, so there are regulators for the retimer, but they are not used.
>>>>> Could you please point out, why?
>>>>
>>>> According to the schematic, there is a regulator and a retimer (PS8830).
>>>> However, as mentioned above, the retimer is not connected to USB 0 and is
>>>> therefore not used in the EVK. As a result, the regulator is left unused in
>>>> this context.
>>>
>>> What is connected to the retimer then?
>>
>> All data lines are broken, except for some power lines.
> 
> Ok. please add a comment. If the retimer is connected to I2C bus, please
> define it too.

It’s not connected to I2C. I will add a comment here.

> 
>>
>>>
>>>>
>>>>>
>>>>>> +		compatible = "regulator-fixed";
>>>>>> +
>>>
>>> [...]
>>>
>>>>>> +
>>>>>> +	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
>>>>>> +		mode-pins {
>>>>>> +			pins = "gpio166";
>>>>>> +			function = "gpio";
>>>>>> +			bias-disable;
>>>>>> +			drive-strength = <2>;
>>>>>> +			output-high;
>>>>>
>>>>> What does this pin do? It's not recommended to set GPIO values through
>>>>> pinctrl.
>>>>
>>>> It is used to switch data lines between USB Type-C orientation detection and
>>>> DisplayPort AUX channels.
>>>
>>> I don't think I follow it here. Which data lines? Type-C orientation
>>> detection uses CC1 / CC2, DP AUX use SBU lines.
>>
>> I made a mistake here — this pin switches between two data sources: one is
>> DP AUX, and the other is a GPIO pair configured with the function
>> usb0_sbrx/usb0_sbtx. Both data sources originate from the SoC and are routed
>> to the USB0_SBU1 and USB0_SBU2 lines of the USB Type-C connector.
> 
> So, it's some USB4 stuff. Ideally it should be described via the
> gpio-sbu-mux, but I don't think we can do that for now. I'd let Bjorn,
> Konrad or Abel comment on this.

Sure.

> 
>>
>>>
>>>> When this GPIO is high, USB0 operates in
>>>> orientation detection mode.
>>>
>>> What does this mean?
>>
>> This means the switch will select the GPIO pair configured as
>> usb0_sbrx/usb0_sbtx.
>>
>>>
>>>>
>>>>>
>>>>>> +		};
>>>>>> +
>>>>>> +		oe-n-pins {
>>>>>> +			pins = "gpio168";
>>>>>> +			function = "gpio";
>>>>>> +			bias-disable;
>>>>>> +			drive-strength = <2>;
>>>>>> +		};
>>>>>> +
>>>>>> +		sel-pins {
>>>>>> +			pins = "gpio167";
>>>>>> +			function = "gpio";
>>>>>> +			bias-disable;
>>>>>> +			drive-strength = <2>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	wcn_bt_en: wcn-bt-en-state {
>>>>>> +		pins = "gpio116";
>>>>>> +		function = "gpio";
>>>>>> +		drive-strength = <2>;
>>>>>> +		bias-disable;
>>>>>> +	};
>>>>>> +
>>>>>> +	wwan_sw_en: wwan-sw-en-state {
>>>>>> +		pins = "gpio221";
>>>>>> +		function = "gpio";
>>>>>> +		drive-strength = <4>;
>>>>>> +		bias-disable;
>>>>>> +	};
>>>>>> +
>>>>>> +	wcn_sw_en: wcn-sw-en-state {
>>>>>> +		pins = "gpio214";
>>>>>> +		function = "gpio";
>>>>>> +		drive-strength = <2>;
>>>>>> +		bias-disable;
>>>>>> +	};
>>>>>> +
>>>>>> +	wcn_usb_sw_n: wcn-usb-sw-n-state {
>>>>>
>>>>> What does this pin do? Using pinctrl to set GPIO values is not
>>>>> recommended AFAIR.
>>>>
>>>> This pin functions similarly to usb-1-ss0-sbu-state; it controls the data
>>>> switch between signals from the USB connector and WLAN data.
>>>
>>> Could you please explain it? Does it toggle USB2 signals(you've added it
>>> to the USB2 PHY) being routed either to the USB connector or to the WiFi
>>> card? Or do you mean something else?
>>
>> Yes, that's right. It routes signals between the USB connector and the M.2
>> Wi-Fi card.
> 
> Ack. Please add a comment.

Sure, I will.

> 
>>
>>>
>>>>>> +&usb_2_hsphy {
>>>>>> +	phys = <&eusb5_repeater>;
>>>>>> +
>>>>>> +	pinctrl-0 = <&wcn_usb_sw_n>;
>>>>>> +	pinctrl-names = "default";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_mp_hsphy0 {
>>>>>> +	phys = <&eusb6_repeater>;
>>>>>> +};
>>>>>> +
>>>>>> +&usb_mp_hsphy1 {
>>>>>> +	phys = <&eusb3_repeater>;
>>>>>> +};
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>> -- 
>>>> Best Regards,
>>>> Yijie
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


