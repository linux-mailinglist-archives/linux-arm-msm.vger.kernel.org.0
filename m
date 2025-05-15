Return-Path: <linux-arm-msm+bounces-58027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2B3AB7C9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 06:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3751B1BA3BFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 04:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ECFAD51;
	Thu, 15 May 2025 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVDU2ntV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BBC8F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 04:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747282620; cv=none; b=hHkpBdR6RIXR73btphLlBTS/O2ryRfV+3OwE6EDKfMcO8FLP0GmQpaadktqmHJWLy8qpHCrMKJTvOt3E+gDlMz+DIhvUTNbLU4XwaeqQnrHvrXL/RJ+zDbUfxKwHof7v5BeolY5/qtDbKpUIEWwtgBqbqAqELLnQtFV2MIs2uoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747282620; c=relaxed/simple;
	bh=KgcLR1oRKC4Bv/OOFiAyyENLF5qMu8d4vlBvf/HQ030=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0AA1kx7mgTNBrwjikAYOoU3NIzM68TvdzATBFIkWib82+4BPOTkShDj0hiQ53KbrVzqoIJwO7IrAIJmSSTtEvpYRRpqEPMlh3x9jBPaJ7Nly57rFSJd3hZwGhRqTS0ZPhXua71QhdXwW/Hbc1ETlrQ961ymwbiTfO8eFGA36FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVDU2ntV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJCN11012704
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 04:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kd8BACwLMeJ2zbpewf7cHuRK1eqa/uuDVR7pqr+1NDE=; b=oVDU2ntV4XC7xyE3
	GZ8J8Je8Cysi9CeMtYPLIDf8UL+UkTnHdoviGgMqXhmOYvxPnf/OVqu1m8V9u24f
	bqSsoIA+mgM1uZNlKFkrkk9xYrJEeTJzOBkseCz5azq/XpHPiATwJQDR5/yMWTPV
	xB6pBMCSJpaV4wHl+3VmuWQNs7dmBsm6cILVy8mLi1G/KU/pvgFDm0PfuZkSRrUB
	MjGOYVWIBEtDag2CeXZ4aTHB341RVSxandGt2iyCggXgvpt+QCgQgsDHqf35MCe8
	gcLnPdy0UDmmNtZ3FjVahRCcLdKr50HLjsQmqfQvocpFq1C/8417oAXKV2Um3Kje
	n86UOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcymy0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 04:16:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23195be68cdso5278465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747282616; x=1747887416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd8BACwLMeJ2zbpewf7cHuRK1eqa/uuDVR7pqr+1NDE=;
        b=dB0mK8CzD3bIs1Q0KPfBlewNSdmL95sb29skInlRsld9Sz5kUa2ZLwkcHYjYBQIQAp
         ju7h7dAICHnI/5lDR6srWzXRb/3a6gen6XG8PBaFQW0Uoeqvm37udrpEdavTzT218cRN
         GdbLo6VgINkzEMVEQ7ajUrc6FbPq8EjYcHTGGvlVG7EW7vMZChXaNqnepsyZFKvhf6uR
         W8R/E0/BaX8Wdljfxn/u+mVkKPH8/bMWFDULynZUPPyUbeU02BX0pCdDhaHXRAvRIPZC
         GWRydqlTBXdEI8GUgJcA5v9v3RxWGuQjRpgxFpYG/GWAjBVLK+5lY8hfEes0b89BLf5g
         cj8A==
X-Forwarded-Encrypted: i=1; AJvYcCUaHGoTLtOo0/iE48ZpKTTIp4dk5/K/wwRdfSdyyU797Jp7g5WNEnYfqbr95BvjCzvvo1NZEyBaMsuck/Pb@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHhr1jkGWy5BDC7g6sxzyR0BN1ER2LYnZdZasdBBeSF5sXUZo
	gwcHDeeMcs8mn1khAsZMPGw5qbSjnV8Bk19g5NCZYlEddfvzg4mlFk9Bmh1rnEOBEBLvZKRxG5s
	+gcWbrC+YkcFouZB8RIbNJY4U+M2MR7thIyNfP7d/nD7hEDRaUAiz3oK45/IM3hGc
X-Gm-Gg: ASbGnctdj91UL6euhnJgL+ALkLHCrw/h5qTR2FJwgueGPWEDXN1pc3tKAcFnHUGFz75
	z0LLD2UHhpUQ9xP9bG4CXhXXEAknjnfFQb1hXDVxNkZwSpKo5x7ppL1mj+8M5riArJwj4NvFmEa
	31qA6VFaUWIrxtuYYndeWdgKNbhOfFVSsFApQps1TvbfympyVU0YZr6v5F+LxPhOZ3Q+87k2aLc
	1U9Mm79DhaaTgBuTZaS6GmtF5S6MhPTeNn7N9gHZZMyl+H2XYVe4jucteF2i8/GCkw67WzVdosf
	Q1KVmYPn2XTsXuJpibPcd+W4BzeiWL5bPhYBE8kP
X-Received: by 2002:a17:902:e548:b0:22d:b240:34fe with SMTP id d9443c01a7336-23198105cc2mr84369935ad.25.1747282616604;
        Wed, 14 May 2025 21:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe8M7Pns6BOfigcI/LdoCzGcLiooRhtIWO/6Xb13UpzJZRpET6QLi1pEDd4SPeyUwIO1RhMQ==
X-Received: by 2002:a17:902:e548:b0:22d:b240:34fe with SMTP id d9443c01a7336-23198105cc2mr84369605ad.25.1747282616167;
        Wed, 14 May 2025 21:16:56 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc77421b2sm108603835ad.70.2025.05.14.21.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 21:16:55 -0700 (PDT)
Message-ID: <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
Date: Thu, 15 May 2025 09:46:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
 <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u6RDXZ9LDrYynxoeFJziCJ_qzpMLtVDV
X-Proofpoint-ORIG-GUID: u6RDXZ9LDrYynxoeFJziCJ_qzpMLtVDV
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68256ab9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HdtPUk39sM2pxYiq6tsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAzOSBTYWx0ZWRfXzze2yWBAslFd
 qNM+My+STGo7Ls1sEYHdh2ecSSsf4+13RNO7IJJAVfe4ZBP+eaMcr8TOyICEHAph3HcZCzRgZ2e
 IgvfbgnVQEvKGT7z+a6fKzqm9yc/D3Qskpg9hLzNWyRUkLO7jvrNbnUJrNwvzPzlPgsCNN9BTeq
 UQWzHPH1aqML/YTLXNBisB7rmlCa5OpOBPEE2Z4o2G7KVEcu04YSD8C9FjHtsRINMnsRmsQOFXQ
 JDMVQIocFlEBlorJOsxukUnFzFil/jBgxLkPi8W7VkJjTYcAv7f5VQhvHs0eBpTdABM6n/t4nmn
 zHuE2/VU620+9r8daMY6NMFomYbvoqNE8o9yZnJqq1kw/xZYXqQDdoVYPicTdWQGuR3mmPkGCt1
 fNOqDYZRJZNShqvNMHsKfWgBhDAYdHxf9PXReB2fQxze3P5Ni3VG1ErQ6RcC1UIcK6WsfFw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_01,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=864 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150039


On 4/26/2025 1:53 AM, Konrad Dybcio wrote:
> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
>> changes since v3:
>>         - added necessary padding for 8digt hex address in dts 
>>         - fixed firmware-name to use .mbn format
>>
>>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>>  1 file changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> index 69dda757925d..fc120fd8b274 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> @@ -2,7 +2,7 @@
>>  /*
>>   * IPQ5332 device tree source
>>   *
>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #include <dt-bindings/clock/qcom,apss-ipq.h>
>> @@ -146,6 +146,11 @@ smem@4a800000 {
>>  
>>  			hwlocks = <&tcsr_mutex 3>;
>>  		};
>> +
>> +		q6_region: wcss@4a900000 {
>> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc@0 {
>> @@ -545,6 +550,39 @@ frame@b128000 {
>>  				status = "disabled";
>>  			};
>>  		};
>> +
>> +		q6v5_wcss: remoteproc@d100000 {
>> +			compatible = "qcom,ipq5332-wcss-sec-pil";
>> +			reg = <0x0d100000 0x4040>;
> This is 0x10_000-long
>
>> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
> Is the firmware OEM signed?
>
No. This isn't OEM signed. userPD firmwares will only be OEM signed.


Regards,

Gokul


