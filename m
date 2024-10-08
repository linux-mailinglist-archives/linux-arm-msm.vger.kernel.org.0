Return-Path: <linux-arm-msm+bounces-33473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82389993D66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 05:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B676285378
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 03:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0457F22611;
	Tue,  8 Oct 2024 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l82YMVBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238722066;
	Tue,  8 Oct 2024 03:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728357524; cv=none; b=rLSjk+pSG5N6OR9mc+c/MaJNZ9ym/rV0gCud+Jr9yrg6QuK79IkHAdZ4BsmfX6Jswp6xijF33WDqz+TAKS4RoSUCBl8SvbX5SEICH9poOzPywE9wkj5LSfjcw7MuL0pXwZ+9ex28ro95zMyAsG/KXbIelIHgWLpCzTA3sd01LKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728357524; c=relaxed/simple;
	bh=KKHx9kn/FjIYnQaVL2sf7HaPXDJxY/zu1C6EOOGVVDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aKKIfqaK7sluDK9Hvv3HhVWoP4VC83+RVG5JEjFOBIWlQlAivo3VWvQKRw2Keqi9okwkbstUhPWZG/sjPjbb/HLFdLy2spTRu4gSMrVPHAZ4gm9ha5g0YxwDBqfhLbRsgkXQn5Ffvj80rJDUWYVWyVbEmg5nLIlxOnPSKc/92i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l82YMVBp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497GaHxm022365;
	Tue, 8 Oct 2024 03:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dowEqxgbLavKo9589+GmS3dK4EJlyj9ChKyl8PXyNag=; b=l82YMVBpdj8LbNwy
	4rlJSc+o4a8MkNciXFYQnxEYUOiN8bd8zXeBKUbUc51MGHfgtzvm5Co9R+sUyJj5
	tRGzRXryRj4bAb5f23Ejy3/ZqcQo9DGeHfVP/ahstZA4jEr0s30fLWkMaQMiDQE0
	QM6ucWqdHQBMYq8r1MnQOJG2MeuZsWdsb27h7ojlpzS2boWzbJDSaSuJwKye4Esd
	+PkzpJbMIwufSIIlxfseFPFKKAEGJP9hIhcIIqc4YsXCb5IOWwz+kMdDqy0jRTWq
	V+M8CYpTKnSXrXsN8BhLWobU3ucZrVNAPUya8ZjzYC79UR0FPZ3Xb8rP6yk5ePam
	9bsR5Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaes6sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 03:18:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4983Ibrb005539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 03:18:37 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 20:18:31 -0700
Message-ID: <d275829f-190c-4b73-a378-1025ca8277ed@quicinc.com>
Date: Tue, 8 Oct 2024 11:18:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add configuration data for QCS615
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
 <20240924-add_llcc_support_for_qcs615-v1-2-a9f3289760d3@quicinc.com>
 <p72feqwqhs3gjzzq53gfaz4ljk2qjdgeanhzomyzvk5ymjdbg2@7jxdlknz2onv>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <p72feqwqhs3gjzzq53gfaz4ljk2qjdgeanhzomyzvk5ymjdbg2@7jxdlknz2onv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wn2P2qXVvnaezRP7GECic5lSWQnrdd8F
X-Proofpoint-GUID: wn2P2qXVvnaezRP7GECic5lSWQnrdd8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080019



On 10/6/2024 10:03 AM, Bjorn Andersson wrote:
> On Tue, Sep 24, 2024 at 06:07:12PM GMT, Song Xue wrote:
>> Add LLCC configuration support for the QCS615 platform.
>>
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 8fa4ffd3a9b5921d95c20648048dcdfa20dde5db..11507eb3efff101e4f330e7f4282a31aa172369d 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -151,6 +151,13 @@ enum llcc_reg_offset {
>>   	LLCC_COMMON_STATUS0,
>>   };
>>   
>> +static const struct llcc_slice_config qcs615_data[] =  {
>> +	{ LLCC_CPUSS,    1,  128, 1, 0, 0xF, 0x0, 0, 0, 0, 0, 1, 1 },
> 
> I accepted Konrad's reformatting of these tables, so please check
> linux-next in a couple of days (or the qcom for-next today), update and
> resubmit this.
> 
> While doing so, please use lowercase hex digits.
> 
> No other concerns.
> 
> Thanks,
> Bjorn
> 
Got it. I will follow Konrad's reformatting and resubmit it.

Thanks,
Song

>> +	{ LLCC_MDM,      8,  256, 0, 1, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
>> +	{ LLCC_GPUHTW,   11, 128, 1, 1, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
>> +	{ LLCC_GPU,      12, 128, 1, 0, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
>> +};
>> +
>>   static const struct llcc_slice_config sa8775p_data[] =  {
>>   	{LLCC_CPUSS,    1, 2048, 1, 0, 0x00FF, 0x0, 0, 0, 0, 1, 1, 0, 0},
>>   	{LLCC_VIDSC0,   2, 512, 3, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
>> @@ -539,6 +546,16 @@ static const u32 llcc_v2_1_reg_offset[] = {
>>   	[LLCC_COMMON_STATUS0]	= 0x0003400c,
>>   };
>>   
>> +static const struct qcom_llcc_config qcs615_cfg[] = {
>> +	{
>> +		.sct_data	= qcs615_data,
>> +		.size		= ARRAY_SIZE(qcs615_data),
>> +		.need_llcc_cfg	= true,
>> +		.reg_offset	= llcc_v1_reg_offset,
>> +		.edac_reg_offset = &llcc_v1_edac_reg_offset,
>> +	},
>> +};
>> +
>>   static const struct qcom_llcc_config qdu1000_cfg[] = {
>>   	{
>>   		.sct_data       = qdu1000_data_8ch,
>> @@ -721,6 +738,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
>>   	},
>>   };
>>   
>> +static const struct qcom_sct_config qcs615_cfgs = {
>> +	.llcc_config	= qcs615_cfg,
>> +	.num_config	= ARRAY_SIZE(qcs615_cfg),
>> +};
>> +
>>   static const struct qcom_sct_config qdu1000_cfgs = {
>>   	.llcc_config	= qdu1000_cfg,
>>   	.num_config	= ARRAY_SIZE(qdu1000_cfg),
>> @@ -1375,6 +1397,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id qcom_llcc_of_match[] = {
>> +	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs },
>>   	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
>>   	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
>>   	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
>>
>> -- 
>> 2.25.1
>>


