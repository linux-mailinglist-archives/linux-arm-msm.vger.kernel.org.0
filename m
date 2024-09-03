Return-Path: <linux-arm-msm+bounces-30469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BA8969515
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22F63B23453
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BF81D6DC8;
	Tue,  3 Sep 2024 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Daz1q44E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B451D6C53;
	Tue,  3 Sep 2024 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347886; cv=none; b=ZOV+Ma3xogCN3w2rYh0U1un+94kd9Fti6VhSq5eovOFYKO6b6KOzLRKOq+p87fsDgk/5Ei79Ai9F9PPoAermMmOwXsK2kpo6L/CXA3MiYlmDeD5WCsmQyRXafSM3hmMeSWT8OlF2ltOndSvIAyHsRLraSzatCS0SrMWrcfPZcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347886; c=relaxed/simple;
	bh=Nn4iA0//TSc/tkyp0Nj373E8KMzfRcmJpALvwi7cqNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fvDxjxkbYrt6NwO/KAa1BebWGCUrUdZ2mw3jFtnJ8kz/N1CrgpsMKf3LefnxNjR3sCCu3+NOwvuUHnI3GRMwLh+ViP88TLnjBenWAmmCNI1nv7CyRyrkfU94zqluNfxGMvQolVmufzPuUgmA5jl4vVDU89ApCi/axKCzZaoZuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Daz1q44E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482MqshO025988;
	Tue, 3 Sep 2024 07:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdPf6npOsH8d2I0KRPc+8ngFKkyOmhuDuK+C/0tcNJE=; b=Daz1q44EFWafPVC8
	R0KgkKzNTs7iUQKnEk55tfE5B0WQYs4t+Ty4aX3DfsO1/VRyP3+rM50dQ+X3mJuZ
	xXeu1mCCcBkqJccbz37obB58VJVpfhQO87sADEFaIONpwg/tjSDPs0vJz8+Bj4T4
	W9e5bjXTZtulXFe6AvWtVevznG9vxdRh01+woMoOO9scBmgNQxzMuO/nJNN9qwO8
	GiAGIIR+EzWXU6Mct6YovfMueXZobQz3mD86iRlFxHjiwlPImFwc+fqQYZDccGJx
	Mu9pgzknzJoHY0TbAsmPTQ5lyJMYzoLAjMp0NsoDu0PMRUd9rD71TBQAnZMiJUon
	xOv9lg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvf8xe1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 07:17:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4837Hvb4006523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 07:17:57 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 00:17:55 -0700
Message-ID: <407fc8ff-8058-4ab4-a822-7a5e47e5b301@quicinc.com>
Date: Tue, 3 Sep 2024 15:17:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: llcc: add errata to get bank num
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>
 <vtj5liux4hrb7je3ojnfyixor6sk2oy2p4nlvt2rgnzisjj773@ckyl7a2kpa62>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <vtj5liux4hrb7je3ojnfyixor6sk2oy2p4nlvt2rgnzisjj773@ckyl7a2kpa62>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x7MtlvNvvw0Q7hhakrC7ngT8k3LmZtde
X-Proofpoint-ORIG-GUID: x7MtlvNvvw0Q7hhakrC7ngT8k3LmZtde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=946
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030056



On 9/3/2024 3:13 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 02:21:31PM +0800, Jingyi Wang wrote:
>> Use "num-banks" property to indicate the actual num of banks for
>> errata.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 8fa4ffd3a9b5..3fb45e625d82 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -1275,12 +1275,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  		goto err;
>>  	cfg = &cfgs->llcc_config[cfg_index];
>>  
>> -	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
>> -	if (ret)
>> -		goto err;
>> +	if (unlikely(!of_property_read_u32(dev->of_node, "num-banks", &num_banks))) {
> 
> Drop unlikely.
> 
>> +		/* errata: get num of llcc banks. */
> 
> Huh? What?
> 
>> +	} else {
>> +		ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
>> +		if (ret)
>> +			goto err;
> 
> Sorry, but what? You can read it from hardware, but you add DT property?
> No, that's just wrong. Why commit msg explains nothing about reasons and
> problem you are solving?
> 
we need the property because there is hardware errata on this SoC, regmap_read get wrong num.
> Best regards,
> Krzysztof
> 
Thanks,
Jingyi


