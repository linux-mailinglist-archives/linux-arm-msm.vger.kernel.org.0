Return-Path: <linux-arm-msm+bounces-40174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455149E3384
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 07:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09F4D16649C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CA418660F;
	Wed,  4 Dec 2024 06:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YY9qsTCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE5136E;
	Wed,  4 Dec 2024 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733293315; cv=none; b=T25jPHOm/xqjhR8QZ5vDkyCEVpH9LtRk6yBkFfaY6zIwSwvZY+9LKw7OBAt2SW9IQx2ED8BA2GZDjzKlczC28tubvvEaF2xJhAcNs6kK+Pmz0c1aCzk4G8Xvt0MFZfzehWfxwweUmKyXi4xmQwG+uZE6pI5lvlnSI7UZTF7ZgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733293315; c=relaxed/simple;
	bh=6hYZ2PKm0Rt8YrKJeQb5VKDn8wpuJFm3xrWGdD73WC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PAO08ME76/1s70hg+M/cmuVkBYmC98V4MSk2nODHyuIHv9WHYfkJk/vEDwdOHt2JchNRiM9LADzAjRQZA4GzKpebpaR56eZ1Qlul/QPWYtLwyzx6Hrwqj3vOwEKrOWjX5CEXPTfcLPybb9ybcE4ExS9NgC91WGDPkj1k+/7BK3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YY9qsTCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3HKxkJ017944;
	Wed, 4 Dec 2024 06:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G/f7T76jDD1SjEGzVfzhkwijkWZZdBKBue9O/RSMkQ=; b=YY9qsTCo7RKwB0hr
	dTRpdiH4o2YyKAB7/gVNdWu3wPQMRutfWBcrgkQfn3Hq/19CVqSuRtavoCTHPOWp
	Jk0T3iRukHYdaQD66WK8dfxsPv00EBXBjXYaHedjkfAZt61h0Gap5p1/oU/W8Oz4
	nHFLxLor7ubZtklF6HEyojE5WPIIXdg7741iT7W0m3jeIvXre6lyvhw8MUoPl+BC
	hAXdLRkSs357W+XdeHsgtM7kcEQpTsJoB+3Zi7t+n55S7fBJZNv7bVAvUJe5zlKl
	nTnxIvZnzE0hBlD2R4Zg8coFIXK+h/gM6zt2JvYZdDRLF+pbLKtf/nBFSrL51hLQ
	+GoQDA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstje6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 06:21:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B46Lh8Z023900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 06:21:43 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 22:21:39 -0800
Message-ID: <bdfadb99-a125-47d8-a28a-bc4de13e2e84@quicinc.com>
Date: Wed, 4 Dec 2024 11:51:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-3-quic_molvera@quicinc.com>
 <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j7elynnRQFbgZJRxHT93Z9XyfzyAc8tu
X-Proofpoint-GUID: j7elynnRQFbgZJRxHT93Z9XyfzyAc8tu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040049



On 11/15/2024 9:01 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 04:28:02PM -0800, Melody Olvera wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Add the RPMH clocks present in SM8750 SoC and fix the match table to
>> sort it alphabetically.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/clk/qcom/clk-rpmh.c | 28 +++++++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index eefc322ce367..a3b381e34e48 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -368,6 +368,10 @@ DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
>>   DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
>>   DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
>>   
>> +DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
>> +DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
>> +DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
> 
> Are the two last clocks defined "for the future platforms"?
> 

Yes, but I will remove them in the next patch set.

>> +
>>   DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
>>   DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
>>   DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
>> @@ -807,6 +811,27 @@ static const struct clk_rpmh_desc clk_rpmh_x1e80100 = {
>>   	.num_clks = ARRAY_SIZE(x1e80100_rpmh_clocks),
>>   };
>>   
>> +static struct clk_hw *sm8750_rpmh_clocks[] = {
>> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
>> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
>> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
>> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
>> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
>> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
>> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
>> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
>> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
>> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a2.hw,
>> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a2_ao.hw,
>> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>> +};
>> +
>> +static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
>> +	.clks = sm8750_rpmh_clocks,
>> +	.num_clks = ARRAY_SIZE(sm8750_rpmh_clocks),
>> +};
>> +
>>   static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>>   					 void *data)
>>   {
>> @@ -894,6 +919,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>>   	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
>>   	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
>>   	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
>> +	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
>>   	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>>   	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
>>   	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
>> @@ -909,7 +935,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>>   	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
>>   	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
>>   	{ .compatible = "qcom,sm8650-rpmh-clk", .data = &clk_rpmh_sm8650},
>> -	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
> 
> Please don't mix fixes and actual code. I'd suggest splitting sc7280
> move to the separate commit.
> 

Sure, I will split in a separate commit.

>> +	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
>>   	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
>>   	{ }
>>   };
>> -- 
>> 2.46.1
>>
> 

-- 
Thanks & Regards,
Taniya Das.

