Return-Path: <linux-arm-msm+bounces-27397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E613E940EB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231DB1C22765
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08096198858;
	Tue, 30 Jul 2024 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzAkECY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55918A92A;
	Tue, 30 Jul 2024 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722334328; cv=none; b=afGiXtaftWZBdzZtQABkVaCaogMaIVoxHty7fQqegEsr/fH5yZMVUkbdUSPQywdDh8GCXW2Pt5m4aahdu3kR80UkNROAWwbdENLGdKC8iRQQww+HtHHgSC1xW37ffOujH7uy6khrWFx5kGqclfp42pLtnYh3SmBJWdUTIHltHI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722334328; c=relaxed/simple;
	bh=ZvLJ7/SCtIJfceG7grSTidcofEdpC9aUrnISK46Oynk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCqXqXylAQAsbvsL3w7iaVZGwzV2H3X6J+C7O0wgFNhFiTA10LuC0yU5Olj7p2FLB97aRiVSxRYIas+ooUjJziZUHMrZTXglur4kmuFdFyrG13UPNG099H1IySxeAoUOJ+Smol39z3gV7ViVdvwvuodptnC+NPPByl1uHU07t24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzAkECY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A35EC4AF0B;
	Tue, 30 Jul 2024 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722334328;
	bh=ZvLJ7/SCtIJfceG7grSTidcofEdpC9aUrnISK46Oynk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TzAkECY4JNH4TLHCFfcsFDcb5DKrTkXbLmxGBDeyy9sggTlAlbXVWZxCEQOF5LaHk
	 OYMT2h/VZy297tSeX2CHiotuYPJQAxVUrKil0NKFe/ElEDSzIfWiZKa32gWNDOpgNU
	 DzEWtU5nQ8rvJSxMrAiRio1DmnVSzAFS1Mn2B0BJbVZ9UcI2zwRRt8MlOnYdJclLrW
	 8VyEDJIZO49Kldu0UVtR9ERik+1hQLn0NqYXva40Wg5M2q+2ZOVJVPcajAFTHF2wJs
	 1hKdOQQM7zvUPdykgB/UhRddR/3NgWkRA162NSnsujO5BhAraLFigbbLGboDC4JBTj
	 I/u8oC/78F/iQ==
Message-ID: <691ee925-b214-4b68-8d7b-ecb54f865cfc@kernel.org>
Date: Tue, 30 Jul 2024 12:12:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
 <osxynb352ubxgcb5tv3u7mskkon23nmm3gxkfiiiqss5zp67jf@fv5d6bob2rgp>
 <CAF6AEGuWULwrJDWW37nQhByTpc-2bBYVv3b_Ac6OCwaJ83Ed9w@mail.gmail.com>
 <CAA8EJpp9zaQSKbis7J9kYTudTt=RFhfbzeayz3b-VbGQENtqeA@mail.gmail.com>
 <3332c732-4555-46bf-af75-aa36ce2d58df@gmail.com>
 <CAA8EJppZsNTqh_KxD=BWXjmedA1ogeMa74cA=vVbCWAU7A-qgQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAA8EJppZsNTqh_KxD=BWXjmedA1ogeMa74cA=vVbCWAU7A-qgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 10:50 AM, Dmitry Baryshkov wrote:
> On Tue, 30 Jul 2024 at 11:08, Konrad Dybcio <konradybcio@gmail.com> wrote:
>>
>> On 29.07.2024 11:21 PM, Dmitry Baryshkov wrote:
>>> On Tue, 30 Jul 2024 at 00:08, Rob Clark <robdclark@gmail.com> wrote:
>>>>
>>>> On Mon, Jul 29, 2024 at 1:14 PM Dmitry Baryshkov
>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>
>>>>> On Mon, Jul 29, 2024 at 10:37:48AM GMT, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>
>>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes support
>>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
>>>>>>
>>>>>> This however, seems either broken in the hardware implementation, the
>>>>>> hypervisor middleware that abstracts the SMMU, or there's a bug in the
>>>>>> Linux kernel somewhere down the line that nobody managed to track down.
>>>>>>
>>>>>> Booting SDM845 with 16K page sizes and drm/msm results in:
>>>>>>
>>>>>> *** gpu fault: ttbr0=0000000000000000 iova=000100000000c000 dir=READ
>>>>>> type=TRANSLATION source=CP (0,0,0,0)
>>>>>>
>>>>>> right after loading the firmware. The GPU then starts spitting out
>>>>>> illegal intstruction errors, as it's quite obvious that it got a
>>>>>> bogus pointer.
>>>>>>
>>>>>> Hide 16K support on SDM845's Adreno SMMU to work around this.
>>>>>>
>>>>>> Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>> ---
>>>>>> There's a mismatch in sender/committer addresses but that's "fine":
>>>>>> https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea@gregkh/
>>>>>> ---
>>>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
>>>>>>  1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>> index 36c6b36ad4ff..d25825c05817 100644
>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>> @@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>>>>>>       return 0;
>>>>>>  }
>>>>>>
>>>>>> +static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
>>>>>> +{
>>>>>> +     /* SDM845 Adreno SMMU advertizes 16K pages support, but something is broken */
>>>>>> +     if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-v2"))
>>>>>> +             smmu->features &= ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
>>>>>
>>>>> Shouldn't we hide that uncoditionally as it's likely that none of v2
>>>>> Adreno SMMUs support 16k pages?
>>>>
>>>> Hmm, that would be unfortunate to have the GPU not supporting the CPU
>>>> page size.  I guess we could still map 16k pages as multiple 4k pages,
>>>> but that is a bit sad..
>>>
>>> For now this might be limited to older platforms (v2 vs -500)
>>
>> In the commit message:
>>
>>>>>> SDM845's Adreno SMMU is unique in that it actually advertizes support
>>>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> 
> My question is about forbidding 16k pages for sdm845 only or for other
> chips too. I'd assume that it shouldn't also work for other smmu-v2
> platforms.

I'd say we shouldn't cause trouble unless we know it's an issue

Konrad

