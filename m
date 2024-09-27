Return-Path: <linux-arm-msm+bounces-32693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52867988AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 21:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F800284DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 19:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CEC1C1726;
	Fri, 27 Sep 2024 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N32ygTRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA511C2314;
	Fri, 27 Sep 2024 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727466899; cv=none; b=YTIAHkaAbToY/ajBb+ZN/gfxOSoHuUw3JPUvQOuk3EOs4tbH0pLgfVlX4LcMC9m+EzPnOQQzNGbcEDrqz2DaMHM8ATFAirkAA2A7YbnRbSARWXU8Zcx1dDOznAyQdofIlZRo1Fcnp9oklLiQg7b+fgXsHMIZUPLz5oFPkV9rJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727466899; c=relaxed/simple;
	bh=ni5f01vHHK6WNOX9fH82PwiWJanF2V/ekCCo5y0yd0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ELklO8PFTEAzZnPgtv6aJ6RYMSWMkD21Hbiri+HmQXns0R4Owlk65bEa1ntklJrt999tGl6J3Q08Y2L1HzV+tSEqUe1kjB54uKzbMXjbbKhYj1vfcPDw5e3jzxdcxQTi/jqEZkDA/DTD53wtJF4KxVWVn4vK/8B6HWTBlo4rM6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N32ygTRt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RFwuLn020953;
	Fri, 27 Sep 2024 19:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bw9dmykM1oqxtd+vSTcwef7paO8IgTipyaS026C0f7w=; b=N32ygTRtOF/GO6Bi
	KZI5vRE7LAl0qmQBF86xWnX0yjMFx3QZDcnSOfEaMGuz79H7hIaljqrFXhyi4KmD
	IskfQ+UNJv4NOenKLLSbbqEvyEXkeBEY1Uw6GwVVrpYdamt7DhneF/Xb653lPwkk
	kPi4qvUXFrTIKXeN6LPm5h/qo+vWi7TRyQkY2r2VbMiLTS89QezI+qQt7rrWusHb
	p89PBQdEkvW0ZKtSnJMzcQvRK+J8x4DUGxH1oVEhYDadvam13HGlw06ZI5racJVK
	4NSbNuHhbWKL1cajyqHcCrGR7EqxAMMSvE6Jq54CPG5+m5VBoSlvGnrOmpPOQe6h
	UOPDAA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7uv773-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 19:54:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RJscAh002640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 19:54:38 GMT
Received: from [10.216.8.2] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 12:54:32 -0700
Message-ID: <a7f0a221-cea1-441a-b276-285b8ce8b2bb@quicinc.com>
Date: Sat, 28 Sep 2024 01:23:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/5] iommu/arm-smmu: add ACTLR data and support for
 qcom_smmu_500
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240920155813.3434021-1-quic_bibekkum@quicinc.com>
 <20240920155813.3434021-6-quic_bibekkum@quicinc.com>
 <xxd74r5zzobcsg6joty4rxxmj4gaiezmj6bqlcdbcyhshchqq2@ljpxtgq2dthg>
 <66af599b-85a7-40fd-b550-346013028394@quicinc.com>
 <jqwm5ddslvpbdp4ngxxyfpeda2qoc2rsnxc5cwo3gy24mpd345@qkyxwggxk77m>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <jqwm5ddslvpbdp4ngxxyfpeda2qoc2rsnxc5cwo3gy24mpd345@qkyxwggxk77m>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NyYgMfx4Dw_sIS2ntnT0gdipMxNkeiXV
X-Proofpoint-ORIG-GUID: NyYgMfx4Dw_sIS2ntnT0gdipMxNkeiXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409270145



On 9/24/2024 3:09 PM, Dmitry Baryshkov wrote:
> On Sat, Sep 21, 2024 at 01:29:04AM GMT, Bibek Kumar Patro wrote:
>>
>>
>> On 9/20/2024 9:48 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 20, 2024 at 09:28:13PM GMT, Bibek Kumar Patro wrote:
>>>> Add ACTLR data table for qcom_smmu_500 including
>>>> corresponding data entry and set prefetch value by
>>>> way of a list of compatible strings.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>>>>    1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 4ac272d05843..e8f936a446df 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -25,8 +25,31 @@
>>>>
>>>>    #define CPRE			(1 << 1)
>>>>    #define CMTLB			(1 << 0)
>>>> +#define PREFETCH_SHIFT		8
>>>> +#define PREFETCH_DEFAULT	0
>>>> +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
>>>> +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
>>>> +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>>>>    #define GFX_ACTLR_PRR		(1 << 5)
>>>>
>>>> +static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>>> +	{ .compatible = "qcom,adreno",
>>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>> +	{ .compatible = "qcom,adreno-gmu",
>>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>> +	{ .compatible = "qcom,adreno-smmu",
>>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>> +	{ .compatible = "qcom,fastrpc",
>>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>> +	{ .compatible = "qcom,sc7280-mdss",
>>>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>>> +	{ .compatible = "qcom,sc7280-venus",
>>>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>>> +	{ .compatible = "qcom,sm8550-mdss",
>>>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>>>> +	{ }
>>>> +};
>>>
>>> Wow, this looks really nice now!
>>>
>>
>> I am also in favor of this compatible based approach now,
>> as it looks to be much cleaner implementation.
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 

Hi Robin/Will, let me know if you have any suggestions/inputs on this 
patch. If everything looks fine, I'll send the next iteration with 
Dmitry's inputs and update tags.

Thanks & regards,
Bibek

>>
>>>> +
>>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>    {
>>>>    	return container_of(smmu, struct qcom_smmu, smmu);
>>>> @@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>>>>    	.impl = &qcom_smmu_500_impl,
>>>>    	.adreno_impl = &qcom_adreno_smmu_500_impl,
>>>>    	.cfg = &qcom_smmu_impl0_cfg,
>>>> +	.client_match = qcom_smmu_actlr_client_of_match,
>>>>    };
>>>>
>>>>    /*
>>>> --
>>>> 2.34.1
>>>>
>>>
> 

