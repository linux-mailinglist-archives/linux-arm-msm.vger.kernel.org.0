Return-Path: <linux-arm-msm+bounces-21074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 328908D4864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0BE1F2411E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 09:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548CF17D350;
	Thu, 30 May 2024 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T++bgKNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD417C7AB;
	Thu, 30 May 2024 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060941; cv=none; b=d//Wv9UJPXyxXYUovreHH9ym9YSh+AGG69gRwZZMvwHwaVytJfig1uFppmD4PUzfLSPg+gtDE92XFMwuRE7phcjag/0zqcfWElLORjynVB3zIKZNW0PrEV9MKora2lBwGD3h4h/iCvYMX5WuWpqELe4ECJG+Lg912gQEIs+1lpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060941; c=relaxed/simple;
	bh=eilKX70jYwebgFz+4v6+1vDZqinrMB8ULnIYQMMLOCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d4Z6EyNSU/ZioMK/JVsmBKC9QXr4PZu12AW7mnPB5bm2v2p7aWbOiF59BCMsefSPWVIVxFnZu9kGm5B6Mlu1RgKhb5khMpkkrrJzc2mc9ya+UtZQJeN+Y5Zh9exTd8jAMuO82lUbaSrtIgq0BIE7cVCUH8fCjcruJdqps1+tUJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T++bgKNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U8cujF018733;
	Thu, 30 May 2024 09:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lzMITiOKy7+8Hn0qlaK9jJKIuSFHPPzrWAw/zEg5e3U=; b=T++bgKNaIUOCpCRw
	gfaJqOcLhfg/kkIrfh3umGAY//JPt0I1xL9HB18vqkQB/wrUU56yJs9VzMpZYcPp
	4y9XQ5mqUuNnC8H4Li18BurBUK0kYoS9uUkEjzXdakdcdjESH+eNC/DS/oNQZ7OD
	BTvzEXZuF/atK7wqW3DFXC9lnxgtFPCGXU/Zmxy6giW8sSu+bDoGPJCKmHz2hcFW
	7SG83kSdzaW72Ftbm1jSLpwlKRsTSFbg+/fklm5zSLdwmjgzlWkMNkwX5qnfUkKM
	vWnde0LUKOpdhzBEYuOMPu6qolxwFbu1wjhv5D9THrcQMC9Cqsjxt8Pop7nxsda5
	BnI9Yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0xbjhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 09:21:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U9Lt2S017262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 09:21:55 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 02:21:48 -0700
Message-ID: <9cda3489-c350-46cf-a1c8-83fd63283849@quicinc.com>
Date: Thu, 30 May 2024 14:51:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jsnitsel@redhat.com>, <quic_bjorande@quicinc.com>,
        <mani@kernel.org>, <quic_eberman@quicinc.com>,
        <robdclark@chromium.org>, <u.kleine-koenig@pengutronix.de>,
        <robh@kernel.org>, <vladimir.oltean@nxp.com>,
        <quic_pkondeti@quicinc.com>, <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com>
 <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
 <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
 <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com>
 <7140cdb8-eda4-4dcd-b5e3-c4acdd01befb@linaro.org>
 <omswcicgc2kqd6gp4bebd43sklfs2wqyaorhfyb2wumoeo6v74@gaay3p5m46xi>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <omswcicgc2kqd6gp4bebd43sklfs2wqyaorhfyb2wumoeo6v74@gaay3p5m46xi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B4_Nsh8IhuuQ3TbKjQbkxBq_Tuz1erfA
X-Proofpoint-ORIG-GUID: B4_Nsh8IhuuQ3TbKjQbkxBq_Tuz1erfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405300069



On 5/28/2024 6:36 PM, Dmitry Baryshkov wrote:
> On Tue, May 28, 2024 at 02:59:51PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 5/15/24 15:59, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
>>>> On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
>>>>>
>>>>>
>>>>> On 5/1/2024 12:30 AM, Rob Clark wrote:
>>>>>> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>
>>>>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>>>>>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>>>>>> register which is implementation defined and is used for Qualcomm SoCs
>>>>>>> to have a custom prefetch setting enabling TLB to prefetch the next set
>>>>>>> of page tables accordingly allowing for faster translations.
>>>>>>>
>>>>>>> ACTLR value is unique for each SMR (Stream matching register) and stored
>>>>>>> in a pre-populated table. This value is set to the register during
>>>>>>> context bank initialisation.
>>>>>>>
>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> +
>>>>>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>>>>>>> +                       smr = &smmu->smrs[idx];
>>>>>>> +                       if (smr_is_subset(smr, id, mask)) {
>>>>>>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>>>>>>> +                                               actlrcfg[i].actlr);
>>>>>>
>>>>>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
>>>>>> downstream kgsl's PRR thing (which we'll need to implement vulkan
>>>>>> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
>>>>>> to enable PRR.
>>>>>>
>>>>>>            val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>>>>>>            val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>>>>>>            KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
>>>>>>
>>>>>> Any idea how this works?  And does it need to be done before or after
>>>>>> the ACTLR programming done in this patch?
>>>>>>
>>>>>> BR,
>>>>>> -R
>>>>>>
>>>>>
>>>>> Hi Rob,
>>>>>
>>>>> Can you please help provide some more clarification on the FIFO part? By FIFO are you referring to the storing of ACTLR data in the table?
>>>>>
>>>>> Thanks for pointing to the downstream implementation of kgsl driver for
>>>>> the PRR bit. Since kgsl driver is already handling this PRR bit's
>>>>> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
>>>>
>>>> The kgsl driver is not present upstream.
>>>>
>>>
>>> Right kgsl is not present upstream, it would be better to avoid configuring the PRR bit and can be handled by kgsl directly in downstream.
>>
>> No! Upstream is not a dumping ground to reduce your technical debt.
>>
>> There is no kgsl driver upstream, so this ought to be handled here, in
>> the iommu driver (as poking at hardware A from driver B is usually not good
>> practice).
> 
> I'd second the request here. If another driver has to control the
> behaviour of another driver, please add corresponding API for that.
> 

Ack, I understood this point now. Will add an interface for gfx to carry 
out the PRR bit implementation through smmu driver.

Thanks & regards,
Bibek

>>
>>>
>>>>> Thanks for bringing up this point.
>>>>> I will send v10 patch series removing this BIT(5) setting from the ACTLR
>>>>> table.
>>>>
>>>> I think it's generally saner to configure the SMMU from the SMMU driver..
>>>
>>> Yes, agree on this. But since PRR bit is not directly related to SMMU
>>> configuration so I think it would be better to remove this PRR bit
>>> setting from SMMU driver based on my understanding.
>>
>> Why is it not related? We still don't know what it does.
>>
>> Konrad
> 

