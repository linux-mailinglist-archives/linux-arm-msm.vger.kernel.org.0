Return-Path: <linux-arm-msm+bounces-52475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214AA704D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA4897A1CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F9F25C6E2;
	Tue, 25 Mar 2025 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oTXccmZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521325BAAB;
	Tue, 25 Mar 2025 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742916058; cv=none; b=Kjni0PHvS3I7pYd1IHzHbTD81QixEP0QiTC5kZa79Fx4ddtaYDmKDwcdL3GyeRy4tB4ELe9TJ+hGPWlVn7QZk2c0RK5WcjWZr/gJ98bwAVMEvdiMk/3cEZ2OWYPoJkkdfyxVdoiBFutEgMVLcLDLUbY7YARPppHge6f390Q6nOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742916058; c=relaxed/simple;
	bh=6PTx7Qnvw8HdZAQZzxdvDTe2LyRa83x4/p2m4DpCrC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QFRwPk3swUobkkBbuZgJvV9CvI50V2BJkf5mln4qXa3R8OKv7mSns4XzWdwLITgkS3ncGMVcM3VFx5epOkGw8hjRHdMD5pcw8CIFfTpBIiECcJi95CIkJSqHkOJYWbmlMFiWKYMhHyOJjEzgBQPu70k/7/KWlvrKYByn1sBNVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oTXccmZA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PFBVmW005427;
	Tue, 25 Mar 2025 15:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99jQ2nlZEiAOniNnZM9a4jOlhArr5JS51LLQ2XWoYnA=; b=oTXccmZA3rlafmZx
	56T8RfAvDADf7OsrtY1VtWFDNZmcq/C7QLJX07Yj7tG4NWlb6+44JK+KaBsGf6pD
	u3v9YvxfK2cuBRao45EOT+bSht7a9gsByeB07kAg+yxkcARwVnRWOE8yJ0qeLjLZ
	Cw+e6u62E5eYr0FgnI+1gPYuiPFvuQQDi4783l3nlBzGXhKg5X+CDjDY6TP8Vvnu
	827lORaWf1hhjoE3ewiXj+q0CchMs//k6Cfn77LFFdv1qQp+WuVVdzG35KjSsRUc
	THcX42OtvJ4/sDwrzGe7oB3hi0Z+OkciPK/8+e/W8IYgyRP1DtjfXGi3Da2Q8uhM
	C5e2pA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd320uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:20:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52PFKXrb011318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:20:33 GMT
Received: from [10.253.12.41] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 08:20:29 -0700
Message-ID: <d4747355-65c2-4361-b515-e9c0945badfb@quicinc.com>
Date: Tue, 25 Mar 2025 23:20:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>
 <20250325-imposing-wine-jackdaw-fb0af2@krzk-bin>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250325-imposing-wine-jackdaw-fb0af2@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2rXMjlUu3O3Pf0R624JVrXJSUsNJ9e_V
X-Proofpoint-ORIG-GUID: 2rXMjlUu3O3Pf0R624JVrXJSUsNJ9e_V
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e2c9d4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=L8H8-DU4cjMHBsthIx0A:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250108



On 3/25/2025 4:19 PM, Krzysztof Kozlowski wrote:
> On Fri, Mar 21, 2025 at 08:49:52PM +0800, Luo Jie wrote:
>> The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
>> input clock. The output clocks are the same as IPQ9574 SoC, except
>> for the clock rate of output clocks to PPE and NSS.
>>
>> Also, add macros for clock rates that are applicable specifically
>> only for IPQ5424.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml        |  1 +
>>   include/dt-bindings/clock/qcom,ipq-cmn-pll.h                   | 10 +++++++++-
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> index f869b3739be8..bbaf896ae908 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> @@ -25,6 +25,7 @@ properties:
>>     compatible:
>>       enum:
>>         - qcom,ipq9574-cmn-pll
>> +      - qcom,ipq5424-cmn-pll
> 
> Same comments as before... keep the order.

OK, I will update to keep the compatible strings in alphanumerical
order.

> 
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>> index 936e92b3b62c..e30d57001c38 100644
>> --- a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>> +++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>   /*
>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
>> @@ -19,4 +19,12 @@
>>   #define ETH1_50MHZ_CLK			7
>>   #define ETH2_50MHZ_CLK			8
>>   #define ETH_25MHZ_CLK			9
>> +
>> +/*
>> + * The CMN PLL output clock rates that are specifically applicable for IPQ5424
>> + * SoC. For IPQ5424, the other output clocks and their rates are same as IPQ9574.
> 
> Just come with different header. Why was this called in generic way,
> since we ask to name the headers based on compatible?
> 
> Best regards,
> Krzysztof
> 

The DT binding file is named according to the compatible string, however
I had incorrectly assumed that this recommendation was applicable only
to the bindings file. OK, I will add a compatible specific header file
to support the SoC IPQ5424. Thanks.


