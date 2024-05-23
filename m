Return-Path: <linux-arm-msm+bounces-20318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D718CDC28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 23:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED272834EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 21:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196CE127E06;
	Thu, 23 May 2024 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bjbk3BFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94050811FF;
	Thu, 23 May 2024 21:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716500100; cv=none; b=LfRfiCuf4Y7MxrFbMuChp/1UaRVC1VJIq8ThQUxpuNRypqWgKVSqEnGQTPtVEdwlwtfUVfp+tk5h2OQhsgDgE7tna03+2LwBebmLqA6dYIBo8xmqwCT9El5YApsgimHbrrNamgLDCfsfYFoUe3zwnC2NhDDaJ2SdOq2Y77pB6uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716500100; c=relaxed/simple;
	bh=TtkKeCps0ejierSSi4w3QTlHUP2b6nZhMZC8/xjZifE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwYR/qGFI07gtC3TyXuFtlMopZWW7+DGOYJRXRSYJwgCDTqxJmTNqSgQ8ChmnKyCSTkgJegRcX9clCQDeVuk6m44dDExZgPf2WdougfjA3sR+xEkzJWSKgEng0EQU2Tv0VXBnDRAopsHDz4gu6RAENWZouCnLVg8GMJ21xNZpoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bjbk3BFa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f333e7a669so16263335ad.3;
        Thu, 23 May 2024 14:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716500098; x=1717104898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7a2uMVZssHO/XdZkFjaZx6Fve2Wj78fROEuqBTUEKo=;
        b=Bjbk3BFam0qDIrREoEVZ24ewxsMyexmPY+M40Pgl4Y+pIz4sfYReqb/m+r8S3h2N+Y
         NKAtd03Kvh4MOrbe+inHjUglrbW132pKzmX9CJtLprhXIthQMf0gznEhUSG1KEVl08aB
         4VRbq36nJJQiqsX6RwfprCIzKw7LeyoiuMfBnHkbOUJCzJI3xAVaoTI6QD+nGE74Y4qB
         wvo2bsHPY9zXDtahdVy/LeV9PPvEiDG/dkfkLKdc15CGrOibrsgF37o/TyOOq7U/FYEb
         Wv4zEXByXeHPqZxeJzaw/0ptnpDsfY9uJLZjO3MQUkid2vY1W0u2qqCK4Yv3P8PsZO09
         CPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716500098; x=1717104898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7a2uMVZssHO/XdZkFjaZx6Fve2Wj78fROEuqBTUEKo=;
        b=s5TzmRUe0MA0f0WpNiePZ0EhFeO2hyAD9FM27mt3gXuoDqHY7w3tkESrB7UOXM7xAz
         +klTPGeLHcWiQKFIncAesrOMUx3njGvWFuF3wDyIxgNjrgGJ6P27MO5IikJtHltUQidr
         UVW+0FV8ULdA8VZRSlgAn/Rp4G5AqLf334++PBeqXESYTznj5qFb/thk5IKJexMThxxX
         fXEbiKUtCyz7cFH/PMpa/ZvCZ1TebPw/yYBycH4oD7vydjSr6pUEXZFSF1NHcTo/x4hw
         GRgbKmeCzdRMUtdlxqQ4q1CRgxrYcUHt54bf7dhBigtfrbCukJ4k7GvlCUtw9I87aqpv
         FVig==
X-Forwarded-Encrypted: i=1; AJvYcCVMXQiTJO1oM4+7+wAUgaRkCoiSmZXBgct++GOwmAEpzEvHX2L6ZDxUgDGb1w3BJRY6fpIJ0TX7tYrYRlHz5KSaxjzh374cWlPJITA4
X-Gm-Message-State: AOJu0YxId/CqpYW8hGlIuW0pGSuuE0/ekfgyNYH6mIduKJQDDUzR5mtl
	bjPij7n1lw4+QpY/7lWpSOe97grIM1UoeDcWklo9EDz3GF9LrqMf
X-Google-Smtp-Source: AGHT+IHg64GfV68qCaL9nLaV71GpQJxYCS/dHS/c9zQ8wKfbt4plO5szkSRDbRHEZbACBIBwzwC+Ng==
X-Received: by 2002:a17:902:ea0a:b0:1f2:fd9a:dbf3 with SMTP id d9443c01a7336-1f4486d1fa4mr5743115ad.11.1716500097727;
        Thu, 23 May 2024 14:34:57 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9dd519sm399235ad.298.2024.05.23.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 14:34:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
Date: Thu, 23 May 2024 14:34:47 -0700
Message-ID: <20240523213452.144108-1-robdclark@gmail.com>
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


