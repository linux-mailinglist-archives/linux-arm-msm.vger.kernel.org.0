Return-Path: <linux-arm-msm+bounces-45171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD6A12E8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5093A4D4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8328F1DCB21;
	Wed, 15 Jan 2025 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EDSnv98/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C74C1DD0D5;
	Wed, 15 Jan 2025 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981355; cv=none; b=r4F/8Cojk8nPMXnteJ8hxp5HB8ssbsgfp1CAew6f1ucmRY/Wizt7vnB0ClffXO+3aSmwE0Z7AkqjumYpKnFh/XQCtVak33N0IaTQaam4njc/StedqW+8eTAf45+y8BxUFXqpjuggSe3VMdWjLJvjYt0PxVvxG0rQpa4yDIwZYF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981355; c=relaxed/simple;
	bh=4Fleq4y+z8fuz6O9oMWy8fy9lYUmUWKf6On7P1XMe4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rB5qbxteYHUYTinXIC5az27BXa4A8z3Pa++Dszg4ID18XFH7elQ7UlKw6EhqvvOkMkVP1eME2rSN098Qv5eJ8GvJA69r5H540dJLmqvC0zhhbZI38WF9HAgYGLfMwPBZQjxw7cZom58Ciap33vFuEBl3qn6XIeWURQz92I60Tmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EDSnv98/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGqZ60018682;
	Wed, 15 Jan 2025 22:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK8i5S0JQN1/gsnMuMEsJa3zlnU6PBnk1Gg5aZ0ypCs=; b=EDSnv98/IKy47dyD
	aA1YzXhqipknXqxshqGdakkz3BcwZDCOWCLotFeDrqE2cLFYjmNLCw/pa5rnFPjB
	+zloPPlUtQGtD8VGXT5JcFtEhuPukQ6JypTB0SnET5BseOAj0HEruBJW1SLrQn3b
	v6aZi4kCd8smIVlm3Zqr4o22SPpDxX1jPpylv5qt4yCM15wig+kROBvO22KV+Qan
	HDcekErvjDQrbGSJw3uKwYA60fpcgor1/yDVU6HLO3oB7i8TZvSym31AVAdQ9Ae3
	XbU+CaCKYg49grGqkFwwDwNaxJuRDg0W3KvbEkj/GQlRh4QAM8gtE7mX5H45QqKX
	Ml60mA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446gx38qx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:49:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FMn8Nj019163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:49:08 GMT
Received: from [10.110.66.9] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 14:49:07 -0800
Message-ID: <8d455825-8c7c-4f92-8485-280275d4da32@quicinc.com>
Date: Wed, 15 Jan 2025 14:49:07 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-3-5389b92e2d7a@quicinc.com>
 <kq5ijq5jnbl5sndr3yyfdxxo43heptilzy7sa6xfrguydzoby3@3gvee4wvno4u>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <kq5ijq5jnbl5sndr3yyfdxxo43heptilzy7sa6xfrguydzoby3@3gvee4wvno4u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0dV8xtwUASVqdBVmQm5KoTR9XkabnSAd
X-Proofpoint-ORIG-GUID: 0dV8xtwUASVqdBVmQm5KoTR9XkabnSAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150162



On 1/14/2025 2:54 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:26:42PM -0800, Melody Olvera wrote:
>> Add system cache table and configs for SM8750 SoCs.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 4379b5baa011aa850a2b65ec20b32519d9331be4..f4cb158e0cf9eb82147ee461f98d0e928e5759a0 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -2770,6 +2770,41 @@ static const struct llcc_slice_config qcs8300_data[] = {
>>   	},
>>   };
>>   
>> +static const struct llcc_slice_config sm8750_data[] = {
>> +	{LLCC_CPUSS,     1, 5120, 1, 0, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
> NAK, things have changed in the driver.

Oh yes I see now. Apologies; will fix in next ps.

Thanks,
Melody

>
>> +	{LLCC_MDMHPFX,  24, 1024, 5, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_VIDSC0,    2,  512, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_AUDIO,    35,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_MDMHPGRW, 25, 1024, 5, 0, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_MODHW,    26, 1024, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_CMPT,     34, 4096, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_GPUHTW,   11,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_GPU,       9, 5632, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_MMUHWT,   18,  768, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_DISP,     16, 7168, 1, 1, 0xFFFFFFFF, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_VIDFW,    17,    0, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_CAMFW,    20,    0, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_MDMPNG,   27,  256, 5, 1, 0xF0000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_AUDHW,    22,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_CVP,       8,  800, 5, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_MODPE,    29,  256, 1, 1, 0xF0000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
>> +	{LLCC_WRCACHE,  31,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_CVPFW,    19,   64, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_CMPTHCP,  15,  256, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_LCPDARE,  30,  128, 5, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
>> +	{LLCC_AENPU,     3, 3072, 1, 1, 0xFFFFFFFF, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_ISLAND1,  12, 7936, 7, 1, 0, 0x7FFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_DISP_WB,  23,  512, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_VIDVSP,    4,  256, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +	{LLCC_VIDDEC,    5, 6144, 4, 1, 0xFFFFFFFF, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_CAMOFE,   33, 6144, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_CAMRTIP,  13, 1024, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_CAMSRTIP, 14, 6144, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_CAMRTRF,   7, 3584, 3, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_CAMSRTRF, 21, 6144, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
>> +	{LLCC_CPUSSMPAM, 6, 2048, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
>> +};
>> +
>>   static const struct llcc_slice_config qdu1000_data_2ch[] = {
>>   	{
>>   		.usecase_id = LLCC_MDMHPGRW,
>> @@ -3432,6 +3467,16 @@ static const struct qcom_llcc_config sm8650_cfg[] = {
>>   	},
>>   };
>>   
>> +static const struct qcom_llcc_config sm8750_cfg[] = {
>> +	{
>> +		.sct_data		= sm8750_data,
>> +		.size			= ARRAY_SIZE(sm8750_data),
>> +		.skip_llcc_cfg	= false,
>> +		.reg_offset		= llcc_v6_reg_offset,
>> +		.edac_reg_offset = &llcc_v6_edac_reg_offset,
>> +	},
>> +};
>> +
>>   static const struct qcom_llcc_config x1e80100_cfg[] = {
>>   	{
>>   		.sct_data	= x1e80100_data,
>> @@ -3542,6 +3587,11 @@ static const struct qcom_sct_config sm8650_cfgs = {
>>   	.num_config	= ARRAY_SIZE(sm8650_cfg),
>>   };
>>   
>> +static const struct qcom_sct_config sm8750_cfgs = {
>> +	.llcc_config	= sm8750_cfg,
>> +	.num_config	= ARRAY_SIZE(sm8750_cfg),
>> +};
>> +
>>   static const struct qcom_sct_config x1e80100_cfgs = {
>>   	.llcc_config	= x1e80100_cfg,
>>   	.num_config	= ARRAY_SIZE(x1e80100_cfg),
>> @@ -4306,6 +4356,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
>>   	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfgs },
>>   	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfgs },
>>   	{ .compatible = "qcom,sm8650-llcc", .data = &sm8650_cfgs },
>> +	{ .compatible = "qcom,sm8750-llcc", .data = &sm8750_cfgs },
>>   	{ .compatible = "qcom,x1e80100-llcc", .data = &x1e80100_cfgs },
>>   	{ }
>>   };
>>
>> -- 
>> 2.46.1
>>


