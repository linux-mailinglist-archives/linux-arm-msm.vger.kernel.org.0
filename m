Return-Path: <linux-arm-msm+bounces-31347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB3971D4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62521C22EE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA31BBBFA;
	Mon,  9 Sep 2024 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aYrgThZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12B1BBBEC;
	Mon,  9 Sep 2024 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893934; cv=none; b=cDnmS+gJ7A565Q8V4CmLcnvyjj5Z99NNdKNuV7tOG5YiuDip4o8CcjD1gLUzM+8eecWGm8MAnl+ZmFHY4LZWTLF4yr+oIBqLk21V0f1FIlxZBuxNffuEcQJJc8V66D9Ch4NMUgvjX+6ZQkpi9n2+KeE4GGtmnFchFSSilO+Tf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893934; c=relaxed/simple;
	bh=+iSOfYq9Ua8qxhxntG/a+1cc+M2jfQnKGfbWwNTw0is=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=sFlMicIACnkK1eNSvG2CuW3DjTRJDDHm97XVc1LcNiJeYNajb3SbnRzO9UhI2sS6mP7x0/GyMOvWNe+yUge4dZvidzFiFocS/itxVeH8AFRU4H8npYqHy64KochtelNFreRvZ5xVvCZQ/VhnitfZh4Q3CUAYvZ7wYy3nk3crhig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aYrgThZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRPZi007001;
	Mon, 9 Sep 2024 14:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Dxb92dQiaIqmIVKPQHiXji0oWhUkRuAcZ70Nd3LWwc=; b=aYrgThZEMvA5aoxi
	LX7Vy0pJy0lJ6QCVHe95DFEy5rpjbua8CY11n7vgViT3bHBHYoth1/Z6yNxEExHd
	8uIRq/jc5A2ot0xsq3Pr0jxKK73Sh4STEY2+c+ftVIiNqc3Su3P9iCx+grQHkYBK
	/wIWaa3MRXTcEIMvRcD8sbN2TDxwkRCQEzHqh0oZjcM8M6aySc8DVm2FX7GMclB/
	tNZOn88rwu1VWd+ERhgpH5o6EnlaOMPexpyquFQJzg6jKYA4DEBUtm8/z1ixQOos
	901df9gRn/I4rartmitkL1EvvoJfoitK0X84GZ20Px0gr6UBPKALHD8PhgYjYQTY
	akmp5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5nk4kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 14:58:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489EwlMQ003318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 14:58:47 GMT
Received: from [10.110.38.56] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 07:58:43 -0700
Message-ID: <23ff8b44-44ff-40d3-ac6f-ddb5261a6fc3@quicinc.com>
Date: Mon, 9 Sep 2024 07:58:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Subject: Re: [PATCH v2 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <cover.1724968351.git.quic_uchalich@quicinc.com>
 <9acc746885d6b06c2333f0493413c44b85fa7f02.1724968351.git.quic_uchalich@quicinc.com>
 <343c2bc4-46b5-443b-bb3b-ed4a45ecce76@kernel.org>
Content-Language: en-US
In-Reply-To: <343c2bc4-46b5-443b-bb3b-ed4a45ecce76@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BaaHsQD68zQwHFtlA-tf8L2K2uKLhFYR
X-Proofpoint-ORIG-GUID: BaaHsQD68zQwHFtlA-tf8L2K2uKLhFYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409090118

On 8/29/2024 4:45 PM, Konrad Dybcio wrote:
> On 30.08.2024 12:15 AM, Unnathi Chalicheemala wrote:
>> Bootloader and firmware for SM8650 and older chipsets expect node
>> name as "qcom_scm". However, DeviceTree uses node name "scm" and this
>> mismatch prevents firmware from correctly identifying waitqueue IRQ
>> information. Waitqueue IRQ is used for signaling between secure and
>> non-secure worlds.
>>
>> To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
>> hardware irq number to be used from firmware instead of relying on data
>> provided by devicetree, thereby bypassing the DeviceTree node name
>> mismatch.
>>
>> This hardware irq number is converted to a linux irq number using newly
>> defined fill_irq_fwspec_params(). This linux irq number is then supplied to
>> the threaded_irq call.
>>
>> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 59 +++++++++++++++++++++++++++++++-
>>  drivers/firmware/qcom/qcom_scm.h |  1 +
>>  2 files changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 00c379a3cceb..ed51fbb1c065 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -32,6 +32,14 @@
>>  #include "qcom_scm.h"
>>  #include "qcom_tzmem.h"
>>  
>> +#define GIC_SPI_BASE            32
>> +#define GIC_MAX_SPI             987  // 1019 - 32
>> +#define GIC_ESPI_BASE           4096
>> +#define GIC_MAX_ESPI            1024 // 5120 - 4096
> 
> Are these going to remain constant on different implementations of the
> interrupt controller across different SoCs that use this? Are these
> mandated anywhere in the arm spec and/or present across the tree with
> parts touching gicv3?
> 

Yes they're constant across all SoCs that use Gunyah hypervisor.
They're documented in the GIC v3/v4 programming guide - I don't think
they're present in the tree.
INTID				Interrupt Type 
16 – 31				     PPIs
1056 – 1119 (GICv3.1)

32 – 1019			     SPIs
4096 – 5119 (GICv3.1) 

> Also, the subtraction comments take some guesswork.. perhaps something like
> 0..31 etc. would be easier.
> 
Ack.
> The MAX_(E)SPI macros could also just have the hwirq number to make the
> if-conditions below simpler
> 
Ack. I broke it up so the macros could be understandable. I can make them just
hwirq numbers.
>> +
>> +#define GIC_IRQ_TYPE_SPI        0
>> +#define GIC_IRQ_TYPE_ESPI       2
> 
> We can definitely use dt-bindings for this
> 
>> +
>>  static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
>>  module_param(download_mode, bool, 0);
>>  
>> @@ -1819,6 +1827,55 @@ bool qcom_scm_is_available(void)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_scm_is_available);
>>  
>> +static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
>> +{
>> +	if (WARN(virq < GIC_SPI_BASE, "Unexpected virq: %d\n", virq)) {
>> +		return -ENXIO;
>> +	} else if (virq <= (GIC_SPI_BASE + GIC_MAX_SPI)) {
>> +		fwspec->param_count = 3;
>> +		fwspec->param[0] = GIC_IRQ_TYPE_SPI;
>> +		fwspec->param[1] = virq - GIC_SPI_BASE;
>> +		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
>> +	} else if (WARN(virq < GIC_ESPI_BASE, "Unexpected virq: %d\n", virq)) {
>> +		return -ENXIO;
>> +	} else if (virq < (GIC_ESPI_BASE + GIC_MAX_ESPI)) {
>> +		fwspec->param_count = 3;
>> +		fwspec->param[0] = GIC_IRQ_TYPE_ESPI;
>> +		fwspec->param[1] = virq - GIC_ESPI_BASE;
>> +		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
>> +	} else {
>> +		WARN(1, "Unexpected virq: %d\n", virq);
>> +		return -ENXIO;
>> +	}
>> +	return 0;
> 
> This could use some prettifying (incl the previous comment):
> 
> if (GIC_SPI_BASE <= virq && virq <= GIC_SPI_MAX) {
> 	fwspec->param[0] = GIC_IRQ_TYPE_SPI;
> 	fwspec->param[1] = virq - GIC_SPI_BASE;
> } else if (GIC_ESPI_BASE <= virq && virq <= GIC_ESPI_MAX) {
> 	fwspec->param[0] = GIC_IRQ_TYPE_ESPI;
> 	fwspec->param[1] = virq - GIC_ESPI_BASE;
> } else {
> 	WARN(1, "Unexpected virq"...
> 	return -ENXIO;
> }
> 
> fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
> fwspec->param_count = 3;
> 
> is much easier to follow along in my opinion
> 
Ack, thanks!
>> +}
>> +
>> +static int qcom_scm_get_waitq_irq(void)
>> +{
>> +	int ret;
>> +	u32 hwirq;
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_WAITQ,
>> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
>> +		.owner = ARM_SMCCC_OWNER_SIP
>> +	};
>> +	struct qcom_scm_res res;
>> +	struct irq_fwspec fwspec;
>> +
>> +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fwspec.fwnode = of_node_to_fwnode(__scm->dev->of_node);
>> +	hwirq = res.result[1] & 0xffff;
> 
> GENMASK(15, 0)
> 
Ack.
>> +	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
>> +	if (ret)
>> +		return ret;
>> +	ret = irq_create_fwspec_mapping(&fwspec);
>> +
>> +	return ret;
>> +}
>> +
>>  static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
>>  {
>>  	/* FW currently only supports a single wq_ctx (zero).
>> @@ -1936,7 +1993,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>  	/* Let all above stores be available after this */
>>  	smp_store_release(&__scm, scm);
>>  
>> -	irq = platform_get_irq_optional(pdev, 0);
>> +	irq = qcom_scm_get_waitq_irq();
>>  	if (irq < 0) {
>>  		if (irq != -ENXIO)
> 
> Is this smc call left unimplemented on !auto platforms? If it's not
> (or it spits out bogus data), we're going to get a WARN splat in the
> log..
> 
This call is implemented on all platforms(auto and !auto) from SM8650 onward.
Will double-check on this.
> Additionally, this mechanism ties the trustzone and hypervisor together..
> Why isn't this done in gunyah which abstracts these resources? A hypercall
> sounds much saner than tying in a third party into the mix
> 
fill_irqfwspec_params is actually a function in gunyah's header file but I copied it
here as didn't want multi waitqueue support to be dependent on Gunyah's patches. I'll
check if this can be made a hyper call. 
Thanks for the review Konrad!
> Konrad


