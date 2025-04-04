Return-Path: <linux-arm-msm+bounces-53194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D7CA7B82F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38115189CFE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 07:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A6618B47C;
	Fri,  4 Apr 2025 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPCC5zAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C4A95E
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751115; cv=none; b=Gg35nzqrEkmWZ8nldIJqg14qEJNNJvtlYhFvo04dvOK6mNMVc7FjWx0oYknxxKk4htpWNRumX3SK0Wf9mxX6LltZwUVyrgt3pzSCgj8CPh7xXSHw9k+Z+zeH78yGcoV0/yQj/mv/jDi1+XSpzgen1mbbTsPKp2AHVVAagCK+pbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751115; c=relaxed/simple;
	bh=ILNynjnmbXQ57V0L7E3GXdTBguloNIvSaFZmp//BXJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fu0DcxcG7z9T82PGqRckDE2IPnYPtMeEGb5WqXe+0FtdlSEEvftK+qW96AefnkVhqAEH4YsZu9k4Kuku0xgMPLj34UeTM5wNkKAeJoggoadm0uC4OtgyZCCUHf5i+LNUmYRqIw/Ggq4PjKQoc/y28IgHGKt6GpLuR2B4Vvbyoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPCC5zAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534346Aa024373
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 07:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UK7jfYZ/W+0+Ux5kZY3m5d5fiL859ZG5h1OBPReTA0w=; b=HPCC5zAQIICBh9lQ
	wJoFgA64hFEjFK/zQTsK4JyYud6DbDAxikBoshqc6uC1aYtUxeqbCmduX1onBMbq
	Q0B4AeIqG9aqzru0BhG7P6sK3E05//xf/g80p7/3wPpHCr38qQoFiruJOHCI4x5q
	rpNNpdZ2dcghlI7GRZxt06t7KBzpq2ndL0VjYxXzu9eZ2/ku6XdS9fm3hpck8o54
	5J/P8NKzNctsNTCkFFSbNpK1q6eckYjx0ODzUpLukMU/b2X87hcdcSpsUO0eg2sR
	SfrCSr6UWHyX6ZNz0iUOuvK2q+mGghDAYSgObrc+Obr+QsIz10Gv9oe3ZCXcQqrr
	OLrFUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d510a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 07:18:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242ce15cc3so17042895ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 00:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751112; x=1744355912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UK7jfYZ/W+0+Ux5kZY3m5d5fiL859ZG5h1OBPReTA0w=;
        b=pLEPogZCLgRkVKEQv0vFZtoGMN/Gpv0c5Llt6ScetRvnGWWOc3fyxJQexvSYEvIFqD
         8oCFGwV8p4cRWME6R1Xb8rNb8blN1m8N/fdxiLR6oCNFDJ0+wGOR1Bll6aJajrVw0t6E
         ToaO3WRG02/1p6XVXpOSuIK2EoYPyOYc+ITXCB8EkJEgAPyMPVYOwD5LQ0bolRPhqs1J
         8lbzTx7dMyR80fTeXPfNRKjcCGSKxsHvhtBJAfdaujpu8StM2nPahOTlEP1ZRzSQQ1S2
         BPrgwlrM0T41Lpy6s+wJY635XFRYoL7cOrA79TomZttDPVEMSApw1SlTyBsRxoPdrp7x
         udmA==
X-Forwarded-Encrypted: i=1; AJvYcCWBYxwI0Jk2JZ2IMQ/s06JBOzf/wrpTBJLq4FuCHWhfDBJYXE6NxN1s6VTv+lNlf6xcxkCcGK+8PLjeQ+9C@vger.kernel.org
X-Gm-Message-State: AOJu0YxtIz4JzixSaWq1RgQsQcFuRg3ywIXfx19d+hS479jx3fuz6UhJ
	jvi1tBdN0ayNjBSeORbISXKtLspMFBgOJBah7sRs4oYEUugc/eAdJy4y9W5UC+ihBkzAYKc4EhE
	7fslPc9CpxQyqi8++bLtw9U0prTDfv4bE/1rTODj2SgsHTnuePcmfwQVY2ohlCJFw
X-Gm-Gg: ASbGncvLf/Tgc2MxslhpDUBSkepDMcV8cruAgO23cWDzEzkoTwblZeL7NcSI0G12F+i
	ODunBGFWMim9Xak5oei/fk/ddWa6t/Z3KpT0oX8Jy4PU/QhUg+ycyPP/JsqRxhR/tgVBinMhbyJ
	xpSnQyiOSS8Q3187mAavObFBzftcX+qihdV9uNDF9ecwBp8gYz7qJO8xmEnol0k2CgejhOpUK59
	nanLNZyhxoaMM1OjzeYJDpwrZ9Qy4k+95E1CjWi8B+bes1evVe12dekKlSjjZp9ArdoyCM0pzVM
	P/gYFYL4qtrJEUuGW4LarNxS+6XdhjmhYp7K0yT75vg=
X-Received: by 2002:a17:903:3bc6:b0:223:5525:6239 with SMTP id d9443c01a7336-22a8a8cef53mr28679315ad.38.1743751112398;
        Fri, 04 Apr 2025 00:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIFjM5Ex2s1BdaYiCxPhmNszCnHV2el4vd4BXNPkCGVPizFcidepi7kG/x3M3w2iKgK5ytFQ==
X-Received: by 2002:a17:903:3bc6:b0:223:5525:6239 with SMTP id d9443c01a7336-22a8a8cef53mr28679025ad.38.1743751112024;
        Fri, 04 Apr 2025 00:18:32 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c3819sm25820125ad.87.2025.04.04.00.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:18:31 -0700 (PDT)
Message-ID: <4ee19c72-eb09-4d1f-ad45-7212c77131ac@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 12:48:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-9-gokul.sriram.p@oss.qualcomm.com>
 <69986326-acec-4032-b110-2f93362b3941@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <69986326-acec-4032-b110-2f93362b3941@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sM1wujp45S0OAqefURPDPxgQQEu_aBY1
X-Proofpoint-ORIG-GUID: sM1wujp45S0OAqefURPDPxgQQEu_aBY1
X-Authority-Analysis: v=2.4 cv=bZtrUPPB c=1 sm=1 tr=0 ts=67ef87c9 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YIqmbIv1MT4caBoUU0QA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040048


On 4/3/2025 8:21 PM, Krzysztof Kozlowski wrote:
> On 03/04/2025 14:03, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 61 ++++++++++++++++++++++++++-
>>  1 file changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index db69bff41afa..11a1849ec50f 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -3,7 +3,7 @@
>>   * IPQ9574 SoC device tree source
>>   *
>>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #include <dt-bindings/clock/qcom,apss-ipq.h>
>> @@ -226,6 +226,11 @@ smem@4aa00000 {
>>  			hwlocks = <&tcsr_mutex 3>;
>>  			no-map;
>>  		};
>> +
>> +		q6_region: wcss@4ab00000 {
>> +			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -1473,6 +1478,36 @@ top_glue-critical {
>>  				};
>>  			};
>>  		};
>> +
>> +		q6v5_wcss: remoteproc@cd00000 {
>> +			compatible = "qcom,ipq9574-wcss-sec-pil";
>> +			reg = <0x0cd00000 0x4040>;
> So this obviously was never built tested :/
>
> I don't understand why bindings and DTS is being changed after half a
> year. You got already review and what you sent supposed to be complete.
> Now, half a year later, you change both bindings and DTS thus:
> 1. What was the point of reviewing it that time? I will skip reviewing
> next time and wait till your patchsets reach v4 or v8 and review only
> then. This is not the first time for IPQ patches. It is actually pattern.
>
> 2. How released hardware can change within this timeframe?

The hardware/firmware hasn't changed. Will keep the Q6 DTB changes
separately outside
this series to make it clear and repost V5.

Regards,

Gokul


