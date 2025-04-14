Return-Path: <linux-arm-msm+bounces-54200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52CA87C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49F8188E3CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E3A25D1EC;
	Mon, 14 Apr 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYG2sVfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D887261580
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624431; cv=none; b=nHHm2HI4KpXtvpJGrhVq//wEzwUZTDNV/bXT/MsHnx61y2JnyMJ9DWZ8uuTzE3B0HZmGoAETw3A/OI5ZNL2NHh3M11vlruDc02eeMFlpRlT/lRPhr32AyRfZIAv/HtePZCMlRbqr+sl/54RYIe1j/4JfAT+tDk/4HlKweRNM5io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624431; c=relaxed/simple;
	bh=fE+JE5cENnrFnAtimgq9nSWmgLL8B8MGJLAmn4zv+vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CF9Tr0JaVyHRjvDRAswow9UNnX85ayJRimSdSCShqrp0HqQ7+1VVjFKCd8VFBMimLqg65p2cWP13l4TLbuWUrYePp0xBIqhqgW36W+DfuP0+uwUdnHxcny+zdMMPhtsUrSHPwzNafpMth64aW9cofPvMDQrQ58fPov3Oq1nyoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYG2sVfB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9AO85004925
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdclKkXxFTt0I2OWvs6ezf5xV8oX2spytT768VYcNQo=; b=UYG2sVfBCarTcUZ4
	Eau8ZJPh1ckqR0jc8pUV/a17Pw4W/yl5434cRscP+fR8qBEYQ31C8hPMaenrWdqA
	DCCex1srCikdUyb0+VT1Yymz8pAwWoQ9Hcrst+3EsjsdKwJqj92swyTFWd74xDox
	5LubjTS27sBK1zuOJRQyK9mduRuJObMIEHU4Tho2DT3VBI/ACryRgUP136AZNzlP
	UpJ/gVUGMD5Wz4v3GNDJQGQtH8K3ioxwkTfhJ1TQxDhonRnS4Q8b8bZQS2OayyH1
	nHKntVEOgCfbldqpfcPGGAYlIBB+LobUB8Mgy517LUbFeGW5HZiv2q/Q7KQZtMiO
	LCgg+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpky9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:53:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c545ac340aso32263785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 02:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624426; x=1745229226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdclKkXxFTt0I2OWvs6ezf5xV8oX2spytT768VYcNQo=;
        b=P0bckVTMJBiz1a1M5GEwpeQ4E0jKyyrNbVcZ6otv2xvgSWrKJ65jZKjw93KKNt3es7
         d5holIok/4stpF19plcp/1XeSeBgguJZCL1S2RL07HELGAKqfXmO7CrGmu99jZ0y/GDI
         WTE5211wcQ0km+ofnG+XqpnusKRKbBuNa0ZstGCh+nmXnfA///hv6c//lnnEWRJaSG2/
         cbo4i0LdIA7/FMorpzUHnFjDhRPnwtZan7yIkwZblx7Rka5iBJP8A1JVlc4Qzcy4y6W7
         8UwJQelXBfLMCb7pTLBvXrzRruEpb6nRJlMGIoDDozXTfXrh/2wyOgXdYICdf3I4/Nmr
         9Y2w==
X-Forwarded-Encrypted: i=1; AJvYcCXvKEHt6C6snX6oDJHAjtZz/KsWhms05FekR1LCFXF3yxQwzaEu2P3dRqjjA6EYASU3SoormN9SjOe+rvbp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/d5ODkXxeEfWmFF8B0sP3Iq83h+BK3RgHdKUDypqkmPN3iLZH
	L1mv551WZIdjFhBOQF5Q1HLBF5DZbr4I9qprlRglwpWYBDxYX5B2SRtcw/WuRmKIJWokcMFeVjv
	k7w+JjxZWZf15UXhzEtWsV11yut/nbKMANDKPdlKCZlPPFQpa3dIfTOV9nnwzR5Ty
X-Gm-Gg: ASbGncs1aVOiw9czqcXnuRSJfbA7LDNpvoY8iTV0JsTdtHQgfSQqs5FuBoSjfYbY16B
	weWZBReMSUcYrWD6fnRIL4r6ZOggWPqiNDSIeMkWGj58kScWTH0whVaJ9ZXnZX3t5z64q1yTdZn
	kGNtItR6apl0YHh75OQ9NjDhae63CBD01fsmiqZWuB3N3A/UFv65/1RWC848Bt/Uo+MnqLRxxro
	EjtPizNeOr8Wl6bncz6l5aWFV+WgvrLONckwDqdARCcEbpHqPsaXnRDRl89vdvi/e9wWNK/gEV3
	JwpMdmu2j1S6m1HSR15suCT5ubM16LpDBSxNiCSCQI5vn7/ZiAJBUgV5Dtv4AxAM0A==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr552037085a.7.1744624426101;
        Mon, 14 Apr 2025 02:53:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoXdqkcpaAerObGEK8HRnwc8WmDaStUQwIiHR1xvbhIiHbRhcZx7+Jtthf6NJhgUhOWtDZ6w==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr552035685a.7.1744624425611;
        Mon, 14 Apr 2025 02:53:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3513sm890098866b.11.2025.04.14.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:53:45 -0700 (PDT)
Message-ID: <2b889254-2847-4c6b-a01d-3626332dcb0a@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
 <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
 <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 40gBPxsS9KJdqUgNG5ko899XoBi86qEY
X-Proofpoint-GUID: 40gBPxsS9KJdqUgNG5ko899XoBi86qEY
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fcdb2b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PLlEqiOu4NsstTQGM3oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140071

On 4/14/25 10:28 AM, Gaurav Kohli wrote:
> thanks for review!
> 
> On 4/12/2025 5:13 AM, Konrad Dybcio wrote:
>> On 4/10/25 4:00 PM, Gaurav Kohli wrote:
>>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>>
>>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>>> ---
>>
>> subject: "arm64: dts: qcom: qcs615: ..">  arch/arm64/boot/dts/qcom/qcs615.dtsi | 281 +++++++++++++++++++++++++++
>>>   1 file changed, 281 insertions(+)
>>>
> will fix this.
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index edfb796d8dd3..f0d8aed7da29 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -3668,6 +3668,17 @@ usb_2_dwc3: usb@a800000 {
>>>                   maximum-speed = "high-speed";
>>>               };
>>>           };
>>> +
>>> +        tsens0: tsens@c222000 {
>>> +            compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
>>> +            reg = <0x0 0xc263000 0x0 0x1ff>,
>>> +                <0x0 0xc222000 0x0 0x8>;
>> Pad the address part to 8 hex digits with leading zeroes> +            interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>>
>> &pdc 26
>>
>>> +                    <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
>>
>> &pdc 28
> we don't want to mark this as wake up capable, so using this approach.

Why not?

>>> +
>>> +        cpuss-0-thermal {
>>> +            thermal-sensors = <&tsens0 1>;
>>> +
>>> +            trips {
>>> +
>>> +                trip-point0 {
>>> +                    temperature = <115000>;
>>> +                    hysteresis = <5000>;
>>> +                    type = "passive";
>>> +                };
>>> +
>>> +                trip-point1 {
>>> +                    temperature = <118000>;
>>> +                    hysteresis = <5000>;
>>> +                    type = "passive";
>>> +                };
>>
>> Please drop the passive trip point for the *CPU* tzones, see
>>
> 
> we are using trip-point 0 for cpu idle injection mitigation which i will add in subsequent patches, if you are fine i will add cpu idle injection cooling map in this series only ?

The folks working on qcs9xxx have made this point too, but I'm lukewarm
on duplicating meaningless dt description everywhere. I've asked them to
conduct some measurements on whether random default settings (that would
be preset in the driver and require no additional dt fluff) show any
significant difference - if not, we can save up on boilerplate.

So let's wait to hear back from them on this.

>> commit 06eadce936971dd11279e53b6dfb151804137836
>> ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
>>
>> and add a single critical point instead, see
>>
> As critical shutdown is already supported by hardware, so we are not defining here.

The hardware critical shutdown will literally pull the plug out with the OS
having no chance to sync the filesystem etc.

Please define one that's like 5 degC below the hardware limit, so that the
operating system can try to take some steps to avoid data loss

Konrad

