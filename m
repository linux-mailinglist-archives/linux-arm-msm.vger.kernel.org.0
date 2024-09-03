Return-Path: <linux-arm-msm+bounces-30524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8543A969E87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E03728661B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E332E1A42C5;
	Tue,  3 Sep 2024 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BP1eNfZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B61A7242;
	Tue,  3 Sep 2024 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725368391; cv=none; b=pp6/kOoJvJgpUELEVVmRkiVk3T9xp0VumNjpxUTr2JCX2G1DuYU+pxOnEcCkAZWSA89EKSEGSPSERCMTPA0AIncO52dcPNMk6fL3pFUoMqJzN3MMs67mhnU3hfeU0C0rQKECgOm9FX9EToSi45myROXBjcRp+DWUvqUdTMr9EH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725368391; c=relaxed/simple;
	bh=jHyzpKqHokvHJ6S6KmoMJTRdJ5y0C642VzrrUor11Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BuWGikmpCFBP7SsM5UYuz99/lZ5U9AJoAVowaDnE24aoB2Da/GR3FXK2jaFTZf2VCoFn/KFN5xEzakZSDy/53F0UNDNQ9cBTmWWVYFv7R7i/SaaG1sGMG+hpEdUQsTGlgjJqiYJs6kWHtgXD2pyLG7AGJbXgFex3sIfxzAQXKHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BP1eNfZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483BcUfk007584;
	Tue, 3 Sep 2024 12:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcyjG8QKOoXWSL8QH8MzR7ntKgb2gNkywn39XRQw5Wg=; b=BP1eNfZtuMUUfHfu
	xpRLG9tB7x3CoQSQtQ8lODh3TnVtvcFaaqrdMRQvPCREVLow834i9seVI5MHwF4Y
	L9hKH5sXhncDa9VJbifiHPjq0NwanuVLkHj6CPJC7loakY3xGDfrCWsWhBftljGP
	vujXuBcNJMUnKou8gEQ9bdj3LrTfuEmLR3qyE6yn7ZoeY9NJcdFS3mu7ClmjMEyY
	WtG0u5bi/EGd4nOZ9dxyEGiRuPzm040DpM7sp0dEHBJ4EDOe7/fbwCRKA6rHnptO
	162aTP23uefr1J0kXy2cgcP2//XdAgcAF3QWaEh2ZkjSYc95b1tSqFPbPy2MNEQI
	8aN0AA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt4rfcxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 12:59:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483CxV5M026573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 12:59:31 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 05:59:25 -0700
Message-ID: <f5121a5f-86f3-4c14-93ed-581b8ef82797@quicinc.com>
Date: Tue, 3 Sep 2024 18:29:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/6] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Robin Murphy <robin.murphy@arm.com>, <robdclark@gmail.com>,
        <will@kernel.org>, <joro@8bytes.org>, <jgg@ziepe.ca>,
        <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-2-quic_bibekkum@quicinc.com>
 <fe5fcd06-ff28-4171-aa22-1bdc1e8510d0@arm.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <fe5fcd06-ff28-4171-aa22-1bdc1e8510d0@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: saTMxbKunqahZcuz22Pw9UQJvnNCBwCH
X-Proofpoint-ORIG-GUID: saTMxbKunqahZcuz22Pw9UQJvnNCBwCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030105



On 8/30/2024 6:23 PM, Robin Murphy wrote:
> On 16/08/2024 6:42 pm, Bibek Kumar Patro wrote:
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
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 36 ++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 36c6b36ad4ff..8ac1850b852f 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -16,6 +16,16 @@
>>
>>   #define QCOM_DUMMY_VAL    -1
>>
>> +/*
>> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
>> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
>> + * buffer). The remaining bits are implementation defined and vary 
>> across
>> + * SoCs.
>> + */
>> +
>> +#define CPRE            (1 << 1)
>> +#define CMTLB            (1 << 0)
>> +
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>>       return container_of(smmu, struct qcom_smmu, smmu);
>> @@ -381,11 +391,31 @@ static int qcom_smmu_def_domain_type(struct 
>> device *dev)
>>       return match ? IOMMU_DOMAIN_IDENTITY : 0;
>>   }
>>
>> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>> +{
>> +    int ret;
>> +    u32 val;
>> +    int i;
>> +
>> +    ret = arm_mmu500_reset(smmu);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* arm_mmu500_reset() disables CPRE which is re-enabled here */
> 
> I still think it would be good to document why we think this is OK, 
> given the reasons for disabling CPRE to begin with.
> 

Hi Robin,

Sure, I agree with your point. I’ll elaborate on the comment here to 
document the reason for re-enabling CPRE.

/* The errata for MMU-500 before the r2p2 revision requires CPRE to be
disabled. The arm_mmu500_reset function disables CPRE to accommodate all
RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
the CPRE bit for the next-page prefetcher to retain the prefetch value
during reset and runtime suspend operations. */

Does this sound good, let me know of your suggestions as well incase.

Thanks & regards,
Bibek

> Thanks,
> Robin.
> 
>> +    for (i = 0; i < smmu->num_context_banks; ++i) {
>> +        val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
>> +        val |= CPRE;
>> +        arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>>   {
>>       int ret;
>>
>> -    arm_mmu500_reset(smmu);
>> +    qcom_smmu500_reset(smmu);
>>
>>       /*
>>        * To address performance degradation in non-real time clients,
>> @@ -412,7 +442,7 @@ static const struct arm_smmu_impl 
>> qcom_smmu_500_impl = {
>>       .init_context = qcom_smmu_init_context,
>>       .cfg_probe = qcom_smmu_cfg_probe,
>>       .def_domain_type = qcom_smmu_def_domain_type,
>> -    .reset = arm_mmu500_reset,
>> +    .reset = qcom_smmu500_reset,
>>       .write_s2cr = qcom_smmu_write_s2cr,
>>       .tlb_sync = qcom_smmu_tlb_sync,
>>   #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
>> @@ -445,7 +475,7 @@ static const struct arm_smmu_impl 
>> qcom_adreno_smmu_v2_impl = {
>>   static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>>       .init_context = qcom_adreno_smmu_init_context,
>>       .def_domain_type = qcom_smmu_def_domain_type,
>> -    .reset = arm_mmu500_reset,
>> +    .reset = qcom_smmu500_reset,
>>       .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>       .write_sctlr = qcom_adreno_smmu_write_sctlr,
>>       .tlb_sync = qcom_smmu_tlb_sync,
>> -- 
>> 2.34.1
>>

