Return-Path: <linux-arm-msm+bounces-71734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75BDB41670
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EEBA7AD0E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B1A2DA77D;
	Wed,  3 Sep 2025 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ODqpf1MW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80253253359;
	Wed,  3 Sep 2025 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884565; cv=none; b=Isco7nK1PcJkzn44O3Ajj8e1jCTk32cihdJHAXnnyMVO5kRHyu2NwfLXD846KTo4+dIuySWfWn1XjWk/bglEYv6nTvZTjLuDtsc8SHGU0RmYgjE13zjPsZ1dhI0/Wf0MqnKrBUxnhCEvEQWMRaqIkjBYHggsWng73xVVGH3k+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884565; c=relaxed/simple;
	bh=il0bQUUF/awkUBDSMgmNGFru+HmxoYrIPzM8y0uvesM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a7MW7mgLvEiCgUqNmdKxXvggMpHU9ngVwPhXe3PpKsI0mzrwbXIUMqCuF+DKFFKaz4XYEcWRYhxJlEr3RuR2oxMpFpgg7yxEq22wMAwB66httlJ/wQQl2vKu5qe5ZTsfjERW7VHYcAmhwVeG48uiuGx1QClkvjgnlbKa9c0/5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ODqpf1MW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831v7aM024029;
	Wed, 3 Sep 2025 07:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yG0U+/OZ6lNHnt3xeIqCpgOxd+sMU4u6meLZ/uRO9to=; b=ODqpf1MWFf0Kc20T
	12Y0MvqiZqw4tnHIAllxkJufCFtnx6+07TIvdkqlipkqaTSkCkaqS8S8jHA2lzwq
	2igy4v/KeitlI0ZSqe7IDfjHf/oNaml4Ze18vAoSsEe7fNzfC1kArHMBDIuChV10
	/4zfcTQ/H9gkAlfcTptHtinMEiwBBSWgygoUKm5k1benEw7wS6NVr8fXQHu/AUb+
	Spj5p19M4QGmZiIQXarcLI1qwZ5Q3Wmo2rGDTHcAbSLAOaAyJaQOcQLsJ4yRJYE0
	JcpQLsYMlTl4AN4QtJtTebkSxerYHZQhD3bp2BqeX3fJfvmtH6iwIQGF08TJvyhb
	ZcA86Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32g6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 07:28:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5837SPwu002743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 07:28:25 GMT
Received: from [10.216.0.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 00:28:01 -0700
Message-ID: <013a91f9-7a8e-4606-9f5a-5d675f78117c@quicinc.com>
Date: Wed, 3 Sep 2025 12:57:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] ufs: ufs-qcom: Streamline UFS MCQ resource mapping
To: Manivannan Sadhasivam <mani@kernel.org>,
        Ram Kumar Dwivedi
	<quic_rdwivedi@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-2-quic_rdwivedi@quicinc.com>
 <ljgirap5pa74fchujk3wrg7wt66x2pub7ezdhuxfbqswymepbe@cu6o5mqg4lak>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ljgirap5pa74fchujk3wrg7wt66x2pub7ezdhuxfbqswymepbe@cu6o5mqg4lak>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXwOvPGzr56bzb
 OvPtie7mcABacUF97jRgAVxmoaR3j5379SKvXXHTaMoB3UwsL3hPGxjeGalExRNgf6KNnBSHvxt
 nte0socvH4vzLNCl7P++RXvHiPcDv40+S7mAscqDTDSPVkcr8C6lqmpKxwp6xTPA/lk0Dw9uEpD
 KYd71jaOAdnNbld6a812Wz2ud5FDSASJ0SaocyixJqhXFORBYobIz2yCvhMQA5poTu47R71zD+L
 i4I9qfAtRjZo7A7eqdUiutICJr/Gk+QeC3fyHcUYv4zA7aRDH6GrF4s7iHR4deEhs+BnIbWf58y
 Tpa0leL7WrexjbE63AXjHHF0wLuyayID27L/ihSe3e0iMI7zBhC3VhNwkOHejNlx6JgliyEpB3K
 H2l5StLb
X-Proofpoint-ORIG-GUID: YbcDXk9bCDq-DfRjiuyJM1uXmpwY1KHW
X-Proofpoint-GUID: YbcDXk9bCDq-DfRjiuyJM1uXmpwY1KHW
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b7ee1a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=IakwTT1RSBMIzvV5xi4A:9 a=r0ZRNBMo7uGkUgGo:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 8/22/2025 2:34 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 21, 2025 at 04:53:59PM GMT, Ram Kumar Dwivedi wrote:
>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>
>> The current MCQ resource configuration involves multiple resource
>> mappings and dynamic resource allocation.
>>
>> Simplify the resource mapping by directly mapping the single "mcq"
>> resource from device tree to hba->mcq_base instead of mapping multiple
>> separate resources (RES_UFS, RES_MCQ, RES_MCQ_SQD, RES_MCQ_VS).
>>
>> It also uses predefined offsets for MCQ doorbell registers (SQD,
>> CQD, SQIS, CQIS) relative to the MCQ base,providing clearer memory
>> layout clarity.
>>
>> Additionally update vendor-specific register offset UFS_MEM_CQIS_VS
>> offset from 0x8 to 0x4008 to align with the hardware programming guide.
>>
>> The new approach assumes the device tree provides a single "mcq"
>> resource that encompasses the entire MCQ configuration space, making
>> the driver more maintainable and less prone to resource mapping errors.
>>
> 
> Also make it clear that the binding only requires a single 'mcq' region and not
> the separate ones as the driver is using. Otherwise, it sounds like a breakage.

Sure, I'll update this in commit text as part of next patch set.


> 
>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Tag order is messed up. Please fix it.

Sure, I'll address this in next patch set.


> 
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 146 +++++++++++++-----------------------
>>   drivers/ufs/host/ufs-qcom.h |  22 +++++-
>>   2 files changed, 73 insertions(+), 95 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 9574fdc2bb0f..6c6a385543ef 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1910,116 +1910,73 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>>   	hba->clk_scaling.suspend_on_no_request = true;
>>   }
>>   
>> -/* Resources */
>> -static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
>> -	{.name = "ufs_mem",},
>> -	{.name = "mcq",},
>> -	/* Submission Queue DAO */
>> -	{.name = "mcq_sqd",},
>> -	/* Submission Queue Interrupt Status */
>> -	{.name = "mcq_sqis",},
>> -	/* Completion Queue DAO */
>> -	{.name = "mcq_cqd",},
>> -	/* Completion Queue Interrupt Status */
>> -	{.name = "mcq_cqis",},
>> -	/* MCQ vendor specific */
>> -	{.name = "mcq_vs",},
>> -};
>> -
>>   static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
>>   {
>>   	struct platform_device *pdev = to_platform_device(hba->dev);
>> -	struct ufshcd_res_info *res;
>> -	struct resource *res_mem, *res_mcq;
>> -	int i, ret;
>> -
>> -	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
>> -
>> -	for (i = 0; i < RES_MAX; i++) {
>> -		res = &hba->res[i];
>> -		res->resource = platform_get_resource_byname(pdev,
>> -							     IORESOURCE_MEM,
>> -							     res->name);
>> -		if (!res->resource) {
>> -			dev_info(hba->dev, "Resource %s not provided\n", res->name);
>> -			if (i == RES_UFS)
>> -				return -ENODEV;
>> -			continue;
>> -		} else if (i == RES_UFS) {
>> -			res_mem = res->resource;
>> -			res->base = hba->mmio_base;
>> -			continue;
>> -		}
>> +	struct resource *res;
>>   
>> -		res->base = devm_ioremap_resource(hba->dev, res->resource);
>> -		if (IS_ERR(res->base)) {
>> -			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
>> -					 res->name, (int)PTR_ERR(res->base));
>> -			ret = PTR_ERR(res->base);
>> -			res->base = NULL;
>> -			return ret;
>> -		}
>> +	/* Map the MCQ configuration region */
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq");
>> +	if (!res) {
>> +		dev_err(hba->dev, "MCQ resource not found in device tree\n");
>> +		return -ENODEV;
>>   	}
>>   
>> -	/* MCQ resource provided in DT */
>> -	res = &hba->res[RES_MCQ];
>> -	/* Bail if MCQ resource is provided */
>> -	if (res->base)
>> -		goto out;
>> -
>> -	/* Explicitly allocate MCQ resource from ufs_mem */
>> -	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
>> -	if (!res_mcq)
>> -		return -ENOMEM;
>> -
>> -	res_mcq->start = res_mem->start +
>> -			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
>> -	res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
>> -	res_mcq->flags = res_mem->flags;
>> -	res_mcq->name = "mcq";
>> -
>> -	ret = insert_resource(&iomem_resource, res_mcq);
>> -	if (ret) {
>> -		dev_err(hba->dev, "Failed to insert MCQ resource, err=%d\n",
>> -			ret);
>> -		return ret;
>> +	hba->mcq_base = devm_ioremap_resource(hba->dev, res);
>> +	if (IS_ERR(hba->mcq_base)) {
>> +		dev_err(hba->dev, "Failed to map MCQ region: %ld\n",
> 
> Do you really need to print errnos of size 'long int'?



On Failure devm_ioremap_resource, returns an error pointer using ERR_PTR 
which is type long. Hence %ld is used.



> 
>> +			PTR_ERR(hba->mcq_base));
>> +		return PTR_ERR(hba->mcq_base);
>>   	}
>>   
>> -	res->base = devm_ioremap_resource(hba->dev, res_mcq);
>> -	if (IS_ERR(res->base)) {
>> -		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
>> -			(int)PTR_ERR(res->base));
>> -		ret = PTR_ERR(res->base);
>> -		goto ioremap_err;
>> -	}
>> -
>> -out:
>> -	hba->mcq_base = res->base;
>>   	return 0;
>> -ioremap_err:
>> -	res->base = NULL;
>> -	remove_resource(res_mcq);
>> -	return ret;
>>   }
>>   
>>   static int ufs_qcom_op_runtime_config(struct ufs_hba *hba)
>>   {
>> -	struct ufshcd_res_info *mem_res, *sqdao_res;
>>   	struct ufshcd_mcq_opr_info_t *opr;
>>   	int i;
>> +	u32 doorbell_offsets[OPR_MAX];
>>   
>> -	mem_res = &hba->res[RES_UFS];
>> -	sqdao_res = &hba->res[RES_MCQ_SQD];
>> -
>> -	if (!mem_res->base || !sqdao_res->base)
>> +	if (!hba->mcq_base) {
>> +		dev_err(hba->dev, "MCQ base not mapped\n");
>>   		return -EINVAL;
>> +	}
> 
> Is it possible to hit this error?

No as per current code. So i can remove this in next patch set.

> 
>> +
>> +	/*
>> +	 * Configure doorbell address offsets in MCQ configuration registers.
>> +	 * These values are offsets relative to mmio_base (UFS_HCI_BASE).
>> +	 *
>> +	 * Memory Layout:
>> +	 * - mmio_base = UFS_HCI_BASE
>> +	 * - mcq_base  = MCQ_CONFIG_BASE = mmio_base + (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)
>> +	 * - Doorbell registers are at: mmio_base + (UFS_QCOM_MCQCAP_QCFGPTR * 0x200) +
>> +	 * -				UFS_QCOM_MCQ_SQD_OFFSET
>> +	 * - Which is also: mcq_base +  UFS_QCOM_MCQ_SQD_OFFSET
>> +	 */
>> +
>> +	doorbell_offsets[OPR_SQD] = UFS_QCOM_SQD_ADDR_OFFSET;
>> +	doorbell_offsets[OPR_SQIS] = UFS_QCOM_SQIS_ADDR_OFFSET;
>> +	doorbell_offsets[OPR_CQD] = UFS_QCOM_CQD_ADDR_OFFSET;
>> +	doorbell_offsets[OPR_CQIS] = UFS_QCOM_CQIS_ADDR_OFFSET;
>>   
>> +	/*
>> +	 * Configure MCQ operation registers.
>> +	 *
>> +	 * The doorbell registers are physically located within the MCQ region:
>> +	 * - doorbell_physical_addr = mmio_base + doorbell_offset
>> +	 * - doorbell_physical_addr = mcq_base + (doorbell_offset - MCQ_CONFIG_OFFSET)
>> +	 */
>>   	for (i = 0; i < OPR_MAX; i++) {
>>   		opr = &hba->mcq_opr[i];
>> -		opr->offset = sqdao_res->resource->start -
>> -			      mem_res->resource->start + 0x40 * i;
>> -		opr->stride = 0x100;
>> -		opr->base = sqdao_res->base + 0x40 * i;
>> +		opr->offset = doorbell_offsets[i];  /* Offset relative to mmio_base */
>> +		opr->stride = UFS_QCOM_MCQ_STRIDE;  /* 256 bytes between queues */
>> +
>> +		/*
>> +		 * Calculate the actual doorbell base address within MCQ region:
>> +		 * base = mcq_base + (doorbell_offset - MCQ_CONFIG_OFFSET)
>> +		 */
>> +		opr->base = hba->mcq_base + (opr->offset - UFS_QCOM_MCQ_CONFIG_OFFSET);
>>   	}
>>   
>>   	return 0;
>> @@ -2034,12 +1991,13 @@ static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
>>   static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
>>   					unsigned long *ocqs)
>>   {
>> -	struct ufshcd_res_info *mcq_vs_res = &hba->res[RES_MCQ_VS];
>> -
>> -	if (!mcq_vs_res->base)
>> +	if (!hba->mcq_base) {
>> +		dev_err(hba->dev, "MCQ base not mapped\n");
>>   		return -EINVAL;
>> +	}
> 
> Same here.

Sure, I'll address this in next patch set.


> 
>>   
>> -	*ocqs = readl(mcq_vs_res->base + UFS_MEM_CQIS_VS);
>> +	/* Read from MCQ vendor-specific register in MCQ region */
>> +	*ocqs = readl(hba->mcq_base + UFS_MEM_CQIS_VS);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
>> index e0e129af7c16..8c2c94390a50 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -33,6 +33,25 @@
>>   #define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
>>   #define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
>>   
>> +/* Qualcomm MCQ Configuration */
>> +#define UFS_QCOM_MCQCAP_QCFGPTR     224  /* 0xE0 in hex */
>> +#define UFS_QCOM_MCQ_CONFIG_OFFSET  (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)  /* 0x1C000 */
>> +
>> +/* Doorbell offsets within MCQ region (relative to MCQ_CONFIG_BASE) */
>> +#define UFS_QCOM_MCQ_SQD_OFFSET     0x5000
>> +#define UFS_QCOM_MCQ_CQD_OFFSET     0x5080
>> +#define UFS_QCOM_MCQ_SQIS_OFFSET    0x5040
>> +#define UFS_QCOM_MCQ_CQIS_OFFSET    0x50C0
>> +#define UFS_QCOM_MCQ_STRIDE         0x100
>> +
>> +/* Calculated doorbell address offsets (relative to mmio_base) */
>> +#define UFS_QCOM_SQD_ADDR_OFFSET    (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_SQD_OFFSET)
>> +#define UFS_QCOM_CQD_ADDR_OFFSET    (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_CQD_OFFSET)
>> +#define UFS_QCOM_SQIS_ADDR_OFFSET   (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_SQIS_OFFSET)
>> +#define UFS_QCOM_CQIS_ADDR_OFFSET   (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_CQIS_OFFSET)
>> +
>> +#define REG_UFS_MCQ_STRIDE          UFS_QCOM_MCQ_STRIDE
>> +
>>   /* QCOM UFS host controller vendor specific registers */
>>   enum {
>>   	REG_UFS_SYS1CLK_1US                 = 0xC0,
>> @@ -96,7 +115,8 @@ enum {
>>   };
>>   
>>   enum {
>> -	UFS_MEM_CQIS_VS		= 0x8,
>> +	UFS_MEM_VS_BASE         = 0x4000,
>> +	UFS_MEM_CQIS_VS		= 0x4008,
> 
> Why are these offsets 'enum'? Can't they be fixed definitions like other
> offsets?

Sure, I'll address this in next patch set.

Thanks,
Nitin

> 
> - Mani


