Return-Path: <linux-arm-msm+bounces-106292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHE6KW1N/GmZNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:29:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 292514E4CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CDBF311B79E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB7C334695;
	Thu,  7 May 2026 08:22:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167829AAFD;
	Thu,  7 May 2026 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142156; cv=none; b=Dm+afsGpm8/FTaXelEVWgikqAnK9VCi0PW5HjytZwq5r1I+GfHJQkKPuFEKCTNBM/7zn/GCzb0TKXFbNjhzvkwHLSOuOROFH3jFGC2gZ/DtKxyHbdZKKSJWd3cNuG49Zep4/kN9PQeE9zm43NEN4EHMurFFCu4iIDK8yJ0U0WR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142156; c=relaxed/simple;
	bh=oFyCt0ZcvHxeKWKnNYN3GLQ73f6AO0b2Rdzeg2beUxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebsEPwUT2YaQHzdJRJsX2g5k+ubV8S1msKyMHvkD6wjXP8R7qXr90Nubk+iH4QkAkyrLn6Fl/UYF4im9jJDyGEiqjPkR7qwPHv7/dI0BwZv6f+C4HUT2eJtcKNOgW8ZrkhIbvMJPAt6SwOoQCRLDCqpkC4kELZjZ88WE/30P0cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz6t1778142077t63181914
X-QQ-Originating-IP: jfpb67kdMjgSXRETIGIS0RyRqVsnPNrvm+HhFO3Cm1Q=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 16:21:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16652249558774308387
Message-ID: <330D3C56EBC6D08F+3d956321-39de-4308-a977-ad8f7101ed92@radxa.com>
Date: Thu, 7 May 2026 16:21:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MLQK/Qc97rZTdr43tE6TitzHEJbKv06OUWn26Wu5R9PnDVVhF3/Q8HTP
	TOZz+mS8WseFACwoZ9cYuBoqc5fh9dwvj5DwTzQE2dItJ0/gRPyZT368v5JG+zqgMvUSq62
	nYIXJRmTCOwNwQeVV9Ab/+kAsPC8cnVn/NxwN7GL5hCccJKc6faKgCyRM3NSloSso0Sq5kZ
	6l5dkDtdzt8crcTKXQTK+YM/2rAcMkyy3PClSnBGLQfn77AJqMrBOscqwaqH52V5uPdf1Nl
	QUX0co19a9erRCp3j6EM/HYXYFPOo5Ci7SSskCUWqQ+61f5uNKCdv2W9oq6BuzXy/AyEb20
	1H8f2E6FDLoCsxGTfkEjrAAhRtuzBzOYQlxlmtP01O3Bu7eCUfmQAxP+RRYorTCm6/p25W3
	xJvp9xT5wdv98cbAWu9XJkJad08a8BhZMiubUy0dJoorXDd0zpz1Qj7o3xufni6C5zvRK+x
	XGHvpJO1286Mx8C5w4OEV2yvzHbzemw/6yKrbMCqgiUbe/3ExmmUrGd2pPTFKnwtQV4Qb4X
	+vPzT1CfkqTkAsPYIJ8UruktFVC+FjPcqfI7vyV7LO27uShoYxiAZlDHYgnMS71fDiG3llO
	4aCRAbO17TlAX9rIYZLxEber84WmRO8TBbfgdDqME+jpmX2m2r7hatx1fRIoWBILmxQ0WK8
	g9dEgZaD/1fOJ9omiLuPstv1TT5K+N5za3JzVkcFYMtB/0ie8Qpj2PIqD/Kvywzcll3KBaa
	PFkMHIyI8XeymlamuXbxCPtyeKZ/IZQKC2dOUPLZ7rxxMJ0KaKSMPBkIToxJnGCT28136X/
	nEEU/NwK2OJY3FRM11p/NMkyfsJRV9wX8r/IZbnjQRGSstxJCOAVwy0ZafNmvDJCOCoe8/6
	DAK+HpwDC07dtvVLbt2cDsUUsjy9bzyYAWidSHuc1pndOVrOKj5TtV13iId0Z2D/MWcbhwo
	SqTJUFMS2NJx/+MwBqp3usAVFsK0Mb9eQ0ckZ+YBxZoZvMYV81b3QAgF/NQy1CvgA/sGDtr
	vGfF9BGMzzW0d+c2JR
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 292514E4CEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106292-lists,linux-arm-msm=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/26/2026 5:11 AM, Anna Maniscalco wrote:
> Previously the device was being accessed while potentially in a
> suspended state.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Simplify patch by acquiring device just around the call that needs it
> - Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..cab7d110aaf5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>   	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>   	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +	int ret;
>   
>   	/* The domain must have split pagetables already enabled */
>   	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>   		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
>   	}
>   
> +	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
> +	if (ret < 0) {
> +		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
>   	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>   
> +	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
> +
>   	return 0;
>   }
>   
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
> 
> Best regards,

May I ask what is the status of this patch? Without this patch, I can 
trigger a crash easily on sc8280xp by running fastfetch multiple times.

Tested-by: Xilin Wu <sophon@radxa.com> # sc8280xp-radxa-dragon-q8b

-- 
Best regards,
Xilin Wu <sophon@radxa.com>


