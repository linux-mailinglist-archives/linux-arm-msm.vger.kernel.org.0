Return-Path: <linux-arm-msm+bounces-32119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BC97D9D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 21:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E93C41F23336
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D830E1442F4;
	Fri, 20 Sep 2024 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cl8SQ7e7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6AF44C81;
	Fri, 20 Sep 2024 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726860896; cv=none; b=FqT3n3PDTCgl2SEAg//bqyd4Vb6tS8wMPL++NIMryyHeAZJ+Nko9QCW+PwkqF5P6XKrXc7UJWzt+xaXKZOUPMxKBi3Q0XurJPNNPg8be8PMILcKbLvIafyE938066y8j9JOlirhdKK7JSNPw/Yl8v16Su6YYUctpHZP/BwVA5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726860896; c=relaxed/simple;
	bh=JyqLtbe0E2IK4lZFZBmmOkz4o+sIiAwpR3NvNf0bGf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mXTC/g+ZwzVytW18qUO2P8bY/kW1yXIFg5g11s1s43lQyHNeloHpx9WXHiMu21wiGLLbnX6TWYYq1GJMzdKBryPoq1lvyqofpH84fUz5UkTvYIOQ46Q39WDdW5CeKt5NPj+CF+iVk1rcrkCFoxZ5O1hI+K7LIH5Rsuz26dZqvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cl8SQ7e7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KI5hq3017169;
	Fri, 20 Sep 2024 19:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKklw6VHAc7PtrhzAdiC/HmgH49cCYfgi4H2Fn8w8HA=; b=cl8SQ7e7rBJjg28O
	PlLJq+kHfnZnoEhRG5EO4Wm/XVY+Vpf/dse6xXgSVNtGB+fsTe67m6SKlAzJ/cNP
	BvwkFcFFbDSfyXGtkq7Q8mk42eYJhprl1SQGNs47nJykNtnKopwl4MsOP8nJMOTr
	wCp6opT92PvOojvxs4qapi1u6XJf0F81Iw6VpzzEJKDE6vk5jyNagf/8U57OI2ch
	82oPW+H3HpXuLyBggmdSGT8d3ETQuPszp/mT+CU+iRRX/uVmyQwreUpwGJNkEpE/
	mSCxjWtJmtA+kdFomDDs3nOEU5EfMTKJjGI8b6O5vtzzbvvKPc1UMjT1gzlyHXKn
	gjeZ3w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hhjb3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 19:34:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KJYZAG007194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 19:34:35 GMT
Received: from [10.216.31.199] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 12:34:30 -0700
Message-ID: <5d57669d-dce5-44de-963e-0997ac107c9b@quicinc.com>
Date: Sat, 21 Sep 2024 01:04:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240920155813.3434021-1-quic_bibekkum@quicinc.com>
 <20240920155813.3434021-5-quic_bibekkum@quicinc.com>
 <hdel47qqf4tto34a5atbjyukameoweudywixuj24aisqoikhcq@v523pootitbg>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <hdel47qqf4tto34a5atbjyukameoweudywixuj24aisqoikhcq@v523pootitbg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: itM2T97mlohOTpcr_8ns0Gu8Svu2fMBi
X-Proofpoint-ORIG-GUID: itM2T97mlohOTpcr_8ns0Gu8Svu2fMBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200142



On 9/20/2024 9:50 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 20, 2024 at 09:28:12PM GMT, Bibek Kumar Patro wrote:
>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>> register which is implementation defined and is used for Qualcomm SoCs
>> to have a custom prefetch setting enabling TLB to prefetch the next set
>> of page tables accordingly allowing for faster translations.
>>
>> ACTLR value is unique for each SMR (Stream matching register) and stored
>> in a pre-populated table. This value is set to the register during
>> context bank initialisation.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 38ac9cab763b..4ac272d05843 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -252,6 +252,20 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>   	return true;
>>   }
>>
>> +static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
>> +		const struct of_device_id *client_match)
>> +{
>> +	const struct of_device_id *match =
>> +			of_match_device(client_match, dev);
>> +
>> +	if (!match) {
>> +		dev_notice(dev, "no ACTLR settings present\n");
> 
> dev_dbg() or even dev_vdbg(), please. We do not want to spam people with
> messages about a perfectly normal behaviour.
> 
> LGTM otherwise.

Ack, thanks Dmitry for the suggestion.
I was actually wondering if to broadcast this message
over the logs through dev_notice or give a option to
print it in debug level through dev_dbg.

But I'm inline with your suggestion now, will switch
to dev_dbg for this message.

Thanks & regards,
Bibek

> 
> 
>> +		return;
>> +	}
>> +
>> +	arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (u64)match->data);
>> +}
>> +
>>   static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>   		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>   {
>> @@ -316,8 +330,20 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>>   static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>   		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>   {
>> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>> +	const struct of_device_id *client_match;
>> +	int cbndx = smmu_domain->cfg.cbndx;
>> +
>>   	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>
>> +	client_match = qsmmu->data->client_match;
>> +
>> +	if (!client_match)
>> +		return 0;
>> +
>> +	qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index b55cd3e3ae48..8addd453f5f1 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -28,6 +28,7 @@ struct qcom_smmu_match_data {
>>   	const struct qcom_smmu_config *cfg;
>>   	const struct arm_smmu_impl *impl;
>>   	const struct arm_smmu_impl *adreno_impl;
>> +	const struct of_device_id * const client_match;
>>   };
>>
>>   irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
>> --
>> 2.34.1
>>
> 

