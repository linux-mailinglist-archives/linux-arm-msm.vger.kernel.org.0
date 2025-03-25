Return-Path: <linux-arm-msm+bounces-52473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4117A704B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64972176C91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788FB25BAA9;
	Tue, 25 Mar 2025 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tyq6GZ3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D721EA7DB;
	Tue, 25 Mar 2025 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915562; cv=none; b=Z8N2rszY+LUnuUz+BHSxGxr3Zdhrjs6n9gy/rzPB/JOuiwuJMxSoZsB3PWc2T1bbbX9EtIYxQ1Cr4RB0BfhTHrEFzt6HKxLjTIRcsUUBO/arkY0UfUszxfmVCH+tFuK2dYJRyKwJ8DrCHgd94tCPY+VRSNslzC2oItGmXb0jMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915562; c=relaxed/simple;
	bh=7Fbdir5Fx3EDswxjRup54AJvbOqqpOmLnwDrZOiSxwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AZLuGYrF+V2BcQgtXuJICHtiAX5IiZvO6dUNkTl/rvNrPEwxz8gbbYTJ2wTC1jp5vn8q9CU6Fjujs9yyfYtjQfs/96gDlyKbu23TPC1q52+wdAfUtYGPVES3C4OMW8APz0HPqu8nFfIeUR3PPxfeQT4q91RUfMb/I1q349FQ2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tyq6GZ3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PFAs1Q028179;
	Tue, 25 Mar 2025 15:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XZYJQiPiHDP+X2UNC7T1rq9idLWk/jlICCOE0TlLrM=; b=Tyq6GZ3DZU/1sfla
	4S1KmSpQQN7+6ih5xHyKkmS+WSBE5qfOUvOPlp6lKMtbvmyhILX5UnOEtldZDumh
	NA9lExKluQVxyaOqsuuAUzGAr7smSS0MSVI6HPUIJh66k5XDMZ49StAjs0XYMzMH
	pU3ofApOUoRceJxx1PpjIPIdW9/uuRlbqT0/viNz5vLdBoLysMyWZvZE8nDnl0Yf
	XhB7MfgMNwOIEsW3VtY2mfMI7gP10E4eNkHhm1ldyUUW9XJ/oord7cb0O8Rc8ESJ
	32+1N6Ci5JBLpg+u8kbV/8XQujKLDmNWqQCEQm1x5Mq8WIainwG5VUMEwuT2yw/m
	wizARQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnrj10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:12:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52PFCY8M032085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:12:35 GMT
Received: from [10.253.12.41] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 08:12:30 -0700
Message-ID: <f37d8541-6e49-45dc-a845-706368be9bdf@quicinc.com>
Date: Tue, 25 Mar 2025 23:12:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-2-3ea8e5262da4@quicinc.com>
 <f1e7566e4004e3f7228961df0b5152c4@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <f1e7566e4004e3f7228961df0b5152c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e2c7e4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Ibpr2pAS98eo1bZLyFsA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
X-Proofpoint-ORIG-GUID: NjUsQ-yxK3Ygpo4SOD3WJEhK4Jdx_Hvn
X-Proofpoint-GUID: NjUsQ-yxK3Ygpo4SOD3WJEhK4Jdx_Hvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250107



On 3/25/2025 7:42 AM, Stephen Boyd wrote:
> Quoting Luo Jie (2025-03-21 05:49:53)
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 432d4c4b7aa6..ce5e83124c6d 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /*
>> @@ -16,6 +16,10 @@
>>    * are supplied to GCC (24 MHZ as XO and 32 KHZ as sleep clock), and to PCS
>>    * with 31.25 MHZ.
>>    *
>> + * On the IPQ5424 SoC, there is an output clock from CMN PLL to PPE at 375 MHZ,
>> + * and an output clock to NSS at 300 MHZ. The other output clocks from CMN PLL
>> + * on IPQ5424 are the same as IPQ9574.
>> + *
>>    *               +---------+
>>    *               |   GCC   |
>>    *               +--+---+--+
>> @@ -115,6 +119,20 @@ static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
>>          CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
>>          CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
>>          CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
>> +       { /* Sentinel */ },
> 
> Nitpick: Drop the comma here so nothing can come after the sentinel.

Understand, I will remove it.

> 
>> +};
>> +
>> +static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
>> +       CLK_PLL_OUTPUT(XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
>> +       CLK_PLL_OUTPUT(SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
>> +       CLK_PLL_OUTPUT(PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
>> +       CLK_PLL_OUTPUT(NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
>> +       CLK_PLL_OUTPUT(PPE_375MHZ_CLK, "ppe-375mhz", 375000000UL),
>> +       CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
>> +       CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
>> +       CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
>> +       CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
>> +       { /* Sentinel */ },
> 
> Nitpick: Drop the comma here so nothing can come after the sentinel.
> 

OK.

>>   };
>>   
>>   /*
> 


