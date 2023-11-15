Return-Path: <linux-arm-msm+bounces-699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB137EC423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9D41C203A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 13:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B231EB49;
	Wed, 15 Nov 2023 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L1CpFfmY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781C1EB42
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 13:54:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31F1AC;
	Wed, 15 Nov 2023 05:54:45 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFCSvt4014315;
	Wed, 15 Nov 2023 13:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oBP2dFBiDbOyaRGMr5yqMC/ir++OPuPgxt40VbUWRc0=;
 b=L1CpFfmYRPRhKAgyw6HYDzRcKbKnt2Clb3UimN6nWZtibNAo9vsacxsfJRnV6gVZiYBi
 Cu+w4Bk9b743I3NedD8rCHf+sUE6YwmunI0RHXpD/kC9mbCUE5twqE0NN8yZ7TLBR835
 7PsdnTcfokaN2FDIb6o2qloAbAE8Mt7KYuOmJk6oq8VzXqtDl/1ShGkRsFQAZYjvgh6e
 D7sM/oypMjgwK0hmIoayS4k50swoH8Xd5QOuyR6ud5v3jctjQiPbRIxwY0u46gMGAqtn
 dFXH2+jAR0I8V5JLol3+g8WQEdgkBtAShGi5MUkO+5WHKh+kWqWMmHHvjMSjxzwv9InF wg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucg2ua0jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 13:54:24 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AFDsNak027204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 13:54:23 GMT
Received: from [10.214.66.253] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 05:54:19 -0800
Message-ID: <40282b6e-9524-4a88-97ca-3ce890317279@quicinc.com>
Date: Wed, 15 Nov 2023 19:24:16 +0530
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
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <372885ab-b24d-44ae-afb8-76755bcd6e21@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z4WfetCGr6aHoS6udUiamQVWWL3ojOWZ
X-Proofpoint-GUID: Z4WfetCGr6aHoS6udUiamQVWWL3ojOWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_13,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=958
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311150108


>> @@ -467,6 +505,9 @@ static struct arm_smmu_device 
>> *qcom_smmu_create(struct arm_smmu_device *smmu,
>>       qsmmu->smmu.impl = impl;
>>       qsmmu->cfg = data->cfg;
>>
>> +    if (data->actlrcfg && (data->actlrcfg->size))
>> +        qsmmu->actlrcfg = data->actlrcfg;
> 
> Do we really need to replicate multiple parts of the data, or would it 
> be sensible to just replace qsmmu->cfg with qsmmu->data and handle the 
> further dereferences in the places that want them?
> 

Mm, could not understand this properly. :( Could you help explain more 
please?
As per my understanding aren't data and qsmmu different structures.
qcom_smmu is a superset of arm_smmu housing additonal properties
and qcom_smmu_match_data is kind of a superset of arm_smmu_impl with
additional specific implmentations, so both needs to be in place?
Apologies if I understood your statement incorrectly.

>> +
>>       return &qsmmu->smmu;
>>   }
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index 593910567b88..4b6862715070 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -9,6 +9,7 @@
>>   struct qcom_smmu {
>>       struct arm_smmu_device smmu;
>>       const struct qcom_smmu_config *cfg;
>> +    const struct actlr_config *actlrcfg;
>>       bool bypass_quirk;
>>       u8 bypass_cbndx;
>>       u32 stall_enabled;
>> @@ -25,6 +26,7 @@ struct qcom_smmu_config {
>>   };
>>

