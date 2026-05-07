Return-Path: <linux-arm-msm+bounces-106471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEINDpq0/GmOSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:49:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8404EB5F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34AA430DB5AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D2344BCA8;
	Thu,  7 May 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzROFiIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157F44B660
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168638; cv=none; b=WaKanTM8nubztcBnk6MRvxSfQnUb0MvgYYGc75WayGqyds0oEbGrNFSYCBAvZLApJmBBaHcWzaC0vi0QLBbb129m29nQ+kuINo4N+5R68+sBqe6mNwGjqMjIKFl4MBdOlx0zuBZ9sVyYhN8rpgdupgqvq79Z1DHOgvg7eS5mT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168638; c=relaxed/simple;
	bh=JvTfGtQt/QzZHDNLS/mKUWRZZK3nInAjvOmIg4zwlgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qe1802S8NDSNErBLsIBzIkJXZduusziLD8VXLeYjNBXVyLGbALCZgJmrNsPuycRAn8hcrqVSsKl1DoOjYBz0gXIVNhK9qNBwLnYMO9nDvgy+4FIKdcKrGwrUuJvpzwmGwdB2QhO95oV21sSqR5aKmX65t/fLj12uDCofzmsjKzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzROFiIn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48374014a77so12187805e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168635; x=1778773435; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhQrAQa75d2J0YA5KpT6AkN5xsQFVAOM6cWXJDqCQUw=;
        b=KzROFiInuNAqn2qruZdSBrGTaEVOkDhi2HSBPZG+wa1Jqf9vQIH07Gi8cT8ZNZoUsq
         iBgvdvfCtaHd7nC5YmQ9Df945QrT3fn+tJOhpqh0Oq7tOop7XSA0Sxm06Bqsq92fJjrS
         S1ugbaVHuld+Lhm1/gc96y3kTMSGRXfPPtqTcoLov5DxQojGBKxSV5FSY44BKHgbO2Uu
         1vrDdm9H+gnqveig34XsX1uY/lOeCJuI95tPEhXU6xcV/rSgtObNqlOccPIzLPaDWYWx
         SBeqKrQRc+xNNxyAIvVSWsmF8GKK3O9oIeeR7POmhwhz3Aw7nwGZ36ID80x5TCNVhF9w
         M5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168635; x=1778773435;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhQrAQa75d2J0YA5KpT6AkN5xsQFVAOM6cWXJDqCQUw=;
        b=jpdAZCubAZSRBJUGtpnBhaIwrZC1AKg/j0nw3r6azfUKxtVzpb5FbwmJtAzjObN1vD
         RPV8TIeRdNI3i/5vtGsZUMJvvBBz4BCh4FAg0YfSx8fLxVvBNBaOUtHlbkRkOyZPC2FR
         4B0gKx9uwedVWEv02+Hky6HQNTxGbrIKoi1SBMEXbPRXJ/134CxhmVhWiTtk/1Naa1ru
         /JPLVIHftodi+in094F0p7Q41/KP7tpD6DQN8vuNdib0OTzeiee2LBD3yOaLAkhMXUhD
         7Or9Z8dBEX8ha2RZMn6pqEslfABlKuUegbQFX7UqRVg72S4rTP7+3KyuOLq21syNYzjP
         QSNg==
X-Forwarded-Encrypted: i=1; AFNElJ9cUGhr38Fu2HJ+tPy8HcpYw35F71CJY5GkVcbGL0UMM1rP24+dYZ2KbM0esqpePfiiEs7QE8HhqTAz0Moi@vger.kernel.org
X-Gm-Message-State: AOJu0YwzTg2GmJInik9e64fLiZRBZaBQyMseAVjPOeaY0yPy8JNbW+wg
	4qun4dtVzLuTdHAetuDMcOCe8fsa70a2GE/mH6TGQ1NwW8uIkWUkCW4=
X-Gm-Gg: AeBDieuXub8drN5iuuc5llaWRfKXkUrDT2S45J+ISrkfrLmgMUf/nJnU5pTAU8HJ6qx
	24jCjpDQZbvrfTknLHPC6bR8qy79ZP++aIFsWsROzFnqC+w5C8Jfsis6j4CZGijGruMto1hU4Hz
	kDqf+xfa3/M8OPYJzie0Yc3yH7zl2l7PSh3pYaDM1BuA5/D1QpwGlgFrQhALcIOrql2UlOIhciy
	XbpbqnQDVL4ahbfAWqSd+TTacZ7FMCYuBAcNWltnl26qV50NSGKNGR7HBUZlRROiUxX8MQhzSRz
	mNKI6Ik5xt7q58Mnp6sl5YKQMtli4mNDCNMgY2W0qLFb7a3lS/EO+7ScsBrdOqTTB6kT5CHp4yE
	1Pn+rn/p98wGq5nnadwBAeqpF3C6NgQ1j3WR/O0gvC1ee1I6Wqt5W0MahCC1cJ9T0DnCe7qEnPx
	I0py8PNJzKW88tdrtIbasDgIOqvrugoNS6mKCpNH+oxddavccCcOTAw1tZqiPtYxfgohVkv6Q1/
	X5waEcrEsbZvoWNMkA=
X-Received: by 2002:a05:600c:a305:b0:48d:364:6c54 with SMTP id 5b1f17b1804b1-48e51f4144amr102180955e9.23.1778168635011;
        Thu, 07 May 2026 08:43:55 -0700 (PDT)
Received: from [192.168.1.17] (host-79-50-55-97.retail.telecomitalia.it. [79.50.55.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm209994895e9.1.2026.05.07.08.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:43:54 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 07 May 2026 17:43:15 +0200
Subject: [PATCH v3] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-qcom_smmu_pmfix-v3-1-af8cd05831a2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQrCMBAGX6XkbCTZ9Ec9+R4iZdOubcA0NdGgl
 L67aS8K4nE+dmYnFsgbCuyQTcxTNMG4IYHaZKzpceiImzYxAwGlACn4rXG2DtY+6tFezJMDEra
 gMScQLFmjpzSvxdM5cW/C3fnX+iDKZf3fipJLXu10JXOFjSjUsbNortt0xpZWhI+voPj1Ifkaq
 3KPJbZC07c/z/Mb6SbGKO4AAAA=
X-Change-ID: 20260210-qcom_smmu_pmfix-2aead2ba4e20
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>, 
 Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778168633; l=2650;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JvTfGtQt/QzZHDNLS/mKUWRZZK3nInAjvOmIg4zwlgw=;
 b=78r+QvfiiQHi317bGaK1Vp3B2bi2od5HUfeBqAj9XVv3eh8gwkCyaKS+hC7krNXwwLSK/Ustd
 uBpdiT/GZqBDZ8rCiOrpauIwtCS2Vf4qswB9VZB1iXJHovt55TZVPwy
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Queue-Id: 8A8404EB5F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106471-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,arm.com:email,infradead.org:email,linux.dev:email,8bytes.org:email]
X-Rspamd-Action: no action

arm_smmu_write_context_bank() assumes it is being called with RPM
active, but it turns out that is not guaranteed in the path from
qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the register
writes to get lost when configuring the context bank while the GPU is
idle, leading to page faults later.
Add the RPM calls here to make sure the SMMU is active before we touch
it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
Changes in v3:
- Changed commit message to be more self-contained as suggested.
- Collected RBs
- Link to v2: https://lore.kernel.org/r/20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com

Changes in v2:
- Simplify patch by acquiring device just around the call that needs it
- Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
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


