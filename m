Return-Path: <linux-arm-msm+bounces-38607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DED9D476A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 684D71F21403
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8E4155335;
	Thu, 21 Nov 2024 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DtrZtUoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DF13C3D6;
	Thu, 21 Nov 2024 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732169216; cv=none; b=afrEWvk8cwtijHAMszXC1Wqv1KXegPtoApI6HF/nznOliZf39MJKbMpj9B2ZoEUn3OU2L/yHsha4t4DzV3ya9PYkoQnaueufOEG7PGDIpkiXdLmbYnvjiHnYVbUcU7SHU22ucI8SBdH5Qa/QxSAia+dT6G40q8TXILrl5dOg2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732169216; c=relaxed/simple;
	bh=vrkL7JRhFQg1QLuO+0X9cgB150fnz5gF4e3X9Jkf+2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Za/ng6e2IAP9bSZ2WdcJvSGMXyje03I6pMTsWYr9sQzNnaYE3/hCxMsQTaAg0soU0Zv7tauVJ9sbSjtsn79Ee6Lc5jMAZv6GgI0l0Lg14nh7MWrOONwbrwCI5aiPOAxIzdwWP8SJGmDn3IOUQ40i2hWwSdx8kRn3r6QQVQLBpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DtrZtUoI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKEwCf005732;
	Thu, 21 Nov 2024 06:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO6/5HsGPxnfAfCT2ZO6+hxDkdbf3npCoq9C7qnEZ3E=; b=DtrZtUoIYDscjDvO
	X9xOPqYkIfEsEY9uGQcto1VBlIeRRphG7+4JpAs8ZvwLi4CvuuH5/xXWfyWCSzdr
	CjNBwAuyRmzdjEQOC80FRnrgqpzww16YC1U2vmuh864fhFBKtfNrh5L/8K9K811v
	DCSQ0cHBKpbq2aea0dzXuQMkC1JAlm7UENfzt5/YIrkbB+SvyxdPvikgwbc4c2Gk
	hfJpfqMbpbAEztGdEACyn9j6z25gh8yCnPCOdhYIk7ihg3L6B2tMemn+RcSWhSge
	SV7XvpKsGl7ohkGHpOnGkZuV4uwqtcxnsmMooaQ0PGCwnGjmcbfzEa3tXmt2HEts
	tAyIxQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y80698-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:06:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL66a3e024427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:06:36 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:06:32 -0800
Message-ID: <e11e19ce-18e0-1fe9-8eda-aa12f8c87a73@quicinc.com>
Date: Thu, 21 Nov 2024 11:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] mtd: rawnand: qcom: Fix onfi param page read
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-3-quic_mdalam@quicinc.com>
 <20241120070609.u2nzofwnupyqnjqp@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241120070609.u2nzofwnupyqnjqp@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1L8Pt72tEb5a8LV64Pn06Ed2tcJo6bYX
X-Proofpoint-GUID: 1L8Pt72tEb5a8LV64Pn06Ed2tcJo6bYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210045



On 11/20/2024 12:36 PM, Manivannan Sadhasivam wrote:
> On Tue, Nov 19, 2024 at 02:50:58PM +0530, Md Sadre Alam wrote:
>> For QPIC V2 onwards there is a separate register to read
>> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
>>
>> qcom_param_page_type_exec() is used to read only one code word
>> If we will configure number of code words to 1 in QPIC_NAND_DEV0_CFG0
> 
> No 'we' in commit message. Also use imperative tone.
Ok
> 
>> register then QPIC controller thinks its reading the last code word,
>> since we are having separate register to read the last code word,
>> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n" register
>> to fetch data from QPIC buffer to system memory.
>>
>> Also there is minimum size to fetch the data from device to QPIC buffer
>> is 512-bytes. If size is less than 512-bytes the data will not be
>> protected by ECC as per QPIC standard. So while reading onfi parameter
>> page from NAND device setting nandc->buf_count = 512.
>>
> 
> This is a separate fix and should be in a separate patch.
Ok
> 
>> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> 
> Please describe the impact of the issue. Add relevant failure messages, affected
> SoC names etc...
Sure, Will update in next revision.
> 
> Finally, you should also CC stable list to backport the fixes.
Ok
> 
> - Mani
> 
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>   drivers/mtd/nand/raw/qcom_nandc.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index 34ee8555fb8a..6487f2126833 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -2859,7 +2859,12 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>>   	const struct nand_op_instr *instr = NULL;
>>   	unsigned int op_id = 0;
>>   	unsigned int len = 0;
>> -	int ret;
>> +	int ret, reg_base;
>> +
>> +	reg_base = NAND_READ_LOCATION_0;
>> +
>> +	if (nandc->props->qpic_v2)
>> +		reg_base = NAND_READ_LOCATION_LAST_CW_0;
>>   
>>   	ret = qcom_parse_instructions(chip, subop, &q_op);
>>   	if (ret)
>> @@ -2911,14 +2916,17 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>>   	op_id = q_op.data_instr_idx;
>>   	len = nand_subop_get_data_len(subop, op_id);
>>   
>> -	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
>> +	if (nandc->props->qpic_v2)
>> +		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
>> +	else
>> +		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
>>   
>>   	if (!nandc->props->qpic_v2) {
>>   		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
>>   		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
>>   	}
>>   
>> -	nandc->buf_count = len;
>> +	nandc->buf_count = 512;
>>   	memset(nandc->data_buffer, 0xff, nandc->buf_count);
>>   
>>   	config_nand_single_cw_page_read(chip, false, 0);
>> -- 
>> 2.34.1
>>
> 

