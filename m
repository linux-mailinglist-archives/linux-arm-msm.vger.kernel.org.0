Return-Path: <linux-arm-msm+bounces-92524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB8RJJZai2ljUAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 17:19:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA3111D0BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 17:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E55063034B2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0BF385EDA;
	Tue, 10 Feb 2026 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW9bfh1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E530FC21
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740294; cv=none; b=U2x0g46E4RGMBcd0DN1WpyR7AjJbTx6K80lWwEDMig8fQUKI6m/Bzxg8vxqWpFUDecZoDJv1qMXEt4ZX/A6SdSdRyQp9Tb1JAOv5XmoTjEBbpbihyJkBkMry+QBDgWgPTpDtzWlk9Mg7n6iV+SZt9Y7asuMxx6ZUXw9VTdbVFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740294; c=relaxed/simple;
	bh=VRL/E7nK1fyZMX83uu6bt4FiGrPrpeuaTEztrOQsu9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kudOTnArdhGPxJBn7rFyu5MiVCiWA6D8ha5+ZzGxOMFbJU3p5yR4qYkhFpsNYZZ7EyjwmGAwiztfn96BwdFhE+QdsgLbxGKXzM0tOnQ0/bT0mTAltHXTqhy3hQME1WMs1m+vNuDGPynDcH2lciYuRSMR23fx0O5A9vp4QQuoDkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW9bfh1Y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359108fd24so3706367f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770740292; x=1771345092; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3mzE9q9JZeLiz5qheXEKidJ4W/5JZW1PBYdqCp5RPU=;
        b=cW9bfh1Y1jvqt62O490bCWtgd0dEZvhc5pZvz5Bwg/CyHWcfoQFtCFzKYET+WdzL6i
         PdwCW6KnJU7EoFM36Uwnlo6mjAc5+uz9Gn6JZC7weR49kk41+1rbp3MEwcv3yCtrbFP1
         Xf1IdeuGLz5AKQ1VLIUpBJzihsBw8XSdOJ3jwajZqjO8ThlY67xqrEo9vWZAbUBFQ0bO
         G0mDZzmmj13qfKcKtF0Bg2hVqAeZuaC0o7LmfbKg3ev+/DiXjX6reHeondHJFxjVryg9
         P2Lwvk0EDYqt0VhqvFkeL5z41A1LWjmeNy0ddMn+QolV1qWk6WDVPazAX0JcMLu3FONv
         jm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770740292; x=1771345092;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3mzE9q9JZeLiz5qheXEKidJ4W/5JZW1PBYdqCp5RPU=;
        b=d0VU0sHil7EUI3YDpsPU1ZakHuKymgRhTpd/1tQSn46OfH5OrIz+ZNDqjVZImYZySf
         4cdzOhKobp0GmEtrf+4y4V7NDQza2p0UXH0y3Q5CE8D4OpOnLA100hZP7JanO1AlW0Cl
         CyLfsyQDMu/Yv7x20lkXvEM2yx+MPD4XNn5gW6Z3aYchxTkk1/mXoic1T9EpWOR1YhjC
         HNDA27fOKUTXY8C1RdVaa2PKSYph5TCNfD+ProOQ3Eskp+fh0dbiM5h9kaL07iKP4LS6
         gYVJYn7vOc31OBnbs5fvQ8uiinM7N/kjV8qcvlBDYNOMpYGNHmWzxMNmmFi5Z3ckdVKq
         pVSw==
X-Forwarded-Encrypted: i=1; AJvYcCU7mOE6r3YKONjavAijMYDOYpJPKlZm343sl02QyRV84NS7cZVZ7SLaS4oEPwu4g6m9oYa8XBnQJtyhRaSK@vger.kernel.org
X-Gm-Message-State: AOJu0YypgZSvoEp2778j9fMTG8LUIrs4u3Yz2Dt6Kds9I1M36+Vi/phL
	yWZe5V9iVDvGBL5dirPZEMqNlHWNVjIuyCEpI9nm7k5DPUuTFWn0lG4=
X-Gm-Gg: AZuq6aL0h6U1BPyK16GJm5bDCmOqVHqzlHK2ZPhks7OyO43ucjudOQnz0GQRqcxGGEq
	Mp6MM/jKyhA3XMm9K4QuLmRt/IbvO82X0dL012vu6ZSwf303Ir4JoqJKfrHuHspT5KJfLYKD4SN
	p3YaJBn2Crrnzh7XWsgGd626XeIQ6LDOW/igATVYQgs7km/8edKmodKYnJxoSot5jJnZkk9yn1D
	ZD5yokBdRLpuaeQh2RMpmNaBRjCn9z5V3ox0FQyvL2r5Av3bZSwh/Z78HpWEWhT0JzObuT8R6hA
	M3bCPP+ZGyc29XcAbbOOmJesvMLJy0/n5/aeM9NuEjakr02xbgPXiZeoyAad/mM5j67WHUvFgKc
	Ao4nUUqN6bVMsoG2Z35WIFXQ8mjWkgtk4WGA1L/UFf7Jnx7OFdec9O3Kry8Hi0DZ0ubhql/krzw
	+4fFVtlhm7H8hzOYQWWu66VzRapftpW8kw2RI0L1xCUIodyxyeBSbK969Pxzfm6AvVWmHpK1OMY
	kZkkea3cVBAnw==
X-Received: by 2002:a5d:5f54:0:b0:435:9ce0:f93c with SMTP id ffacd0b85a97d-4362969509amr24592397f8f.62.1770740291496;
        Tue, 10 Feb 2026 08:18:11 -0800 (PST)
Received: from [192.168.1.17] (host-79-19-172-190.retail.telecomitalia.it. [79.19.172.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa41sm39165771f8f.23.2026.02.10.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:18:10 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Tue, 10 Feb 2026 17:17:38 +0100
Subject: [PATCH] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TtAlOvSVCDHdag9aKUUg/j3pO
 AMzBTIlpgyjKJDo4cxHbKA7AW63cSPJvjGgwkGhVvJyRzA5hNucYeVXoiXrcbE9oYJWnYma/o/
 TXOsHqLYDBGEAAAA=
X-Change-ID: 20260210-qcom_smmu_pmfix-2aead2ba4e20
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770740289; l=2426;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=VRL/E7nK1fyZMX83uu6bt4FiGrPrpeuaTEztrOQsu9U=;
 b=3pZgXNEhwfzftk2Cfw8XXJ8nneEtPReIYQm7FPKnhsBaAF4wvq6oc6yGwv56OjIaVfHmJkCqc
 mZihmSR2ywFBaJPn3/li3OAgz3sQw2TocZC9SOPytLYad1lKiiWdrfF
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-92524-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAA3111D0BF
X-Rspamd-Action: no action

Previously the device was being accessed while potentially in a
suspended state.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..ca34b7a141e6 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -231,16 +231,27 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return -ENODEV;
+	}
 
 	/* The domain must have split pagetables already enabled */
-	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
-		return -EINVAL;
+	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* If the pagetable config is NULL, disable TTBR0 */
 	if (!pgtbl_cfg) {
 		/* Do nothing if it is already disabled */
-		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0))
-			return -EINVAL;
+		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/* Set TCR to the original configuration */
 		cb->tcr[0] = arm_smmu_lpae_tcr(&pgtable->cfg);
@@ -249,8 +260,10 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 		u32 tcr = cb->tcr[0];
 
 		/* Don't call this again if TTBR0 is already enabled */
-		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
-			return -EINVAL;
+		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
 		tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
@@ -262,6 +275,8 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 
 	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
 
+out:
+	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
 	return 0;
 }
 

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


