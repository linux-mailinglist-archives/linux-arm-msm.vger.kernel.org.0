Return-Path: <linux-arm-msm+bounces-85087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1DCB7869
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B657D304744F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109A42773C3;
	Fri, 12 Dec 2025 01:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A89EWoIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRzluN1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A8B26ED44
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501955; cv=none; b=PdnGJ2c5YBB19NRSpfEDBfwk4bOCL6cTg2dQIeHtaGr3rZI+y+bVUiGKLCWUwBYGnn0QWBtpXmUB6mC4ZnSLOtm7Y3S6YTg0G2yk1Ni7MXfNe53awO1yB6yMaOrR9TY7J2UfSq6WnYpnSaDRtbj4UHYc6PNoFXMv/Jwut65wumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501955; c=relaxed/simple;
	bh=kihEArBdt2qh6TdIAAOz8f0jmLZeHn1njZYdfCTRSeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqy4XUw0rXWE3wyYM7t0xFWzeq8s/sskyOwcvL+6RNKbKkntGG/GYKepcqiJeaDxWCgrLkPfIUlu+hSZ5Vh16+Hno6d35EL5Lff9xjBMdxCWfLxLxLVn0UKDJGLMu+4Qd/zhNZ+Fl330JKoMv2heXDFHkft1jTrwJ1rqGI1afXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A89EWoIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRzluN1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBJdp992945967
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 01:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=; b=A89EWoIlqp08Gzas
	9IsxU4r25bwS1PI6RUlXRgh1nH171eLABDW5RjYXzpcczsbSPHRaeTBk/8LFVTuM
	knndiRhyDkIsqUk8bJOFPkHLCdxx9ZefNUxGAXMyvE/PKu+mn4elMKnuz1bCUpDG
	QyBigXSdTxECywHcJH6/ysYbLpLLAbBZRpQ+M6otQAXTBC/9XCnK3aNJLGQJlHXx
	GEZ96o4aYU1BfaRjcgaSXTNZGCZMw8oBLeZ1ewYRo/+VlJDaNLbSUk5CjhP1/jSe
	xsw0R/YOHZP+cuku3D/8Zl5ub/A/A3zpdRa2SdJZo3UFhU1SBh/0Pl7yhipJG7VV
	GEqHpQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04a2gqj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 01:12:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29848363458so13166985ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 17:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765501951; x=1766106751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=;
        b=DRzluN1sms4ZrqAwVUQZ1HiAYZrz37o0PbzqNuoWdtNfQa6+PLmKNwofrAab4zKgDi
         JwRTpJAFuoplaqWKx1HZEQx8X/+mt5cDBck6MKDuxEdyfAu+xpLuVjYS7GvpG3G8vVEe
         YUGTmiwX3Da73bdCebTF02ywYDn3dwBFowa8HD99eauxIdfzvQbMHHkjqGfGUpcm0TrG
         4pgP5puYUv8xgLFiujEIlVtPvYm7ZULcYlbI6bBJEsD3wzW3f+SrojFqn5tah3WSXXJi
         uz7UUMhxkg8feMGwdThpYYY3XpTR5OBx6kkxKTw592BC0247rTmSiJMJA7bpUKHyS37d
         miog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765501951; x=1766106751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=;
        b=TpTIaX/vH0hm/OmhDXkOYhBfXWJtE/Ct0ovUN0ak6/4nKzPiG36I0RCx9P3+z4kmQZ
         oEXeG2m2VaRBHQB1tG2+sDW13AU8laudkVkWBnYttV41Ad7E3feiV2VnM+CwFqatEq6Y
         viFd+qjmBWO4O//Th6DPMEcAMeEMmkPvDfmkjI3G6i7sPmDv/t3+wr16jLK32a0j7lvi
         1vG/jzcZiey0iRCniw9VnRY7uIdi4xMwP/UcsuHPBkxhQhE07g5TQI8e+FXphnuYxrj4
         gjnr+vEqZhDuNNo0mLEW+FQrWCQprgpVrg80bDwuZtuAMggxeHCJVR6dN/t/YOBB0I+V
         zTLg==
X-Forwarded-Encrypted: i=1; AJvYcCWQj264xizt5J0zxZh1IQSOTUIW1zguDlcrRBCJLLhKISG/B6KKDAnWrh/ovsHOzN7/6iEIrwrpq0DTkFoz@vger.kernel.org
X-Gm-Message-State: AOJu0YzvhXl4729ZP4kcleH7S6btBZwLXHGR4cr60oVO1wsfFyD9hgH3
	f0CCrHc+BB2xhPNaQn3ZvQxFgzj4wwosD1ePdFnXpJqLmHzqa5PEZcRJ+lw2bOlrlkEX4V0ij4T
	83z0fdyPmEw51Rqwgr1FBJG2e8NJp+wGhArkESH2UrXXRrA2gOR4sGkkQ8hupXCo/x0m4
X-Gm-Gg: AY/fxX4kY9fgoRUrCdp24zXTNrTpM3N7jhjTxcChbX/K4RUySsMC5ow6B1aEU7ZguNo
	83KJKxIoRDkZvjmiEOZtgCoQX3sTYvJGqZzYUruv6nI8RaRJMJj6MIOZSFFI0IzSxbuOxl7sSeB
	dqc/LrdZoUswmKRRgq/u1SsHyJIOqkdoxBLfLTo5ocmS1xuGMfG3WGcQgFzy/qvNSla+iABgjyt
	ClhlMYM2oIRChUosI+XCwqE4JyTZwUpYUUx/fKBpRrLysTYYzksvg7YrCBQy5YY5iyYKPG8FO9y
	p+shctwLrR6vMJQRdc6uSMd39p59yN2FVXwAJ/0cAke4dLlZm1gkasLJcLXohVXztODSlxDzm9v
	3L5Sf9NLa6kOd3MIBk9BX5d1LCLny6d2VpKBbrLfN3nMNvUrcCSRiCEZgpyT5Y/LwDwIoZU7Wag
	==
X-Received: by 2002:a17:903:22c2:b0:282:eea8:764d with SMTP id d9443c01a7336-29f23c68107mr5693455ad.35.1765501950720;
        Thu, 11 Dec 2025 17:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx4fRvdhPu/SygFF5ybCQmrFBEB7oSGXXfLs0+77TNXaagA2gUiZ7A/5tmbwK6pdQO3pay8w==
X-Received: by 2002:a17:903:22c2:b0:282:eea8:764d with SMTP id d9443c01a7336-29f23c68107mr5693045ad.35.1765501950185;
        Thu, 11 Dec 2025 17:12:30 -0800 (PST)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f271bc8a0sm429515ad.92.2025.12.11.17.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 17:12:29 -0800 (PST)
Message-ID: <dfa43a63-ca14-4dd7-a7ab-acd95748a8b9@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 09:12:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <20251211133723.GA859302-robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251211133723.GA859302-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iJd7Z1n6TfwsZxKmFg3eHNdMCaxr0zMj
X-Authority-Analysis: v=2.4 cv=PZPyRyhd c=1 sm=1 tr=0 ts=693b6bff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SkUS4XPTP4F0jhogtscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iJd7Z1n6TfwsZxKmFg3eHNdMCaxr0zMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAwOCBTYWx0ZWRfX5hS+Z26qwbX9
 C1N/48eq/I6xihSElriH/fPT66JoPJagkb8OKCgBw31/OPUhEkBQcCiZ6k1nt7axIQ8icWPZdDr
 QagNT2eKScOOdY15Q3KMxD5j7SZLTrhWjsqcTKoxqgHs2k63DN+OBVnDs23+sVj2+gy3nCsnJFl
 579h9/gKv5yxdA19egpGhTDreC8PmMgwFjtaK7kVVTNq89nevfXNwBlKRle4ER2RheYkjFGlChM
 ZcJ0wrcWS7brlKMj/xXMtZgHC29CGmeofvHmyuHLd+Xcnz7mFXv2vNSzhu/t9AJ/p1lJFmenBXW
 47sqVoSIKGUjMESZK5SjLJCfs17SedK0d5EhVk6UxXKu15m6QuYRwGQRJSfRl+i72Uwnye3QKSL
 vV7TJXHrixu7wKM9wfbGvMwz1xMx+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120008



On 12/11/2025 9:37 PM, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> index c969c16c21ef..90f88cc6cd3e 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,16 @@ properties:
>>       items:
>>         - const: apb
>>   
>> +  interrupts:
>> +    items:
>> +      - description: Byte cntr interrupt for the first etr device
>> +      - description: Byte cntr interrupt for the second etr device
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etrirq0
>> +      - const: etrirq1
> 
> Names are kind of pointless when it is just foo<index>.

Hi Rob,

I was naming them as etr0/etr1. Are these names acceptable?
The interrupts are assigned exclusively to a specific ETR device.

But Suzuki is concerned that this might cause confusion because the ETR 
device is named randomly in the driver. Suzuki suggested using ‘port-0’ 
and ‘port-1’ and would also like to hear your feedback on these names.

Usually, the probe sequence follows the order of the addresses. In our 
specification, ‘ETR0’ is always probed before ‘ETR1’ because its address 
is lower.

I would greatly appreciate your suggestion for the interrupt name, if 
possible.

Thanks,
Jie

> 
>> +
>>     label:
>>       description:
>>         Description of a coresight device.
>> @@ -60,6 +70,8 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -67,6 +79,11 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>>   
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "etrirq0",
>> +                          "etrirq1;
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
>> -- 
>> 2.34.1
>>


