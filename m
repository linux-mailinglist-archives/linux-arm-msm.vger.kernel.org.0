Return-Path: <linux-arm-msm+bounces-36497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3159B6DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 21:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9D61F22AE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 20:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510901D1509;
	Wed, 30 Oct 2024 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YSlotxyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33971BD9D9;
	Wed, 30 Oct 2024 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730320147; cv=none; b=pIG9qeB3s7OxttEMNitvjjYTvTbzzwI0AI3XUIXxqDrikGtL+WUfGQ1b/em2+ioeWUEjMUvfQ2Pt69+9/sjQun0oyY5sjDARccv9i/Qf9fpZevB1EeAHNWCCXkIaXL3Njbgir0q9mGPTMDGwctogMIezEzxS6O2ltv6gswaDqK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730320147; c=relaxed/simple;
	bh=XQDf4KwhzoVupOYmXKc8Lx1WuIdBC30yWgl0O9pEZLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IiXxFNHFWvA0JVCPjmdAOjH6V/yPgJRj2z2d8NRd9aeqc/Zjg1V2kgRa4V4+mbDNNYJ5CSuDXZ+9fnnTO1UiIdTOSx9H+gNF9qCcfsppTDHER3Hkw8UVd9tV3IGYExeAu1iZk3n3hxPDg52PYUzQJfAgOXHoINLYlqeRZ9PtoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YSlotxyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9NqxQ030781;
	Wed, 30 Oct 2024 20:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kr3pdSxJAC17iJeJYanChxc13xKqGSdNWwjLg2lSZvQ=; b=YSlotxyym6FVmk/V
	SnXHsMD0n13gRWDZmsK3trIxBa4OvVGcSkaIMGMUd29nkmJXfQyfj+qy1eDM5ioC
	UiNK3viw0QAQ1mM18CSaTXOfqPI2bximPf5mAYVObmYwDa7Ko571LlUJalLgbsaW
	xqvWer8e4GhKSfNg4HXtc1PpUXl4NPR3SlRq3NmYYnLznX8aGxMrqvPOUtA3M0gN
	xwEM1xMzDUQfmppV851r4nuq39PoVuW59tSCQI72e5SrUupedsqWVSJ4ctnBO2PC
	5wVBfd3CLSARyd0oSQ+KS3/nWtnjsSfr6sQIk9rJnRXi4HVYATU446oxd5yjrYEa
	lRwvCw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqwa0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 20:28:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UKSktF031408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 20:28:46 GMT
Received: from [10.216.13.3] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 13:28:40 -0700
Message-ID: <92f0df16-c755-49c2-8356-0b7b94754390@quicinc.com>
Date: Thu, 31 Oct 2024 01:57:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>
CC: <will@kernel.org>, <joro@8bytes.org>, <jgg@ziepe.ca>,
        <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
 <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
 <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com>
 <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
 <CAF6AEGvAYeY-fuk1Dg-0gsrod7Dy91qifKvChCd03=bs_zfs-g@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGvAYeY-fuk1Dg-0gsrod7Dy91qifKvChCd03=bs_zfs-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0DRIBPD_QtZswvcDiJ6fI5Eu4JlMrROk
X-Proofpoint-GUID: 0DRIBPD_QtZswvcDiJ6fI5Eu4JlMrROk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300160



On 10/30/2024 10:28 PM, Rob Clark wrote:
> On Wed, Oct 30, 2024 at 8:23 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 30/10/2024 1:14 pm, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 10/29/2024 6:59 PM, Robin Murphy wrote:
>>>> On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
>>>>> Add an adreno-smmu-priv interface for drm/msm to call
>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>>>> sequence as per request.
>>>>>
>>>>> This will be used by GPU to setup the PRR bit and related
>>>>> configuration registers through adreno-smmu private
>>>>> interface instead of directly poking the smmu hardware.
>>>>>
>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>> ---
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>>>    include/linux/adreno-smmu-priv.h           | 10 +++++-
>>>>>    3 files changed, 48 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/
>>>>> iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> index 6e0a2a43e45a..38ac9cab763b 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> @@ -25,6 +25,7 @@
>>>>>
>>>>>    #define CPRE            (1 << 1)
>>>>>    #define CMTLB            (1 << 0)
>>>>> +#define GFX_ACTLR_PRR        (1 << 5)
>>>>>
>>>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>>    {
>>>>> @@ -109,6 +110,40 @@ static void
>>>>> qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>>>        arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>>>    }
>>>>>
>>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>>>> +{
>>>>> +    struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>> +    const struct device_node *np = smmu->dev->of_node;
>>>>> +    struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>> +    u32 reg = 0;
>>>>> +
>>>>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>>>
>>>> These conditions aren't going to change between calls - wouldn't it
>>>> make more sense to conditionally assign the callbacks in the first
>>>> place? Not the biggest deal if this is a one-off context-setup type
>>>> thing, just that it looks a little funky.
>>>>
>>>
>>> Let me know if you want to pursue this still.
>>>   From the current PRR implementation in the graphics
>>> vendor layer, this seems to be just setup kind-of thing.
>>> Also if we keep this conditional check before assigning callbacks,
>>> and vendor layer caller won't be having any such check,
>>> wouldn't it be an issue in unsupported platforms (!qcom,smmu-500 or
>>> !qcom,adreno-smmu)
>>> as the callbacks won't be assigned?
>>> So as per my understanding I think it would be safe to keep the
>>> condition check here?
>>
>> Like I say, it makes more sense to me personally if SMMUs which don't
>> have a PRR don't offer a callback for setting the PRR which they don't
>> have, and for it to be the caller's responsibility not to call a NULL
>> callback where they wouldn't need to call one anyway. But the
>> adreno_priv interface is kind of Rob's thing, so I'll leave it to his
>> preference.
> 
> We can go the route of NULL cb if it is not supported (but should make
> note of that in the adreno-smmu-priv.h header comment)
> 

Actually I liked Robin's suggestion to use the compatible check before 
assignment in the sense that there won't be repeated compatible checks
for each call. My only concern was how to handle the non PRR supported 
targets incase vendors called it.
Thanks for clarifying the same, we can use null callbacks for non-PRR 
supported targets with a note in adreno-smmu-priv.h header, so that
caller could take care while implementing the same.
I'll incorporate these changes in next patch along with the CPRE workaround.

Thanks & regards,
Bibek


> BR,
> -R
> 
>> Thanks,
>> Robin.


