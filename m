Return-Path: <linux-arm-msm+bounces-82493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF5C6EDB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 239F03A2B0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E879359F8E;
	Wed, 19 Nov 2025 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dW1E7pra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCrkhpUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2543563D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557840; cv=none; b=i0VnvyOLMq3u0xAI3RQDs1EfedskDi7YbzOJOfyjPiHZ/Fc+lPOcuB7YSLcKbnUUlkPqrFGwDlA7tjiXpq6f/7/6O1K8f1Gd6NhIHR4wi8VVqftWkEO4s+jRO5X1Xs9ILsGOHAybRGn3ydd7bu4ZDkLnz7u7ISdFC4Kg7K3haxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557840; c=relaxed/simple;
	bh=XrDLVF0hdBkV83ksSO/kiDKCKfNYl8BcFLfDLZf0ALk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vlv+D7LPmObwO//LJZSpLRFSVasW4AQbHV8q+bIUjnP6KUkcJXb9VBiFeNF29fm9A7ZEQJROEzahf4Ek3U/gPIVjPjbcG9paH6U6rfdVlL7vcP7GwqbQJMdxKBalYVn2p1jBkKHu2mFKrVEhcYY929rZ63r1Ub2j/345LkrTgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dW1E7pra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCrkhpUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aCsV718640
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82wMIqlPGNNgih/lMY0DCJQqqS6YcUhjEj+rPxqlHpA=; b=dW1E7prav8zuTRjn
	h7SiYUoEwxnZ8RUsEdRdhahiDnMp1eM0lWbQ8TENAmlDL3d8otU5NEkFM/7Vs/rQ
	VH+3wWPqKW/9aTxsYwet1+z1/1CzrNUgpIg+jd0xyZlt8CfxRzSK3jnKuiLWZjCR
	8IK5K2f5CvrpZdV/Uiq4k8hJ8brQL6vQLWNhxgCXqaGXNlcOneD7Gvsw8hya+b9D
	pge8e4mDxouQIXCtmASP8DIvNUJn8XnhEMF83sQEVHhp4PUyVBLpNjfIXyobDA/I
	LHX39R/kInmmUXXlUj6rAWC4LKrzmtV5kfHElP1/rGIlsMItwwJFbEWATf7fGPby
	BdhR1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0rya1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:10:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso6666649a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 05:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763557837; x=1764162637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82wMIqlPGNNgih/lMY0DCJQqqS6YcUhjEj+rPxqlHpA=;
        b=DCrkhpUPvWqbIxhr9HG2vS09KjLuiTkcYIAD8uD6rZuzSLqeJ5zuNtsmYxR6YWKrhU
         2A7LTsyWzvIoDj2o3RoK4GLhuvaIHIWft/VV/0FfNY96dcIeObfj8dA0YCJ0mmJN8IZK
         2IRj83/F2K2Mt+XOIHC38qNA72NVfNqylob2UIyU8TFydisUJ7PfFb8sccq5gC7Vuvbk
         okB13gT2F4vHRhKIDjueu7tFR63kWMBnfeg0GE6ypVeYw/H44WaqMb5OoBRjTBTL6mmi
         EbUfhJtyIRVJUjTx3R98r5wr+udOlzfn259J2p+/rPtPPCrKzvo0K716xt88p3ei6h+T
         mt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557837; x=1764162637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82wMIqlPGNNgih/lMY0DCJQqqS6YcUhjEj+rPxqlHpA=;
        b=MX+PJ8bBcq70Ruiga/aLOhDz7T4JozIxXZucFOmQiJ78Qy2ptR7QpjnZVbzOkyS94V
         vUKczGADUBa+EgB9rK/S8qaf+WpkTpzpldsp0M0aIwChSypo1pkfkFET2pfvGg1hovl+
         R14q3MJnpgXDRGIpLE4baX+w+JziQtmSHSAVAPjOyGwvmYoFNA74recPoZn+3QdhkMAn
         7lAckW7oN/gZX1DfQc2Ke4IvRSQxzOJ4HQh8aIG9PQ8MbR4/WFqr5aygmVMX/p8ufecy
         vC2NFUm6JdNiPa9mscF/S3gsCLYQZ6/rRUK3J0CaTGfZVLBIzYJHfFg7KDFp0DXqrq3m
         x8UA==
X-Gm-Message-State: AOJu0Yz0qNh4GtpaEnWJjIik4DQQ+tjKzk1rNUkcojPqSII25UaKH6HK
	fzXAuQDx5GK40z5E59mejMis2WYa23TYnbsSsvVTYZiwDw8hfkF7tp/Xy606HoUBeTr9EHuloWk
	YSr3X5c1UQL6VrupX3JqPVh4LX9WOv/5+bYIiaFJhwhlhkD0Bpiuf8xT8WMZTVJAx8dez
X-Gm-Gg: ASbGnctk1M6SSmciC9Gp4PV/UsWnpFzYPmyz+WCuyc+1PJiMY9O38jllF9/gkQxXu5x
	LseJYqR9K40qNsP4Q42zryaFxYAAG4gJbX/zu8QahLVn1/MLTosC4+cwMWqLDgVS7RZi5/tNYz3
	3s1OHq4b9PCSOHbL7iLGq5QXOvdSV16kg9GODk7iBVwKoX5b7JjsdfmeT0aDTVPdzd8Bn/TgX6d
	Ijb2ZtdOoDRLac+VV2941XmQHUMW1tBPGYlk+ynppLFd6FtHrUZbdZKVRZtaSE3r3920zkzrDPP
	Ognq+AbWndtaWX8E4y+MzKp7TqQGNJjPurUOdAHZr33+jakoX35Y9iUw8YpK2yjHnT3BposHcRQ
	zCDpsHJmuNLmAHk64Bl5EEs9AViOn1sQOR3bbnCPUs/rKNg==
X-Received: by 2002:a17:90b:43:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-343fa74be1fmr20991255a91.33.1763557837200;
        Wed, 19 Nov 2025 05:10:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfLnU9udBZsj27CHa3Apm+yWyXzude/KlvIWUon4gLSj1GOLNmMt3duV3KJHFp8HIDrx3baQ==
X-Received: by 2002:a17:90b:43:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-343fa74be1fmr20991223a91.33.1763557836591;
        Wed, 19 Nov 2025 05:10:36 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251ca3e9sm19787700b3a.29.2025.11.19.05.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 05:10:36 -0800 (PST)
Message-ID: <c2d66f05-d6a6-4838-bda8-7acf910e8600@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 18:40:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] arm64: dts: qcom: glymur: Enable tsens and thermal
 zone nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-21-24b601bbecc0@oss.qualcomm.com>
 <86492536-c14d-422c-add1-a6c60a7cb2e0@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <86492536-c14d-422c-add1-a6c60a7cb2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwNCBTYWx0ZWRfXzggiUU/7F256
 tFZV7My8tVq8dCS1eZaIBGLmLp0QUo7KYVKbhJQiojG4OGnVGCJ08o8Ec3BXXQEYgjgBQC6m7lZ
 vfOCh2DnCK8rV+N+ZzZConLJqHwuRPbHwny62e7/PLBR9IXpY+FL3sFiNO5CXbFUWtYnErD2DK/
 Qtcpq3q2VhQJ3gZr0gvaKjRMcwUafbfK771AwU9UK8Q7yKfL93jAhzOJdDutbhcZ3dWhgwh4GCY
 BcqGkd9RlWXQKr6uPMVF8JWqcuUwyo5PbcU+Y//PIw8wIHOwvnZr+Rht4X5xn4q+490CD+a9yti
 6mDuTABU5K60TjXEAx1WxY7CbsPlPsyE6mHhwWdQC6Imk8FpGwbZywoLzr7dEFSKjIZluERBizD
 WakINPV4m5/ZBPHpOekfYP6YE2az6Q==
X-Proofpoint-GUID: fZ9ffM3T80CzWPseeRHMM0Jkyqu0E95X
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691dc1ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1UUbX536_rBP94QpSC8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: fZ9ffM3T80CzWPseeRHMM0Jkyqu0E95X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190104

Hi Konrad,


On 9/25/2025 4:45 PM, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>
>> Add tsens and thermal zones nodes for Glymur SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur.dtsi | 1998 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 1998 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 17a07d33b9396dba00e61a3b4260fa1a535600f2..986dc385200029071136068ab79ff8dd66d5284a 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -2790,6 +2790,134 @@ pdc: interrupt-controller@b220000 {
>>   			interrupt-controller;
>>   		};
>>   
>> +		tsens0: thermal-sensor@c22c000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c22c000 0 0x1000>, /* TM */
>> +			      <0 0x0c222000 0 0x1000>; /* SROT */
> These comments are not useful
>
> I noticed that some patches use reg = <0x0, while others use reg = <0
>
> please unify them for the former
I will update in next revision
>
>> +
>> +			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
> pdc 26
We don't have any usecase to enable it as pdc interrupt and don't want 
to wake up from sleep as it is already in lowest power mode.
>
>> +				     <GIC_SPI 861 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <13>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens1: thermal-sensor@c22d000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c22d000 0 0x1000>, /* TM */
>> +			      <0 0x0c223000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
> pdc 27
>
>> +				     <GIC_SPI 862 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <9>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens2: thermal-sensor@c22e000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c22e000 0 0x1000>, /* TM */
>> +			      <0 0x0c224000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
> pdc 28
>
>> +				     <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <13>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens3: thermal-sensor@c22f000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c22f000 0 0x1000>, /* TM */
>> +			      <0 0x0c225000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
> pdc 29
>
>> +				     <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <8>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens4: thermal-sensor@c230000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c230000 0 0x1000>, /* TM */
>> +			      <0 0x0c226000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
> pdc 46
>
>> +				     <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <13>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens5: thermal-sensor@c231000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c231000 0 0x1000>, /* TM */
>> +			      <0 0x0c227000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>,
> pdc 108
>
>> +				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <8>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens6: thermal-sensor@c232000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c232000 0 0x1000>, /* TM */
>> +			      <0 0x0c228000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>,
> pdc 109
>
>> +				     <GIC_SPI 815 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <13>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>> +		tsens7: thermal-sensor@c233000 {
>> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
>> +			reg = <0 0x0c233000 0 0x1000>, /* TM */
>> +			      <0 0x0c229000 0 0x1000>; /* SROT */
>> +
>> +			interrupts = <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>,
> pdc 110
>
>> +				     <GIC_SPI 816 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors = <15>;
>> +
>> +			#thermal-sensor-cells = <1>;
>> +		};
>> +
>>   		aoss_qmp: power-management@c300000 {
>>   			compatible = "qcom,glymur-aoss-qmp", "qcom,aoss-qmp";
>>   			reg = <0 0x0c300000 0 0x400>;
>> @@ -4611,4 +4739,1874 @@ timer {
>>   			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>>   	};
>> +
>> +	thermal_zones: thermal-zones {
>> +		aoss-0-thermal {
>> +		thermal-sensors = <&tsens0 0>;
> You need one more \t here
>
>> +			trips {
>> +				trip-point0 {
>> +					temperature = <90000>;
>> +					hysteresis = <5000>;
>> +					type = "hot";
>> +				};
>> +				aoss-0-critical {
> Please keep a \n between subnodes and between the last property and
> following subnodes
I will update in next revision
>
>
>> +					temperature = <110000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		cpu-0-0-0-thermal {
>> +			thermal-sensors = <&tsens0 1>;
>> +
>> +			trips {
>> +				trip-point0 {
>> +					temperature = <90000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip-point1 {
>> +					temperature = <95000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
> See:
>
> 06eadce93697 ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
>
> It also only makes sense to keep "hot" trips for devices where we
> can actually apply some cooling (e.g. the GPU)

I will update in next revision

Thank you

Manaf

>
> Konrad

