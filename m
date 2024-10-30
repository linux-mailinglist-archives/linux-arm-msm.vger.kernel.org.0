Return-Path: <linux-arm-msm+bounces-36420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB09B61E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0104F281DFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD49D1F12F9;
	Wed, 30 Oct 2024 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WHb6oIUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8101EF952;
	Wed, 30 Oct 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287937; cv=none; b=HwnixElgwoa825E/HolyW34YG/9b5yEGiABS8wNr+0vqyoLwS1X1BIVGbNx8700PfN/4zwDQfxNyAC+N2Ey/3j+MgC4NGXu2Fa/+/7qD5JGQV5zb2ycVjuWB8IQw60/ixlzgwSb4+kv3lBhc/gZMkCrgvl+2y0SicN3jujW5Czw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287937; c=relaxed/simple;
	bh=w6H7Qq42d5eP8LdVc2TdnqklE3NAyDo0h846LZs1ff4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T5wb1l1fSPokktKatG+TEpt5fIDBISR/+hbdbPsocC4a7VdXPRI9rRJj8YsayRptFmmZP7L43zQEnjFEea+uPeds3UkaollXwjy3x/mMkdmWZCK41xatpntVO2bYttpSsxJ8OrUWyF+aft5gw//L/JaoKg2vHFava1LHlVkWNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WHb6oIUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U4msrZ027408;
	Wed, 30 Oct 2024 11:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOlC8HDfJ7U71PYiyPB7unuvlzouylxbI0NzZJCY39o=; b=WHb6oIUOBDKD0AvU
	MC6BTJhP5meNs9Y3bn+QHSm4gHOfHUQaZvZWRE2yXSqWDhEtDAuQwS81ICGdHR1k
	Z6ukYv9LdFWdUd4M/pE6ilRVMtNGfp5G84A0ibCJ6V2yKGXQkIB4KezA3u6AqQfT
	Nc9DlQU7qYPr9UWhHFbaBKbJn1u4+kw/qZgzXOn/f9oOGlSdZabAKz5hMLhJ2HQ3
	LGzShfcHtVyV++aGkitwmYqGUNmwlZhW+KAFGj5rD2nuB5BFzirLlsnAQyXA9UGs
	qHuaCzOkvHz9uzvkrn0g/B4GmI7QL6sBXVsFUxR/fzkrduRBgds6UtjLqb9+oAkF
	ehv8IA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k1p33483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 11:31:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UBVtK7027520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 11:31:56 GMT
Received: from [10.214.66.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 04:31:08 -0700
Message-ID: <e7a8e786-d67d-4ee7-a4d1-d9d02fd08bda@quicinc.com>
Date: Wed, 30 Oct 2024 17:00:13 +0530
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
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20241029124708.GA4241@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yI_kZ8z9PhJ4xMO0zQsOvTIwldSf4Fn1
X-Proofpoint-ORIG-GUID: yI_kZ8z9PhJ4xMO0zQsOvTIwldSf4Fn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300090



On 10/29/2024 6:17 PM, Will Deacon wrote:
> On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 10/24/2024 6:22 PM, Will Deacon wrote:
>>> On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
>>>> Default MMU-500 reset operation disables context caching in
>>>> prefetch buffer. It is however expected for context banks using
>>>> the ACTLR register to retain their prefetch value during reset
>>>> and runtime suspend.
>>>>
>>>> Replace default MMU-500 reset operation with Qualcomm specific reset
>>>> operation which envelope the default reset operation and re-enables
>>>> context caching in prefetch buffer for Qualcomm SoCs.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
>>>>    1 file changed, 42 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 087fb4f6f4d3..0cb10b354802 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -16,6 +16,16 @@
>>>>
>>>>    #define QCOM_DUMMY_VAL	-1
>>>>
>>>> +/*
>>>> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
>>>> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
>>>> + * buffer). The remaining bits are implementation defined and vary across
>>>> + * SoCs.
>>>> + */
>>>> +
>>>> +#define CPRE			(1 << 1)
>>>> +#define CMTLB			(1 << 0)
>>>> +
>>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>    {
>>>>    	return container_of(smmu, struct qcom_smmu, smmu);
>>>> @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
>>>>    	return match ? IOMMU_DOMAIN_IDENTITY : 0;
>>>>    }
>>>>
>>>> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>>>> +{
>>>> +	int ret;
>>>> +	u32 val;
>>>> +	int i;
>>>> +
>>>> +	ret = arm_mmu500_reset(smmu);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/*
>>>> +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
>>>> +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
>>>> +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
>>>> +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
>>>> +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
>>>> +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
>>>> +	 * during reset and runtime suspend operations.
>>>> +	 */
>>>> +
>>>> +	for (i = 0; i < smmu->num_context_banks; ++i) {
>>>> +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
>>>> +		val |= CPRE;
>>>> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
>>>> +	}
>>>
>>> If CPRE only needs to be disabled prior to r2p2, then please teach the
>>> MMU-500 code about that instead of adding qualcomm-specific logic here.
>>>
>>
>> Doing this on MMU-500 code would make it generic and reflect for SoC of all
>> the vendors on this platform.
>> We can make sure that it won't cause any problems in Qualcomm SoCs as we
>> have been enabling this since for some years now and could not
>> observe/reproduce any issues around these errata.
> 
> Unless you can explain definitively hy that's the case, I still don't
> think we should be second-guessing the core SMMU driver code in the
> Qualcomm backend.
> 
>> But we won't be able to guarantee the same behavior in SoC for other vendors
>> where these errata might still be applicable as per [1] and [2].
>> So as per my understanding it's safe to include in Qualcomm specific
>> implementation and not changing the default behavior in all other vendors'
>> SoC even if they are not prior to r2p2 revision [3].
> 
> If you want to gate the errata workarounds on policy, then please follow
> what we do for the CPU: add a Kconfig option (e.g.
> ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> the relevant errata aren't all "rare") and update silicon-errata.rst
> accordingly.
> 
> Then you can choose to disable them in your .config if you're happy to
> pick up the pieces.

This seems to be a good idea to me . I am thinking of this approach 
based on your suggestion,
i.e. we can bind the original workaround in
arm_mmu500_reset implementation within ARM_SMMU_WORKAROUND_BROKEN_CPRE
config (defualts to on, CPRE would be disabled) and in QCOM SoCs default 
it to off
(when ARM_SMMU_QCOM=Y -> switch ARM_SMMU_WORKAROUND_BROKEN_CPRE=N).

In silicon-errata.rst would updating ARM_SMMU_WORKAROUND_BROKEN_CPRE be 
okay , as the config names are based on erratum number.

Thanks & regards,
Bibek



> 
> As an aside, I'm happy with the rest of the series now.
> 
> Will


