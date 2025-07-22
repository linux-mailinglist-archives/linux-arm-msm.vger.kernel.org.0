Return-Path: <linux-arm-msm+bounces-66148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A93B0E2AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451FE564813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3681527FB26;
	Tue, 22 Jul 2025 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6Vct6Px"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BF27E7DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 17:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753205823; cv=none; b=lJkR7Ow9YU++WD77rHdHrtFQ/jdSF0wHCHl3KlYQoVesObSpbEUC2xWImqM6RzVsdhBdqhuzhKsgUINenhYMKMdVEv6g+6spJysq5ucgeF5ghL6ZG5MBR9wHO8cXb9gIXnaF2YoZdMdEcp/jW/GnXB+eBaKo2sb2QjQFD11EgpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753205823; c=relaxed/simple;
	bh=JjE0VAUs/J0+dJNz1qos9yiUiv2iZz0R8XhEsFlljuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALD4aDPsJ7F85+ubHvF1GY6xBza4jr0h+W50+Unm+YWbUSUVV02Uabu2LGmipEHe5mxt3/lvkUwgmcal7RKaz+YroMX517PWxRMfrwGdvzFrZkqxQl9rjkXv4Rzr3jTDrmpYcOjO5aU4gUhS8POsSW3LtIKfg8Qvc4DlcoFPJ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6Vct6Px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEivMq018339
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 17:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bU7DW70Vq3fqTu0IqRRaBc2dO6wODFlMeXGfXQWsOEs=; b=L6Vct6Pxe+j+SCds
	VltgIQhYP3L0YIik4WhdDiqM/EfJio6JtRfTKJI8KZNpYnxVROyBPt0OdtGg1aXI
	rvTB3ZJ3fDiA3U7JkzDtUJvdt/DLZDtEqmM5qp5bd9QDUjcpdawlmFaQYdoyFLaF
	h5XyS4up7nMObmESBNhFKW58lQQm49Qk5qU1lu/vtmLeAE3kHdox81PE5p7TF0zU
	pb2m1wdi3Ah5J5N5NAD5umZou14kF4Ay7yoFN8XN1KnPDRywd/6wmJJRpqf6+dR/
	i2m8SpStxoWhcd5PDY870tj6Na2CUUFUA9ELA7oqrvICjAM3nkfDDy+y+apYPWZh
	jgwFbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na0rgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 17:37:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e36f4272d4so426493785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 10:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205819; x=1753810619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU7DW70Vq3fqTu0IqRRaBc2dO6wODFlMeXGfXQWsOEs=;
        b=SDLIMER6jMmwPeoNJfh3A8tWcm6bsYs1AX/6+e4GHxPEM1u5pFXhzP/oeRRWlLKD78
         SHqPs15I/CdySvDe4DFJVnIzN4tbNugaooDDtVfNWyIP4Ln5EOHK42B1pqh/bb1g+Pyr
         mKiY/NnjGFe3DHjgK+lsUOeNvnfchNZAFU5jBRJtuDcCG00V63TCvkcA+Ip5atJaJALe
         gdSMdPLFfgwyxH37CKe/rwPdvQenqGMHgKANlY7EBLx//6mri1QioLJZ2XSoQX0Ud7z6
         +SpMHbK0VnTRX+WjvemduS9Tt67KfqUpj2FXCL0Gq85z83jeYmECo4Ou6aHQCISt2Jnp
         V8KA==
X-Forwarded-Encrypted: i=1; AJvYcCWwsxlulcmZ26b3vOTFMd9EwsZ0R/fnAp5FU934HcQ5GXYn+F09NAYhs8nqxiIQPsZUrIW4t2outS9ow+Uh@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbSm1XrHRyYjFqWL4r9KmuDkE5dzn+ZJNKYIusrJy+wNi7btz
	0ErGt8nFmA68JJphPtlTFHDqk+aKocDL9Pk6lcv0P43KyGJH21XQ/xeRRcxeTWZpUDvBpuR+sEu
	OwuTGNe2dm/33/DzLBqRmpoQqP1n/DMv9+vzw4yk/9ARX80sq2IjvVTFaS8BNQ14vGB9D
X-Gm-Gg: ASbGnctZ6QmfQwqdWSlrrbQCfk2+/1hrCB4hVodKpmQP1BttjsDY3Srno59uHQu06gy
	6Cc9eXXrxtq3GONm/z9VqvgNvxqWMqiYf79QGuPjWfh+vPXa826/7M6WsuKJ1tEM1iUgRYmD8li
	qKYaOWl4aM2RshQyy7v28qbeAfyEkMj4ftD3rQY/2mc5Tnx40+f2Y+iA5asEDEoCeS/HKaR8JnL
	1tYJ2un0HDc5oU0m4vgIbjvhYeu903usC2paxgrY7OmdJmGEthZfiCk8+szsBhQbqwJJrDw2t0Q
	ER/vPQcEd+SFYmR8OK39r3xU8S5t2McvM00IZG7W6J+s5f1Ab8B+hVtrX+NRMfRp3SuF/nH9yp0
	M8CAfpiK8FXiXEhisdu7iDppJb5+2zBAhxZDBL+N/qvtiFRZ0aVDmRqWBX5pkMVMSZZS06Dt47J
	GmA4GJLLSQSAsJFg6tOg==
X-Received: by 2002:a05:620a:6ccc:b0:7e1:872a:50fc with SMTP id af79cd13be357-7e62a0e0882mr28111685a.15.1753205819224;
        Tue, 22 Jul 2025 10:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAhb4mNssqROGibAAgQdqvjUpNDDUd7RpqBoP1UdVvRdfzRy3DFb+cKvDrEktkeTKmlmkPew==
X-Received: by 2002:a05:620a:6ccc:b0:7e1:872a:50fc with SMTP id af79cd13be357-7e62a0e0882mr28105185a.15.1753205818594;
        Tue, 22 Jul 2025 10:36:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:119:87b1:24ce:1d7c:ed1:f2d3? (2001-14bb-119-87b1-24ce-1d7c-ed1-f2d3.rev.dnainternet.fi. [2001:14bb:119:87b1:24ce:1d7c:ed1:f2d3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31dafffcsm2000022e87.224.2025.07.22.10.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 10:36:57 -0700 (PDT)
Message-ID: <7117b159-6743-4db3-9ae5-1cf4ae051601@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 20:36:55 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
 <20250707-615-v4-2-1a2f74d167d7@oss.qualcomm.com>
 <smnw6whsw5todddsoveeanohcaesfip27udzkbw5wk5dwlztzz@ic3xemwrbjwg>
 <a63cab56-2d32-4d38-83f9-911561807e9d@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a63cab56-2d32-4d38-83f9-911561807e9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oRieIkVJczT1w4VxhTGWKYTZdBraDql8
X-Proofpoint-ORIG-GUID: oRieIkVJczT1w4VxhTGWKYTZdBraDql8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE0OCBTYWx0ZWRfX/KrGICra9QvE
 kSadn+d5q+NpljYbrXYEv71W7PDDQnPcaTn9eXX+EhshN1chuAAm1v30LxhLpSXt9k/osvIqHgS
 cpd/rUWGKKRxWXT1GLT3gzbsAPJdcAzRiSZgytg27iJY+s4IzIaAU9cqx+yqbFxHol9BfadHYEo
 w92lBYxo6oMyqJWiocJiw/a/HUUZ4KD7kPxCBBzjM85s0FsFYp0vCt8fDMLR66XLhYpB4bNVXg9
 QvD0tBP+R1Y4Es7CYjPmXr2gTq+wMRzXLNLvF5z7L60K1LeU5CVnL7MmB4Kb2L8oOpJ5ioFNnXO
 nJKOJR4at6Yjet/gBClJrZ+FTNuwiLtzrE4CAlXtrdX/HCQ5y5BvE/krpe3MA3xAknTNHrcjzsy
 kpWtRH8Z6/nKtS3cOvRN4HVFdM7iaMJmofvXMLsBuvBK0EDfOA+gVzN7VixAyXMNFHj1zPZu
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fcc3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=yfEDxQUIism5sP7DLRQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220148

On 22/07/2025 18:58, Yu Zhang(Yuriy) wrote:
> 
> 
> On 7/19/2025 6:13 PM, Dmitry Baryshkov wrote:
>> On Mon, Jul 07, 2025 at 10:51:06AM +0800, Yu Zhang(Yuriy) wrote:
>>> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
>>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>
>>
>> What is "existing WiFI/BT module"? There is no module in the DT. Not to
>> mention that PMU is a part of the WCN6855.
>>
>>>
>>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 ++++++++++++++++++++ 
>>> +++++++++++
>>>   1 file changed, 135 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/ 
>>> boot/dts/qcom/qcs615-ride.dts
>>> index 
>>> 011f8ae077c256f079ce1b07720374a9bf721488..2df8e7e3c1d3b6d6353a6753b8387c7411edd927 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> @@ -18,6 +18,7 @@ aliases {
>>>           mmc0 = &sdhc_1;
>>>           mmc1 = &sdhc_2;
>>>           serial0 = &uart0;
>>> +        serial1 = &uart7;
>>>       };
>>>       chosen {
>>> @@ -47,6 +48,85 @@ regulator-usb2-vbus {
>>>           enable-active-high;
>>>           regulator-always-on;
>>>       };
>>> +
>>> +    vreg_conn_1p8: vreg_conn_1p8 {
>>
>> No improvement. Please try again.
>>
> you mean should be "vreg_conn_1p8: vreg-conn-1p8",right? I'll update it, 

What is the node name for the previous regulator device? Anything 
preventing you from following the pattern?

> thanks.>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "vreg_conn_1p8";
>>> +        startup-delay-us = <4000>;
>>> +        enable-active-high;
>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>> +    };
>>> +
>>> +    vreg_conn_pa: vreg_conn_pa {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "vreg_conn_pa";
>>> +        startup-delay-us = <4000>;
>>> +        enable-active-high;
>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>> +    };
>>> +
>>
> 


-- 
With best wishes
Dmitry

