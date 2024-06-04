Return-Path: <linux-arm-msm+bounces-21619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0E8FB676
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8BE91C22F07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA9A12BE81;
	Tue,  4 Jun 2024 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/2iz4Nz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9462B9C5;
	Tue,  4 Jun 2024 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513309; cv=none; b=rBCKxp79VYxCr+1vo823xvuKYkdKK2nH7NKdSlBrCZISLlEE6R2HN3MRuWrivBrYzT0IA5UU2U/c5ikJBrHJH88yNQHJ1RMxegHj5N8MKXO2+6jkqihpVsqbWsLbGh6ibQuzmw0Z9BYjuyUgIF5/mPPCfpgKWmZ8ujG//v9M8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513309; c=relaxed/simple;
	bh=FBKiAGtmKJHWNrtxjlG2jSJk1wPquEKW9T6nmOhWZEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8KxlJ76NG1mDnZiIytN+xhztkkTDq6O467IE2/rWU1XcwMXZlLjt9aXeLy+EmoTPj/JTzNxwgqbOKQcqA00nHJtk2ThjJg1CwGbuk7HoBXznAsTof2NZtL78HDSPOfIQHg5Q5FKNJmNYEtGTKREv4+7QngGM4rGRhB8F4BnkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/2iz4Nz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f44b42d1caso43315525ad.0;
        Tue, 04 Jun 2024 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717513307; x=1718118107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zzDBNu/Km1bywTdzn1zNJ2Ca7zC5GTmKmM9CZqf88E=;
        b=b/2iz4NzNpSYvpte8HqOw58iz17gwmscwpZmea9mBnIAZ2e8WxfD7KhjFnJbpTMgX5
         GA4+bG+LfA533IT89IFVbwKovsWiieSrVvIwDYfoqNCmWY6Y/mTI/xlg0bidhz+k4z3O
         H5sbRLYXKrJIpA6QeYiVpV2sa1TblCWrlpETPhGo97j5+tmEzsvdBoRpUpy35VgUvFLs
         ZWOIgCaRnrEr0Rt09UihrgdHPFbt+5zpJHhSoyy7apcliuDBA8GYsUeM7dUL3FCeuJFl
         7UfpDdcwOjpL3uQZ+cyFKZoeVU7IzkwMIf58SMG92G4yOgTY409tvrNIl++joTac6QWC
         87Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717513307; x=1718118107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zzDBNu/Km1bywTdzn1zNJ2Ca7zC5GTmKmM9CZqf88E=;
        b=kOK+HpqjsrDzqMQu5EuUQ8VukO0Hq0uPK1Bh2kTcXS+hMX3/n/sDsIsDHslAsyzL6t
         kZ3yEMwj+4zh6BBfq7WeW6B5iDtLR1DlnOfMPNuTxKPTTjb/CQs2/Am/c275WkQegBno
         jZwoMJ0Chm1nrO1k3Y/OyRe9T+fLSqoyqNCgbXvdPG6llaa//FycP7A2D2hUISHl4GFC
         bgc8dYf8+sK6r2GBAC306+E7Cu70ERtEQPrIPTLtHuJvZOI9pChZgafox87qfIHX+4fP
         MPnqXqc2wXduHIvoLCChmXqXOLunkUtKgCxrJy9noeuUZGZZ1R3BkaZRPJu943t2pcvH
         Nnvw==
X-Forwarded-Encrypted: i=1; AJvYcCV3vKWKZYJ+W1a6gJgF+1o3t35yGwg0Pq8hwMktNO+r90fQiNOOUqRPrKq30q4m5krCi/+FHilIEZZs6I0geUEyCHYxSOdlniPbG/uq
X-Gm-Message-State: AOJu0YyEeCWL3t6i62cD7acEaxajszLgTxurohtAqPmOYpHpReNrdjtc
	d00vq0FGVBjL3efs3d6eM+CFLoc6viqMwk7gYAc2Du9Y8R/xGOO0
X-Google-Smtp-Source: AGHT+IF1zgJrv6FVFO4d/uMJ9aDbi7Mhv60qd0JUz/GquNgBBdeZzjzd6K0FINdAHBDxfCTjnp5JGg==
X-Received: by 2002:a17:902:e846:b0:1f3:4d2:7025 with SMTP id d9443c01a7336-1f6370985fcmr137086895ad.49.1717513301179;
        Tue, 04 Jun 2024 08:01:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd731sm86202895ad.144.2024.06.04.08.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 08:01:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
Date: Tue,  4 Jun 2024 08:01:31 -0700
Message-ID: <20240604150136.493962-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Parse out the bitfields for easier-to-read fault messages.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Stephen was wanting easier to read fault messages.. so I typed this up.

Resend with the new iommu list address

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 +++++++++++++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  5 +++
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index c572d877b0e1..06712d73519c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -411,6 +411,8 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	unsigned long iova;
 	struct arm_smmu_domain *smmu_domain = dev;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
@@ -425,10 +427,53 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
 		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
-	if (ret == -ENOSYS)
-		dev_err_ratelimited(smmu->dev,
-		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-			    fsr, iova, fsynr, cbfrsynra, idx);
+	if (ret == -ENOSYS && __ratelimit(&rs)) {
+		static const struct {
+			u32 mask; const char *name;
+		} fsr_bits[] = {
+			{ ARM_SMMU_FSR_MULTI,  "MULTI" },
+			{ ARM_SMMU_FSR_SS,     "SS"    },
+			{ ARM_SMMU_FSR_UUT,    "UUT"   },
+			{ ARM_SMMU_FSR_ASF,    "ASF"   },
+			{ ARM_SMMU_FSR_TLBLKF, "TLBLKF" },
+			{ ARM_SMMU_FSR_TLBMCF, "TLBMCF" },
+			{ ARM_SMMU_FSR_EF,     "EF"     },
+			{ ARM_SMMU_FSR_PF,     "PF"     },
+			{ ARM_SMMU_FSR_AFF,    "AFF"    },
+			{ ARM_SMMU_FSR_TF,     "TF"     },
+		}, fsynr0_bits[] = {
+			{ ARM_SMMU_FSYNR0_WNR,    "WNR"    },
+			{ ARM_SMMU_FSYNR0_PNU,    "PNU"    },
+			{ ARM_SMMU_FSYNR0_IND,    "IND"    },
+			{ ARM_SMMU_FSYNR0_NSATTR, "NSATTR" },
+			{ ARM_SMMU_FSYNR0_PTWF,   "PTWF"   },
+			{ ARM_SMMU_FSYNR0_AFR,    "AFR"    },
+		};
+
+		pr_err("%s %s: Unhandled context fault: fsr=0x%x (",
+		       dev_driver_string(smmu->dev), dev_name(smmu->dev), fsr);
+
+		for (int i = 0, n = 0; i < ARRAY_SIZE(fsr_bits); i++) {
+			if (fsr & fsr_bits[i].mask) {
+				pr_cont("%s%s", (n > 0) ? "|" : "", fsr_bits[i].name);
+				n++;
+			}
+		}
+
+		pr_cont("), iova=0x%08lx, fsynr=0x%x (S1CBNDX=%u", iova, fsynr,
+			(fsynr >> 16) & 0xff);
+
+		for (int i = 0; i < ARRAY_SIZE(fsynr0_bits); i++) {
+			if (fsynr & fsynr0_bits[i].mask) {
+				pr_cont("|%s", fsynr0_bits[i].name);
+			}
+		}
+
+		pr_cont("|PLVL=%u), cbfrsynra=0x%x, cb=%d\n",
+			fsynr & 0x3,   /* FSYNR0.PLV */
+			cbfrsynra, idx);
+
+	}
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
 	return IRQ_HANDLED;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 836ed6799a80..3b051273718b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -223,6 +223,11 @@ enum arm_smmu_cbar_type {
 
 #define ARM_SMMU_CB_FSYNR0		0x68
 #define ARM_SMMU_FSYNR0_WNR		BIT(4)
+#define ARM_SMMU_FSYNR0_PNU		BIT(5)
+#define ARM_SMMU_FSYNR0_IND		BIT(6)
+#define ARM_SMMU_FSYNR0_NSATTR		BIT(8)
+#define ARM_SMMU_FSYNR0_PTWF		BIT(10)
+#define ARM_SMMU_FSYNR0_AFR		BIT(11)
 
 #define ARM_SMMU_CB_FSYNR1		0x6c
 
-- 
2.45.1


