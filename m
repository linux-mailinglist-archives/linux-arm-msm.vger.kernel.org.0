Return-Path: <linux-arm-msm+bounces-6973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F49829FEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 18:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C5D1C215D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 17:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55324D597;
	Wed, 10 Jan 2024 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4d8NFhA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAAB4D58A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cceb5f0918so47924581fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704909414; x=1705514214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPUG8wGHjUncLfJR9e1hMbIghHR8x5XwILqQc+Upn/A=;
        b=O4d8NFhAWvFdco7lDdy84yi5s557ETyKeOojaijEXSRSt6geSkN8tMRkuCugnl0BCE
         EXufD6OHOXkF60uPjjXUgQY64cKUc4m5x3PU3Sq1UooB4NWttp3D9SJw4YR4JXB12sDr
         wBQdcB0sHidI0z9tVmzv3O14PJZtB6+ZuqN7w3Oo1UT5H8BQQQsnXg/hjxuwROaGazWz
         4G8R+Kk8jNMCYGNKY8n5QC4iGxt7oLJDrwmnMsna20ETSBPsGYX/LpW+m2A9IcA2KfhV
         w1jXBcoNKOhWRSBk7mL9ARRktmkcIiV2UyDm1xkk7rI6O1rV4IIcOMh2i1MgFE4rso62
         J83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704909414; x=1705514214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPUG8wGHjUncLfJR9e1hMbIghHR8x5XwILqQc+Upn/A=;
        b=nbaUl2Uw8NgtT4JRoG/DwOriUN1BpSy0pJfpiuPfuxnKdSxI0OTVtn1um7H5hTe9pN
         3JWAtrR4MtoAT9Ljsyknm+jZLwI+fN8XQYBJR5vF7bbmO6YMjjePDxKjn4R+HHX/UabL
         vYP9XX45ldCmaOJgp7/4UxRFQka82qSfFqVS/atOwk+9DFFiBqbJnu+Mb1SoZsU1KFC6
         0dUpV/FFNSchoFy671WC9MA11937h4HISDE5vIHVwrnb2hW4ylhWSyYfzXf0Opjw4ofX
         Qb4sHe+/mQOI6+ncYA1pv6bkyVaMBOdLFQieQmF5e2ZjOW28aJ0d+E2mHR8qxyAafuIA
         mB3g==
X-Gm-Message-State: AOJu0YxS0HrQwNX5rASTbCltgf6cOW6ZCcKl2q1VJ9Cn6GV97AaUuA8V
	DjhSc3KZIQYUmhhIn2UIBbxbAFANgobLsg==
X-Google-Smtp-Source: AGHT+IHvrOZ0aqeCr586qVWcuhFyKWtM901HK7CwO0DiO3YJfPrWwlIUBPh0GgYU2a0lKt1fMyeUlQ==
X-Received: by 2002:a05:651c:b23:b0:2cd:7fe1:39c with SMTP id b35-20020a05651c0b2300b002cd7fe1039cmr334267ljr.72.1704909413963;
        Wed, 10 Jan 2024 09:56:53 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v17-20020a2ea451000000b002cd1a3bdecbsm829614ljn.22.2024.01.10.09.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 09:56:53 -0800 (PST)
Message-ID: <492aeca3-a4df-47a3-9c77-02ea4235d736@linaro.org>
Date: Wed, 10 Jan 2024 18:56:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
 Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 dmitry.baryshkov@linaro.org, jsnitsel@redhat.com, quic_bjorande@quicinc.com,
 mani@kernel.org, quic_eberman@quicinc.com, robdclark@chromium.org,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com,
 quic_molvera@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, qipl.kernel.upstream@quicinc.com
References: <20240109114220.30243-1-quic_bibekkum@quicinc.com>
 <20240109114220.30243-4-quic_bibekkum@quicinc.com>
 <2ad70157-27d1-41df-8866-c226af690cf6@quicinc.com>
 <ec31fafa-b912-454a-8b64-e0593911aaf2@quicinc.com>
 <4a595815-7fcc-47e2-b22c-dac349af6d79@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4a595815-7fcc-47e2-b22c-dac349af6d79@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/10/24 13:55, Bibek Kumar Patro wrote:
> 
> 
> On 1/10/2024 4:46 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 1/10/2024 9:36 AM, Pavan Kondeti wrote:
> 
> [...]
> 
>>>> @@ -274,6 +321,21 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>>>>   static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>           struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>   {
>>>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>> +    struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>> +    const struct actlr_variant *actlrvar;
>>>> +    int cbndx = smmu_domain->cfg.cbndx;
>>>> +
>>>> +    if (qsmmu->data->actlrvar) {
>>>> +        actlrvar = qsmmu->data->actlrvar;
>>>> +        for (; actlrvar->io_start; actlrvar++) {
>>>> +            if (actlrvar->io_start == smmu->ioaddr) {
>>>> +                qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar->actlrcfg);
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>
>>> This block and the one in qcom_adreno_smmu_init_context() are exactly
>>> the same. Possible to do some refactoring?
>>>
>>
>> I will check if this repeated blocks can be accomodated this into qcom_smmu_set_actlr function if that would be fine.
>>
> 
> Also adding to this, this might increase the number of indentation inside qcom_smmu_set_actlr as well, to around 5. So wouldn't this
> be an issue?

By the way, we can refactor this:

if (qsmmu->data->actlrvar) {
	actlrvar = qsmmu->data->actlrvar;
	for (; actlrvar->io_start; actlrvar++) {
		if (actlrvar->io_start == smmu->ioaddr) {
			qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar->actlrcfg);
			break;
		}
	}
}

into

// add const u8 num_actlrcfgs to struct actrl_variant to
// save on sentinel space:
//   sizeof(u8) < sizeof(ptr) + sizeof(resource_size_t)


[declarations]
const struct actlr_variant *actlrvar = qsmmu->data->actlrvar;
int i;

[rest of the functions]

if (!actlrvar)
	return 0;

for (i = 0; i < actrlvar->num_actrlcfgs; i++) {
	if (actlrvar[i].io_start == smmu->ioaddr) {
		qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar->actlrcfg);
		break;
	}
}

Saving both on .TEXT size and indentation levels :)

Konrad

