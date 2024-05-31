Return-Path: <linux-arm-msm+bounces-21227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F68D5E40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6FD1F26D75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2107581737;
	Fri, 31 May 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/745Uuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1D7710F;
	Fri, 31 May 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147740; cv=none; b=qLnuTZE1E111sB/SfPvG2ymO5usHISR3dmFmviIaXhAVp6HIdrpi1NQWKJ18xNpoMMBng3uSR9k1ygln8TftfiiOXYVeDhU0TeOToTeEpvB6uAKc3Q8X/Ch692ED+LK0AeosbslE6mdC9YoUcXdYKcRit8Ku1jqhS6hm+w5k0cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147740; c=relaxed/simple;
	bh=jz3k2NEhynlos8En21PLWn8q4d4j96Lkja6DLIVGRbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eQ9ZtEP/oc+mo6jtxmTJ7wKXd4uvpv8nn5cJhd5ulDIeMkHZn4ucloyz8Dno4Ckj+gcjD7Z/4dhXGKaesd7zuXqQZhKGs31hHHWXHxASPHNesNg3Z2qlDTa/tiUIJ9DFA8aGbYPHiNy8N8BwJpNm8mYbdhFTCs3LWaQi4uLKfaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/745Uuk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8aJep029210;
	Fri, 31 May 2024 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cy+1yRjtgfx1z2jkjpWM/0l3EqvOkrew5S3UR+mAvPo=; b=K/745UukngEo3BYk
	BCpvu1Z7W+slNrxkYEsib0MTOKziYIqjZEvCIYEKoL2t2hJ4BQcIkg80KEHmXtps
	+jd7rGrbpZa2Btg5Lkksx+3rCvI13SK/+E5TwhX7Q3JjU4wN8YihoFZy+jRlG4Ii
	6qwGSyACWkcZHNq2dVqIk2e1iGGQuL1aIHM5GHrSYcn64btQaXIOioubOBxhAqiC
	fSwfOjlWn0BGlgL0kbyLGfEE8+jaMmi7OLWUDkHwRrlu/D388+fBkyplCRBFhROO
	7HuAYkYuu9KvzWwrS9eCSuFGr34LS3ioZ0c0tRKhNmgONyzizqQuFaZQVyjhpEtM
	psrzaA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2hebhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:28:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9SsLG026576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:28:54 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 02:28:50 -0700
Message-ID: <13c261e3-1292-4531-b09c-1da2bb1ec2bc@quicinc.com>
Date: Fri, 31 May 2024 14:58:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-3-quic_tdas@quicinc.com>
 <c3abdf10-ebb8-4b77-beeb-65409b08d7c1@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <c3abdf10-ebb8-4b77-beeb-65409b08d7c1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AOABWfqCwD791uTffj93ScLeV7RmIPuY
X-Proofpoint-ORIG-GUID: AOABWfqCwD791uTffj93ScLeV7RmIPuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310069



On 3/18/2024 1:20 PM, Krzysztof Kozlowski wrote:
> On 18/03/2024 06:35, Taniya Das wrote:
>> On the QCM6490 boards the LPASS firmware controls the complete clock
>> controller functionalities. But the LPASS resets are required to be from
>> the high level OS for the LPASS SW driver could assert/deassert the
>> audio resets.
>>
>> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> index c43d0b1af7f7..d68139762a80 100644
>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -721,6 +722,7 @@ static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>>
>>   static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>>   	{ .compatible = "qcom,sc7280-lpassaudiocc" },
>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc" },
> 
> Why q is after s? Really, keep the order.
> 
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
>> @@ -752,6 +754,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>   	struct regmap *regmap;
>>   	int ret;
>>
>> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc")) {
> 
> This does not scale. Use match data.
> 
>> +		ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
> 
> No, qcm6490 does not have two IO maps, according to your binding.
>

In the next patch I am separating out the reset functionality from the 
rest of the code.

Hope that will simplify the board requirement.


> Best regards,
> Krzysztof
> 
> 

-- 
Thanks & Regards,
Taniya Das.

