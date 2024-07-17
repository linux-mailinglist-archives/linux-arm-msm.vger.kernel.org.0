Return-Path: <linux-arm-msm+bounces-26452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9364933B20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D0C1C21119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F51B143C6A;
	Wed, 17 Jul 2024 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i1033r4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE3AD59;
	Wed, 17 Jul 2024 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721212084; cv=none; b=Wrs1EAEg09TylP23i5gnlhggHwzOwbqNqif0QnrfN9wNRdFt5u3kC98i4j6LzDoI03xpDQWali1vCFU5aa1QU2SX1K9GbJNIokeHXV4glwa4uEgKIMWmy83jQJC7disw4rCXd/y2rRU8Luaeda/6rJ//1zIiLUzacnz2tUxXaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721212084; c=relaxed/simple;
	bh=Md7cIiwIxMDYIpBUAwywWdJsY3F8ESklIX0WUXEsJks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f0nXKYPXYao2hFj1wthsOKcpk7tw5yOCZD7NAemttdgpBo/q62UCno6LmngMCy9Nofh2owk43wKY1WkJDPM2AkPpvfkxu3S2Q2P8x8DvWT1PUe9ZaUj20b9fuyp1lTYjiteyjzv/1nLzW6FfSVoDltZiq6426Yuw4JzdTBtVsYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i1033r4L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H7C2NZ023029;
	Wed, 17 Jul 2024 10:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwC9+wGJyRIgk66K3XO4CWV5VqsDXB4XrVeDJW5Yruc=; b=i1033r4L8q7TKBTZ
	9khX2CuajfiT0tCFJJbRWGVPz/pnewWxGMK7kVpvv7yf6mabVtB58xBe40L6JUnE
	YmJwXizgLMKQXx8R04LFys/NWghu94lOlxVfPQv/s2L6wx/jDhl2FBL6hSTm2nJM
	ts8yhBun7XMfmFI5SLg2lc4y1aQ2czhEntFtN6NZShoPZAxc4JZlx8V/2WHaVQYV
	bHxzI3i/SviJBgftUO+6LR2e8VCb9SeK8jf07qaWliF759nVsLuwrfx3dklnPPNz
	91nsVh36Gflfvv1erNeLw3Tkv3hhphFoQrXDnnwSayM8DJ4pM8phei6Sh4ASN0sh
	IgClkA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfnj147-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 10:27:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HARfA5007906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 10:27:41 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 03:27:36 -0700
Message-ID: <3c3456bc-0f79-4a17-9614-f3b32b6ed30a@quicinc.com>
Date: Wed, 17 Jul 2024 15:57:33 +0530
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
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGu0uH7GuNb3SJVk0cPDUwkYZ6NTG1ze+wmc1OjsaownwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 329uxBOCLDX_Rus8OUFiRtwGfzr_Rw6X
X-Proofpoint-ORIG-GUID: 329uxBOCLDX_Rus8OUFiRtwGfzr_Rw6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407170080



On 7/16/2024 1:37 AM, Rob Clark wrote:
> On Mon, Jul 15, 2024 at 4:00 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 7/10/2024 10:31 PM, Rob Clark wrote:
>>> On Tue, Jul 9, 2024 at 12:43 PM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/4/2024 9:28 PM, Rob Clark wrote:
>>>>> On Thu, Jul 4, 2024 at 7:46 AM Rob Clark <robdclark@gmail.com> wrote:
>>>>>>
>>>>>> On Wed, Jul 3, 2024 at 4:38 AM Bibek Kumar Patro
>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 7/2/2024 2:01 AM, Rob Clark wrote:
>>>>>>>> On Mon, Jul 1, 2024 at 4:01 AM Bibek Kumar Patro
>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 6/28/2024 9:14 PM, Rob Clark wrote:
>>>>>>>>>> On Fri, Jun 28, 2024 at 8:10 AM Bibek Kumar Patro
>>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 6/28/2024 7:47 PM, Rob Clark wrote:
>>>>>>>>>>>> On Fri, Jun 28, 2024 at 7:05 AM Bibek Kumar Patro
>>>>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
>>>>>>>>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>>>>>>>>>>>> sequence as per request.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This will be used by GPU to setup the PRR bit and related
>>>>>>>>>>>>> configuration registers through adreno-smmu private
>>>>>>>>>>>>> interface instead of directly poking the smmu hardware.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>        drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
>>>>>>>>>>>>>        drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>>>>>>>>>>>        include/linux/adreno-smmu-priv.h           |  6 +++++-
>>>>>>>>>>>>>        3 files changed, 30 insertions(+), 1 deletion(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>>>>> index bd101a161d04..64571a1c47b8 100644
>>>>>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>>>>>> @@ -28,6 +28,7 @@
>>>>>>>>>>>>>        #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
>>>>>>>>>>>>>        #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
>>>>>>>>>>>>>        #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
>>>>>>>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
>>>>>>>>>>>>>
>>>>>>>>>>>>>        static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>>>>>>>>>>>>>               { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
>>>>>>>>>>>>> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>>>>>>>>>>>               arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>>>>>>>>>>>        }
>>>>>>>>>>>>>
>>>>>>>>>>>>> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_addr_t page_addr, bool set)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>>>>>>>>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>>>>>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>>>>>>>> +       u32 reg = 0;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
>>>>>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
>>>>>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>>>>>>>>> +       reg &= ~GFX_ACTLR_PRR;
>>>>>>>>>>>>> +       if (set)
>>>>>>>>>>>>> +               reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>>>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>>>>>> +
>>>>>>>>>>>>
>>>>>>>>>>>> nit, extra line
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Ack, will remove this. Thanks for pointing out.
>>>>>>>>>>>
>>>>>>>>>>>> Also, if you passed a `struct page *` instead, then you could drop the
>>>>>>>>>>>> bool param, ie. passing NULL for the page would disable PRR.  But I
>>>>>>>>>>>> can go either way if others have a strong preference for phys_addr_t.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Oh okay, this looks simple to reset the prr bit.
>>>>>>>>>>> But since this page is allocated and is used inside gfx driver
>>>>>>>>>>> before being utilized for prr bit operation, would it be safe for
>>>>>>>>>>> drm/gfx driver to keep a reference to this page in smmu driver?
>>>>>>>>>>>
>>>>>>>>>>> Since we only need the page address for configuring the
>>>>>>>>>>> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.
>>>>>>>>>>
>>>>>>>>>> I don't think the smmu driver needs to keep a reference to the page..
>>>>>>>>>> we can just say it is the responsibility of the drm driver to call
>>>>>>>>>> set_prr(NULL) before freeing the page
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> That makes sense. If we go by this NULL page method to disable the PRR,
>>>>>>>>> we would have to set the address registers to reset value as well.
>>>>>>>>>
>>>>>>>>> The sequence would be like the following as per my understaning:
>>>>>>>>> - Check if it's NULL page
>>>>>>>>> - Set the PRR_CFG_UADDR/PRR_CFG_LADDR to reset values i.e - 0x0 for
>>>>>>>>>        these registers
>>>>>>>>> - Reset the PRR bit in actlr register
>>>>>>>>>
>>>>>>>>> Similar to this snippet:
>>>>>>>>>
>>>>>>>>> #PRR_RESET_ADDR 0x0
>>>>>>>>>
>>>>>>>>> --------------
>>>>>>>>> reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>>>>> reg &= ~GFX_ACTLR_PRR;
>>>>>>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>>
>>>>>>>>> if (!prr_page) {
>>>>>>>>>             writel_relaxed(PRR_RESET_ADDR,
>>>>>>>>>                             smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>>             writel_relaxed(PRR_RESET_ADDR),
>>>>>>>>>                              smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>>             return;
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> writel_relaxed(lower_32_bits(page_to_phys(prr_page)),
>>>>>>>>>                     smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>>
>>>>>>>>> writel_relaxed(upper_32_bits(page_to_phys(prr_page)),
>>>>>>>>>                     smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>>
>>>>>>>>> reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>> -----------------
>>>>>>>>>
>>>>>>>>> If looks good, will implement the same in next version.
>>>>>>>>
>>>>>>>> yeah, that looks like it could work..
>>>>>>>>
>>>>>>>> you probably don't need to zero out the PRR_CFG_*ADDR when disabling,
>>>>>>>> and probably could avoid double writing ACTLR, but that is getting
>>>>>>>> into bikeshedding
>>>>>>>>
>>>>>>>
>>>>>>> Actually Rob, since you rightly pointed this out.
>>>>>>> I crosschecked again on these registers.
>>>>>>> PRR_CFG_*ADDR is a global register in SMMU space but
>>>>>>> ACTLR register including PRR bit is a per-domain register.
>>>>>>> There might also be a situation where PRR feature need to be
>>>>>>> disabled or enabled separately for each domain.
>>>>>>> So I think it would be cleaner to have two apis, set_prr_addr(),
>>>>>>> set_prr_bit().
>>>>>>> set_prr_addr() will be used only to set this PRR_CFG_*ADDR
>>>>>>> register by passing a 'struct page *'
>>>>>>> set_prr_bit() will be used as a switch for PRR feature,
>>>>>>> where required smmu_domain will be passed along with
>>>>>>> the bool value to set/reset the PRR bit depending on which this
>>>>>>> feature will be enabled/disabled for the selected domain.
>>>>>>
>>>>>> on a related note, adreno has been using arm-smmu for a number of
>>>>>> generations, I guess not all support PRR?  The drm driver will need to
>>>>>> know whether PRR is supported (and expose that to userspace to let the
>>>>>> UMD know whether to expose certain extensions).  How should this work?
>>>>>
>>>>> So, I noticed in the x1e80100.dtsi that there is a gpu_prr_mem
>>>>> reserved section..  maybe we should be connecting this to the smmu
>>>>> driver in dt, and using that to detect presence of PRR?  Ie. the smmu
>>>>> driver would configure PRR_CFG_*ADDR based on the reserved mem, and
>>>>> the interface to drm would just be to enable/disable PRR, returning an
>>>>> error code if the reserved mem section isn't there.
>>>>>
>>>>> This simplifies the interface, and handles the question of how to
>>>>> detect if PRR is supported.
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>
>>>> As I checked gpu_prr_mem reserved mem section is not used for mobile
>>>> targets hence not present for other DT only compute targets like
>>>> x1e80100.dtsi has the same. PRR looks to be smmu version specific
>>>> property.
>>>
>>> I only see it in gpu_prr_mem in x1e80100.dtsi, but not documented
>>> anywhere.  I'm only assuming based on the name that it is intended to
>>> be for PRR (but not sure why it is larger than 0x1000).  Are the
>>> PRR_CFG_*ADDR regs programmed by the fw (and access blocked in EL1) on
>>> this device?
>>>
>>
>> As I checked, if the drm/gfx driver allocates the page for drm, then
>> this reserved-memory region is not required.
>>
>> PRR_CFG_*ADDR regs have read and write access in EL1 only for this
>> device, behavior is same as other devices as well. These are not
>> programmed by fw.
> 
> If there is any device which _doesn't_ have EL1 access to these regs,
> I think going the reserved memory route seems more future proof > Otherwise we later on have to deal with two different ways to do
> things.  But I'm not sure if there is any such device or risk.
> 

PRR is a bit in ACTLR register which is in SMMU space,
so is the PRR_CFG_*ADDR registers - with EL1 having access
to both the registers in all targets released till now with MMU-500.
It's unlikely that this design would change in future
for MMU-500 based targets, so I feel this risk is somewhat negligible.

Also would the reserved memory route look a bit hackish?
Because, since this reserved-memory node is not used when page is
allocated through drm - so it might turn out to be redundant.
If we are aiming for a device-tree handle/node for reference then I
think a better way would be to create a bool parameter inside smmu-node 
indicating presence of PRR ?

Personally,I feel since the PRR enablement mechanism is same for all
MMU-500 targets - compat string would be a robust approach.

Thanks & regards,
Bibek

> BR,
> -R
> 
>>> As far as other DT, we haven't enabled PRR anywhere yet.  I think it
>>> would be perfectly valid to require a new reserved-memory node to
>>> enable PRR.
>>>
>>
>> As mentioned above reserved-memory region is not required if gfx/drm
>> allocates the page.
>>
>>>> This feature is present in all the targets using SMMU-500,
>>>> I am still checking for targets using versions prior to smmu-500.
>>>> Then maybe we can use the smmu compatible string itself (e.g.
>>>> qcom,smmu-500 && qcom,adreno-smmu) to connect to smmu driver for
>>>> checking the presence of PRR ?
>>>
>>> If there is a clean break, such as all smmu-500 have PRR and all
>>> smmu-v2 do not, then it would be reasonable to use the compat strings.
>>> If not, I think we need a different way.
>>>
>>
>> Yes, from SMMU block perspective PRR bit is present for ACTLR register
>> on targets with MMU-500, so feature support is available. So I think we
>> can just use the mmu-500 compatible string.
>>
>> Thanks & regards,
>> Bibek
>>
>>> BR,
>>> -R
>>>
>>>> And if the compatible string is different then we can return the
>>>> error code signifying PRR feature is not supported on the particular
>>>> smmu version.
>>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>>> BR,
>>>>>> -R
>>>>>>
>>>>>>> Thanks & regards,
>>>>>>> Bibek
>>>>>>>
>>>>>>>> BR,
>>>>>>>> -R
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks & regards,
>>>>>>>>> Bibek
>>>>>>>>>
>>>>>>>>>> BR,
>>>>>>>>>> -R
>>>>>>>>>>
>>>>>>>>>>>> Otherwise, lgtm
>>>>>>>>>>>>
>>>>>>>>>>>> BR,
>>>>>>>>>>>> -R
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Thanks & regards,
>>>>>>>>>>> Bibek
>>>>>>>>>>>
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>>        #define QCOM_ADRENO_SMMU_GPU_SID 0
>>>>>>>>>>>>>
>>>>>>>>>>>>>        static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>>>>>>>>>>>>> @@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>>>>>>>>               priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>>>>>>>>>>>>               priv->set_stall = qcom_adreno_smmu_set_stall;
>>>>>>>>>>>>>               priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>>>>>>>>>>>> +       priv->set_prr = qcom_adreno_smmu_set_prr;
>>>>>>>>>>>>>
>>>>>>>>>>>>>               actlrvar = qsmmu->data->actlrvar;
>>>>>>>>>>>>>               if (!actlrvar)
>>>>>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>>>>>>>> index d9c2ef8c1653..3076bef49e20 100644
>>>>>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>>>>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>>>>>>>>>>>>        #define ARM_SMMU_SCTLR_M               BIT(0)
>>>>>>>>>>>>>
>>>>>>>>>>>>>        #define ARM_SMMU_CB_ACTLR              0x4
>>>>>>>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
>>>>>>>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>>>>>>>>>>>>>
>>>>>>>>>>>>>        #define ARM_SMMU_CB_RESUME             0x8
>>>>>>>>>>>>>        #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>>>>>>>>>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
>>>>>>>>>>>>> index c637e0997f6d..d6e2ca9f8d8c 100644
>>>>>>>>>>>>> --- a/include/linux/adreno-smmu-priv.h
>>>>>>>>>>>>> +++ b/include/linux/adreno-smmu-priv.h
>>>>>>>>>>>>> @@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
>>>>>>>>>>>>>         *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
>>>>>>>>>>>>>         *                 the GPU driver must call resume_translation()
>>>>>>>>>>>>>         * @resume_translation: Resume translation after a fault
>>>>>>>>>>>>> - *
>>>>>>>>>>>>> + * @set_prr:      Extendible interface to be used by GPU to modify the
>>>>>>>>>>>>> + *                 ACTLR register bits, currently used to configure
>>>>>>>>>>>>> + *                 Partially-Resident-Region (PRR) feature's
>>>>>>>>>>>>> + *                 setup and reset sequence as requested.
>>>>>>>>>>>>>         *
>>>>>>>>>>>>>         * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>>>>>>>>>>>>>         * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
>>>>>>>>>>>>> @@ -67,6 +70,7 @@ struct adreno_smmu_priv {
>>>>>>>>>>>>>            void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>>>>>>>>>>>>>            void (*set_stall)(const void *cookie, bool enabled);
>>>>>>>>>>>>>            void (*resume_translation)(const void *cookie, bool terminate);
>>>>>>>>>>>>> +    void (*set_prr)(const void *cookie, phys_addr_t page_addr, bool set);
>>>>>>>>>>>>>        };
>>>>>>>>>>>>>
>>>>>>>>>>>>>        #endif /* __ADRENO_SMMU_PRIV_H */
>>>>>>>>>>>>> --
>>>>>>>>>>>>> 2.34.1
>>>>>>>>>>>>>
> 

