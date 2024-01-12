Return-Path: <linux-arm-msm+bounces-7108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966EC82C088
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 14:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF98AB21431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6097E6BB2F;
	Fri, 12 Jan 2024 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ePYBDYFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAFB54747;
	Fri, 12 Jan 2024 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CAvgK9007838;
	Fri, 12 Jan 2024 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=e++oduosROBbRwrR+WcfX2gh3eW8lfjBgtSsJfueI9M=; b=eP
	YBDYFOeOOqKCbdKdPEKbUxQN59pUcAgeX+w5JxvVnjWn+MeSGUuIRcfCONH/ATd7
	i+ygNjVPWbUcUcxIgYM8rQZO2surpP4HacEVyctNWfyd/+Br03PnFkhwn4EddMen
	3l2izPwy8kASsV9pYjQw34NkCBAGB9Jw0C6/1oKjc2dlflD2fWm0qqnM6mx9qIB5
	Bw/aU35SqcYfKNvQ0JSQfZ9TPwCub9oCBA1H7tSfbaUnj9S2/yPWPVH61uuuUGIG
	cAvRyChuiCwrDtB2glOyZ4NHVY9r3zS+STNnnAUDUCL+EY6mUY4+OdWwHALFweqn
	7iur9+IM6+p0iZGWTUpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk43xg6yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 13:07:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CD7CD5019245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 13:07:12 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 05:07:07 -0800
Message-ID: <d7110cff-334f-40cd-9f11-62fafd8d722d@quicinc.com>
Date: Fri, 12 Jan 2024 18:36:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavan Kondeti
	<quic_pkondeti@quicinc.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <dmitry.baryshkov@linaro.org>, <jsnitsel@redhat.com>,
        <quic_bjorande@quicinc.com>, <mani@kernel.org>,
        <quic_eberman@quicinc.com>, <robdclark@chromium.org>,
        <u.kleine-koenig@pengutronix.de>, <robh@kernel.org>,
        <vladimir.oltean@nxp.com>, <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20240109114220.30243-1-quic_bibekkum@quicinc.com>
 <20240109114220.30243-4-quic_bibekkum@quicinc.com>
 <2ad70157-27d1-41df-8866-c226af690cf6@quicinc.com>
 <ec31fafa-b912-454a-8b64-e0593911aaf2@quicinc.com>
 <4a595815-7fcc-47e2-b22c-dac349af6d79@quicinc.com>
 <492aeca3-a4df-47a3-9c77-02ea4235d736@linaro.org>
 <1a1f9b11-5a6d-41f7-8bcd-533a61a27a65@quicinc.com>
 <babd9514-6202-486f-a7c5-51ad793aaca6@linaro.org>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <babd9514-6202-486f-a7c5-51ad793aaca6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zLsShExd-OpWjT8-1yvTGKYYdogaEpEy
X-Proofpoint-GUID: zLsShExd-OpWjT8-1yvTGKYYdogaEpEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401120102



On 1/12/2024 3:31 PM, Konrad Dybcio wrote:
> 
> 
> On 1/11/24 19:09, Bibek Kumar Patro wrote:
>>
>>
>> On 1/10/2024 11:26 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 1/10/24 13:55, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 1/10/2024 4:46 PM, Bibek Kumar Patro wrote:
>>>>>
>>>>>
>>>>> On 1/10/2024 9:36 AM, Pavan Kondeti wrote:
>>>>
>>>> [...]
>>>>
>>>>>>> @@ -274,6 +321,21 @@ static const struct of_device_id 
>>>>>>> qcom_smmu_client_of_match[] __maybe_unused = {
>>>>>>>   static int qcom_smmu_init_context(struct arm_smmu_domain 
>>>>>>> *smmu_domain,
>>>>>>>           struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>>>>   {
>>>>>>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>> +    struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>>>>> +    const struct actlr_variant *actlrvar;
>>>>>>> +    int cbndx = smmu_domain->cfg.cbndx;
>>>>>>> +
>>>>>>> +    if (qsmmu->data->actlrvar) {
>>>>>>> +        actlrvar = qsmmu->data->actlrvar;
>>>>>>> +        for (; actlrvar->io_start; actlrvar++) {
>>>>>>> +            if (actlrvar->io_start == smmu->ioaddr) {
>>>>>>> +                qcom_smmu_set_actlr(dev, smmu, cbndx, 
>>>>>>> actlrvar->actlrcfg);
>>>>>>> +                break;
>>>>>>> +            }
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>
>>>>>> This block and the one in qcom_adreno_smmu_init_context() are exactly
>>>>>> the same. Possible to do some refactoring?
>>>>>>
>>>>>
>>>>> I will check if this repeated blocks can be accomodated this into 
>>>>> qcom_smmu_set_actlr function if that would be fine.
>>>>>
>>>>
>>>> Also adding to this, this might increase the number of indentation 
>>>> inside qcom_smmu_set_actlr as well, to around 5. So wouldn't this
>>>> be an issue?
>>>
>>> By the way, we can refactor this:
>>>
>>> if (qsmmu->data->actlrvar) {
>>>      actlrvar = qsmmu->data->actlrvar;
>>>      for (; actlrvar->io_start; actlrvar++) {
>>>          if (actlrvar->io_start == smmu->ioaddr) {
>>>              qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar->actlrcfg);
>>>              break;
>>>          }
>>>      }
>>> }
>>>
>>> into
>>>
>>> // add const u8 num_actlrcfgs to struct actrl_variant to
>>> // save on sentinel space:
>>> //   sizeof(u8) < sizeof(ptr) + sizeof(resource_size_t)
>>>
>>
>> Git it, Would it be better to add this in struct qcom_smmu_match_data ?
> 
> Yes, right.
> 

Actually, I noticed now, we can do both the actlr_config (num_actlrcfg 
is used) and actlr_var (num_smmu is used) in the similar by storing the 
number of elements in each of them.
something like this:

+static const struct actlr_config sc7280_apps_actlr_cfg[] = {
+	{ 0x0800, 0x24e1, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2000, 0x0163, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2080, 0x0461, PREFETCH_DEFAULT | CMTLB },
+	{ 0x2100, 0x0161, PREFETCH_DEFAULT | CMTLB },
+	{ 0x0900, 0x0407, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x2180, 0x0027, PREFETCH_SHALLOW | CPRE | CMTLB },
+	{ 0x1000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
+};
+
+static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
+	{ 0x0000, 0x07ff, PREFETCH_SWITCH_GFX | PREFETCH_DEEP | CPRE | CMTLB },
+};
+
+static const struct actlr_variant sc7280_actlr[] = {
+	{ .io_start = 0x15000000, .actlrcfg = sc7280_apps_actlr_cfg, 
.num_actlrcfg = 7 },
+	{ .io_start = 0x03da0000, .actlrcfg = sc7280_gfx_actlr_cfg, 
.num_actlrcfg = 1 },
+};
+
  static const struct actlr_config sm8550_apps_actlr_cfg[] = {
  	{ 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
  	{ 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
@@ -661,6 +680,13 @@ static const struct qcom_smmu_match_data 
sdm845_smmu_500_data = {
  	/* Also no debug configuration. */
  };

+static const struct qcom_smmu_match_data sc7280_smmu_500_impl0_data = {
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
+	.cfg = &qcom_smmu_impl0_cfg,
+	.actlrvar = sc7280_actlr,
+	.num_smmu = 2,
+};

Just for note , there's a small hiccup here as we have to manually
calculate and the number of elements in actlr_config size everytime we
add this info for a new target, won't be an issue though but just a
hindrance to automation (?)

>> Posted a sample below.
>>
>>>
>>> [declarations]
>>> const struct actlr_variant *actlrvar = qsmmu->data->actlrvar;
>>> int i;
>>>
>>> [rest of the functions]
>>>
>>> if (!actlrvar)
>>>      return 0;
>>>  > for (i = 0; i < actrlvar->num_actrlcfgs; i++) {
>>>      if (actlrvar[i].io_start == smmu->ioaddr) {
>>>          qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar->actlrcfg);
>>>          break;
>>>      }
>>> }
>>>  > Saving both on .TEXT size and indentation levels :)
>>>
>> Thanks for this suggestion Konrad, will try to implement this, as it 
>> would reduce the indent levels to good extent.
>> Would something like this be okay?
>>
>> static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>       const struct actlr_variant *actlrvar;
>>       int cbndx = smmu_domain->cfg.cbndx;
>> +    int i;
>>
>> +    actlrvar = qsmmu->data->actlrvar;
>> +
>> +    if (!actlrvar)
>> +        goto end;
>> +
>> +    for (i = 0; i < qsmmu->data->num_smmu ; i++) {
>> +        if (actlrvar[i].io_start == smmu->ioaddr) {
>> +            qcom_smmu_set_actlr(dev, smmu, cbndx,
>> +                        actlrvar[i].actlrcfg);
>> +            break;
>>           }
>>       }
>>
>> +end:
>>       smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
> 
> If you move this assignment before the actlrvar checking (there's no
> dependency between them), you will get rid of the goto.
> 

Ack thanks, it's tlb flush operation so won't be an issue moving this
before the check.

> I also noticed that qcom_smmu_match_data.actlrvar could likely be
> const struct actlr_variant * const (const pointer to a const
> resource), similarly for actlr_variant.actlrcfg
> 

Sure, make sense, as we aren't aiming to modify these values later on.

Would address all these inputs in next version.

Thanks & regards,
Bibek

> Konrad

