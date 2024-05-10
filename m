Return-Path: <linux-arm-msm+bounces-19704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2E8C255B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D4EF286DEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8822F129E6A;
	Fri, 10 May 2024 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixa6xieg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C4127E01
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715346173; cv=none; b=DEZ0GJ6ao3TajnSsvFMFVhwPBe5nwJIdy04s3HmOibSxgt4INYZ6KySDXb4TtLACMV0h0X2y9+cT9NJ6XGlhuuwu9qdq6R7KpgoWY9S5+nAh+xzvFdDy3WcN1qQ4KdNDPLk3rI9OA60sEpsLp0FrgiIrKLXsWCDeL15hUBI2ktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715346173; c=relaxed/simple;
	bh=IDOoM5FN/jEaq3m/ykRVd6MkVbSLFiji4upzz0M1kAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTKEhi+fzXoBE5TbuLlg2tPWpHCdsBcu+quMh6DH+LoJgPpulJNLQTldohQTqL8YcXGqwmGx5LHkQ1A1klXo6CrmqMa1xblNYWgjjoKmIJ0BCv0PK24tB0u5ngau1+Qv6A/sRrSMKRCLAtviXcY3rDkcOmOsV23D2l2PxBRKFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixa6xieg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a387fbc9so528233566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715346170; x=1715950970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9OHbA2aVTxqonA8Wb82h9NaQktmaQSCPyBhO9xRJSO4=;
        b=Ixa6xiegHg5a0MvDnjGcI+QCQ21T4osPAc5881MyWnkJ7Lr4JnDcEjLbgUK+49h4Ol
         xlT/ZVjO7rhKG5PHlk9GmEWkT/EoQZRaYQHTvZ2WEBqUjcHNUuwNt7wXyuPTkGeaXEIp
         lG7V4nbZJILcMLYM5w+ItBQM7eCb+0F0FgzMs45Nzn0S9KLpxiufZBf5k0hOQsQNe+FF
         XloijbR2XherTQ4dzMclaDM0MN+ZYpbsVBxECjm5RaEQAHUKjpT0vsvya2JkACW8S50U
         WEda9zVAL9s9rVOFYZTBfVd37M5x576tYUySzngKcBjILPc/XL8UyJe9si1AEzhuvXpL
         6DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715346170; x=1715950970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OHbA2aVTxqonA8Wb82h9NaQktmaQSCPyBhO9xRJSO4=;
        b=sZ4YouuBzOulON806sWzh4LKSxh+DaD22qt2ZY0QOsLc6UupAwqzgw6E5bviZu8UtQ
         X3ASyB0EQ/BwsjMxeZz8P1pZg04ZdY4+jrmcsdEGz6IGpANu++xPiaaecigniuFnQ8so
         L1uGQyKh0ff0A2vyZIrHbUjCqJWji7fbY3pPPN4vvIQ5Xn+Zcb6UU78AIlEjDemkZiS8
         RJTgar7y68YbSqOIdDwEseI1p8in8Wz4w4tbF4UjfJlAmDoVYsPFTn12jnYj2hkQVgV1
         PH8r6C7HUGF6DDx26SFhed6mb3mlXXzZYXdx4oTa7i5sl0SZD/a0rxWjsuFmBDNAfBzE
         s1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEa6H1SmroKh20RMdhBPVezGH7TIOjonpyDeSsbb6qV/bws50FouZG/ED0m2QaoQ5aYergoPAnyrqRip78bNlTqFqy8VY8s4/tYz1n6w==
X-Gm-Message-State: AOJu0YwdzdVPWwEPRSZq4r8M7/nA3ffBNJs0BDB+uofDWrLwm6nSPIiy
	pDTV3yPd6h1zOy+7338KxHM9NIXIh4hof+qW+w0wvzD47Lz4RUzvOEdD4Dh2rM4=
X-Google-Smtp-Source: AGHT+IGVtxPgtNd2rd4rODKiorsOsAs0qSpPYNSo8wWMMgqW1gANzgb4n2Wkjla3fBWd2TMEpAEAsg==
X-Received: by 2002:a17:906:40d2:b0:a5a:1f4f:cb4c with SMTP id a640c23a62f3a-a5a2d54c80amr175360666b.7.1715346170095;
        Fri, 10 May 2024 06:02:50 -0700 (PDT)
Received: from [192.168.62.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17555sm180568566b.189.2024.05.10.06.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 06:02:49 -0700 (PDT)
Message-ID: <51b2bd40-888d-4ee4-956f-c5239c5be9e9@linaro.org>
Date: Fri, 10 May 2024 15:02:46 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.05.2024 2:52 PM, Bibek Kumar Patro wrote:
> 
> 
> On 5/1/2024 12:30 AM, Rob Clark wrote:
>> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
>>>
>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>> register which is implementation defined and is used for Qualcomm SoCs
>>> to have a custom prefetch setting enabling TLB to prefetch the next set
>>> of page tables accordingly allowing for faster translations.
>>>
>>> ACTLR value is unique for each SMR (Stream matching register) and stored
>>> in a pre-populated table. This value is set to the register during
>>> context bank initialisation.
>>>
>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>> ---

[...]

>>> +
>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>>> +                       smr = &smmu->smrs[idx];
>>> +                       if (smr_is_subset(smr, id, mask)) {
>>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>>> +                                               actlrcfg[i].actlr);
>>
>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
>> downstream kgsl's PRR thing (which we'll need to implement vulkan
>> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
>> to enable PRR.
>>
>>          val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>>          val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>>          KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
>>
>> Any idea how this works?  And does it need to be done before or after
>> the ACTLR programming done in this patch?
>>
>> BR,
>> -R
>>
> 
> Hi Rob,
> 
> Can you please help provide some more clarification on the FIFO part? By FIFO are you referring to the storing of ACTLR data in the table?
> 
> Thanks for pointing to the downstream implementation of kgsl driver for
> the PRR bit. Since kgsl driver is already handling this PRR bit's
> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.

The kgsl driver is not present upstream.

> Thanks for bringing up this point.
> I will send v10 patch series removing this BIT(5) setting from the ACTLR
> table.

I think it's generally saner to configure the SMMU from the SMMU driver..

Konrad

