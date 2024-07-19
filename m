Return-Path: <linux-arm-msm+bounces-26624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 792539377D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 14:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A561F213C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E48136E30;
	Fri, 19 Jul 2024 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F5cBH+Cb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06384D3E;
	Fri, 19 Jul 2024 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721392730; cv=none; b=i/erks3Yh8uHsKt0t8yFfE1cytBbfvh18PNlTwN1fUTbrKFVs08FvoGPUQFdjh2AbCXa5QF6yRl2ptlCdoVRXPVdJ6ayV7Eik5Aj1kKMsUPIRetV6AxeLYbGMW0wb1dlxf3gHH6tmvYbOU4D2vup0l/Fkie+kiusv/loCO5fQEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721392730; c=relaxed/simple;
	bh=dkl0nmiSSuuHXGUZAQSFRkEXXt4SyFK6o4BT5Uam6v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T1R3qVF6C9LiL6ZX/rV20SDEyt2/XhELqDWs1KHP1fy1do/UdpDA6J8H2TIXvXBa87kptj7ghe1QPwlaq47NpkI6RRvQUvNFemVXvgzbAMmkinIvSr00HRzbvM5s3ZImlYhRowdMxriwHCvbq1WxLDk0jemaQajONYSMpZLzsAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F5cBH+Cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JCQuMo026232;
	Fri, 19 Jul 2024 12:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hf8mLurASjSW5HTS6sTQcRFKjx2FXMOgDWpuHPgX0VI=; b=F5cBH+CbtCLrMSPL
	3V7vu10lHTMpnhx6xSuns7tNSGYCBg0OdOsV3eaFP5ccKexwTdoGUi2a74hSOXAn
	Bio4Ej8+qZhIG+qtQreWumrqXRC3gSYv6OpHQURZT4MN8/EV5vxgSveNSbJ2B7bC
	3b30fYwCKWd58EvxN1XkdlZq2M08lOPnTKE8rkpNzwOgVjR7GJQltAvzxRqrpZGm
	360ni+L7f8lQjAYDVTWBMOEHX3iIc2JX3zojcqQj/+MFImvwyQy3hfhHOKF8xPmj
	g56dsW6fT0QA2bGgaRlhaXOUADBsfoKqOIkGJaQ4pXZM/WXrtIBBeT1DRxydJfOS
	pOD6LA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe1m9bf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 12:38:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JCcPnd011094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 12:38:25 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 05:38:18 -0700
Message-ID: <5790afa3-f9c0-4720-9804-8a7ff3d91854@quicinc.com>
Date: Fri, 19 Jul 2024 18:08:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Rob
 Clark" <robdclark@chromium.org>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
 <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com>
 <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
 <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com>
 <CAF6AEGtrtFNxDWtuADA4oOHhZJ=dJZcGaJ1XLFJt4fe4Xp=pTA@mail.gmail.com>
 <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com>
 <CAF6AEGuRKU+DkL0-b3xdR1R45_MiiKQYRRXEXYz-xohu8rUaEQ@mail.gmail.com>
 <CAF6AEGtbw06-gOSvX9gAbi=SA801gmD3_8c5xkOU-G9g2qKptQ@mail.gmail.com>
 <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com>
 <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
 <3382aaca-4ca1-46e5-a445-dcb115ff206f@quicinc.com>
 <CAF6AEGu0uH7GuNb3SJVk0cPDUwkYZ6NTG1ze+wmc1OjsaownwA@mail.gmail.com>
 <3c3456bc-0f79-4a17-9614-f3b32b6ed30a@quicinc.com>
 <CAF6AEGvZWdN+CC9O3tq7kjYPq424U6__KgAnFNCV0bCqE8wPuQ@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGvZWdN+CC9O3tq7kjYPq424U6__KgAnFNCV0bCqE8wPuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6w-E2XXAm71EPi3EcTHLU8B--8wlApNU
X-Proofpoint-ORIG-GUID: 6w-E2XXAm71EPi3EcTHLU8B--8wlApNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190096



On 7/17/2024 8:30 PM, Rob Clark wrote:
> On Wed, Jul 17, 2024 at 3:27 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 7/16/2024 1:37 AM, Rob Clark wrote:
>>> On Mon, Jul 15, 2024 at 4:00 AM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/10/2024 10:31 PM, Rob Clark wrote:
>>>>> On Tue, Jul 9, 2024 at 12:43 PM Bibek Kumar Patro
>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 7/4/2024 9:28 PM, Rob Clark wrote:
>>>>>>> On Thu, Jul 4, 2024 at 7:46 AM Rob Clark <robdclark@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Wed, Jul 3, 2024 at 4:38 AM Bibek Kumar Patro
>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 7/2/2024 2:01 AM, Rob Clark wrote:
>>>>>>>>>> On Mon, Jul 1, 2024 at 4:01 AM Bibek Kumar Patro
>>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 6/28/2024 9:14 PM, Rob Clark wrote:
>>>>>>>>>>>> On Fri, Jun 28, 2024 at 8:10 AM Bibek Kumar Patro
>>>>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 6/28/2024 7:47 PM, Rob Clark wrote:
>>>>>>>>>>>>>> On Fri, Jun 28, 2024 at 7:05 AM Bibek Kumar Patro
>>>>>>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
>>>>>>>>>>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>>>>>>>>>>>>>> sequence as per request.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This will be used by GPU to setup the PRR bit and related
>>>>>>>>>>>>>>> configuration registers through adreno-smmu private
>>>>>>>>>>>>>>> interface instead of directly poking the smmu hardware.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>>>>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>         drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
>>>>>>>>>>>>>>>         drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>>>>>>>>>>>>>         include/linux/adreno-smmu-priv.h           |  6 +++++-
>>>>>>>>>>>>>>>         3 files changed, 30 insertions(+), 1 deletion(-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>>>>>>> index bd101a161d04..64571a1c47b8 100644
>>>>>>>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>>>>>>> @@ -28,6 +28,7 @@
>>>>>>>>>>>>>>>         #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
>>>>>>>>>>>>>>>         #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
>>>>>>>>>>>>>>>         #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
>>>>>>>>>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>         static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>>>>>>>>>>>>>>>                { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
>>>>>>>>>>>>>>> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>>>>>>>>>>>>>                arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_addr_t page_addr, bool set)
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>>>>>>>>>>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>>>>>>>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>>>>>>>>>> +       u32 reg = 0;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
>>>>>>>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
>>>>>>>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>>>>>>>>>>> +       reg &= ~GFX_ACTLR_PRR;
>>>>>>>>>>>>>>> +       if (set)
>>>>>>>>>>>>>>> +               reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>>>>>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> nit, extra line
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Ack, will remove this. Thanks for pointing out.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Also, if you passed a `struct page *` instead, then you could drop the
>>>>>>>>>>>>>> bool param, ie. passing NULL for the page would disable PRR.  But I
>>>>>>>>>>>>>> can go either way if others have a strong preference for phys_addr_t.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Oh okay, this looks simple to reset the prr bit.
>>>>>>>>>>>>> But since this page is allocated and is used inside gfx driver
>>>>>>>>>>>>> before being utilized for prr bit operation, would it be safe for
>>>>>>>>>>>>> drm/gfx driver to keep a reference to this page in smmu driver?
>>>>>>>>>>>>>
>>>>>>>>>>>>> Since we only need the page address for configuring the
>>>>>>>>>>>>> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.
>>>>>>>>>>>>
>>>>>>>>>>>> I don't think the smmu driver needs to keep a reference to the page..
>>>>>>>>>>>> we can just say it is the responsibility of the drm driver to call
>>>>>>>>>>>> set_prr(NULL) before freeing the page
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> That makes sense. If we go by this NULL page method to disable the PRR,
>>>>>>>>>>> we would have to set the address registers to reset value as well.
>>>>>>>>>>>
>>>>>>>>>>> The sequence would be like the following as per my understaning:
>>>>>>>>>>> - Check if it's NULL page
>>>>>>>>>>> - Set the PRR_CFG_UADDR/PRR_CFG_LADDR to reset values i.e - 0x0 for
>>>>>>>>>>>         these registers
>>>>>>>>>>> - Reset the PRR bit in actlr register
>>>>>>>>>>>
>>>>>>>>>>> Similar to this snippet:
>>>>>>>>>>>
>>>>>>>>>>> #PRR_RESET_ADDR 0x0
>>>>>>>>>>>
>>>>>>>>>>> --------------
>>>>>>>>>>> reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>>>>>>> reg &= ~GFX_ACTLR_PRR;
>>>>>>>>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>>>>
>>>>>>>>>>> if (!prr_page) {
>>>>>>>>>>>              writel_relaxed(PRR_RESET_ADDR,
>>>>>>>>>>>                              smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>>>>              writel_relaxed(PRR_RESET_ADDR),
>>>>>>>>>>>                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>>>>              return;
>>>>>>>>>>> }
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> writel_relaxed(lower_32_bits(page_to_phys(prr_page)),
>>>>>>>>>>>                      smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>>>>
>>>>>>>>>>> writel_relaxed(upper_32_bits(page_to_phys(prr_page)),
>>>>>>>>>>>                      smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>>>>
>>>>>>>>>>> reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>>>>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>>>> -----------------
>>>>>>>>>>>
>>>>>>>>>>> If looks good, will implement the same in next version.
>>>>>>>>>>
>>>>>>>>>> yeah, that looks like it could work..
>>>>>>>>>>
>>>>>>>>>> you probably don't need to zero out the PRR_CFG_*ADDR when disabling,
>>>>>>>>>> and probably could avoid double writing ACTLR, but that is getting
>>>>>>>>>> into bikeshedding
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Actually Rob, since you rightly pointed this out.
>>>>>>>>> I crosschecked again on these registers.
>>>>>>>>> PRR_CFG_*ADDR is a global register in SMMU space but
>>>>>>>>> ACTLR register including PRR bit is a per-domain register.
>>>>>>>>> There might also be a situation where PRR feature need to be
>>>>>>>>> disabled or enabled separately for each domain.
>>>>>>>>> So I think it would be cleaner to have two apis, set_prr_addr(),
>>>>>>>>> set_prr_bit().
>>>>>>>>> set_prr_addr() will be used only to set this PRR_CFG_*ADDR
>>>>>>>>> register by passing a 'struct page *'
>>>>>>>>> set_prr_bit() will be used as a switch for PRR feature,
>>>>>>>>> where required smmu_domain will be passed along with
>>>>>>>>> the bool value to set/reset the PRR bit depending on which this
>>>>>>>>> feature will be enabled/disabled for the selected domain.
>>>>>>>>
>>>>>>>> on a related note, adreno has been using arm-smmu for a number of
>>>>>>>> generations, I guess not all support PRR?  The drm driver will need to
>>>>>>>> know whether PRR is supported (and expose that to userspace to let the
>>>>>>>> UMD know whether to expose certain extensions).  How should this work?
>>>>>>>
>>>>>>> So, I noticed in the x1e80100.dtsi that there is a gpu_prr_mem
>>>>>>> reserved section..  maybe we should be connecting this to the smmu
>>>>>>> driver in dt, and using that to detect presence of PRR?  Ie. the smmu
>>>>>>> driver would configure PRR_CFG_*ADDR based on the reserved mem, and
>>>>>>> the interface to drm would just be to enable/disable PRR, returning an
>>>>>>> error code if the reserved mem section isn't there.
>>>>>>>
>>>>>>> This simplifies the interface, and handles the question of how to
>>>>>>> detect if PRR is supported.
>>>>>>>
>>>>>>> BR,
>>>>>>> -R
>>>>>>>
>>>>>>
>>>>>> As I checked gpu_prr_mem reserved mem section is not used for mobile
>>>>>> targets hence not present for other DT only compute targets like
>>>>>> x1e80100.dtsi has the same. PRR looks to be smmu version specific
>>>>>> property.
>>>>>
>>>>> I only see it in gpu_prr_mem in x1e80100.dtsi, but not documented
>>>>> anywhere.  I'm only assuming based on the name that it is intended to
>>>>> be for PRR (but not sure why it is larger than 0x1000).  Are the
>>>>> PRR_CFG_*ADDR regs programmed by the fw (and access blocked in EL1) on
>>>>> this device?
>>>>>
>>>>
>>>> As I checked, if the drm/gfx driver allocates the page for drm, then
>>>> this reserved-memory region is not required.
>>>>
>>>> PRR_CFG_*ADDR regs have read and write access in EL1 only for this
>>>> device, behavior is same as other devices as well. These are not
>>>> programmed by fw.
>>>
>>> If there is any device which _doesn't_ have EL1 access to these regs,
>>> I think going the reserved memory route seems more future proof > Otherwise we later on have to deal with two different ways to do
>>> things.  But I'm not sure if there is any such device or risk.
>>>
>>
>> PRR is a bit in ACTLR register which is in SMMU space,
>> so is the PRR_CFG_*ADDR registers - with EL1 having access
>> to both the registers in all targets released till now with MMU-500.
>> It's unlikely that this design would change in future
>> for MMU-500 based targets, so I feel this risk is somewhat negligible.
> 
> I wasn't worried about the ACTLR register, but the PRR_CFG_*ADDR regs ;-)
> 
> IIRC those were in the SMMU global space, why hyp tends to like to own.
> 

Yes correct, those are in SMMU global space which hyp likes to own, and
read/write access are avaialble by design for EL1.

>> Also would the reserved memory route look a bit hackish?
>> Because, since this reserved-memory node is not used when page is
>> allocated through drm - so it might turn out to be redundant.
>> If we are aiming for a device-tree handle/node for reference then I
>> think a better way would be to create a bool parameter inside smmu-node
>> indicating presence of PRR ?
> 
> tbh, I don't think there is anything better or worse about having the
> reserved-memory node vs dynamically allocating it.  (If we dynamically
> allocate, we should remove the reserved memory node from
> x1e80100.dtsi)
> 

Right, if the page is dynamically allocated then this reserved memory 
node should be removed as it will stay as an unused region in DDR acting 
as a deadweight. I checked the history on this region for x1e80100 and 
it went as a part of platform upstreaming - we can remove the same.

> The thing I was more concerned about was whether there was any chance
> that some existing or future SoC+fw combo _relied_ on a reserved
> memory node and the fw programming PRR_CFG_*ADDR. If there was any > chance of that, and we went the dynamic allocation route, then we'd
> have some devices with a reserved memory node, and some without.  That
> seems a bit ugly to me.

Agree on the concern, that would surely look a bit ugly - with different 
targets having these allocation differently and having this 
reserved-memory node

But as far as I checked the targets present with MMU-500, none of them 
is relying on reserved-memory node yet.
And the chances are negligible in future targets as well.
Since FW is not setting up these registers - so this reserved region
should not be considered as per me.
Also since in our api we are only taking the address of the prr page to 
setup these registers, so even if client chooses any page allocation 
method <not surely from firmware as per design> then the same api 
smmu-driver is exposing would still work indentical.


> If there is no chance of this, then we can go either route.
> 
>> Personally,I feel since the PRR enablement mechanism is same for all
>> MMU-500 targets - compat string would be a robust approach.
> 
> I guess if it is all mmu-500, then we can just pick based on compat
> string.  If it turns out some subset of smmu-v2 have PRR, we can just
> have a list of compat strings in arm-smmu-qcom.c.. there would only be
> a finite # of them ;-)
> 

Yes right, atleast one thing which we can conclude is - in
MMU-500 version the PRR enablement steps are same from SMMU block and
driver perspective <i.e configure the PRR_CFG_*ADDR regs and set PRR bit
in ACTLR>. So all targets on MMU-500 - we would do the same steps.
Hence under MMU-500 compat string we can keep this.
Agree on the smmu-v2 part as well.


Thanks & regards,
Bibek

> BR,
> -R

