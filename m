Return-Path: <linux-arm-msm+bounces-35889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD889B05AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 16:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B6A1F24BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8141FB8A1;
	Fri, 25 Oct 2024 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZE0KHZ+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A91D9668;
	Fri, 25 Oct 2024 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866181; cv=none; b=j5KCeZnbz4sarmLlkwDa7tOAIH5frGMJ55aWb5VcAyuoWHrK/OPcbHNzSoDiHlmhere0jGVZhXke68zaSTPFnmH5ZQDpV53LUH7/5FKPVaKGK5Iu41uru/3Y4MYmn0iXLV0gPvQSOR0KDJRyw0lHZkNI+FZRB/L/+zXKJH/gadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866181; c=relaxed/simple;
	bh=rvJ5UrpH8CAj6aSMv+fxBBx82elqojErPfgDYbT+2DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fgng+BpNH/UGBT2+nMYP/yRArkIUkDL43EEzcYE37b35FTNeQMhPzpuxsB9CirAn151B5ziltgO1KN5egfzPY8vshHt1tgIK/tjH4qkCbj4dCu9BS5Gh/P4oCLC2xDH0q62whCqH8WNO2vjpt2wpeWbGjPorOv9S0LdDR8Jf6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZE0KHZ+G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBC3IQ017697;
	Fri, 25 Oct 2024 14:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbRBhp0nksiEsDwTJjRTX0/cwvwxa/39KRzDImBUbOA=; b=ZE0KHZ+GY85xP6fS
	p7gBZWklnjbqKAPIXNenvdNFftGJ6h4uwgMMDLtFg4VlMwkA5boaHBm4M20ozYs2
	P/cnbHlHKlMkMTCRs6Idtr2jKugWVRXwORyG/SrPRSYj6V6Xq6kI0TyzvKSRs1CJ
	anr9wF8dLoA210/Xp9tSPSk2keyELZZAaxKg1W6F/dP5EAQtahIowENrSmcvn4up
	ZmNMglWxPUQvKAPObc0sFEkX5FIA8oVJorQoV3dbyKmJo341a+iSvKs/2OgKWQQJ
	tfofNBH5KtdGpumjm3hugsuicXTSBXjhB8gxYgHmjl9/vqD/HG4MTJXbQQasJ34T
	KkkriQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3whe9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:22:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PEMeov023378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:22:40 GMT
Received: from [10.214.227.50] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 07:21:54 -0700
Message-ID: <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
Date: Fri, 25 Oct 2024 19:51:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Will Deacon <will@kernel.org>
CC: <robdclark@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20241024125241.GD30704@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y1Vf84Z4S45OAOubf3kdrxvTuc6LPKz7
X-Proofpoint-ORIG-GUID: y1Vf84Z4S45OAOubf3kdrxvTuc6LPKz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250111



On 10/24/2024 6:22 PM, Will Deacon wrote:
> On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
>> Default MMU-500 reset operation disables context caching in
>> prefetch buffer. It is however expected for context banks using
>> the ACTLR register to retain their prefetch value during reset
>> and runtime suspend.
>>
>> Replace default MMU-500 reset operation with Qualcomm specific reset
>> operation which envelope the default reset operation and re-enables
>> context caching in prefetch buffer for Qualcomm SoCs.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
>>   1 file changed, 42 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 087fb4f6f4d3..0cb10b354802 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -16,6 +16,16 @@
>>
>>   #define QCOM_DUMMY_VAL	-1
>>
>> +/*
>> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
>> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
>> + * buffer). The remaining bits are implementation defined and vary across
>> + * SoCs.
>> + */
>> +
>> +#define CPRE			(1 << 1)
>> +#define CMTLB			(1 << 0)
>> +
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>>   	return container_of(smmu, struct qcom_smmu, smmu);
>> @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
>>   	return match ? IOMMU_DOMAIN_IDENTITY : 0;
>>   }
>>
>> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>> +{
>> +	int ret;
>> +	u32 val;
>> +	int i;
>> +
>> +	ret = arm_mmu500_reset(smmu);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
>> +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
>> +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
>> +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
>> +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
>> +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
>> +	 * during reset and runtime suspend operations.
>> +	 */
>> +
>> +	for (i = 0; i < smmu->num_context_banks; ++i) {
>> +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
>> +		val |= CPRE;
>> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
>> +	}
> 
> If CPRE only needs to be disabled prior to r2p2, then please teach the
> MMU-500 code about that instead of adding qualcomm-specific logic here.
> 

Doing this on MMU-500 code would make it generic and reflect for SoC of 
all the vendors on this platform.
We can make sure that it won't cause any problems in Qualcomm SoCs as we 
have been enabling this since for some years now and could not 
observe/reproduce any issues around these errata.

But we won't be able to guarantee the same behavior in SoC for other 
vendors where these errata might still be applicable as per [1] and [2].
So as per my understanding it's safe to include in Qualcomm specific 
implementation and not changing the default behavior in all other 
vendors' SoC even if they are not prior to r2p2 revision [3].

[1]: 
https://lore.kernel.org/all/4db1b4d2-0aa9-4640-b7d7-7d18ab64569a@arm.com/
[2]: 
https://lore.kernel.org/all/467590c40029ef0712b1fd38f2928fd4f08d09af.1726232138.git.robin.murphy@arm.com/
[3]: 
https://lore.kernel.org/all/CAA8EJprHppoN6rg8-rS1F+4kynQqmV1L3OiHFnJ0HyrshywFig@mail.gmail.com/ 


Thanks & regards,
Bibek



> Will

