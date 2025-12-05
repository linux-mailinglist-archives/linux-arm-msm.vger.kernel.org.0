Return-Path: <linux-arm-msm+bounces-84451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7286CA7746
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 12:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FAE1302D299
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 11:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CE729A33E;
	Fri,  5 Dec 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0DTEAv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtCPNC8Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3530328B72
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764935519; cv=none; b=VDbdOcSOyKkVll7t+k8jd5OxF+rCkB9vvdWkJeRD4QHvKf63xECneZaATKlG+r+0FBBpAS878QI99W3EqdSWQr/JzVMjzs82fWjjr60QFZSJafbGv2GIS49Ipj0icNT+x/dZTaZPHMF0bXq1RRt50CAib9G+3ea23nEmxUT3KKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764935519; c=relaxed/simple;
	bh=4FEPkcmPQydsXKd3bDt+V/OwWf+GUJUg2bHRhHFd5JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bwqgjhh2wWTBTbiSWunhBQeNOaWkjKcICWIE46UX2Rm2HGMrqHoOEeLcDCTDdQAGyFFL+MGNk5OfnTAcH7Wdw6nBjBe5aCnT7IPGVD8rZz6dCru6je8qPpnL2njhyWuRvDSWOQtZ+WScf1mMM/z1gIWZQSkBUbDarW0qIZouj9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0DTEAv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtCPNC8Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AOaB0067787
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 11:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ3MnpeLSn5m9T5UfL7r6oeLnx6zH4HXGLQHnpAL93s=; b=b0DTEAv7S5bKt3pD
	9HLKjFgX1/R2PR4BzPITB+QLzNfXc3GHO5u1xDuD03ICJ7pD2TtVOFaxUl8hYd6s
	LIFcUdKmZ51Kv5q2tL4lx+AatgdC1pM9prSbp8Hdit2bnh7BiJIYD5RmSyUC0VJC
	vWf5qH5UF2SZOTxTDUON1faVKk79pXvsMf9YPvZIHq/4Z7RiadaWHRQT8V7z3Myj
	UKF3gxJvJfNi6ORYlxsBAO6Wrxbh2x2ZxtyYT6KbapLSbi3rJCshd7v/u+aRkS1L
	wWiIhlFyESnNpbFw4CkQyT56jbNJ51PGFvWOTN4gRDiG/yexity+1kcVEG+YUVEA
	OyY6Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm4g7c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 11:51:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so5039701cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 03:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764935509; x=1765540309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZ3MnpeLSn5m9T5UfL7r6oeLnx6zH4HXGLQHnpAL93s=;
        b=gtCPNC8QmkxyLCAfa6P3SzXP3vIIoSEUfuX7e9HXX5x/z3n80MVnDXQqqaSj00aKJK
         kn1ZZ0tE2DDKLhl1EENY2UHdkyYaDFE9WW2N/Xg+VhIx/mL7KrBfjjNiZatZdk/ykfpj
         j0xmn0rlWQ7YcpFa2W4kCZeNd7QvSaYs883vDP90faTgfQxxRoF9EEod5Iwz9JnAFEze
         zHvcKSNRkIffW2ZYx8mxMLZAcBBY1HgjuUn0aQCXz7tshxPV9d40PW69lhuv7eJwKAEE
         hi+By2C7Ks9MwsA7d+u8R+vJu8VA4ZV8uzo45rZHKiMwalnBXqELEQTzyXb1MPLK0tsn
         knjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764935509; x=1765540309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ3MnpeLSn5m9T5UfL7r6oeLnx6zH4HXGLQHnpAL93s=;
        b=rQKNrn1Pmq0wr7lDN1FAVvZeF5P0OPTSma32UCHDpP6RHpSPvILj6eMAV6ffCC974u
         CmMWhumyF2SzHQSv7+sxlwQ12r0+na+8CAKXu42Bs1MilRSmWLXxHfOFBI69E642yvdb
         ipjtvwGko9Lo0L6cqqHS72kYGWYogt2W1fYZO/E30cfqKdflMUQ/C22TqIcw7UIDwIXF
         uDvdSuNcRJwQslt70O6WlDffBYnFg5plS8IU6iDVynNn0sHjNsGJobSvLsh1xryj2yP2
         eFBtDRCtLyz4mwNeVa6SN9Haj36lGwRl1s15r7JAI6mBMNx0RqnuZJg0ePmmf5gK7x9b
         at7g==
X-Gm-Message-State: AOJu0YzvF9P4DjF0wUmvnzj09v5qy+Vbtn/7nk3AjHzlrDo5IZt2feVa
	jdRCJt5XPllMCfHONmZy6oYBT7ojvhlfB2r652c3SQ98kueY2/VeMptEyf8VH4wWY4EwnlRd0y9
	43zjiB5S2uqrEZAHKAiNwMg9DQniHwYkkyWWgltm4L8MymC8PJbJHHKfRu4bVYoPsOoU7
X-Gm-Gg: ASbGnct2Hja1FjhqhagKKsVHK7bODYfQyRF2dyGMQMvyxFkkmGmZ3AmfFkia8O9Lq3Y
	1uVcUz5XNVoUgbtEucvISjKDE6sVvSGMfL3pidl7W89CQLpDIyyTJR56nQStAiCjykLoTmay1ew
	qfyS4k5zcsPmQxV+1EBukp2ksOQuaAxATtOjQAQIer2+EtPSkNtps10MsPMiywkOXZ0YWQxRLa9
	ccVe/PpL6vG0XdOuyYPn/hX5e+1umXHgtJKLxCiPTQaBKvvUo5S/8mexO/nayMzRWc7GNEXQo5C
	2I635cYvbL+Le3PiUfLeS1NwJJFs94wdPGW8us60scIJnDLXhpaJmGl8OKCeas0ZT/vd+JHuRx4
	niwL1w2QSAiPa2vHe9QMkqv/NKjIyj7IWj9B5fypCAnxDKdWHvbPwc3xe1tc9ISLvBA==
X-Received: by 2002:a05:622a:8603:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f01f47c206mr58946531cf.8.1764935509399;
        Fri, 05 Dec 2025 03:51:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYijUVYYzQtkzHyt+odEkZ8dzACllEwFv8T03QtxlHJQATGGl85vBbzl0MqQcf2F48ONcYRA==
X-Received: by 2002:a05:622a:8603:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f01f47c206mr58946321cf.8.1764935508847;
        Fri, 05 Dec 2025 03:51:48 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445982dsm362646966b.1.2025.12.05.03.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 03:51:48 -0800 (PST)
Message-ID: <509d5d7d-b7a3-4dc9-b3e6-c3e52abe040c@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 12:51:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
 <20251121-battery-hall-v2-1-d29e0828f214@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-battery-hall-v2-1-d29e0828f214@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T92BjvKQ c=1 sm=1 tr=0 ts=6932c756 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69Il93vAAAAA:20 a=pGLkceISAAAA:8
 a=I6SptnUO25vYt0rnpQ0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: inORwQXpkjKidZXlGJPrwABlZJSBvE4x
X-Proofpoint-ORIG-GUID: inORwQXpkjKidZXlGJPrwABlZJSBvE4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX/5wF/zG8ChmM
 JEjj7S1DSx4YMh+KhVcci5VCxtsc2ogLLLAtaKIb4Q1Vj3cIpHChFYQOcA/zOBTruzbo6vRLq7m
 5XPEGfZWgC1c/GAyx/RZmuQJNBlCZJJ9dsFCn07Kl2J41W2f63nEiwqwvFB2uFHgcBwLU21tnmm
 Q5rOJTD3i2pIHTnzm3b/X0RZAM0Yg5jhTY7w8cqILY9kR8hHbo21X7PuDIHf2HM2Wd3I4+wuG/g
 zU2T+2zrqspxfpq8/WxwhEpRhPznWY2DpZAAarkMj7R4jT7acPvf9qOR4QW6uBp72EMJUxRT+wQ
 Whs4hsbLCQf45QC5OUnJHDtxW7OL7TJk+0SeycCxqVTmMZlNInkw4G48UbNoAfqB7pdU6ynrpSs
 sgmD/2XUBhokrHtvbzoWD86Bq1ZbHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050086

On 11/21/25 12:10 AM, Erikas Bitovtas wrote:
> This device tracks remaining battery capacity percentage using voltage
> mode BMS. This commit enables the pm8916_bms node and adds a battery
> node to track its capacity. Battery properties were taken from the
> information printed on the battery itself and downstream device tree
> for a battery named "nvt+atl_3000mah" [1]
> 
> [1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index ebb548e62e02..b58f0a04abfd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -20,6 +20,25 @@ aliases {
>  		serial0 = &blsp_uart2;
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion-polymer";
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4400000>;
> +		energy-full-design-microwatt-hours = <11500000>;
> +		charge-full-design-microamp-hours = <3000000>;
> +
> +		ocv-capacity-celsius = <25>;
> +		ocv-capacity-table-0 = <4372000 100>, <4306000 95>, <4247000 90>,
> +			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
> +			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
> +			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
> +			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
> +			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
> +			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
> +			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;

I was surprised to learn the binding allows you to specify the OCV table
for multiple temperature points (your downstream provides -20/0/25/40/60)

May I ask you to fill in that data?

Konrad

