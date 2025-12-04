Return-Path: <linux-arm-msm+bounces-84281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0923CA236F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CCE43028DB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D651B2FBDFD;
	Thu,  4 Dec 2025 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtezQRzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAUELtFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AB14EC73
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816850; cv=none; b=Xu67ylSC2O69bwNtgW+wiKfMzXCRIt3c8gPEikOn5nLwUcpwhefzGMk5YXnJ7KYOzWWg8r8sbYjFNLIdIJKIUBbwNSnByCxwPX6ziBGOndcvx4ZTdd1O0/o1b5OSCMIkPHR5N1bYEDamGRCjp9pqfTPdrC0hXoL2/HkkANCUFps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816850; c=relaxed/simple;
	bh=BmJIuFHsC7XXg/N++rwuXMZNeNYGRclofDr23Hxa6dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkNWqcv7DoUnPsb4Xc/nP40ARM81aVfffXRiMVa837GGJ2/pvciQzkAFBplsAvRcQH/AKNimciTDbq3mjD/G9IvGNqtcjo+SY0vcaq6gz0MbRWngeEdhlUot8VPs7/b46jPSn7ruQRG9uEwUgSIqFburxLbGRKC2QIiS+33DDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtezQRzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAUELtFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3LpoxI1374513
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=; b=KtezQRzArFv7yXH9
	XIsgCS7QCkjhX+vSLQXshdcz9P8PEL1uvFsGVn78VWJzgI/a3EyRamQdzAVBhxA1
	Id8VKebQqGOYpSSgJWqItuDE0QX2dbcmvH8EaTm/FU5/9VsnAnwH3WjOZHyD+rop
	pv2S7+pVEFtZyqmVbHCB8WSe4LJKdOPPZphI4jt2HdktyXqWoAp3g9S227i2Je6V
	jHrls339qp7D2NDQoF2UR9fqrT546x9hr/EFuLO5+c5pKWlpZr+J8PeeiiMCN8jY
	jJI7LTz/bVPfyQDC+gQElvaMUD4BnMriybyenYYtDahxBAmQ7pxf84C0O8DN35di
	cHclgA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0bakex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:54:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c07119bfso743806a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816845; x=1765421645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=;
        b=XAUELtFTaZ/T3S0W8deSEp5SJXW9UbwBKdAT1egOV+X8nOgbCxLnOC7U8qcKyfX5yJ
         h+fU1Z+2gCn6A5PbtD2Kk77JYoe5X2mZZePsHEwjIukQKJPwNrlACmk6TRU+pNVU+a6e
         G61oUmP18QzBEnBkgdlGj4Hr1KKIhFSdTG2CpZXA2Ru4CqzA/kaOkaqUqumDTfGeB9XE
         ratmhulIQS35fv0FYgTjZ62PQxv0Ka9JbJa2H9Nk50rtFNmlSNlAHJpstWJQtnKGaqtm
         YLv8lSUYnXAy/0rpak0cRtYAfEDzKqiFS8mDOS++o8/JWE5ySnbAhGEAUMuwdmkDk18o
         lO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816845; x=1765421645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=;
        b=TO5RpGU2zup2bBUBQRNzL52p9mZr4RWnQUPTunxiUCy/fIiGHrivdLrQwjR+DzLTiu
         KV5glmRZuU7KOGV+7rsbp4hUI04gKhvTxUy6Eyq4G4mhI9MQSwK7IjqW9mJ9SqPx4Ijo
         CBFv37PKGui7dR9ZZuU8c4apI1iS7B1yPMMEown3YB0vxFzINl9FASFjPQMutYpP5gz8
         vbdr9Gsolo/ycdXuO9D6XoU590xGagEUk9lzerlZ1bdJojw+MhVG9l8QZP8OIuVUq+Im
         HcOIeRfBRsKS7AbyskUI8gzI2iwWRJ95h7fSM6iwnurWKN6mJB4Wezh2nykO2MTpRcTK
         EHrg==
X-Forwarded-Encrypted: i=1; AJvYcCXp9zUT/SAeo9m2evlBzNdF3GQLsdGlIi6N8PqQZykVTn02YEl+fQHuuP3S/objkntpAZ7OLToX1iRqEa4p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40n//e7SzcjPMINikL6bpKQO8vvPEzPxuzc+28rK/Rgmuewxy
	F46kgrcagEu8KwBQp7onCtHl4HkNx+4skCBhxzEGLUFSxNiNJepJh0Dbd7jRpH7i0TpG3QVRy3c
	moTypFW0UiyLkanig/et0B24jQBjvfLaG1zOrl4OTYrtcW42Qz+NbNBZnF3Wxyi7Ir7xx
X-Gm-Gg: ASbGncuWg9vdqqQQfHhsECCA+GcyKAlAc1/B7Fnmy0jMr7NuY3qnyyphIUZYlUsy0N0
	sAzwFWs+bx3c8RaepIKJ62Zg4muxDWXGg1OfmhHuH9E+MiU3klNnYw5zHxoP6zBC+ZlXO9PuLsK
	5qA4BuHSvVCstlEULgw2QIMx+tCwzRPxKjiYVNt5kFCLJWOa9hDSwEiXzOoSkoP+ZCGXFtCXKl3
	8+kEelRrYX7JUw4XYCHgPV8jQG2hef424eH0KkT6bOXRVMvXxDiT2jaWyq6MerMoti5QXAe5/E9
	agoD3GyL4gvSsMjsa4MtgACKRPt+yreAQcCXhXXNyY40hmCQTj1PXFPm5BnhQwmPRgpoFOnrDwv
	4CF87jN8Vpc2o8hCA4CfO4FEoNqnQe6lXrsxFq/6h9Oo2fRJx0ISPSCwP3xZLKauhYVdJsd+XPl
	U=
X-Received: by 2002:a17:90b:580f:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-349127ca211mr4859699a91.18.1764816845437;
        Wed, 03 Dec 2025 18:54:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENjq7ZgBrcQpEkrNDiTTzJi8Ifz/jSay8KddNCoTe0e3Bj8PjxrzVNWwx2tBY7wryDD6xl4A==
X-Received: by 2002:a17:90b:580f:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-349127ca211mr4859656a91.18.1764816844919;
        Wed, 03 Dec 2025 18:54:04 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d36fc0sm1546875a91.12.2025.12.03.18.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:54:04 -0800 (PST)
Message-ID: <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:53:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=6930f7ce cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SkUS4XPTP4F0jhogtscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lr7nT2X8HaSEGFi2lNgx6eA2-WACRGCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMSBTYWx0ZWRfX/Y9Hw9LM8lGb
 FYX4/f64PswU8B+/aM6EXuRK8k5seTjc2K3/S2sQdSGbGyni03aYXIjmpTxfB+hGNzNLBtL0LpQ
 JgK3o2juffA+INNt8sfG1J/LlLuumFTwihmAMbX+0N5rhDGdBSyfjHVl16XhgIpw6u/wM2Y3rJ7
 4DleitCIlb185kuhnrWw6P/sRMwdfNljv2/WscLq640MdxwfbQMRtG49e9wkSgqz1jXPDhQXSEo
 /bNwe7tTryB5d4sOoRSSIFsdImEbPzF5lVe8q5VlvlaRwT8EXTK4STV49/sjT49SVwGhf5AaF0K
 JMuh/4Rje1I8HLtkAP14ZX4bMEYgm4ZTo9sRbXppJ05CWEsrjwTb2scwg7mBAihYtnup0MHOiNj
 0FIDl+owz7yAZd8zKFgGsmunFi4+IA==
X-Proofpoint-GUID: lr7nT2X8HaSEGFi2lNgx6eA2-WACRGCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040021



On 12/4/2025 2:14 AM, Suzuki K Poulose wrote:
> On 08/09/2025 03:01, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++ 
>> ++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml
>> index 843b52eaf872..ea05ad8f3dd3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,16 @@ properties:
>>       items:
>>         - const: apb
>> +  interrupts:
>> +    items:
>> +      - description: Byte cntr interrupt for etr0
>> +      - description: Byte cntr interrupt for etr1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etr0
>> +      - const: etr1
> 

Hi Suzuki,

> Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
> especially with the Linux driver naming things randomly for the TMC-ETRs.
> 

Yes, it will cause misunderstandings since the "etr0" here may not the 
right device we are expecting.

> 
> What we want is the "port" number corresponding to the "TMC-ETR" being
> monitored ?
> 
> Have you explored other options, "port-0", "port-1" ?
> 

I think it's much better. Will update in next version.

Thanks,
Jie

> Suzuki
> 
>> +
>>     in-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -56,6 +66,8 @@ additionalProperties: false
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -63,6 +75,11 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "etr0",
>> +                          "etr1";
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
> 
> 


