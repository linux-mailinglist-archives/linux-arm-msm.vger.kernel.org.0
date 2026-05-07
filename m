Return-Path: <linux-arm-msm+bounces-106472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GENyLbOz/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:45:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28A4EB4DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76BAC30294BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509DD44D033;
	Thu,  7 May 2026 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9N+9Otl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8596939098C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168686; cv=none; b=Yk7a6V2qzVid6HD/sy0ZORcz7HzAGyiPpe/4TZ/I6DZtPD0G1BW4E5VligMsO6iMqVounKJ5ms5hy0zQN/kOd3SSVXzNWVbVHrrNyzUuGKArUxlROMH6hsqKWWRBgTTgTB2O0bSnRTg4B/iE2Dy5qbGZa28dUxhgXfNU/fPh4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168686; c=relaxed/simple;
	bh=/65aTewutdOYYHkLbv4J7oGxKMUrM7GHgTR/87MEjOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCxojjiUsZsvCChwUt0ESl8dTnRcxWnFp7N3PF+5mx3btOLotAoHGGyDIBXyGNbDMGSRYs+/9bc9+igATXIkb/lUC61wBR0dOKLCi92LSCWr99f3jsVMP4AL/a0q0JnvUBSEdusJjHQC4m+UBVu1bnGUqvhgNmGykgv9beMD1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9N+9Otl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so6641905e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168683; x=1778773483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSOmSFJwCPNmD4rhxZFAOsBilrO5DsGS6d5uAovPx48=;
        b=Z9N+9OtluwDnlhh7wOohKSqQZg25ZONvm+7mPpGTZMBjh/yBYjoAGhxgBGhmK7DbSn
         RGsKR/hPdCNhXs49+vzFUWF8yVrRS85Psl3IcrT+AvUr9ZLNMoUUGCcTgyeRFliSqVp1
         Nv/bJMsrYuD/WsUVsGrE6zJZbAViBMbtcCZhaRG79wyaraPe+E9yAOFmq0xCkHt3HLhA
         I4fO07BJDPNOtKrwu5xzMmaRnF1q96pZWATlSCp2RmyFYlZyhhdaIuBK5RL/mYTUwNyq
         e7ksPouMVylTU2Xn5bb0eU59STMpDxmdZUWaoUR8yIK5RkGD0ve0B4aZel3ZtvMBt4kb
         aUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168683; x=1778773483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSOmSFJwCPNmD4rhxZFAOsBilrO5DsGS6d5uAovPx48=;
        b=GjICmhEaex8fnKlJwRnRjAF4BWkC114wZQ0wAaUATItkMv89XTR52lNHry1QhjfygD
         O5V00lWnlvrnyl+mieOZeTHW1vTqpgitye3ttNSWWXkniJL7W9z75kqpta9FJ9twfwRT
         OcqkiZjS1uPkS6jRRzlE2/u0vl1GgvJmu04QBL5tuyo/cUG1xcZ4yL0RJjMC3zhZatyr
         hdRpCE5+EgdoMv0tXDmTMb1Ox2qxEpCtd/jyqfxImvibk8n8YWbGmkbaUL9ybMw5r6RN
         5tihSu1iC2iqB0wwYibW5kL0HksKHiXBV3FFWQp/+gi9wf8woN0+MUZsKvw/f4RQPEyP
         W7rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LpiauP12RZ3QvyEzJOj74WTh+zwUMMoBHBwSA9Ub0QCIXzcPkXowDkVllQ9dRsV8DkNm8gsLw4S0NBmaM@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6T5hmA5lHf0/T/FBWtuNAddrZDlaMDDQaf9e+R1C31pDdJKt
	+voqt5a5IEeJaX+OxD4BNJH3gEZ3onlC8AIVen+gOI8Glz1YzCi1528=
X-Gm-Gg: AeBDieuAljM72HDCy8KASb8H8/RG+QwbtNoKwA6H5igfC5tZmpTsU2VMHXMVbVfvWJs
	lHz57bOFZYfF7SJRpCGWbN7zlLWbWhXs3UoL0lh3eei2MBDBNEHZy5s/bISns0x7ViiINQJBDC5
	espdMbEF1BoqC4Ie8xsu7V1YkI5+OdIc98V/xjM342epS8HZd6IlsV8FBEEf1Td0HWmP6iqAIrO
	kdDQZDe5OQBVuBIdgkoX6ZXjhPjPXfptsWN5FFCrPE2rt9qTnGFLwEqoGUTqYfU4NzCdbSg1qzw
	+9TEYVaiDaMzpJh6+5KVcaGMo/9pEVGo+nAyESBRgb7ohMuKfpuengRhgkSYqkyJJZPzA75qQQj
	rbozcbm5gBiKaFNfioSCnmbFIYXTUwjAbMEJTEY6RQvlNPcnASc2vHr9bomHOqWfkJqwQe1N2Cd
	wVr2yCU3aCegZd28aXTas3I114yC9gIzmML2Ixx2difTJ5prkZ44r3I1EnsWsMgYsFIDggDt7+c
	IP8kzp6WWRTcntKII4=
X-Received: by 2002:a05:600c:2d15:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48e51e16d0bmr83937765e9.8.1778168682869;
        Thu, 07 May 2026 08:44:42 -0700 (PDT)
Received: from [192.168.1.17] (host-79-50-55-97.retail.telecomitalia.it. [79.50.55.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fe317sm65839805e9.4.2026.05.07.08.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:44:42 -0700 (PDT)
Message-ID: <c6e73ca7-fc97-483a-8abf-f2c31407807c@gmail.com>
Date: Thu, 7 May 2026 17:44:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
 <d071cc86-0449-430f-a572-4f43c3440748@arm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <d071cc86-0449-430f-a572-4f43c3440748@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7C28A4EB4DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-106472-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/7/26 4:47 PM, Robin Murphy wrote:
> On 25/03/2026 9:11 pm, Anna Maniscalco wrote:
>> Previously the device was being accessed while potentially in a
>> suspended state.
>
> The SMMU driver's own write_context_bank() calls all look to be safely 
> within arm_smmu_rpm_get() scopes that are holding an RPM count when 
> relevant (or the one at probe time before RPM is activated at all), so 
> indeed this seems like the appropriate solution for here where we're 
> free to assume that Adreno platforms must always have a power domain.
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>
> Just a minor nit: it's probably OK in this case (unless Will 
> disagrees), but for future patches, it's preferable for the commit 
> message to be self-contained, so as to give a sufficiently clear 
> description of the problem, and summary of the solution, without 
> having to be read in the context of the title and the whole diff to 
> make sense. For example, if I were writing this I'd put it something 
> like:
>
> "
>   iommu/arm-smmu-qcom: Ensure SMMU is powered up in set_ttbr0_cfg
>
>   arm_smmu_write_context_bank() assumes it is being called with RPM
>   active, but it turns out that is not guaranteed in the path from
>   qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the the
>   register accesses to lead to an [external abort/hang/whatever] when
>   [doing whatever it is] while the GPU is idle. Add the RPM calls here
>   to make sure the SMMU is active before we touch it.
> "
>
> Thanks,
> Robin.
Thanks for the feedback, I've sent a v3 with an improved commit message.
>
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

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


