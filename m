Return-Path: <linux-arm-msm+bounces-106395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH0BNYGU/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:32:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3884E94CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 695DC300D852
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22F23264C2;
	Thu,  7 May 2026 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REcujGCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7C73B7B9E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160485; cv=none; b=SRRxKXzNeokVAIBSClyGmbtopFM1OlQqaJzB2fVF9qP1FHJA95222a11KKSkk3ZEQXNVrYSSZINinkVV+mboST1DbqArroylT+BLPUOIh9TlnIhcHabuY6sN8obXS1GyK63t8iylTpZ5V6MLPKnIcpxiO80RlGyLm6th1JkEU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160485; c=relaxed/simple;
	bh=GUGxPoO5R7lonFmB6Rui3l22EEGIexu+OW62yr5eVbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmDER7Wqnsu/qOu2Erwfv/zoQNYb3TESOOA7+GT6Wfi1UFepnh8m7VDmvJo6BKuzEZGbWC6UHucMrBXwSnO1P1ZW5s9IRT09WRNYenud07G5pwVrrNLdY91qbvCRi/P6xVfsfEc0N7IkE97a3AxKwmv7HVw4M5tdQwJ5FtOE8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REcujGCO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449de065cb3so907998f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778160481; x=1778765281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/1d4MNXx8F6WoIg+pWhQR6lyz8UlfDfaD1LAFn90c8=;
        b=REcujGCOOFYxYxcvSAzGBJmWqrzOCr/Kto/NJGmNUzl8VVLg8OR9a7hpTHC5H/o2VE
         tfoeNAzoJi2zUrrJ1dtJEzkjXooUCU53tibAnd9zZ4VDTFpBEQgu9j1GTs9qND6Lfs1+
         bctaZET7KD70gmkust0+0PTU6x5BM86Z/4znb58MzqbTXwzDAZ7qbptbJr2axAELKmOy
         Gk/OSwTCGH9HWO6FQfoKTRsGC5S3DNzJ0GGGA+uknkuJrfzMO4AWqe1u9Sz6oSopSL6f
         hVyu7jRPtnN2WFiQgdKYzlcCoUIQcCwQsqRdqUR2UhYycB+hQoK774xyuRKTl9Yav+MU
         /UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160481; x=1778765281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/1d4MNXx8F6WoIg+pWhQR6lyz8UlfDfaD1LAFn90c8=;
        b=ApKxKHvzHtlXVwYXL5V1yveyW4bVUQ9mzs92L107V6lypPgC0TtBC+V3E+6e847pw/
         BeTGLShbPfAD5sI0qNkqziV2iyOmbAGc5hGE1rmdZGuI0kDd7YuNVabm0N/Zcgx5B7UG
         Jk0pFkhRH6yn31sB8NVO3V7Fz2KRXCim/ooHiUcRy5pAxJjYKlsqiEzr2fStBRy3XsIq
         QUmWIzq18iumtiyp6NkUEYK7UhqvsbMYIvC4IfxmOai1F9bF7pj0V5zTyDTkaPEAELUc
         NOrmDD+XEafFYPej6VTeCS6G1LUGQam1oO6EwsGN+WfutFn8+7fiqign+J0Xchuo+p05
         l9+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MTNgdtDhWdVX8GdCDWOPOM8kXNSLr7JoudZ3llmoIfCJXTeHVAhPaHqx4Hx/kJNWog8yRq8lZj3s5iZ3p@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2WprGpNjccMvc7x8vI2hyAU62dl/gBA+DhTSWlemuZPc798E
	AcjCPMydrfgCcd7rfcEHrNHDXwAhcVa3Wy/oegu0ut3IChcq1FFN7u6ALE3t
X-Gm-Gg: AeBDieuL0Z594nNWRUF1vm8ThZTEM4WsCYTNDwObojahnPgvjkRHuCIub/gsPfuoSnU
	Dg6dkfvYIGc592U9w6ruOx0RlYyLTRSRaL7m8+lL/VxHj6nXjHE7vgj0r9MyuyhU2zNXx26O5sn
	X9qpZCMJhjZN2PBraF+LgxhQWfC+qJzuTCe1QNp1vhE4Qj/gg1IAZvGSXHbsexw8eCp/8eWZiZg
	MRtDuvFGo0wghPRnOna93gjcArQ/nAq1N8mrFnh9/ajG3KZRBuMOZ8f82BmowkDLA+LH2015oG5
	je9ZhGkw9xHFM9aiG7jnNhA4NrF6wkoe8wPln2f0GE4NAHZHXKSUhyoQZdp7/dji2eQZt0oxh7J
	xMyUYpzXubpm2/KTjU6oPsZSAwX0uA6lzjs7gtRtue/g93Q4FNXeNWdeu7Z4B4gMFtZhmdawFYs
	q/266MzHljwr/j0aOLpWqW4sw4+BhzHSeXs4EmFxJgm7WwisxRIg1i87tgIIGdFEpq1+A2t2uO/
	dYTqLwR2+icS0+q3WWApy+N9PqLGw==
X-Received: by 2002:a5d:588b:0:b0:44b:7ec9:2d76 with SMTP id ffacd0b85a97d-4515b056d5fmr14170290f8f.7.1778160480564;
        Thu, 07 May 2026 06:28:00 -0700 (PDT)
Received: from [192.168.1.17] (host-79-50-55-97.retail.telecomitalia.it. [79.50.55.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm20037129f8f.34.2026.05.07.06.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:28:00 -0700 (PDT)
Message-ID: <6cc62409-9ca5-4db1-9526-65dd8b88981c@gmail.com>
Date: Thu, 7 May 2026 15:27:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Xilin Wu <sophon@radxa.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
 <330D3C56EBC6D08F+3d956321-39de-4308-a977-ad8f7101ed92@radxa.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <330D3C56EBC6D08F+3d956321-39de-4308-a977-ad8f7101ed92@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C3884E94CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-106395-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email]
X-Rspamd-Action: no action

On 5/7/26 10:21 AM, Xilin Wu wrote:
> On 3/26/2026 5:11 AM, Anna Maniscalco wrote:
>> Previously the device was being accessed while potentially in a
>> suspended state.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>> Changes in v2:
>> - Simplify patch by acquiring device just around the call that needs it
>> - Link to v1: 
>> https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 573085349df3..cab7d110aaf5 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const 
>> void *cookie,
>>       struct io_pgtable *pgtable = 
>> io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
>>       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>       struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
>> +    int ret;
>>         /* The domain must have split pagetables already enabled */
>>       if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
>> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const 
>> void *cookie,
>>           cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
>>       }
>>   +    ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
>> +    if (ret < 0) {
>> +        dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: 
>> %d\n", ret);
>> +        return -ENODEV;
>> +    }
>> +
>>       arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>>   +    pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
>> +
>>       return 0;
>>   }
>>
>> ---
>> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
>> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
>>
>> Best regards,
>
> May I ask what is the status of this patch? Without this patch, I can 
> trigger a crash easily on sc8280xp by running fastfetch multiple times.
It's ready on my side so if someone could review I think it could be 
merged.
>
> Tested-by: Xilin Wu <sophon@radxa.com> # sc8280xp-radxa-dragon-q8b
>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


