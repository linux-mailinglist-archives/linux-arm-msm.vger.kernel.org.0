Return-Path: <linux-arm-msm+bounces-66418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48156B10136
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 313481881F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 06:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C3D217F55;
	Thu, 24 Jul 2025 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDqeVuAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB6186E2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340347; cv=none; b=gxt2Y5xARxwU5RUN4Unq7J5OigYLipUNTyjwHmF+NWokR3gwLRORXMFDSAwXlqicd0yPORU5E82NZfJNP0RjzRjrzALT1IOm9nNx5eHDLGiuCHc/PZPuFyRBS/J0MtT/X6gByWJ2dsgvXISh3W0cN9eXhuzaVxhXDELK0LVUTqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340347; c=relaxed/simple;
	bh=+yILzwFo/vLcC/23zbY4nvnSyr41gpPHH0cSaLYpt1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0+oTdCWXMiOjm+4kKAG2m2l+WJfvZXeAFGPzKkkRcAywKlQTLtG2Wblv0z9Z2rYy2YKJE9qHUz10LF92i/SuzSB7aNjJq9/1Uu7IupOfzTPj0EEPayTre6VX1GF4oITNEIU/tloxJbfFSfxDI1dWVbXLLC3F8m63I4BxLI/0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDqeVuAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXR8h001556
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJLV9y6DAFvprSCjH4CLC3U/qcxOb+AXlx3u+EDpR9E=; b=FDqeVuAH05RgmGV0
	EoJh1q4G+gwLO3u55Iy5+Zk1puce159J78ZZ/N2qBuQ+QNDSsiIxRB2lFJGQ+bOF
	xX7kAgcUOaKYgvZ9XIq8/+urztEY2C9ZlIql7ncZl2a1tKGI0VYOXmfTEhXtfMQ6
	fDIa2VM5ttsFJuEXxldqj1xeIp6IVkrI5xtDWB1Ugp+i+hlZm+LsYxggJ1EAcEEK
	4e+xrzRtyvzqu+wPyrZ1UqIJtA5+RpasbDGSDPhtUg/foYUwkgX+AU08Cyg/X4CE
	W+XyESCWQ5kpG1r9ovgMfDnCdZsnrgtAyjYZ5ScNn6BmtPAgfoJdx4UkPctIs/rG
	N25cJA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ueah0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:59:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235eefe6a8fso5292265ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 23:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340344; x=1753945144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJLV9y6DAFvprSCjH4CLC3U/qcxOb+AXlx3u+EDpR9E=;
        b=L/gyAfjUw4LYmZR5E6OvrQU//Ybt2YhTWe3aLiijQh2441XedHdChTDODE2PDqHKex
         2Rzb8KRm1SRbsW/YCkC/y+AShYjO12hbd7SONLlSjop57JVaYL+l3DzJtFGPlbB+fIHB
         2TBRLU2McyJw/00zNXX3FtHSnmN3jyk4JPWrhacRH4RM78vuky4eG4oqgIWKV+2jbyLn
         Go0YDjEfhJr70hjtf711GsqjsIWEaQ5G3oicgTa3fAV3ep5+qzJmdngHBbAG8qMOHOS8
         ZkNO90DMsehlqtkBBrjJGQoFTbnlSVBWedwZXRdNbp7n0ngVXwmpafjK9AQ4ACLwp9p/
         gQOw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0Q7WtHBu11ZTkQ55bDkynHASPbDBbZzInW2sCeLX70TV4Xbv9eonOh6XWbZ4V2niLaUIYaZ4cuCnASoU@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGRjb1Jbtf91YOVP9+hcbIaSe1Ogt3e5mkICoD6yOghF9kQMT
	pUzorLQQZVxtqWhAZNEgoLV/XvRN+qES1cvB2jVCN6BURGPkmqETa+dyfvci87BuS64r930unir
	k2+h1CiVdfGIuOnkID4hn+cjOzGpJjdeb57DKN/tM+9TgiwtiTndiC9Xama+y8/RJZfrj
X-Gm-Gg: ASbGnctzJP01tmBoRLMnPR5sapjfLqLDX1DdeKrRQoNu5IUGomRPiSlQsGFRQlUAnN7
	x3zm3A1vq5lkEHp7jiS/ZTcNEQJZPJo44cHmc8TAPa59tOQtGXRtCq3WAe0fSPC4qPPp6OR5tEE
	H8C66k0B+hce6xw9whK2waLFJOl+fz4OHbvh57zad9QfI7c0o157AMNt0NRNKYmTZ5qMebe8kYD
	vy6YIKymU7UTqS4fZmOv7REDCBiTdj5xGHkHp9iPW6u0PPybhduBTuzU822oAj5nGDiV6CFybdq
	eo+WFrgOa3Hq2lA1dn8t71IVUjUFhbUAvwel0OyFPrb+jin6i432KDglX6CBPTZxqKzcDcygBLy
	BGDUn54LMjDcspaI=
X-Received: by 2002:a17:903:2445:b0:234:9068:ed99 with SMTP id d9443c01a7336-23f98203dcdmr87152705ad.24.1753340344288;
        Wed, 23 Jul 2025 23:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKcm8oYoOanaAm12F5fP1f1haS3gxOMzehTBR38a2e8qMjyLPtKfGSbghtnx0VPvQBOw39pQ==
X-Received: by 2002:a17:903:2445:b0:234:9068:ed99 with SMTP id d9443c01a7336-23f98203dcdmr87152395ad.24.1753340343813;
        Wed, 23 Jul 2025 23:59:03 -0700 (PDT)
Received: from [10.110.12.211] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bbee6sm7918125ad.102.2025.07.23.23.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 23:59:03 -0700 (PDT)
Message-ID: <2949c950-71d0-4560-83c0-d49bd860b387@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:58:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <7117b159-6743-4db3-9ae5-1cf4ae051601@oss.qualcomm.com>
 <469e2e9c-b950-4ecc-bfa9-82aa9178b65d@oss.qualcomm.com>
 <fym6hgenzzpct3kbat4iz42o6nyavfkrp6z5jkf6vjfnwo2u55@of7pgzoxbgej>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <fym6hgenzzpct3kbat4iz42o6nyavfkrp6z5jkf6vjfnwo2u55@of7pgzoxbgej>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6881d9b9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gtneBsfJDwcf013Ok-4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA0NyBTYWx0ZWRfX/wn+RZXt2YlC
 dzHRsMSOxFytmeyeP2Dz2lwrjHGAjBBdGmeNPBYCHFMsA6xO4V9ZP9kwnTCORVNFIOjLW7YUzQr
 ZJulgRI00rdzIzoiIsexjfEF8FPaT7zlkZhJNkT47lajVf2NV9LlR5y+C+2c2jlC3gXdDp5jtMU
 NhPgKyw7pVqrD0inkh9gQbjyaiEBNbtjzUkr6Ijov8Xv33Ns0drk5AfjLPkwEh7aFEyjQZyXA5Y
 ZjAtU9oAGCCYTg7wq82nV98Khb/jdheBOQV/XaUTLEXJoN9WEMoM6gTakEqBF7REMT6QQmrzHbu
 nKLQY8LowUEUGsaqu1WevnNcFvY7Fvs+mSDVX+knuc2FKAzjEdL9ggtsaI+VGW3nco+ZUFQ7re5
 y+b8spTlNzThoIvf3WGt4qSnnr1U+rWzCF2r5KliXkGhCvj2SQFAXQOC395vC/UQTbwUVf8B
X-Proofpoint-ORIG-GUID: VnxfifyfHs46z5lwwhrCXRLoPulP5sZw
X-Proofpoint-GUID: VnxfifyfHs46z5lwwhrCXRLoPulP5sZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240047



On 7/23/2025 7:31 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 10:02:36AM +0800, Yu Zhang(Yuriy) wrote:
>>
>>
>> On 7/23/2025 1:36 AM, Dmitry Baryshkov wrote:
>>> On 22/07/2025 18:58, Yu Zhang(Yuriy) wrote:
>>>>
>>>>
>>>> On 7/19/2025 6:13 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 07, 2025 at 10:51:06AM +0800, Yu Zhang(Yuriy) wrote:
>>>>>> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
>>>>>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>>>>
>>>>>
>>>>> What is "existing WiFI/BT module"? There is no module in the DT. Not to
>>>>> mention that PMU is a part of the WCN6855.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135
>>>>>> +++++++++++++++++++ + +++++++++++
>>>>>>    1 file changed, 135 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>> b/arch/arm64/ boot/dts/qcom/qcs615-ride.dts
>>>>>> index 011f8ae077c256f079ce1b07720374a9bf721488..2df8e7e3c1d3b6d6353a6753b8387c7411edd927
>>>>>> 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>> @@ -18,6 +18,7 @@ aliases {
>>>>>>            mmc0 = &sdhc_1;
>>>>>>            mmc1 = &sdhc_2;
>>>>>>            serial0 = &uart0;
>>>>>> +        serial1 = &uart7;
>>>>>>        };
>>>>>>        chosen {
>>>>>> @@ -47,6 +48,85 @@ regulator-usb2-vbus {
>>>>>>            enable-active-high;
>>>>>>            regulator-always-on;
>>>>>>        };
>>>>>> +
>>>>>> +    vreg_conn_1p8: vreg_conn_1p8 {
>>>>>
>>>>> No improvement. Please try again.
>>>>>
>>>> you mean should be "vreg_conn_1p8: vreg-conn-1p8",right? I'll update
>>>> it,
>>>
>>> What is the node name for the previous regulator device? Anything
>>> preventing you from following the pattern?
>>>
>> Do you mean the prefix 'regulator'?
>> I just want to keep 'vreg_conn_1p8' and 'vreg_conn_pa' the same as in
>> sa8775p-ride.dtsi, because they're using the same module.
> 
> That's a different device. Please use the style of the file that you are
> patching.
> 
Got it, thanks.>>
>>>> thanks.>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "vreg_conn_1p8";
>>>>>> +        startup-delay-us = <4000>;
>>>>>> +        enable-active-high;
>>>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>>>>> +    };
>>>>>> +
>>>>>> +    vreg_conn_pa: vreg_conn_pa {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "vreg_conn_pa";
>>>>>> +        startup-delay-us = <4000>;
>>>>>> +        enable-active-high;
>>>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>>>>> +    };
>>>>>> +
>>>>>
>>>>
>>>
>>>
>>
> 


