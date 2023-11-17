Return-Path: <linux-arm-msm+bounces-844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ABB7EEBF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 06:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E9C6B20A4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 05:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E78D4A15;
	Fri, 17 Nov 2023 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ntXWc8Hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E45B127;
	Thu, 16 Nov 2023 21:27:44 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH4f9O6011080;
	Fri, 17 Nov 2023 05:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dhT2XdCd54WDofOXSqRAnO8rRI0rIMHIuPIIUVu1eco=;
 b=ntXWc8HrWboTdgCttpqzEoK5kz1OPpjAfh9slOhrT3MUUTBHjTAZsZTIUsbrZSixNIKW
 t6i30JWUz5GKshciH2V98nW1jXOvqi1msTPCKx30KFbm7LMjZdyoLSTefGpaD1RhsCWt
 JCpSnyR7C/sJ/vSDlx8GXwIql2uHS/6EKJxF9tFo4t9AlLMDQ1wt5Cni05bRFxaUPO2+
 GLo3amQGDhAgzVflxKpGaWZxP+XQJKLvcQ6OmLP9kEQb9pPoudfmppjhwcveZyIrUoB2
 NaQN6JsasGSerqxgP/9VIgQg/8fabeEkf3zCl4hXytmpyXABumC/WHcWaPy1KlbB/6Iq ng== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udhe1t798-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:27:27 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH5RRqd013039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:27:27 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 21:27:22 -0800
Message-ID: <9b406a7c-57b8-4b5f-8fbc-714560cce8cf@quicinc.com>
Date: Fri, 17 Nov 2023 10:57:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>,
        <dmitry.baryshkov@linaro.org>, <a39.skl@gmail.com>,
        <konrad.dybcio@linaro.org>, <quic_pkondeti@quicinc.com>,
        <quic_molvera@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <qipl.kernel.upstream@quicinc.com>
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-2-quic_bibekkum@quicinc.com>
 <372885ab-b24d-44ae-afb8-76755bcd6e21@arm.com>
 <40282b6e-9524-4a88-97ca-3ce890317279@quicinc.com>
 <c75d107a-44cb-4df3-b583-13719df1f8be@arm.com>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <c75d107a-44cb-4df3-b583-13719df1f8be@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 855NDTmkIbrpzKNLihUn6YTDtBl0mx7P
X-Proofpoint-ORIG-GUID: 855NDTmkIbrpzKNLihUn6YTDtBl0mx7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_03,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=957
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170037



On 11/15/2023 8:23 PM, Robin Murphy wrote:
> On 2023-11-15 1:54 pm, Bibek Kumar Patro wrote:
>>
>>>> @@ -467,6 +505,9 @@ static struct arm_smmu_device 
>>>> *qcom_smmu_create(struct arm_smmu_device *smmu,
>>>>       qsmmu->smmu.impl = impl;
>>>>       qsmmu->cfg = data->cfg;
>>>>
>>>> +    if (data->actlrcfg && (data->actlrcfg->size))
>>>> +        qsmmu->actlrcfg = data->actlrcfg;
>>>
>>> Do we really need to replicate multiple parts of the data, or would 
>>> it be sensible to just replace qsmmu->cfg with qsmmu->data and handle 
>>> the further dereferences in the places that want them?
>>>
>>
>> Mm, could not understand this properly. :( Could you help explain more 
>> please?
>> As per my understanding aren't data and qsmmu different structures.
>> qcom_smmu is a superset of arm_smmu housing additonal properties
>> and qcom_smmu_match_data is kind of a superset of arm_smmu_impl with
>> additional specific implmentations, so both needs to be in place?
>> Apologies if I understood your statement incorrectly.
> 
> My point is that the data is static and constant, so there's really no 
> point storing multiple pointers into different bits of it. So rather than:
> 
>      qsmmu->cfg = data->cfg;
>      qssmu->actlrcfg = data->actlrcfg;
>      ...
>      do_something(qsmmu->cfg);
>      ...
>      do_other_thing(qsmmu->actlrcfg);
> 
> we can just store the one pointer and have:
> 
>      qsmmu->data = data;
>      ...
>      do_something(qsmmu->data->cfg);
>      ...
>      do_other_thing(qsmmu->data->actlrcfg);
> 
> Thanks,
> Robin.
> 

I see, this looks like probably we need a separate patch altogether for
this cleanup, as "cfg" is used in other fault handling places as well as 
i can see and is introduced as a part of different patch. Should we 
scope this work for a separate patch if it's okay?

Thanks,
Bibek
>>>> +
>>>>       return &qsmmu->smmu;
>>>>   }
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h 
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> index 593910567b88..4b6862715070 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> @@ -9,6 +9,7 @@
>>>>   struct qcom_smmu {
>>>>       struct arm_smmu_device smmu;
>>>>       const struct qcom_smmu_config *cfg;
>>>> +    const struct actlr_config *actlrcfg;
>>>>       bool bypass_quirk;
>>>>       u8 bypass_cbndx;
>>>>       u32 stall_enabled;
>>>> @@ -25,6 +26,7 @@ struct qcom_smmu_config {
>>>>   };
>>>>

