Return-Path: <linux-arm-msm+bounces-19885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D68C6828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 16:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF66E1F23E56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8644D14036B;
	Wed, 15 May 2024 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cX3oXw54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92413F433;
	Wed, 15 May 2024 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781606; cv=none; b=Vjeos/y3jx1GCQe7tFlrI+nz1J2tKcuZBBXTo8sZlLW+ifQmpxDO6YKcrQZYWO0HNjGsY/fzTANziSm3m569n78Oa8ET4SSuc43+xAEWBy40HoevAVxFr0WVwpWTwCawhO+7OJs9mMFDvyWoIJ0HHQ/5zqtzD3GM7brDcs5EsrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781606; c=relaxed/simple;
	bh=nNCvn+LTR3HF0HYu1Ms5WNy0wPxDZ1DGc/ApOSFNMas=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qx0K1H8OSIEy3159oNZ5uK9cyA5Nu9UNAVStkWUHLhBoaXHFbMwpvezC0hHIkDQwa2pnvUF6zjasZ04rgCcNSsyYEpEz/H6RwF/2ZktIYF/Lf+7+BHJVdSwmMYpc+rFUacYSMDPed6JjiZdusVnyahttLBaBDA/rlU1jpmu7u8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cX3oXw54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90cf6012347;
	Wed, 15 May 2024 13:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=z5nmHfaq7fpNC+vzw2j6vpM0SSB3xUrKvCEz2G5i64A=; b=cX
	3oXw548rkNZvsDHwyD8fsL+ePmfn4tSF8HZ40Bs5H7pjf6svQWECZ0dp9iYwu86R
	6VDY5awiM6W2UINFqZQZcr2xe9CKk+C9aLdisS1/Kh3slEmyVjf4qCY4qUtX1sEu
	4EGB0xiSANcf2mFzDQUYqByk9PHnDJ+mTn1mIydoEb6y4C8bAizg7UHT4m2hENoQ
	YDfal4M/hkL40akKTGHzwMPPjXycj5EgwD4AxDWgDVOHyxG2hA6TElluW8Auq7wc
	MD0VUeIN9DpKX/0dzVXGxtSiX9AhbnoCqpQxHM1e/bKfmqMsJq8FWz5Y/WrgVQUX
	/Lb5H35kHp3Fyrw2B7EA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28npx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:59:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FDxdTb015592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:59:39 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 06:59:33 -0700
Message-ID: <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com>
Date: Wed, 15 May 2024 19:29:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <dmitry.baryshkov@linaro.org>, <jsnitsel@redhat.com>,
        <quic_bjorande@quicinc.com>, <mani@kernel.org>,
        <quic_eberman@quicinc.com>, <robdclark@chromium.org>,
        <u.kleine-koenig@pengutronix.de>, <robh@kernel.org>,
        <vladimir.oltean@nxp.com>, <quic_pkondeti@quicinc.com>,
        <quic_molvera@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com>
 <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
 <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: txihSruCNW1nVPzBJ-XNCpZsT7TjaDCy
X-Proofpoint-GUID: txihSruCNW1nVPzBJ-XNCpZsT7TjaDCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150098



On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
> On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 5/1/2024 12:30 AM, Rob Clark wrote:
>>> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>>> register which is implementation defined and is used for Qualcomm SoCs
>>>> to have a custom prefetch setting enabling TLB to prefetch the next set
>>>> of page tables accordingly allowing for faster translations.
>>>>
>>>> ACTLR value is unique for each SMR (Stream matching register) and stored
>>>> in a pre-populated table. This value is set to the register during
>>>> context bank initialisation.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
> 
> [...]
> 
>>>> +
>>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>>>> +                       smr = &smmu->smrs[idx];
>>>> +                       if (smr_is_subset(smr, id, mask)) {
>>>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>>>> +                                               actlrcfg[i].actlr);
>>>
>>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
>>> downstream kgsl's PRR thing (which we'll need to implement vulkan
>>> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
>>> to enable PRR.
>>>
>>>           val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>>>           val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>>>           KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
>>>
>>> Any idea how this works?  And does it need to be done before or after
>>> the ACTLR programming done in this patch?
>>>
>>> BR,
>>> -R
>>>
>>
>> Hi Rob,
>>
>> Can you please help provide some more clarification on the FIFO part? By FIFO are you referring to the storing of ACTLR data in the table?
>>
>> Thanks for pointing to the downstream implementation of kgsl driver for
>> the PRR bit. Since kgsl driver is already handling this PRR bit's
>> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
> 
> The kgsl driver is not present upstream.
> 

Right kgsl is not present upstream, it would be better to avoid 
configuring the PRR bit and can be handled by kgsl directly in downstream.

>> Thanks for bringing up this point.
>> I will send v10 patch series removing this BIT(5) setting from the ACTLR
>> table.
> 
> I think it's generally saner to configure the SMMU from the SMMU driver..

Yes, agree on this. But since PRR bit is not directly related to SMMU
configuration so I think it would be better to remove this PRR bit
setting from SMMU driver based on my understanding.


Thanks & regards,
Bibek
> 
> Konrad

