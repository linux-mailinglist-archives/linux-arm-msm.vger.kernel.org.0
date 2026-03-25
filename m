Return-Path: <linux-arm-msm+bounces-99950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFjvD/dPxGljyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:13:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE87D32C44F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CA1230BFC5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC7F332EAC;
	Wed, 25 Mar 2026 21:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgkEPGJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35FE3368AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473073; cv=none; b=oBm+WchWJKKuB4Nsvu64bs7Ep1JeNkHs7ys2szk7eHNidAn1W36O61mae2VlPq2Uq766mXLF1O8Gx2WQoFjNZk3RoqIVxa11T1nHZQjzQJUHZP1V4FhaM4wcqg+v1VPPvvD/ofoeY518YbT9+SIxszshDAPSPwiwhHVgTPRRkZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473073; c=relaxed/simple;
	bh=c9MHl6wwCqZZZNdguQdAF7xL+qjBzLIdLAmWzKLWIrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h77fzlXRkMGNIwZrcB0TlmxSBbyQsiHvFwR0eGrKnFlL2FVhSi++RH8RkTiRYlokEl2EFrLdZhu0PIuI83ItvsxbjyhAIawiB4ngk/9PpX1L9Bwd/8kxMqZGeFzSCI+F+lrSxDUvEvxcTHE+OCsK4tEZLWhqpWPiF7FWe72oT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgkEPGJb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38aef9cc451so2222311fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774473070; x=1775077870; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFJKPQI5/sac9me8amIP9+ekaSHHOonqJLT2WhRtyac=;
        b=mgkEPGJb/Ysm8b8ff/QIx1RmXrLf4wiJdoc2gzgB1yhZJB43R6sT3kj1lMerc//J7h
         UZXHi1HLN5R66ZsQbxQYRwO5Oackhn4R3y4EZETbg9MydoUBLwMOqwKZBfJDtqGIoBrB
         b2i5eqvilaLrNZ1Q7cLYBvHA4qWjdV/+s/qaJKnvu439wb/Ki2cU/WRiIaDkmK2CYYI7
         DPc3mONK0gq5wgdxejuaDEGsM3ltMUTY6do51iF2Nn/5iWdwV8xuzXgu+z8rjjSnG/b5
         I/BD+fBW35GoHgW+mvrRXnm/54sJxEswXvpSTeFE+KMpYJKKjuENGhh8UbH1PWrsuvPU
         Df/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774473070; x=1775077870;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFJKPQI5/sac9me8amIP9+ekaSHHOonqJLT2WhRtyac=;
        b=pt4KHpUppWdSoRY3mcKj5/YAl1zCDTfF56xOgigzEpNAzKYhVhuBpL+038VTNxvA6q
         W868MCuukHqCIx+wRF4u0jN8UuUL7Tth78Z9t20B2CFbCfxLy5jCPG+aeRPtivRCQ81X
         A250a4zasfcv9yInaq9PhaZ6bLDoy5cxZFhUveJanR9rjhBTp6P4YimeHlU+AEz4EH3g
         62xCGggkogiohpEBUt+rdArMt7Ud9MOkBvg1OcPltjwkE+bbpAR0QjrolvmOUOtUpgvY
         0vMriAtdtsnM4Y0tH5jYxa27WprDOTPgqY6DLQU5oMDNVwL/jihegjYmSfRrsl3XRkGC
         H6xw==
X-Forwarded-Encrypted: i=1; AJvYcCU7rLQiUzgMUwehJUrSBxDmO7XN7g/Lcm8B1qrIVuk+xkOcjurdu44GwsVWr38StTz5zEiZsA8cX5zFlebf@vger.kernel.org
X-Gm-Message-State: AOJu0YzYztj6JjG5igVfrCpwuAiO/3EIgkAPY9W1t1PSNDWX+iIzo9Fm
	hBZJas8efgxfrUEL42ah+tQznwkkq1JxrZJQsQs0Ws6T4eX9SSJRRbY=
X-Gm-Gg: ATEYQzwGsbKPQmf1cTSeEhpCk3bbss5Jl3xGJUsiGMt7eCKx9PeSwLBz0zBFz/bwX2+
	XXUzNikutwbjInnxcbsF6BRCubWivkNj3d8AdzDSRZy53FFqfvs53x541wtTvgSE1y1ENrbWesW
	2ikjLCjezABe28Ta+EjcHyJyyEJPfxaAasU8qPmBgfhz9JcIrER1B1NuVBMiTktgo4Ef3ibwF3e
	bqgxRGFZe8MPhUfYe8sD+9SruLNCRnsPogDsOaATdCssmdnZXwbItOsyekx9mcjZbMrVA9ezkGA
	ZRBg0abpDH0ydzTt86IsSITx8/ZA0ts3bq2gPIO1Mxk5aa5NG3Fx/VmyLB8RkaAJ+xf4rNycJ+m
	uBZ54IUKIhtswU69Wz5UNFmZ9zNx9fSVOfIIRHypXmHW+3gkj4Cwfs1Dt3Ii4fDikFfkyWfF4Ez
	9ALuwdEhOwpSEpVf7ReXupCLf6Lr1xUsw8nYGZW0VmE5NWq+Ya8TcByUEp2+dozGs/7qsu3EPy+
	L5kv/tiyd6FBaU2WNzd6mU9
X-Received: by 2002:a2e:bcc4:0:b0:387:d29:fd4f with SMTP id 38308e7fff4ca-38c43053841mr18578111fa.1.1774473069655;
        Wed, 25 Mar 2026 14:11:09 -0700 (PDT)
Received: from [192.168.1.17] (host-79-52-171-101.retail.telecomitalia.it. [79.52.171.101])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fac168sm1524821fa.11.2026.03.25.14.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:11:09 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 25 Mar 2026 22:11:03 +0100
Subject: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6CMBBGr0JmbU07oBhX3sMQUsoIk1jAVhsN6
 d0d2bt8L9/PCpECU4RzsUKgxJHnSQB3BbjRTgMp7oUBNR41Gq0ebvZt9P7VLv7Gb4WWbI+drQg
 1SGsJJHpbvDbCI8fnHD7bQTI/+38rGWVUfepqU5XW6UN5Gbzl+15i0OScvxkVNjWuAAAA
X-Change-ID: 20260210-qcom_smmu_pmfix-2aead2ba4e20
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774473068; l=1749;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=c9MHl6wwCqZZZNdguQdAF7xL+qjBzLIdLAmWzKLWIrs=;
 b=nZxsZvGAgjyLb36vu1D/zn/oDYONnycLHZGwePaIYT75gLjwmEB/AP/WcoAECO0yu57KZ+ikU
 XNixHH2ZPVhDYRs4ADLGfLw/0OhzZBIQ0C9H4Duz9/j7FQodQ3+oErp
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99950-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE87D32C44F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Previously the device was being accessed while potentially in a
suspended state.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Simplify patch by acquiring device just around the call that needs it
- Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..cab7d110aaf5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	int ret;
 
 	/* The domain must have split pagetables already enabled */
 	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
@@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
 	}
 
+	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return -ENODEV;
+	}
+
 	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
 
+	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
+
 	return 0;
 }
 

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


