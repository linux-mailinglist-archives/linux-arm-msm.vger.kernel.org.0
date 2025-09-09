Return-Path: <linux-arm-msm+bounces-72717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77656B4A943
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F74A4E0116
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E543148BC;
	Tue,  9 Sep 2025 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnqQ6qAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBDC2D481D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412148; cv=none; b=BoKOBH59N/Xk7zYSck4ggCgp35iMMtVpwyS02/TbRMs0UEb3zG23dg8bgRlm6OQTe6nOyYvHPQyZr1fqa8ak/9OC6rCz+0+k2osLLsbKXWk7qu5kgr0xkfclaxgPcNtlhRy1hrTheGCU+fb3i1idk5xrgY9iEfLs0M88bUiV9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412148; c=relaxed/simple;
	bh=iQ5gERobvATb314ro5gdhE+DkIWkSDFz9Z8hAAya7KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loXRFiBcwqQRzPG6bLjahzxsMddpbfP+Tw543xHbcdqCJu6sdwWUCkXbKkaXDX0vanjrZrV1sWKvp/qow7UNw7Z+QPUbY1Z+lVpR3AOcbUWJK3Wb3Odp7tKmao47ujlt7Xd436r6RIaQS5RHyjzq8SEsywzdD5rWMlpWQAN+uR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnqQ6qAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LVBj011067
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 10:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HaulBQ7AYoFu5zw4WFGYJoR+Ifng1FxEuEOGIbmKB8=; b=KnqQ6qAirfLwNjnQ
	FWYep/qK09brm/KftOca+OO1UjSL+rwsIoDXjs1SPz6Rw/AJx1GfiJ27yKV2Pyhg
	ucgkr2rcjVBp8NujvnglVswlEhl3VZUt1BpNrpguSPDsUUaXDpqwlXzhWDuR61PH
	d5l3ml2/gDCStL8Pw3Y6mINgtk+EjRCfQfC1/++LQUzML4OO5jxOjVtPIkJQWwR9
	9q8um6oKIt0+eFosstJxvdocSXztz+QDIK9z1BlgOv116NQmlJVJQrZ9SKaqqFun
	jwkU1sRlLXQeGDmAmATrhU1Tk30F/bp1F4mLmqLhj9mQkTGmtrl7kf3RjBun7bVk
	s1EGRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0qt0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 10:02:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24afab6d4a7so115859905ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 03:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412144; x=1758016944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HaulBQ7AYoFu5zw4WFGYJoR+Ifng1FxEuEOGIbmKB8=;
        b=aS7KTPEtJAD0ixaT7XqdtOnRt4yt7xEzKe8d/AsDWKXMjFAAtRCv6c2JEZDSFH0xec
         Y+pvC4DK+m+z0E5Trvo8naUjzsh9oyoO0XmvNmFHhOGOQqeRKMxQ1mc2U3xM4/YMhOxi
         VjvL5qEp2/hzhCJdfEj+f9yeY5Xr2jv7yTSQCGDM7Yvi1WDnQENzppxCYxAqFLFxRkmM
         OXjiDX7AgM5RO38CeYMIfMSU9RZolLErg1DZCUgIh5K3g7pE6AQQhy3fID3vC2Q/Bblu
         clwf0OOcTJ9r6e3N4fSm9GUTle4/wvJ5qA8+7Emn3rxU5BWTQsPkClrsu08oIPNB/7FI
         l7DQ==
X-Gm-Message-State: AOJu0Yz27cmSAX//qZLl7hWVpLBrkTFrSZh+VBN21uGYYcQBXRWFW+8Q
	VIiLyr4dcTbHtVDG8e9lkgWO/AyxMMV6GcyQM6xTaKpY6TaEbx6P09tjs9+n5Ca0zSgtLqbFbGY
	tjIvRFBF/mfMmMnVTezWZgUDco6BUaNEICLPuT+e8zvWUaCJCn67LG/B0C4Uu9SAY/nVV
X-Gm-Gg: ASbGncsbYIqGEMFoQ9CaAHo36Mwv8gOJVr/MYYwBr5fkYoXlZclHO5hFN0JA6Z55DAw
	G/DOw+mBsxbkGQ+JFXmX1DvHYzc3MOoku3YuXm7jbNjvYdlAoKVDRL/mKm7Q/lzFUq1eeO/Wv2y
	J3M/Sb96Qx9P6VR9g/h6+8pZVoGAyiSWbPp9Dv+tFO4ODR0R0/9183m/OoKzsNA9Ls0y28ETbhZ
	rWkZDwDCC4AZUo92oVIpaPtBq02I9b+WRsu+bvVJkduvvw2ff/+RlU9rx67lVzGXr2y0aAJmVV9
	t1EjGu+IGL7OTzU5znQxEA1Sr17p7C0rrmVqvyz4qK2u9/V9+RG5Wa7h5q4sjXwP5g3MXeWpL5+
	PVMdBIJQuiBTJj8dhQ+ErTVCDVv3W8OxS0A==
X-Received: by 2002:a17:902:f60b:b0:24c:9a51:9a4b with SMTP id d9443c01a7336-251703958bdmr150722585ad.21.1757412143552;
        Tue, 09 Sep 2025 03:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGetpndXROcKB2fp2rRqcvrm+wqc4vDETNgwz1xtv8hDlxdy1e7FS/7JbWqSHVAsyjPVhVOeg==
X-Received: by 2002:a17:902:f60b:b0:24c:9a51:9a4b with SMTP id d9443c01a7336-251703958bdmr150721735ad.21.1757412142865;
        Tue, 09 Sep 2025 03:02:22 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb28c3110sm151780825ad.120.2025.09.09.03.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:02:22 -0700 (PDT)
Message-ID: <483e3380-0e88-4a95-950b-0a533bf7ce17@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 18:02:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
 <20250909-hamoa_initial-v10-4-ec10057ffcd2@oss.qualcomm.com>
 <c1dff274-4b71-4d18-be2d-eb5959111243@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <c1dff274-4b71-4d18-be2d-eb5959111243@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J04_RaSzoFDmMJFfeEwViPCaYyE-kxsL
X-Proofpoint-GUID: J04_RaSzoFDmMJFfeEwViPCaYyE-kxsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX8AdEgWM11w57
 yCrZePIzKN453LSHrEu/ZbVYwpO6+9rEnfXbUd2b68FfQiHWK8+ZfoJ/gjOv0Gvsdr6DFrdRr5Z
 TFyhnrA155IT/FrMwGrEhHNea6jGv++/y40Hxs8tqizh6GfdXda1tcwDPD8+jX95mmgSHlxwate
 6ecokkK3vmMHdaaxb1nxTiuu0GFO9jLEiMR5siHYLmqOkounRYH0ud2FrF2MmvAAppouhfjjemj
 MWtaSp83Mo31jyyCf8Ph3fnYnO91MinHEUxnantVlecwj1K4+Qp9ZI7U1YalOYLhbejo3OAJRI0
 rORco7pWp86KlkiH01Bj+6UqAW31Dl2FH+p4e9ZOqBqSzm1NzC9QU9xHXllPx4fgPa4qeEYnuJc
 LlIxFt/b
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bffb31 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=sn0vIxX-2wHjl4zpZ4MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024



On 2025-09-09 16:31, Konrad Dybcio wrote:
> On 9/9/25 5:56 AM, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> Make the following peripherals on the carrier board enabled:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - WLAN
>> - Audio
>>
>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,x1e80100-sndcard";
>> +		model = "X1E80100-EVK";
>> +		audio-routing = "WooferLeft IN",
>> +				"WSA WSA_SPK1 OUT",
>> +				"TweeterLeft IN",
>> +				"WSA WSA_SPK2 OUT",
>> +				"WooferRight IN",
>> +				"WSA2 WSA_SPK2 OUT",
>> +				"TweeterRight IN",
>> +				"WSA2 WSA_SPK2 OUT",
>> +				"IN1_HPHL",
>> +				"HPHL_OUT",
>> +				"IN2_HPHR",
>> +				"HPHR_OUT",
>> +				"AMIC2",
>> +				"MIC BIAS2",
>> +				"VA DMIC0",
>> +				"MIC BIAS3",
>> +				"VA DMIC1",
>> +				"MIC BIAS3",
>> +				"VA DMIC2",
>> +				"MIC BIAS1",
>> +				"VA DMIC3",
>> +				"MIC BIAS1",
>> +				"VA DMIC0",
>> +				"VA MIC BIAS3",
>> +				"VA DMIC1",
>> +				"VA MIC BIAS3",
>> +				"VA DMIC2",
>> +				"VA MIC BIAS1",
>> +				"VA DMIC3",
>> +				"VA MIC BIAS1",
>> +				"TX SWR_INPUT1",
>> +				"ADC2_OUTPUT";
> 
> It's good to write these entries in pairs, as that's what they
> correspond to.
> 
> Please also take a look at this commit:
> b49e37de8e70 ("arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies")

Will update.

> 
> [...]
> 
>> +&i2c5 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
> 
> A '\n' before status is customary

Will update.

> 
> [...]
> 
>> +&usb_mp_hsphy0 {
>> +	phys = <&eusb6_repeater>;
>> +};
>> +
>> +&usb_mp_hsphy1 {
>> +	phys = <&eusb3_repeater>;
>> +};
> 
> See:
> 
> https://lore.kernel.org/linux-arm-msm/20250819-x1e80100-fix-usb-mp-repeaters-v1-4-0f8c186458d3@linaro.org/
> 

Great reminder! I'll take care of it.

> Konrad

-- 
Best Regards,
Yijie


