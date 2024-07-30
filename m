Return-Path: <linux-arm-msm+bounces-27377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F37A940ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDD39B25046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 08:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B87186E4F;
	Tue, 30 Jul 2024 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXNZzGbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F9D2E5;
	Tue, 30 Jul 2024 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326911; cv=none; b=Twz+RpDkt+w9RML2izAR3Y/8AnL34JPZeCsV4hMXAL+tqYilOBJQJRYS2D3btCmoW1E6M8wGt6kmYp6pmP5/GwpMddMyKlzTE7vY/r/QviJNd5KT0pPBo2BoGwAEDAayBxODvgMuBjQEeA2HIrVN6rVjSYiWj/3s6u9KtGnSEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326911; c=relaxed/simple;
	bh=jJbBEws4+9wxc7s41ddcTpMuiU+dFrCzFuJxlG6M4Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSV4RKo7G+WIp5cmrTLKBv9DM9A2KU2FYXhVVDfW8hrxTtodx2PHljTmgDghoQemDAVZQfuZwgBBq3BEA9icJAHruz/R6yV7rUM6C4c82HYjeOXrD2dYDPmuRO4E2BkZgJ7LfGJ4f9rKbxPM2Ab4pBV0I7BSTzq9UfkbMjzF5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXNZzGbT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7aada2358fso776071966b.0;
        Tue, 30 Jul 2024 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722326908; x=1722931708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZF+Pz2AhcQY27YBc6J2Fo4eWNRZZfKHCgf0Gc2Vi6o=;
        b=ZXNZzGbT+YXBGdf9t4pi/KBMcre1dF2R+yh9OPbTWNM+wWB/EVUrUOV06j0YNnIC9O
         Lgr3EwY89PzOhpU+Ry1fOwgmS0IuNis3KOSnsuQhL7nRPfqBzYN5w8ATCR3moLnSLkT6
         FK+l4nmR55zay6qKmmQ+AR0EJ4z79/PutlAbGs9FJJey14Q28LFrIig4BbUDGWfEIR+B
         nI2NrmTLN2QfamRG9T6NESwOAwmupkeFpd+bJyTOk6dpunp6lnS1oYowyVSiENCfABDN
         yG3rvMDKQcsS0fFE9gWyIpSMbjR5tZMqZNMGfoIDdHQw263yvEubALj8k0yI/WQEEsFZ
         vFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722326908; x=1722931708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZF+Pz2AhcQY27YBc6J2Fo4eWNRZZfKHCgf0Gc2Vi6o=;
        b=EpaZIGsUg+w4kUwHtY9ks1kqH5eDg3eVE6+FOU4Rm6ydWkfkTIfCh0qRAAYMuXBsaB
         i9QgijGf9ypVjDMaQY3WjtTrg9mz3gYmsv3QwhiUN7VY5M4NJLMpNj/0elbGjBXQffV8
         STUYvzLmrcsrERDwy1NCLSkvdn4xTqlJwai6YHWcL44W+MN/K0V0Ng8kKhedardBu6KL
         XPd5fqmsdJn9wDu98/B9i5DI9WEG2YRw9CU2sCe0T4957KLHo7Asklc3gCclmz9Ksm84
         4TR7hSS9jZvYufmWW5J2U0YHd1457Tq2FE+ujYEuVwWquWUguKLOHz9ek1s0dv6x3ilL
         txlg==
X-Forwarded-Encrypted: i=1; AJvYcCU6JqnMu0B9jQ8ZOun9QUhrqCb4VQGcjC7/Ap/CErHVEBVWvxYDm6eyUi1No6A5iU6n9wJeBCcZR8dISZx8nDIgpkeOU90magk8bWnKz9KeBjuPYxs+rZUd/ujY7hwb/XuEBECwZPRiBuR2KA==
X-Gm-Message-State: AOJu0YyPzgURW6nLQvTC4Xw11ZHm0UXSihZVom4OAOa5VFhq/0gaq1ok
	B708BMibfKE1eadAn0h8o4PwLYceNjUXG975sbRnkpfxUBRy8zGV
X-Google-Smtp-Source: AGHT+IHmcD8TT/OjORJf5+HJTjExUKx41HXrJqoDLKcAwWWZieiprfgJ7DuRrTHke21Hmw0S4rjPuA==
X-Received: by 2002:a17:906:bc20:b0:a73:9037:fdf5 with SMTP id a640c23a62f3a-a7d858b3d5fmr129857466b.6.1722326907671;
        Tue, 30 Jul 2024 01:08:27 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad90130sm620226666b.144.2024.07.30.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:08:26 -0700 (PDT)
Message-ID: <3332c732-4555-46bf-af75-aa36ce2d58df@gmail.com>
Date: Tue, 30 Jul 2024 10:08:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <CAA8EJpp9zaQSKbis7J9kYTudTt=RFhfbzeayz3b-VbGQENtqeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 11:21 PM, Dmitry Baryshkov wrote:
> On Tue, 30 Jul 2024 at 00:08, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Mon, Jul 29, 2024 at 1:14 PM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On Mon, Jul 29, 2024 at 10:37:48AM GMT, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> SDM845's Adreno SMMU is unique in that it actually advertizes support
>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
>>>>
>>>> This however, seems either broken in the hardware implementation, the
>>>> hypervisor middleware that abstracts the SMMU, or there's a bug in the
>>>> Linux kernel somewhere down the line that nobody managed to track down.
>>>>
>>>> Booting SDM845 with 16K page sizes and drm/msm results in:
>>>>
>>>> *** gpu fault: ttbr0=0000000000000000 iova=000100000000c000 dir=READ
>>>> type=TRANSLATION source=CP (0,0,0,0)
>>>>
>>>> right after loading the firmware. The GPU then starts spitting out
>>>> illegal intstruction errors, as it's quite obvious that it got a
>>>> bogus pointer.
>>>>
>>>> Hide 16K support on SDM845's Adreno SMMU to work around this.
>>>>
>>>> Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>> There's a mismatch in sender/committer addresses but that's "fine":
>>>> https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea@gregkh/
>>>> ---
>>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 36c6b36ad4ff..d25825c05817 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>>>>       return 0;
>>>>  }
>>>>
>>>> +static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
>>>> +{
>>>> +     /* SDM845 Adreno SMMU advertizes 16K pages support, but something is broken */
>>>> +     if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-v2"))
>>>> +             smmu->features &= ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
>>>
>>> Shouldn't we hide that uncoditionally as it's likely that none of v2
>>> Adreno SMMUs support 16k pages?
>>
>> Hmm, that would be unfortunate to have the GPU not supporting the CPU
>> page size.  I guess we could still map 16k pages as multiple 4k pages,
>> but that is a bit sad..
> 
> For now this might be limited to older platforms (v2 vs -500)

In the commit message:

>>>> SDM845's Adreno SMMU is unique in that it actually advertizes support
>>>> for 16K (and 32M) pages, which doesn't hold for newer SoCs.

Konrad

