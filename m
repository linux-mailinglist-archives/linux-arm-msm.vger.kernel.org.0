Return-Path: <linux-arm-msm+bounces-21739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E258FC969
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 12:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D292281A90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1AB191477;
	Wed,  5 Jun 2024 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R38xGkup"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374541946D3;
	Wed,  5 Jun 2024 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717584772; cv=none; b=eKmw6yqx3guhfqnF5r2eiARz5L4m0KAYgI6V/BsF7UZpOR47r44pNoAaepe6d2lDDQxzZnpplu+Pr/h04yhyDIf13L4qtjSTD9XKley3K3AHWAblx2XOtv1uZh6ZPsKcGy1ZviUyeqszsLBH/9Tx62Zuwa9LWLP3lIcAdUUPuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717584772; c=relaxed/simple;
	bh=7htvEWCotUmbZeaXgqHfgnS0af7cxO3nra+5pZMCWzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hDvrp9M4lwfni9iueq3bIuw2CbdnkMTlSU0aNx09wNnslZk3gz1IbwVVRNnpIc2RT60fMeDHzmK7KDuMTP6TTUMZaxXxPkC+hXakWCV75ppszUMG2nn7Yut5j+/XKYQA64RuiwgJFFWI1aidMjIcLqJtnkPFsVe66KgtU6p0lrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R38xGkup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4555S25B030335;
	Wed, 5 Jun 2024 10:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EhPoHnYt237zWZ8cAWGIZLoyRyox/Qg3D+1HOJedcw=; b=R38xGkupZfm734jG
	ADuVCYpu36X3HwanG8jmL3qQ5uQX19nGgcWbihQhk9ny0LwO8nZoi7JlPIenXm+u
	BqVt4nMHzEh42CEAwJBWrob5ZY85s2yAfhDO06Eb5EzSXJzlN7nkBReY8KcnYpEr
	rpbSDdrnnDpScJRysIMbIYa1pI4QU1TcflKp7D7rEQ5NvO/JgDGTnSzWiD4ThT9v
	eaxLQyaveKA/+gNZJMrwAf8BD+FT1mTWx/RuLn4eKB3f6nq1tZpaq97xpgiLy1uE
	LOQS5vpgqY4fTek5wNxLLSRZH9xyxG96K8KsckfAm7gB9dcHbqdhVMYFvWZZmBeT
	0PCnpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjhw0rrrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 10:52:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455AqEe6004196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 10:52:14 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 03:52:08 -0700
Message-ID: <afb0698e-68a1-47b8-ba37-c9e413ca3ee3@quicinc.com>
Date: Wed, 5 Jun 2024 16:22:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Rob Clark <robdclark@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <will@kernel.org>,
        <robin.murphy@arm.com>, <joro@8bytes.org>, <jsnitsel@redhat.com>,
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
 <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com>
 <7140cdb8-eda4-4dcd-b5e3-c4acdd01befb@linaro.org>
 <omswcicgc2kqd6gp4bebd43sklfs2wqyaorhfyb2wumoeo6v74@gaay3p5m46xi>
 <CAF6AEGub2b5SRw7kDUGfKQQ35VSsMkQ9LNExSkyHHczdFa2T4Q@mail.gmail.com>
 <9992067e-51c5-4a55-8d66-55a102a001b6@quicinc.com>
 <CAF6AEGsxKwzX6it4vipggOdGqNVzPbwMj6a0h871a=GfwUp0Cg@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGsxKwzX6it4vipggOdGqNVzPbwMj6a0h871a=GfwUp0Cg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r6LXRxUn4HzyQNKmltphAen89s29Q2oI
X-Proofpoint-GUID: r6LXRxUn4HzyQNKmltphAen89s29Q2oI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_01,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406050082

On 6/5/2024 12:19 AM, Rob Clark wrote:
> On Thu, May 30, 2024 at 2:22 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 5/28/2024 9:38 PM, Rob Clark wrote:
>>> On Tue, May 28, 2024 at 6:06 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Tue, May 28, 2024 at 02:59:51PM +0200, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 5/15/24 15:59, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
>>>>>>> On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/1/2024 12:30 AM, Rob Clark wrote:
>>>>>>>>> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>>>>>>>>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>>>>>>>>> register which is implementation defined and is used for Qualcomm SoCs
>>>>>>>>>> to have a custom prefetch setting enabling TLB to prefetch the next set
>>>>>>>>>> of page tables accordingly allowing for faster translations.
>>>>>>>>>>
>>>>>>>>>> ACTLR value is unique for each SMR (Stream matching register) and stored
>>>>>>>>>> in a pre-populated table. This value is set to the register during
>>>>>>>>>> context bank initialisation.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>>>>>>>>>> +                       smr = &smmu->smrs[idx];
>>>>>>>>>> +                       if (smr_is_subset(smr, id, mask)) {
>>>>>>>>>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>>>>>>>>>> +                                               actlrcfg[i].actlr);
>>>>>>>>>
>>>>>>>>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
>>>>>>>>> downstream kgsl's PRR thing (which we'll need to implement vulkan
>>>>>>>>> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
>>>>>>>>> to enable PRR.
>>>>>>>>>
>>>>>>>>>             val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>>>>>>>>>             val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>>>>>>>>>             KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
>>>>>>>>>
>>>>>>>>> Any idea how this works?  And does it need to be done before or after
>>>>>>>>> the ACTLR programming done in this patch?
>>>>>>>>>
>>>>>>>>> BR,
>>>>>>>>> -R
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Rob,
>>>>>>>>
>>>>>>>> Can you please help provide some more clarification on the FIFO part? By FIFO are you referring to the storing of ACTLR data in the table?
>>>>>>>>
>>>>>>>> Thanks for pointing to the downstream implementation of kgsl driver for
>>>>>>>> the PRR bit. Since kgsl driver is already handling this PRR bit's
>>>>>>>> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
>>>>>>>
>>>>>>> The kgsl driver is not present upstream.
>>>>>>>
>>>>>>
>>>>>> Right kgsl is not present upstream, it would be better to avoid configuring the PRR bit and can be handled by kgsl directly in downstream.
>>>>>
>>>>> No! Upstream is not a dumping ground to reduce your technical debt.
>>>>>
>>>>> There is no kgsl driver upstream, so this ought to be handled here, in
>>>>> the iommu driver (as poking at hardware A from driver B is usually not good
>>>>> practice).
>>>>
>>>> I'd second the request here. If another driver has to control the
>>>> behaviour of another driver, please add corresponding API for that.
>>>
>>> We have adreno_smmu_priv for this purpose ;-)
>>>
>>
>> Thanks Rob for pointing to this private interface structure between smmu
>> and gpu. I think it's similar to what you're trying to implement here
>> https://lore.kernel.org/all/CAF6AEGtm-KweFdMFvahH1pWmpOq7dW_p0Xe_13aHGWt0jSbg8w@mail.gmail.com/#t
>> I can add an api "set_actlr_prr()" with smmu_domain cookie, page pointer
>> as two parameters. This api then can be used by drm/msm driver to carry
>> out the prr implementation by simply calling this.
>> Would this be okay Rob,Konrad,Dmitry?
>> Let me know if any other suggestions you have in mind as well regarding
>> parameters and placement.
> 
> Hey Bibek, quick question.. is ACTLR preserved across a suspend/resume
> cycle?  Or does it need to be reprogrammed on resume?  And same
> question for these two PRR related regs:
> 
>    /* Global SMMU register offsets */
>    #define KGSL_IOMMU_PRR_CFG_LADDR        0x6008
>    #define KGSL_IOMMU_PRR_CFG_UADDR        0x600c
> 
> (ie. high/low 32b of the PRR page)
> 

Hey Rob, In suspend/resume, the register space power rails are not in
disabled state, so it won't go back to reset values and should retain
it's value. Only in hibernation cycle the registers' value would get reset.

So the hi/low address bit register for PRR page would also retain it's 
value along with the ACTLR registers.

> I was starting to type up a patch to add PRR configuration, but
> depending on whether it interacts with suspend/resume, it might be
> better form arm-smmu-qcom.c to just always enable and configure PRR
> (including allocating a page to have an address to program into
> PRR_CFG_LADDR/UADDR), and instead add an interface to return the PRR
> page?  I think there is no harm in unconditionally configuring PRR for
> gpu smmu.

Sounds okay though since this would not interact with suspend/resume path.
But I think, suppose in-case this page would have some other references 
as well before configuring the address to the registers for PRR 
configuration, then  GPU would be dependent on arm-smmu-qcom for this page.
So Instead an endpoint api in arm-smmu-qcom.c can recieve the just the 
page-address, and bit set status from drm/msm driver and can set/reset 
the bit along with any page-address they want ?
It would mean the interface will be smmu's , but the choice of 
configuration data to the registers' will be still with gpu.

I wrote up a small patch with this implementation, would you like to 
review that?
Will send it in this v11 series as new patch.

Thanks & regards,
Bibek

> 
> BR,
> -R
> 
>> Thanks & regards,
>> Bibek
>>
>>> BR,
>>> -R
>>>
>>>>>
>>>>>>
>>>>>>>> Thanks for bringing up this point.
>>>>>>>> I will send v10 patch series removing this BIT(5) setting from the ACTLR
>>>>>>>> table.
>>>>>>>
>>>>>>> I think it's generally saner to configure the SMMU from the SMMU driver..
>>>>>>
>>>>>> Yes, agree on this. But since PRR bit is not directly related to SMMU
>>>>>> configuration so I think it would be better to remove this PRR bit
>>>>>> setting from SMMU driver based on my understanding.
>>>>>
>>>>> Why is it not related? We still don't know what it does.
>>>>>
>>>>> Konrad
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry

