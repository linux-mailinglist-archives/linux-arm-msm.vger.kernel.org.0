Return-Path: <linux-arm-msm+bounces-20757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F338D1C09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0671F23E01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E6116E872;
	Tue, 28 May 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWZEHEer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8413E3F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901200; cv=none; b=bmL+9/6XOuDBBcCVgz3Omg0IXS7UCIxFtgfNmXT2jqFhYiynv8NgzKDnsa98FIC30mx4Ct8a0ovsSgkU0WhUqy0FeUaWtzce+0TdW+f7zmvnvgPze0b1G8Rh40RnLlU5vi37onaGE8FUrH9wKwpU1h7M44IH9KGOAqWeYx3iGKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901200; c=relaxed/simple;
	bh=ibTR33difJu0brc+rGnVpjq76/6lgB2c66S2t3YAECw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okFpIZ9T/ONNt9NQ58IoPs1jK3CwW6BfDJ0X/FzqDxwqb9bX5WhCriqhaqOgND8tT29AxpqhGF4ESjLp0mTUjVZUzo8vjXwq6rnxDT7oZWEQI5nN4PURmXAgENxtxavn9CsZR96rlgtEdhrXzwlptXDjMDj2vj0p51N67097J4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWZEHEer; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295eb47b48so1015798e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716901197; x=1717505997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XOBr0QwA/8BpJHnfWBeozKjSkUVxwa5M0pLTBP3P79A=;
        b=zWZEHEer4oCjLMsZxCQTBd3gjN2lx2NQByniLSiDm36jyQ8LE3KP+xr5wNRNwk63tx
         DqDgJW/CG6a655ugcTimjLAky40LseidCg7bDb4yEppYYZBMkNElTJzs248j3LZ65gSV
         3wOI/Gg2FplrT9hZM2uJzkimyjVdGK1tShTDEm8CMnXp3V732HoTVVeoAuLj0yfMApMm
         1C4IqSEkwVDdBq2o3hE7Zo1XkGmY+u3M5qwet12iv3YUBiOY9a8NcUssfQkUN5+tipjF
         jyLAkwWYTFkhfXcLVFdu5qdeCsa4WmjRZAVxAEZbQA0mLVvccjOUD89b7PaO1FlMigtC
         8z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901197; x=1717505997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOBr0QwA/8BpJHnfWBeozKjSkUVxwa5M0pLTBP3P79A=;
        b=usZH5Jdrc+qNHaOnN/NUan1NPMNdWaY64hCVUC+AUxj1usrTsWr1FVDFQTRoEk8QLS
         tgWmUCdP/SWQ5sVV4yIgzfUhr+1FghGcNOPBPQQmruN1n+9EglP5MqxcNFXkLOMS1M2Y
         0oiQIGGVOFktMChUPzLlPQezPlOxd2jNnnqnnWHWJr8WoEA5Qtu+7b2NPEGS3NryPDcj
         fgjDwt8tIntvzWuB3uVkG+jrX6aDA9RkG4vw+GdFvGc/1SDu8mdbzXs8Uqg2LEvWpkXs
         Lm/vhLGXbnTzryoj/aS/s9KnCuwAMgPP1SFsk6ceJ0qJhs+KehR0b/VhZaCzWH2IYbsf
         0cvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWJltdO+ZhZ4qGE768wfH3euiZf0z6wERz4upL8OEt7cT5ZqaOx3hpOC6loVUJMxI//wzUnsH1H9YkTiIxGg++rxGj1Va57uHlKMoKiA==
X-Gm-Message-State: AOJu0Ywj0D+kAAH2rOySIQq6qp+HNsEEzvrSKrJ/XJgVX8lCWStmiYAB
	IMPoSOIWenblZ8HFrrZxzopVZXISs4mE2NzNLoj1EHlQNxyShBFwMrfK2tCWGoU=
X-Google-Smtp-Source: AGHT+IFXf/+RRE+alYWCcaaLbnd49N8q+E0GmJHkiDkk528vWbXdOgl6wGGAbUCm0uGw6i7zb8FILQ==
X-Received: by 2002:ac2:48b4:0:b0:522:2c9b:63b7 with SMTP id 2adb3069b0e04-529645e2488mr7419999e87.14.1716901196633;
        Tue, 28 May 2024 05:59:56 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b21dsm988109e87.173.2024.05.28.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:59:55 -0700 (PDT)
Message-ID: <7140cdb8-eda4-4dcd-b5e3-c4acdd01befb@linaro.org>
Date: Tue, 28 May 2024 14:59:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
 Rob Clark <robdclark@gmail.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 dmitry.baryshkov@linaro.org, jsnitsel@redhat.com, quic_bjorande@quicinc.com,
 mani@kernel.org, quic_eberman@quicinc.com, robdclark@chromium.org,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com,
 quic_pkondeti@quicinc.com, quic_molvera@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com>
 <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
 <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
 <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <0a867cd1-8d99-495e-ae7e-a097fc9c00e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/15/24 15:59, Bibek Kumar Patro wrote:
> 
> 
> On 5/10/2024 6:32 PM, Konrad Dybcio wrote:
>> On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 5/1/2024 12:30 AM, Rob Clark wrote:
>>>> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>
>>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>>>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>>>> register which is implementation defined and is used for Qualcomm SoCs
>>>>> to have a custom prefetch setting enabling TLB to prefetch the next set
>>>>> of page tables accordingly allowing for faster translations.
>>>>>
>>>>> ACTLR value is unique for each SMR (Stream matching register) and stored
>>>>> in a pre-populated table. This value is set to the register during
>>>>> context bank initialisation.
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +
>>>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>>>>> +                       smr = &smmu->smrs[idx];
>>>>> +                       if (smr_is_subset(smr, id, mask)) {
>>>>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>>>>> +                                               actlrcfg[i].actlr);
>>>>
>>>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
>>>> downstream kgsl's PRR thing (which we'll need to implement vulkan
>>>> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
>>>> to enable PRR.
>>>>
>>>>           val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>>>>           val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>>>>           KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
>>>>
>>>> Any idea how this works?  And does it need to be done before or after
>>>> the ACTLR programming done in this patch?
>>>>
>>>> BR,
>>>> -R
>>>>
>>>
>>> Hi Rob,
>>>
>>> Can you please help provide some more clarification on the FIFO part? By FIFO are you referring to the storing of ACTLR data in the table?
>>>
>>> Thanks for pointing to the downstream implementation of kgsl driver for
>>> the PRR bit. Since kgsl driver is already handling this PRR bit's
>>> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
>>
>> The kgsl driver is not present upstream.
>>
> 
> Right kgsl is not present upstream, it would be better to avoid configuring the PRR bit and can be handled by kgsl directly in downstream.

No! Upstream is not a dumping ground to reduce your technical debt.

There is no kgsl driver upstream, so this ought to be handled here, in
the iommu driver (as poking at hardware A from driver B is usually not good
practice).

> 
>>> Thanks for bringing up this point.
>>> I will send v10 patch series removing this BIT(5) setting from the ACTLR
>>> table.
>>
>> I think it's generally saner to configure the SMMU from the SMMU driver..
> 
> Yes, agree on this. But since PRR bit is not directly related to SMMU
> configuration so I think it would be better to remove this PRR bit
> setting from SMMU driver based on my understanding.

Why is it not related? We still don't know what it does.

Konrad

