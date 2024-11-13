Return-Path: <linux-arm-msm+bounces-37836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6879C7854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 17:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F17428B912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F0615CD60;
	Wed, 13 Nov 2024 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f1vC2gci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F615C14B;
	Wed, 13 Nov 2024 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514240; cv=none; b=mET2b/R9WZuJqfLQhn5Q20A8GIHkWRHUeSRYGPvQr4ih2Dw3OLNaVsaB29uBNmRFf6Y18coIoSDEHXz0iyeAb1z6vXEsgK7/dA0QpOlzeW3k182n9l6hmY17eswbfmb212h8huMFQFwz5+AXoXzaHYJLXAKda9UDoToH76w+cMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514240; c=relaxed/simple;
	bh=h7rgYNY0zMGLozPpnICPg0s1zDS8h/q1Wmkb+nNMBWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nWmqUBerLGDc0FQdHnbk2yy3O8KiVQGm3KJqDFQFuXtlgrxZVENEeOzVh58ZFk4Tf7VndhUUC5Snie9vbE/vkBe8mDl0A3KmoT+dPAOzHv+tRqrB43PwuRilRN8S4B8Be8lFOMHWVwVJgENtOBbdCpJbWg9XhrJ6AUlgA0O82ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f1vC2gci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADAppQR004020;
	Wed, 13 Nov 2024 16:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZK0+YyweZQCes29dh8tlT1jQMLj3p8TWxhGiIGAqi4=; b=f1vC2gcizXg8j4r+
	uS+n0N3twR8WBoboJrE/WNlMVABJquNJrshzeQJtPf41eRo01/zUuGDnLCy2klM+
	WEMzaYImRivxq2UFjnoxCRiBDzOxsL5skp/grnKLah+HTJ0g+gXHQsAXsV3BGCpg
	QZj9dQwL31aqSlzRq29Ll6jRAV9kTXLNSMwyXi0S8Cq//+lAAMSeOiI5kF89jolY
	G/CLryb3nVEvKcH2IASWlSwTHNVpfckUNsq9JhdbMoDp7OFFLpds7orgbrFNy6gu
	wEdPju1Vv6n9/YbAB0BhVW0fw9CeqOzV4bwN7ewDZ+zDixQXJk9qncLt/OPEVFvk
	ceYRig==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vtqwrt38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:10:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADGATKm005284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:10:29 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:10:24 -0800
Message-ID: <b2ec9392-8682-4c4f-8ffc-8ec540ac6e00@quicinc.com>
Date: Wed, 13 Nov 2024 21:40:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dma: gpi: Add Lock and Unlock TRE support to
 access SE exclusively
To: Vinod Koul <vkoul@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-3-quic_msavaliy@quicinc.com> <Zw1jm+cVpwz0xhGp@vaman>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Zw1jm+cVpwz0xhGp@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r9mL_ha9NlOVg1s_x2LISSLA2695Ij0T
X-Proofpoint-ORIG-GUID: r9mL_ha9NlOVg1s_x2LISSLA2695Ij0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130135

Thanks Vinod for your review comments !

On 10/15/2024 12:01 AM, Vinod Koul wrote:
> On 27-09-24, 12:01, Mukesh Kumar Savaliya wrote:
>> GSI DMA provides specific TREs namely Lock and Unlock TRE, which
>> provides mutual exclusive access to SE from any of the subsystem
>> (E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
>> concurrently performing DMA transfers and avoids disturbance to
>> data path. Basically for shared SE usecase, lock the SE for
>> particular subsystem, complete the transfer, unlock the SE.
> 
> it is dmaengine: xxx so please update that
> 
Done
>>
>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>> TRE for the last transfer.
>>
>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>
>> TRE = Transfer Ring Element, refers to the queued descriptor.
>> SE = Serial Engine
>> SS = Subsystems (Apps processor, TZ, ADSP, Modem)
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>>   include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 52a7c8f2498f..120d91234442 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2020, Linaro Limited
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -65,6 +66,14 @@
>>   /* DMA TRE */
>>   #define TRE_DMA_LEN		GENMASK(23, 0)
>>   
>> +/* Lock TRE */
>> +#define TRE_I2C_LOCK		BIT(0)
>> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
>> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)
>> +
>> +/* Unlock TRE */
>> +#define TRE_I2C_UNLOCK		BIT(8)
>> +
>>   /* Register offsets from gpi-top */
>>   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>>   #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
>> @@ -516,7 +525,7 @@ struct gpii {
>>   	bool ieob_set;
>>   };
>>   
>> -#define MAX_TRE 3
>> +#define MAX_TRE 5
>>   
>>   struct gpi_desc {
>>   	struct virt_dma_desc vd;
>> @@ -1637,6 +1646,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   	struct gpi_tre *tre;
>>   	unsigned int i;
>>   
>> +	/* create lock tre for first tranfser */
>> +	if (i2c->shared_se && i2c->first_msg) {
>> +		tre = &desc->tre[tre_idx];
>> +		tre_idx++;
>> +
>> +		tre->dword[0] = 0;
>> +		tre->dword[1] = 0;
>> +		tre->dword[2] = 0;
>> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
>> +		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
>> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
>> +	}
>> +
>>   	/* first create config tre if applicable */
>>   	if (i2c->set_config) {
>>   		tre = &desc->tre[tre_idx];
>> @@ -1695,6 +1717,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>>   	}
>>   
>> +	/* Unlock tre for last transfer */
>> +	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
>> +		tre = &desc->tre[tre_idx];
>> +		tre_idx++;
>> +
>> +		tre->dword[0] = 0;
>> +		tre->dword[1] = 0;
>> +		tre->dword[2] = 0;
>> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
>> +		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
>> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
>> +	}
>> +
>>   	for (i = 0; i < tre_idx; i++)
>>   		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>>   			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
>> index 6680dd1a43c6..8589c711afae 100644
>> --- a/include/linux/dma/qcom-gpi-dma.h
>> +++ b/include/linux/dma/qcom-gpi-dma.h
>> @@ -65,6 +65,9 @@ enum i2c_op {
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>>    * @muli-msg: is part of multi i2c r-w msgs
>> + * @shared_se: bus is shared between subsystems
>> + * @bool first_msg: use it for tracking multimessage xfer
>> + * @bool last_msg: use it for tracking multimessage xfer
>>    */
>>   struct gpi_i2c_config {
>>   	u8 set_config;
>> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>>   	u32 rx_len;
>>   	enum i2c_op op;
>>   	bool multi_msg;
>> +	bool shared_se;
>> +	bool first_msg;
>> +	bool last_msg;
> 
> Looking at the usage in following patches, why cant this be handled
> internally as part of prep call?
> 
As per design, i2c driver iterates over each message and submits to GPI 
where it creates TRE. Since it's per transfer, we need to create Lock 
and Unlock TRE based on first or last message.
> 
>>   };
>>   
>>   #endif /* QCOM_GPI_DMA_H */
>> -- 
>> 2.25.1
> 

