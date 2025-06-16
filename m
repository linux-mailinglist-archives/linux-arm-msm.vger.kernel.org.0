Return-Path: <linux-arm-msm+bounces-61371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F967ADA782
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7A523AF97F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 05:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34911C1F2F;
	Mon, 16 Jun 2025 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LL2R0Cy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F471A2C3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 05:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051104; cv=none; b=X/Vr3pSswLwviTrdJyoGl3FQhItHdKinYnxok78PKfN4h6gD1AsQD7MeNbEcqvQfmlQ4NqrAp0LbPXdFqgkMj3e2gBcinl8tk8KlEvckBDWsZ2fXKyMA3fgxPG0CAl1jHVeVuANVJs3GjVUUxBwjZmTFbK2hvCTwMN1Zc451+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051104; c=relaxed/simple;
	bh=dSTO6ceL4cBcJlGtrwFEVwSB8h1XEE3UyPcaVRgLcoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovo08VPA9sciqFypJOPdnmX0eShFfk9QJCab0f0fUWnatHcWY6mBLxD1uK9G7wKWSKPq6vUrPI9RinFTrHSHbPTrm05cwQeRBFqyRe6LtIk0QbB3rOW0WfCwo2mOYkHBPTeigIs1LT4laJuJAs2ec9FFchsJ5w8neE1pBlHvsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LL2R0Cy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMo23a000772
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 05:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eah5o1kUJVZGAXwBZNw8iMgtalpjcoQR+VZU+ZsxQwU=; b=LL2R0Cy5w0o97slA
	hXfKgWsa/Mq+CtRLCE7pdpmGRx11xMV5gQaahmOGEWtHOfykvb57s4pDlLov80vd
	rpPDi/1YZkvBpGA2tAz2iSYVWqxNbs7e0uw0hp52LnmX8bOqajNbhG6FyPyxmS+y
	nr382m3JvFj61XXQe5xPw+Sz0TNcw3PtM33cjgMkVkSr2ogU9tgcygH+7x8AOuWl
	KdQam2heRJVMiIwVI26oGRgTE2FjGElDHB9HpIrfbdTVgS6Bbz7WPKZDwgj9RgsF
	hVsBLyiECHifKPbwkM65VjZ4WUocRWCBKw92SaNV7QqTMDLlSigPNShLdeuwBNEw
	EEmISw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsu3rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 05:18:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23536f7c2d7so68098005ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 22:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750051100; x=1750655900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eah5o1kUJVZGAXwBZNw8iMgtalpjcoQR+VZU+ZsxQwU=;
        b=teG7VHPKIfSGkrVL4cdevBSF5aawNTRKiWNGSl88Tquj8FYTuqT/e1dAuv7SKfqpp1
         /8/0sM9qZPQWpd106Lbs6ym4NjFzXowIJ01HOBXDTgSUw/KgosJWsT2d902mwfB3bi94
         2rbote197k2Gsrl5PtAV7v6PJ/GRAQkTLAFiRuz7vtCHWpRDqV6IAGnnQqCdYSvGNK/r
         sh+eSwRvtZPrkMvCxbJ2214fUPjEfAyjKt0nVNA8z1njL7IfihXaVJ/Mi2M1DxGAPENO
         lNOiUKSJzDr4CMu+1/bhBYEHIZl5BZDITp0OrLRQ1UIywtCqMH4M8VSXnyLsNkY4lmUd
         gaQA==
X-Forwarded-Encrypted: i=1; AJvYcCWuTTkdacuLwCzkV9wMZUd74LpP2HgvTXX1isHPk5TvSRJhKc2yBzNQRcSkB19O6v/WVDxEEpcTlYNYU+JY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lfJIFcfobN2E5wdozRsRPkeIRZYk1U57wuWeJ5OPWAPCOW1t
	ozkXS8mrwNR4P0NqOqR9moc6NvWk6HJW06QyTvQ3wqs20mmKUjBsNte2BzrrFeuDug1cfU8hhT9
	UH+fXb2uJy4Rog/vXfAdldo6QUWO1xnhwMSUqLPHtGcn+oTZmkLorjnslkmkIcPHH+cVQ
X-Gm-Gg: ASbGncsVvDVjwamwdYCOyXoIsoKbf6Zh/G+EC9fiVNVEYYgTOe0faJccU711mR066z/
	xzOcViZwtHOsS2DL4YK4fsGh8tKJ0gEL/frausbnUbiOzbEfRyP+LrN63EEOOrV+T9yI4C8Pt2Y
	E9oBVy4wFmE5iD7a+FK/qf1PRPv2RKaGYA3VwzJv+NJydqoUQwdYqe4ciKzF7Stk64NQiiqzAbw
	7zLgJzzas1kVrtFX6VMHVoGn4v2PLQpjkPl0MZlHMyRf7CLWQJgBPTN1ugLBRMX/lUkeFsHvAFR
	9AafyoEfgfQ4+SZfIP9tUQnVADLJWBPgjoVhr1LSF45B0ABUMx0+TTNevXLLJCM=
X-Received: by 2002:a17:902:d510:b0:235:1966:93a9 with SMTP id d9443c01a7336-2366b3135e7mr102105095ad.3.1750051100117;
        Sun, 15 Jun 2025 22:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKX5qugZa1AxrKnkhp2zsOgIOkWCwkCCSqcySZ7F3F6nUv30kFT3Ho/o5/GcaX/FF9+6nTvw==
X-Received: by 2002:a17:902:d510:b0:235:1966:93a9 with SMTP id d9443c01a7336-2366b3135e7mr102104765ad.3.1750051099523;
        Sun, 15 Jun 2025 22:18:19 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78204sm52672895ad.101.2025.06.15.22.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 22:18:18 -0700 (PDT)
Message-ID: <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 10:48:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
 <20250610180345.GA2382213-robh@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250610180345.GA2382213-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX4AUCY1Gu99If
 CiE0BqtoNX5RZ91znQv2syu1J975jV2L275BRTj4uXsMKHMFfDbCusUj8GcRpqplMXEXL0aF+KA
 fExIOruWTaAGhIk2dk1mfQP22JPmAKBddLJOHtt3q3TRUUEj9dV1AJ1xYLe7HlG9otwHVcGo2Gl
 Bem3yEs1HzInu2JbdRQFi898L5P5RbsSwUOrXvlOrJxS5yB7ggfka68sQj0f3aqqvHhWtHaHiq0
 lq8l13I8sukUm+StGYsT+7Wjuom1Nkc6amj7f/EWR51KAp5PKbsdR7Ay/r+4hiCy9S/p33w8wFt
 EsRmOrqCVGK0oKu4SXJsZxI1ohm/zcJ/DPW99kwu6ZrmRKvA4Bb1L6EJ9e7nir4BDJubZl5AVeS
 9Z84k7YluJClXMB4iTxmzWc5he5QljdIA86VvUF9Tx6HbVtmDgO09UfosPqCeQJR0twE0KEU
X-Proofpoint-ORIG-GUID: ZysjdnoK4uoCFKkQ_Dl94JqgexSrHybu
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=684fa91d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xrx7LQK3kUNipwB-6k4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ZysjdnoK4uoCFKkQ_Dl94JqgexSrHybu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160033

Thanks Rob for the review comments!

On 6/10/2025 11:33 PM, Rob Herring wrote:
> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the "sram" property for the watchdog device on Qualcomm
>> IPQ platforms. Use this property to extract the restart reason from
>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>> entry with this information, when the system reboots due to a watchdog
>> timeout.
>>
>> Describe this property for the IPQ5424 watchdog device and extend support
>> to other targets subsequently.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v5:
>> 	- Rename the property 'qcom,imem' to 'sram'
>> Changes in v4:
>> 	- New patch
>> ---
>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -81,6 +81,16 @@ properties:
>>       minItems: 1
>>       maxItems: 5
>>   
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      phandle to the IMEM syscon node that exposes the system restart reason
>> +    items:
>> +      - items:
>> +          - description: phandle of IMEM syscon
>> +          - description: offset of restart reason region
>> +          - description: value indicate that the watchdog timeout has occurred
> A 'sram' property points to an SRAM region (see mmio-sram binding), not
> a syscon and offset.
>
> The 'value' should be a separate property or implied by the compatible.

Sorry for the delay. It was a long weekend here!

Let me start with the requirement (Please feel free to skip it). When 
the system goes for reboot, Xtensible Boot loader (XBL) find the cause 
and update the particular offset (in this case it is 0x7b0) in the IMEM 
region with the known values. On the next boot, if the system is 
rebooted due to  watchdog timeout, watchdog's bootstatus is updated 
accordingly, which this series tries to address it.

Based on the previous review comments / discussions [1], it is decided 
to go with the above approach, i.e., name the property to 'sram' and let 
it points to the syscon region (IMEM) along with the offset to read and 
what value to expect. So that we don't have to touch the driver if 
either of the offset or the value changes across the platforms.

Currently, IMEM region (which is a on-chip SRAM) in the most of the QCOM 
platforms are modeled as 'syscon' [2]. So I have followed the same 
approach here as well. Should I describe the IMEM region as "sram" 
(mmio-sram)  instead of the "syscon" (existing approach) and retrieve 
the offset and desired value from the compatible? or stick with existing 
approach and name the property to something else? Could you guide me 
here to proceed further?

[1] 
https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml


Thanks,

Kathiravan T.

>
> Rob

