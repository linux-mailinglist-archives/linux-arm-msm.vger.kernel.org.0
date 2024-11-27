Return-Path: <linux-arm-msm+bounces-39277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7D9DA474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A31916613F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F98190493;
	Wed, 27 Nov 2024 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cE5TRT6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646BB14AD02;
	Wed, 27 Nov 2024 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698339; cv=none; b=FieNuY1lTPXi2i5KnBK5kFs6zOWwyCpZWeVZlzDrbh3iEHE2hH9MIq0ObuwJjuBm9b1rmK+gEaYWhhXTCU9zVs3d1S1+o+JWZ9CunC2GT91UTrVPiFeEVd5SWBOaybKv5CjLqmBiM2eBxkbkpoh9dIAlsJwe+PggxF0Wtwe9uvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698339; c=relaxed/simple;
	bh=Tb6kjVh7jfFmpmMXuIRGhK7kiVbrABjoeMQJv2i1pcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ym1EEXWM7ZOPERzWU/ZIkgzbt5Or9oUommonVc/xCrvsxijh8lDOtmnLaa/rYMs2Gz1ieBPxksz9PTWjA4+tOo0S9tBVKze+3a6XJzWOlHJeBUSWzIXxQR7hcbFl/sWwuPyxZhJ3dGp64DovE8tqfmF9uwRj5YP09JuUwtRq+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cE5TRT6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLJ7V022746;
	Wed, 27 Nov 2024 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKdg1a8UXEDnzqGonEr7So4ElPrNguVTFyRMl84Fin0=; b=cE5TRT6L1gNXBGNF
	q66671gjswCoOiVoBtTayHYMcVjMI0mHqeo/HC3q5oBOJUVbewC6BAN1Z9ofoNnU
	Zvfj2/qNlhHbICSMBpW5SpxQJd+WRceP1/FV4BdmxabVTDVjzwtH1MTQel6Fr9eW
	zmalJBYwQRHsIFaLa/1HyZv4H6Gaov8eoyNxbWmnfgzsCuLurr3ZC2ypiyMm3Nek
	ONPQdk0KM72bBYLIj7ssJWDFKmR+9q1E0S+otK+F8XATKVyW5thCIZkG/KXcKB/K
	+zUiso3Ei8M36r3dZzHlWQYXHBIlFGAsP5/+bAxTgy8N6PuWxO5+fhmhkS67s6Ck
	tfvQNQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mx7794s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:05:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR95IQZ028294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:05:18 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 01:05:14 -0800
Message-ID: <09a03767-1bd5-c398-7894-5fd1392d1fb8@quicinc.com>
Date: Wed, 27 Nov 2024 14:35:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/3] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-2-quic_mdalam@quicinc.com>
 <20241126053019.ujdb7nkkj3f25jyn@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241126053019.ujdb7nkkj3f25jyn@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MkfATXQB6BIws0kTm7OdZD9qGKcZDd_s
X-Proofpoint-ORIG-GUID: MkfATXQB6BIws0kTm7OdZD9qGKcZDd_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270074



On 11/26/2024 11:00 AM, Manivannan Sadhasivam wrote:
> On Fri, Nov 22, 2024 at 02:29:31PM +0530, Md Sadre Alam wrote:
>> Currently we are configuring lower 24 bits of address in descriptor
>> whereas QPIC design expects 18 bit register offset from QPIC base
>> address to be configured in cmd descriptors. This is leading to a
>> different address actually being used in HW, leading to wrong value
>> read.
>>
>> the actual issue is that the NANDc base address is different from the
>> QPIC base address. But the driver doesn't take it into account and just
>> used the QPIC base as the NANDc base. This used to work as the NANDc IP
>> only considers the lower 18 bits of the address passed by the driver to
>> derive the register offset. Since the base address of QPIC used to contain
>> all 0 for lower 18 bits (like 0x07980000), the driver ended up passing the
> 
> SDX55's NANDc base is 0x01b30000 and it has bits 17 and 18 set corresponding to
> 0x30000. So it is correct that the IP only considers lower 18 bits and it used
> to work as the driver ended up passing 0x3000 + register offset.
This address 0x30000 is the address from QPIC_BASE to QPIC_EBI2NAND
e.g for SDX55 and SDX65 the QPIC_BASE is 0x01B00000. So here lower 18-bits
are zero only.
> 
> Your wording is not correct.
Ok, will fix in next revision.
> 
>> actual register offset in it and NANDc worked properly. But on newer SoCs
>> like SDX75, the QPIC base address doesn't contain all 0 for lower 18 bits
>> (like 0x01C98000). So NANDc sees wrong offset as per the current logic
>>
> 
> 'all 0 for lower 18 bits' is not true.
The lower 18 bits zero we have to see in QPIC_BASE not in EBI2NAND_BASE.
e.g SDX55 & SDX65 the QPIC_BASE = 0x01B00000, all lower 18 bits are zero
but in SDX75 the QPIC_BASE = 0x01C98000, all lower 18 bits are non-zero.
> 
>> Older targets also used same configuration (lower 24 bits) like SDX55,
>> SDX65, IPQ8074, IPQ6018  etc. but issue is masked in older targets due
>> to lower 18 bits of QPIC base address being zero leading to expected
>> address generation.
>>
> 
> This paragraph is redundant now.
Ok, will remove in next revision.
> 
>> The address should be passed to BAM 0x30000 + offset. In older targets
>> the lower 18-bits are zero so that correct address being paased. But
>> in newer targets the lower 18-bits are non-zero in QPIC base so that
>> 0x300000 + offset giving the wrong value.
>>
>> SDX75 : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
>> SDX55 : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
> 
> This address is wrong as I mentioned above.
Ok, will fix in next revision.
> 
>> older targets.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>
>> Change in [v2]
>>
>> * Updated commit message
>>
>> * Added Fixes tag
>>
>> * Added stable kernel tag
>>
>> * Renamed the variable from offset_from_qpic to nandc_offset
>>
>> Change in [v1]
>>
>> * Preliminary correction for the register address forwarded to BAM
>>   
>>   drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index b8cff9240b28..cc59461df72e 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
>>   #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>>   
>>   /* Returns the NAND register physical address */
>> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
>> +#define nandc_reg_phys(chip, offset)  ((nandc)->props->nandc_offset + (offset))
>>   
>>   /* Returns the dma address for reg read buffer */
>>   #define reg_buf_dma_addr(chip, vaddr) \
>> @@ -561,6 +561,7 @@ struct qcom_nandc_props {
>>   	bool is_qpic;
>>   	bool qpic_v2;
>>   	bool use_codeword_fixup;
>> +	u32 nandc_offset;
>>   };
>>   
>>   /* Frees the BAM transaction memory */
>> @@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>>   	.is_bam = false,
>>   	.use_codeword_fixup = true,
>>   	.dev_cmd_reg_start = 0x0,
>> +	.nandc_offset = 0x30000,
>>   };
>>   
>>   static const struct qcom_nandc_props ipq4019_nandc_props = {
>> @@ -3484,6 +3486,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
>>   	.is_bam = true,
>>   	.is_qpic = true,
>>   	.dev_cmd_reg_start = 0x0,
>> +	.nandc_offset = 0x30000,
>>   };
>>   
>>   static const struct qcom_nandc_props ipq8074_nandc_props = {
>> @@ -3491,6 +3494,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
>>   	.is_bam = true,
>>   	.is_qpic = true,
>>   	.dev_cmd_reg_start = 0x7000,
>> +	.nandc_offset = 0x30000,
>>   };
>>   
>>   static const struct qcom_nandc_props sdx55_nandc_props = {
>> @@ -3498,7 +3502,8 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
>>   	.is_bam = true,
>>   	.is_qpic = true,
>>   	.qpic_v2 = true,
>> -	.dev_cmd_reg_start = 0x7000,
>> +	.dev_cmd_reg_start = 0x0,
> 
> What is this change?
Sorry, by mistake this get modified. Will fix in next revision.
> 
> - Mani
> 

