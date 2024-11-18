Return-Path: <linux-arm-msm+bounces-38250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725B9D188F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 19:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47530282692
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 18:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDCF1E1055;
	Mon, 18 Nov 2024 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjusmFc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5C3BBF2;
	Mon, 18 Nov 2024 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731956115; cv=none; b=LXeskcyfdoCk7lxV0G/dTDqKonrl6WGB3DxsrvwNF2xmGSkrYWrGe4fOoHusDf9J3NmVvIEl21CqJ5zDMWoueS1+i330PZu4cnP3fRtYYIWuxpCMKkgY16f14DQ66gHGcdA9Q/N8Q7xvutipdgFeLoeFQ0gk5r659Q2uAJ2Cld8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731956115; c=relaxed/simple;
	bh=vkDwkubs4wI12O/WB7HNRk5g9Va10+lT4y1VsDgTgpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HwIM5jBz1rjquvd7ZTJFEwU5zkuFAYs402iih+R9bCpDQKjfRdkC7U8we6wOjP7dXHYbkAzyG/iR+IYTfwC/rJ2NG8pSq95k/8G5vP1/6EEI4Ni1QdfRO162VOyNYEe/YTTZhJyvw1vHPIhj5TQh9tP6DfMBzjL/kPfXOLS4410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjusmFc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGlrg031040;
	Mon, 18 Nov 2024 18:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2BUYrr5aczH1Jz/fKXz+KFmy2W0PTLebONE4a4Z1yk=; b=XjusmFc2lGjL8Hw0
	lqcK421pMa6yjv3cITkSBS0vXUdCF1PrNpk6t60IFGcu58x7JTRQ+EfGOQK6Xn9m
	PTsBgZmY816Rd5IPuy08+Sy4EUl6PArZhiF1OKcpnDdKNV142AqYE7XGnXBh8FyE
	gveKYsrcKXQSIQ7o2Jbi+nEzgxa6VmVGcnRnOxGbx8Av0BpsgQKnipRUfqFBeKwj
	g6UzdDExNctGHHr44DI4gzgsO82bfyO62RLuO5msQZl+feNlueqsfK3tuCy2C9/r
	LoJiTdkZLniEGFkBJTyxGePWgDH0Mn4jxYjAjOdZINfNp4w4EO2bHhJV1mNH59YC
	4Hx/Fg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y90bvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 18:55:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIIt6nQ010089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 18:55:06 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 10:53:23 -0800
Message-ID: <8d3c2efd-b6c3-4b01-ae01-78460f4e9f26@quicinc.com>
Date: Mon, 18 Nov 2024 10:53:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-3-quic_molvera@quicinc.com>
 <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x7H4gC5FBWbnjFVmrT1XC2jv_VGTmafe
X-Proofpoint-ORIG-GUID: x7H4gC5FBWbnjFVmrT1XC2jv_VGTmafe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180155



On 11/15/2024 7:31 AM, Dmitry Baryshkov wrote:
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
> Are the two last clocks defined "for the future platforms"?

I'm unsure; I'll let Taniya comment.

>
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
> Please don't mix fixes and actual code. I'd suggest splitting sc7280
> move to the separate commit.

Bryan O'Donoghue requested we sort these as part of this patch. I don't 
feel strongly either way,
but clear guidance here would be appreciated.

Thanks,
Melody

>
>> +	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
>>   	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
>>   	{ }
>>   };
>> -- 
>> 2.46.1
>>


