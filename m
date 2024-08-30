Return-Path: <linux-arm-msm+bounces-30252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBDA9661CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 14:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 748BF1C209E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E2C192D9C;
	Fri, 30 Aug 2024 12:31:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6587B192581;
	Fri, 30 Aug 2024 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021086; cv=none; b=fFvhmBKaiNdo/KrAOKcO7zL6JzFAINc+smUXTVCyW5hn9XocOUj5lcw7dVV1uNcnkJVHLNtAi/Ra17pS8tg5LOSKvhNMcLpHrzJl8hdASi0VrSt15zoa7ktdeAWLWOrI3hOMod0D1Ld9gJFMq0yAWKuacEDiF2HQrv5Ge+sybH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021086; c=relaxed/simple;
	bh=oof5KM6kmb1k0VNrztj4BbtVdtVtzGXFeVrQdpuiNh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JaBbMTzmPuTl7ZtsGB0wuKCTKbtlcy7aghVJLUbLmdrGdBQTZK+a+Jf2HMH7hdiah5mR74Pg3OZQudrYDgkshuoLKzQvKRycBym/+pTqtmxr1yQyw3YyHpZXzNC2n3nZ/m+BlvMVKJCsGyPiTMreM7fFbf0qF84DpQexVXGgs0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1592A152B;
	Fri, 30 Aug 2024 05:31:50 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 229553F762;
	Fri, 30 Aug 2024 05:31:22 -0700 (PDT)
Message-ID: <35849d74-1197-446b-9a4c-1b8aabb38427@arm.com>
Date: Fri, 30 Aug 2024 13:31:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/6] iommu/arm-smmu: add ACTLR data and support for
 SC7280
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
 Will Deacon <will@kernel.org>
Cc: robdclark@gmail.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
 <20240823155918.GD525@willie-the-truck>
 <3ae75a75-1717-40b6-9149-bc3673d520d6@quicinc.com>
 <20240827124714.GB4772@willie-the-truck>
 <b335452a-977e-41cc-9424-a2244fbe20de@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <b335452a-977e-41cc-9424-a2244fbe20de@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/08/2024 11:00 am, Bibek Kumar Patro wrote:
> 
> 
> On 8/27/2024 6:17 PM, Will Deacon wrote:
>> On Mon, Aug 26, 2024 at 04:33:24PM +0530, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 8/23/2024 9:29 PM, Will Deacon wrote:
>>>> On Fri, Aug 16, 2024 at 11:12:58PM +0530, Bibek Kumar Patro wrote:
>>>>> Add ACTLR data table for SC7280 along with support for
>>>>> same including SC7280 specific implementation operations.
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>> ---
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 
>>>>> +++++++++++++++++++++-
>>>>>    1 file changed, 57 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> index dc143b250704..a776c7906c76 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> @@ -31,6 +31,55 @@
>>>>>    #define PREFETCH_MODERATE    (2 << PREFETCH_SHIFT)
>>>>>    #define PREFETCH_DEEP        (3 << PREFETCH_SHIFT)
>>>>>
>>>>> +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>>>>> +    { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +    { 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>>> +    { 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +    { 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>>> +};
>>>>> +
>>>>> +static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
>>>>> +    { 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
>>>>> +};
>>>>
>>>> It's Will "stuck record" Deacon here again to say that I don't think
>>>> this data belongs in the driver.
>>>>
>>>
>>> Hi Will,
>>>
>>> It will be difficult to reach a consensus here, with Robin and the DT 
>>> folks
>>> okay to keep it in the driver, while you believe it doesn't belong 
>>> there.
>>>
>>> Robin, Rob, could you please share your thoughts on concluding the 
>>> placement
>>> of this prefetch data?
>>>
>>> As discussed earlier [1], the prefetch value for each client doesn’t 
>>> define
>>> the hardware topology and is implementation-defined register writes 
>>> used by
>>> the software driver.
>>
>> It does reflect the hardware topology though, doesn't it? Those magic hex
>> masks above refer to stream ids, so the table is hard-coding the prefetch
>> values for particular matches.
> 
> That is correct in the sense that stream id is mapped to context bank
> where these configurations are applied.
> However the other part of it is implementation-defined register/values
> for which community opinion was register/value kind of data, should not
> belong to device tree and are not generally approved of.
> 
> Would also like to point out that the prefetch values are recommended
> settings and doesn’t mean these are the only configuration which would
> work for the soc.
> So the SID-to-prefetch isn't strictly SoC defined but is a software
> configuration, IMO.

What's particularly confusing is that most of the IDs encoded here don't 
actually seem to line up with what's in the respective SoC DTSIs...

However by this point I'm wary of whether we've lost sight of *why* 
we're doing this, and that we're deep into begging the question of 
whether identifying devices by StreamID is the right thing to do in the 
first place. For example, as best I can tell from a quick skim, we have 
over 2 dozen lines of data here which all serve the exact same purpose 
of applying PREFETCH_DEEP | CPRE | CMTLB to instances of 
"qcom,fastrpc-compute-cb". In general it seems unlikely that the same 
device would want wildly different prefetch settings across different 
SoCs, or even between different instances in the same SoC, so I'm really 
coming round to the conclusion that this data would probably be best 
handled as an extension of the existing qcom_smmu_client_of_match mechanism.

Thanks,
Robin.

> 
>> If I run on a different SoC configuration > with the same table, then 
>> the prefetch settings will be applied to the
>> wrong devices. How is that not hardware topology?
>>
> 
> The configuration table is tied to SoC compatible string however as I
> mentioned above, its basically a s/w recommended setting.
> (using prefetch settings other than the recommended values e.g 
> PREFECH_DEFAULT instead of PREFETCH_DEEP would not render the device 
> unusable unlike changing stream-ids which can make it unusable).
> 
> Since it is implementation specific we cannot have a generic DT binding,
> tying stream ids to these recommended settings.
> Even with qcom specific binding due to dependency on implementation, not
> sure if we would be able to maintain consistency.
> 
> So from maintenance perspective carrying these in driver appear to be
> simpler/flexible. And if it doesn’t violate existing precedence, we
> would prefer to carry it that way.
> 
> This parallels how _"QoS settings"_ are handled within the driver 
> (similar to this example [1]).
> 
> [1]. 
> https://lore.kernel.org/linux-arm-msm/20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com/#t
> 
> Thanks & regards,
> Bibek
> 
>> WIll

