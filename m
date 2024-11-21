Return-Path: <linux-arm-msm+bounces-38606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FF9D4766
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2C51F2216D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AE113AA53;
	Thu, 21 Nov 2024 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YWx9R5lZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D71CA84;
	Thu, 21 Nov 2024 06:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732169035; cv=none; b=Z+C9+J5S0z7xsohNGN6V7U8Fl4a+0GII7UTd7aQw+icnx3FQcMSTnVDL1RY9FLzc95S6NRe2/32R5Sk7Jc+dHx5xj9dSV033ys4Kmt6hDfzzHjD0+Sx8IqLK5dwhReu9uyl6GUjPMlinjmwC0HE1UEsjntabCxTZAXyIMF1dbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732169035; c=relaxed/simple;
	bh=YwAMbjE4WlP84kGuh0Ly6VUFIb9Fz9LYSgmvSsF9F9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XU33QgcSCHAmEP6Koxj/agsI4t6ygCyN6tyi49WnxJRwT8rPI+z6TCc4/0pQeSwRJ88a12O80Emk34GV8Dv8SlN9veVI9aX8CCaZ6Vz/Xysng1Y/yED8DJyWWlo50s+AOKo6b9Gxok31j5bwGi7OLYviQ/8a2nwuCaQmXNFFdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YWx9R5lZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLFT1e003960;
	Thu, 21 Nov 2024 06:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6Jl2tzSXGi/sUdh51WPs4tzerONVjaBeh4Spf+zr+g=; b=YWx9R5lZr0CKKtxN
	i6AA+2TwvelAPt5CigzhdAH8yOw0SDneFVgMBV+7F76wNima9uwatG2IlrbEBNwc
	dhvlFMlcL2ZqNEywRowXEHcWyyBTTEb/gU8diuiipBbv7iH/KZD+TK9gnwhoTwFy
	KMygmhoXlu37HvAnVhauwjI9JvmGcz6PkVoWe/6i5pgPMXTFm2HNszSvSTvWNv3n
	v2TK9/zqjFwhOBDQO52vttxwRK8WBLqk5mrKy++J5wlSip4ESl/Bv3aHyJ91UxvM
	5iur4eBFn31uncC7q5Uyad8eg5E8vVSVG4Q35fTATM2ScA025Cue97UXf66QTaHi
	1r0G9g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3avsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:03:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL63S2X007801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:03:28 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:03:24 -0800
Message-ID: <e76e9562-f7d0-88c9-dcb6-dfcf41cdf205@quicinc.com>
Date: Thu, 21 Nov 2024 11:33:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] mtd: rawnand: qcom: Pass 18 bit offset from QPIC base
 address to BAM
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-2-quic_mdalam@quicinc.com>
 <20241120070115.qox54zr3yhnkqgmd@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241120070115.qox54zr3yhnkqgmd@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RU4Nn85hEjtemehtf8aOgozaQkVC8fjO
X-Proofpoint-ORIG-GUID: RU4Nn85hEjtemehtf8aOgozaQkVC8fjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210045



On 11/20/2024 12:31 PM, Manivannan Sadhasivam wrote:
> On Tue, Nov 19, 2024 at 02:50:57PM +0530, Md Sadre Alam wrote:
>> Currently we are configuring lower 24 bits of address in descriptor
>> whereas QPIC design expects 18 bit register offset from QPIC base
> 
> You mean 'QPIC IP' here? But is it QPIC or NANDc? I guess the later.
It's QPIC IP only.
> 
>> address to be configured in cmd descriptors. This is leading to a
>> different address actually being used in HW, leading to wrong value
>> read.
>>
> 
> This doesn't clearly say what the actual issue is. IIUC, the issue is that the
> NANDc base address is different from the QPIC base address. But the driver
> doesn't take it into account and just used the QPIC base as the NANDc base. This
> used to work as the NANDc IP only considers the lower 18 bits of the address
> passed by the driver to derive the register offset. Since the base address of
> QPIC used to contain all 0 for lower 18 bits (like 0x07980000), the driver ended
> up passing the actual register offset in it and NANDc worked properly. But on
> newer SoCs like SDX75, the QPIC base address doesn't contain all 0 for lower 18
> bits (like 0x01C98000). So NANDc sees wrong offset as per the current logic.
Yes correct. If QPIC address = 0x07980000 and QPIC_EBI2NAND address = 0x079b0000
the the diff is 0x30000, this is the actual offset expected by QPIC RTL code.
and RTL needs only 18-bit offset.
> 
>> Older targets also used same configuration (lower 24 bits) like sdxpinn,
> 
> Please use actual product names and not internal names. I believe you are
> referring to SDX55/SDX65 here.
Ok , will change in next revision.
> 
>> ipq etc. but issue is masked in older targets due to lower 18 bits of QPIC
>> base address being zero leading to expected address generation.
>>
>> Sdxpinn     : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
>> Sdxnightjar : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
>> older targets.
> 
> Same here.
Ok
> 
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> Please add relevant Fixes tag.
Ok
> 
>> ---
>>   drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index b8cff9240b28..34ee8555fb8a 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
>>   #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>>   
>>   /* Returns the NAND register physical address */
>> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
>> +#define nandc_reg_phys(chip, offset)  ((nandc)->props->offset_from_qpic + (offset))
>>   
>>   /* Returns the dma address for reg read buffer */
>>   #define reg_buf_dma_addr(chip, vaddr) \
>> @@ -561,6 +561,7 @@ struct qcom_nandc_props {
>>   	bool is_qpic;
>>   	bool qpic_v2;
>>   	bool use_codeword_fixup;
>> +	u32 offset_from_qpic;
> 
> nandc_offset?
Ok
> 
>>   };
>>   
>>   /* Frees the BAM transaction memory */
>> @@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>>   	.is_bam = false,
>>   	.use_codeword_fixup = true,
>>   	.dev_cmd_reg_start = 0x0,
>> +	.offset_from_qpic = 0x30000,
> 
> How 0x30000 is supposed to work? You said the NANDc ignores lower 18 bits, but
> this has 17th and 18th bits set.
Not this address 0x30000, this the diff b/w QPIC base and EBI2NAND base. The 18-bits we have see
on this address 0x07980000 and this address 0x01C98000.
> 
> - Mani
> 

