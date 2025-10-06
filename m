Return-Path: <linux-arm-msm+bounces-76018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F74BBD6C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 11:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B05F3A2E57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9B4265630;
	Mon,  6 Oct 2025 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2BSDM3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26985261B6E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742421; cv=none; b=RxOgEpM+pfNqT4XeHsxt5zsnbR6LkHB5TlgGK5M9lRqemt9afx6NGB+ExI/75Z4kASG0YzAUlEF9XVe7W1k7PWTDZRkvpZNr0sP6syLQ29rLcHeUduWRvemG+RzbrIyMEgYlFLeUEO8795NQQqXSyU1JV4UzekaOMCohAGHOLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742421; c=relaxed/simple;
	bh=+z5RsXcmsnLuH9oNH0dtACv/z+mVo02WavJT6h3Tmb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuLbRPKylf5NdzSpEBLKEV0YS0NlCRDwuJap/7e8e6Jwk7gJXRtI2QH72Sez2/W/Uns9s7mzk9IZWh+qXNFo70NIorUl/pdn0EdFJiwTH9WS1SAFq1kZqHzUdItyLvxqojCBV0XCwEeaKvSum03DeuQCx4zLGzdbOhYvoHRBa7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2BSDM3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960K2kg012589
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ch18kniChG2tsKGJYqAIJlfKxhd34mEMTSP7HHJxa+w=; b=Q2BSDM3DsTGF7/0K
	uXAY2/t3FEUaRZmjpySbCnpdoClHNsxo9phEPQ6gBWa19C/YOIaNEFwYEjybyJDu
	swB6LJ1bI4V6yo8lvbtKGJIeQxWL8WUXUQch5Fk1IepuUapm5G5/imxYXcACdk6E
	mSuFuzzVT76N1blW7kJkZ9EqTbRBMMr4KIj3fRPs68iW6TQDUWeZTw9zufK42vQn
	KSi/LN9l2hMzB9efTMhVu5VzDpbXgh56XGibyj07bqVsYb4TFOc+jxYtwbIdQjlA
	GYu2/pIdCagT89jUuA7GIvkOXnJ3TY0Zw1Kpk0BuFTxzujdrjMIEK8jEAC90+22I
	N27e8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu3ffm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 09:20:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e6d173e2a2so2465061cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742418; x=1760347218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ch18kniChG2tsKGJYqAIJlfKxhd34mEMTSP7HHJxa+w=;
        b=GGo+2c5GOwn4ny8I4GddCXCCAXOPyYHCBtP94btAnSoZb9gjE9TuE7V4/yt3Gg3jyA
         6+NSgsN6prnNZLln7rKR11eL7KFBVTQJJqdVe67z7TJhdk2AReLNP5d/lngeW6t5e4Ej
         dB+KyoFNOWLGsF96GvRxATtW9PKVvv0oUb3r1aQSFL+xlrPi+F8oMlwg7rFLQtcbMaDp
         uHNY/TfNTQHhwvT0KP5efLKue49lUKnID531+h9IR3riOhRZyXQX8zUrmBIjg0K1JyOG
         rM9HX0/QEVXSgkojhuvwWND/F0qVFl5Ci49fPBlRlJpkhryZFVqczVdC33NjzkYf/T8t
         UM6g==
X-Forwarded-Encrypted: i=1; AJvYcCXmw7YPW/pTtVyFBjyEKSPu6HfSRi5zpiGN4e9hkEZZAmmv7SBhpsIer/vEAb94WrK7FT2a2EnCeseO0e11@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlsUe/vzkLa7iLBvuNZmNgM4FoteXnKw2Bj7pk2HxbjMp1KQZ
	vm3N0XIutxVbvIZaHQD4W4wFdANNM4JIB2Y19BJBHS7+Lsrwvj2YSIQXo9g2cwU7TKmNvt7/2K3
	vyz6yJBIdfJ8F9hq30//DriM/fdpk7AW7YiEgUS8hC6Y/a67OA0r893GuzpT5fdrbaZaY
X-Gm-Gg: ASbGncsHsVoU10XCD59F8047lzYlk6I8NS9DcjGYUcVaN0jvMWMUgFfin5Qi9HaweEl
	l30AixLpsWY0dF7W79cflqz1mvt6e6JlK537RT5Qs05fG5l/I+nQMDp8IZ1ZeNGB+X+EV0MmaFW
	xZDKz6x9i+4iJHRh0UxVzJ98E9xCcYueb12lXcAwKDqMBbzRm+kO/kcBpi40+kgBp6tn39IWBCy
	6fwm9f++ilq/9HZZFRx59R6l3Gj/gTbsfAEevK87ght+oOm7WxEVrBdVhMpcmNKf1Jo5/PkumWZ
	Nq3njLs4MOb6EXN+7EM6rTwsD1wotgQDp2azDwEwV3Ervh+2eiTWfhljKg644qvdeVMW7BJ/F1S
	EMwhwtMHUEBAX3g3h/6QeoGxlajM=
X-Received: by 2002:ac8:5fce:0:b0:4b5:e606:dc13 with SMTP id d75a77b69052e-4e576ae6a6bmr96762611cf.10.1759742417974;
        Mon, 06 Oct 2025 02:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBV9Zd/QB2x5+JdkTxQwqxdzWs0zfhbi9OLES7dJj3xqxLmh3J9kn0Sitv0LuTbN/cbiCltQ==
X-Received: by 2002:ac8:5fce:0:b0:4b5:e606:dc13 with SMTP id d75a77b69052e-4e576ae6a6bmr96762421cf.10.1759742417399;
        Mon, 06 Oct 2025 02:20:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1102808466b.76.2025.10.06.02.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:20:16 -0700 (PDT)
Message-ID: <dfc093a1-e13b-4342-9015-5a896bf18d5a@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ovJzUgFtT1ELJEXfCDjJ-snSSMCmJb1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX7ZkmRgph1bn0
 uB1yANIBCXfokRDjeAUngi4cJJkOJ42qeE39s/8RguARv/jWFy6T/8pHnGTPbl9it8y2PSvoKwH
 0qEycY2L++NZrWj8wUOhqeUA2GyUEYvRegb8f3MZrGM2VCNuBVUveM5nmNUbF7I+RkvIgtmieFL
 FEQeeeOz08hHfDj8R1NctJDG2cOcx0bMp0obLY+Te2zG3yzlRlXAqk3fIOHMEQsaLp1TrwYMIHV
 CcX+wqrAxLaLgUFFcDhpTaE9LdP5a8ZhWiBNmAEmn0Ew891DQ+g7uOYmlrV+bhTXMAMDmVkLHk5
 hoWNxgITgofKdSB0heV8/E6DbUflKO1VG/7v6p9CTZjD4ET8QlYY1OaSKWqtt0E6zAl6OjY2583
 o689GbW731hZlLhD3W58XAxHnw1Dgw==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e389d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=gTkJHdstRq_Xg2VDakwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ovJzUgFtT1ELJEXfCDjJ-snSSMCmJb1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
> Add a node for the Dongwoon DW9800K actuator, used for focus of the
> ultra-wide camera sensor.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4e0ee5fc409fe4ce6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -627,6 +627,15 @@ eeprom@50 {
>  };
>  
>  &cci0_i2c1 {
> +	camera_imx858_dw9800k: actuator@e {
> +		compatible = "dongwoon,dw9800k";
> +		reg = <0x0e>;
> +		vdd-supply = <&vreg_afvdd_2p8>;
> +
> +		dongwoon,sac-mode = <1>;

This property exists, but isn't documented (you need to extend the bindings)

> +		dongwoon,vcm-prescale = <16>;

This property is neither documented, nor consumed by the driver (it may
or may not matter to you, check against what your presumably-BSP driver
does with it)

Konrad

