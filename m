Return-Path: <linux-arm-msm+bounces-28361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7BA94FF30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 09:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E402837AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 07:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B911812EBEA;
	Tue, 13 Aug 2024 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cNKHli/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14288485;
	Tue, 13 Aug 2024 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723535804; cv=none; b=sPrICbXEMfXCc7CuFP9Ak75SfUblKmalJCh20twcZ9kGY0/NKdHg24CxZWqOtV3GlSICeX+aMqt5uFmmx5r1ULkakhRenMuXN0+2NH0KS7jmT4JRW2i7a3d2XmUxl4IB9kT7U0U0pxV1AGz5ovGC/su5mSismgk+Dd3guROciM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723535804; c=relaxed/simple;
	bh=CuolsEvLRiLP6iFRnAtWEnHXHVPNiug2hq17U4nw3Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o0CRs+8K5rxZL42xmq0eTc1ILNRSB2BF1nhutl/9A7FwQyjosz6PwN/itkI8WnBsfQA3QaTTHE+MTjlf/qKZavLISKq4zf4fWQm7DlkJFMPqoX+s1SipB3ntvlm2PxLpDLfb7Z8fsDu31WlAiMTBdN7FGhv1Ngoq8bmm/2tN10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cNKHli/K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D2evNm012717;
	Tue, 13 Aug 2024 07:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PlMolErtoFP8CfRHuM+/XHS0z4d1Y7nlgBTHug4gbI=; b=cNKHli/KYWCImpyt
	vY4dZQXURKN7nHls3G8wKyPkG37b3cWKmXGp2G/yPtGZ9bNX9lpiFR0Yl/jnWoZ9
	9jlkw0D1ZONU6xq0yYmaVbN2Rp8vtw/i436nAr0yXmj94zfR1M98nPm0pEZ1qTSX
	yWkTgduRmFFY8Ir9EmXN7QfFJGV/4ohrXvs1JMp5KLiacC7hJhUS3VQpwnRXZzgJ
	3ytqARpL+r2di9d92TWpSx9FgbsiYg7uScEk0XN0QCPL7S5DSurNas3F6yZuS7DK
	Ug+P6GZXVxhZB18qOgfu4FOjxTQolt/xdO5m9ExDOLq03VhQBJ9t64tRXYL+8EhH
	y45qmA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40yxwv0kuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 07:56:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D7uSMd013544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 07:56:28 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 00:56:26 -0700
Message-ID: <dee2f394-c9c5-4099-8e05-ce0c8756887b@quicinc.com>
Date: Tue, 13 Aug 2024 15:56:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
To: Pranjal Shrivastava <praan@google.com>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
 <ZroNUGkKuC1L7Qfr@google.com>
 <cca690c3-916e-43b6-b2a5-eca4f2eb838e@quicinc.com>
 <ZrsJLqTnq6tG2xp4@google.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <ZrsJLqTnq6tG2xp4@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N1_QYba_QmHkO8ZYoQALFYM_LNDAWse3
X-Proofpoint-ORIG-GUID: N1_QYba_QmHkO8ZYoQALFYM_LNDAWse3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130056



On 2024/8/13 15:20, Pranjal Shrivastava wrote:
> On Tue, Aug 13, 2024 at 10:37:33AM +0800, Zhenhua Huang wrote:
>>
>>
>> On 2024/8/12 21:25, Pranjal Shrivastava wrote:
>>> On Tue, Jul 30, 2024 at 06:30:43PM +0800, Zhenhua Huang wrote:
>>>> TBU driver has no runtime pm support now, adding pm_runtime_enable()
>>>> seems to be useless. Remove it.
>>>>
>>>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ------
>>>>    1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 36c6b36ad4ff..aff2fe1fda13 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -566,7 +566,6 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
>>>>    static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>>>>    {
>>>> -	struct device *dev = &pdev->dev;
>>>>    	int ret;
>>>>    	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
>>>> @@ -575,11 +574,6 @@ static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>>>>    			return ret;
>>>>    	}
>>>> -	if (dev->pm_domain) {
>>>> -		pm_runtime_set_active(dev);
>>>> -		pm_runtime_enable(dev);
>>>
>>> I assumed that this was required to avoid the TBU from being powered
>>> down? If so, then I think we shall move it under the
>>
>> Hi Pranjal,
>>
>> In my sense, this was giving the TBU ability to power down when
>> necessary(through pm callbacks)? While I haven't seen any RPM impl for TBU
>> device.. hence having the doubt..
>>
>> Thanks,
>> Zhenhua
> 
> Apologies for being unclear. I just meant to ask if there was a reason
> to add pm_runtime_set_active & enable in the tbu probe previously? And I

It's also my doubt and hope Georgi can help clarify :)
Actually I assume this part of codes was copied from arm-smmu driver
https://elixir.bootlin.com/linux/v6.11-rc3/source/drivers/iommu/arm/arm-smmu/arm-smmu.c#L2264 
.. but for TBU, seems no user ?

> *assumed* that it was to set the device state as RPM_ACTIVE to avoid it
> being RPM_SUSPENDED after enabling pm_runtime

Yeah, it's normal sequence from doc: 
https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/power/runtime_pm.rst#L574

> 
> I agree that there are no pm_runtime_suspend/resume calls within the TBU
> driver. I'm just trying to understand why was pm_runtime enabled here
> earlier (since it's not implemented) in order to ensure that removing it
> doesn't cause further troubles?

See above my assumption, need Georgi to comment but.

> 
> I see Georgi added it as a part of
> https://lore.kernel.org/all/20240704010759.507798-1-quic_c_gdjako@quicinc.com/
> 
> But I'm unsure why was it required to fix that bug?

I'm just thinking it is dead code and want to see if my understanding is 
correct.

Thanks,
Zhenhua

> 
>>
>>> previous if condition, i.e. CONFIG_ARM_SMMU_QCOM_DEBUG?
>>>
>>> If not, we can remove it give that the TBU would be powered ON as needed
>>>
>>>> -	}
>>>> -
>>>>    	return 0;
>>>>    }
>>>> -- 
>>>> 2.7.4
>>>>
>>>>
>>>
>>> Thanks,
>>> Pranjal
> 
> Thanks,
> Pranjal

