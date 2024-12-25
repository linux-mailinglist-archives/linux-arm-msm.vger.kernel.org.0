Return-Path: <linux-arm-msm+bounces-43286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E84C9FC445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 09:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250C91881F2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 08:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460D414A0BC;
	Wed, 25 Dec 2024 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nk4u6hX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5A5C603;
	Wed, 25 Dec 2024 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735116512; cv=none; b=JcmB27+CBCSj5c/w6Hf6tNP1xfnLTfYa44X30I8YKwrWgXmUijNEyUXPZPGb5soyPNdtWvgueLP+nCdxQlNKxlC3M79/OcmjtjOeag38IB8meuNhsyJu7IRlkqfbpEu6TOwdBNS27GgPb5nTHQqJdpL6EO12Z8icu75OzYjJhJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735116512; c=relaxed/simple;
	bh=xazrug+LH/ihK+1MZO9UNxR93oE0gAw3ANz1wEYcBCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aasdhgk3Vamj5wXouaBXqz7l4/yrjpj/ZzM+biT/NLphQUs5KtoMazYxEEBJ1bl7khMjXzDxV+r6wznBQ56YBrYJ1VNUd0wmzvqahpvh7gBSqqjayaSnnfZgclFde/c2grtvWU8qb7KhP2knKEZSGvfSvIQzNSvUpA0xHYMzr6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nk4u6hX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP0xUh6006885;
	Wed, 25 Dec 2024 08:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2td9t4sfIhhiNuVIvJwjDuBHMbZHT4OKnAbzZuz6hjk=; b=nk4u6hX0zh4QRYqI
	3yimNKrxrtvFuY22barlktzg24lqHylki76coa8kqeYkzO0Kv160S17sTTuF6WDn
	GzClWYof2aham6ePrq1atz+DktvvE1Q7bV5HD/B+En5G1UJyCM2Aeu2yRQogWc7R
	XGGNevivuLNxiafdcXUkauXTpJL631+3pmbn9w2KIZp9sDDCrVqhHPpV4B5/tthA
	7K2QjRhT0IJTJmrm1sSlfU+oUG4MOgu4GMTJrjYQg6JcIsj07vgiTrISahHLvrtp
	5AYhScpclENPDjQnY1xL9XsaNBBpBe8sC7EgdvtN1sZEmk6vcHsS/mGWaWXU8ica
	vqR+0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qyv7usa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 08:47:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BP8lwLF006187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 08:47:58 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 00:47:53 -0800
Message-ID: <d7b78ab4-bc3d-41b0-ad74-28a8ed630070@quicinc.com>
Date: Wed, 25 Dec 2024 16:47:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos: add support for
 EMAC on qcs615 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
 <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
 <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>
 <htnq5jjxwbsn3fjc3m6tzvyqrwzckipd3z63j2dotkliiwnqgk@lifzh4q35dqg>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <htnq5jjxwbsn3fjc3m6tzvyqrwzckipd3z63j2dotkliiwnqgk@lifzh4q35dqg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Eutn9DNG8oTpUHbKArQu5mSd4FWJxpA_
X-Proofpoint-ORIG-GUID: Eutn9DNG8oTpUHbKArQu5mSd4FWJxpA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250076



On 2024-12-24 13:05, Dmitry Baryshkov wrote:
> On Tue, Dec 24, 2024 at 12:36:29PM +0800, Yijie Yang wrote:
>>
>>
>> On 2024-12-24 12:18, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
>>>> qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
>>>> compatible.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>>>>    1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
>>>>    	.has_emac_ge_3 = false,
>>>>    };
>>>> +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
>>>> +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
>>>> +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
>>>
>>> lowercase the hex, please.
>>
>> I will take care of it.
>>
>>>
>>>> +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
>>>> +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
>>>> +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
>>>> +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
>>>> +};
>>>> +
>>>> +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
>>>> +	.por = emac_v2_3_1_por,
>>>> +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
>>>> +	.rgmii_config_loopback_en = true,
>>>> +	.has_emac_ge_3 = false,
>>>> +};
>>>
>>> Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
>>> emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
>>> corrected to use qcom,qcs404-ethqos as as fallback entry, making this
>>> patch unused. Please correct the bindings instead.
>>
>> Although they currently share the same data, they are actually two different
>> versions. Their differences are not apparent now but will become evident
>> once new features are uploaded. If I revert to qcom,qcs404-ethqos now, it
>> will be challenging to distinguish between them in the future.
> 
> Which features? Moreover, note, the use of the fallback doesn't preclude
> you from addign a new compat entry later on. By having a fallback you
> simply declare that the device A is also compatible with the device B.
> 

Yes, you're right. I confirmed with the hardware team that the EMAC of 
qcs615-ride is the same as that of qcs404. I will fall back the 
compatible of qcs615 to the latter and drop the unnecessary patches.

>>
>>>
>>>> +
>>>>    static const struct ethqos_emac_por emac_v3_0_0_por[] = {
>>>>    	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
>>>>    	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
>>>> @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>    static const struct of_device_id qcom_ethqos_match[] = {
>>>>    	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
>>>> +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
>>>>    	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
>>>>    	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
>>>>    	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


