Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C7D3A3662
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 23:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhFJVrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 17:47:23 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:53117 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhFJVrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 17:47:14 -0400
Received: by mail-pj1-f49.google.com with SMTP id h16so4477019pjv.2;
        Thu, 10 Jun 2021 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFeq080l4pyungY1s5smdqe1RkTm59ggcZkYab3uzaA=;
        b=od6K+JZZ2Ya1vmUSFUzEt823il+QDfWsVXULz6C3V7pvOQe/OzfOO55BSEJzkpc8V/
         5JOvD07BvVRg/OUQJGhdt3WhNAMlxvZRHKw4Tom3lj+u254y+rqPNS7CiyfzFeZWay14
         QkHfcnTFWk3raQFcGjmXdXzCYZMGKeZkSW5nAnVFeL5+GKtd58AmcFt7hgF2x+oN5Mdk
         scz1q9J5xs3hherxMHktgpvuV/RTVG57XvRS98Lz1/enDmR2B62RVDrD80/v5vWPJlmt
         x5eEyI8CcqhqyEIkxvEwrjmZtexHTnAI/ORQNhFawNle8sCr38KIui2WPmSlV2mbDGXy
         DUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFeq080l4pyungY1s5smdqe1RkTm59ggcZkYab3uzaA=;
        b=iVb9nCXZd0dkUYeofjeLX0i7UvAjcwdoUAXGq2XdqGtb31LUKGJMuxXwsQ9BbHH1V/
         QPipj9Os2wVwqj5DnDHqZEU7dbL2Bv/8UNAn1s4dKQIR17GGomAXenEi71wWMJBuPqrZ
         +as38l+N9kOmXZH26rStmzSodZRkfY+H49QAVfP+dJBqdwIKDYwYIPnmeIK8rqXs7SzG
         tuJ5MKJUM6JuGNnrcGumKmSU76FwiDkXwg5rMu134UnoOKd5B2KcrqTzvjo4yD1cW6Rb
         hv59BBssjQQVARVzjFoBaO5I0u83kGl5izfJspxTfwEn6T+juALS/lR5YH0qf8Od5YVW
         Ywvg==
X-Gm-Message-State: AOAM5304GULLDt4WJMLEsPsYw4Ia4ipGU+y4DYlZlgCdaIqJ8qlw8bTH
        422Wu2t0JRvZBkAo++pSLew=
X-Google-Smtp-Source: ABdhPJwTXFRr4e/p/Dd+f4YZhg9ockexXtaUtSitnB/HmG6Ps8HeqoEC32RQ+nVKhHQlYKvHIoRK8g==
X-Received: by 2002:a17:90a:ad47:: with SMTP id w7mr901700pjv.51.1623361444589;
        Thu, 10 Jun 2021 14:44:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id h18sm3415629pgl.87.2021.06.10.14.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:44:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/5] iommu/arm-smmu: Add support for driver IOMMU fault handlers
Date:   Thu, 10 Jun 2021 14:44:09 -0700
Message-Id: <20210610214431.539029-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610214431.539029-1-robdclark@gmail.com>
References: <20210610214431.539029-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Call report_iommu_fault() to allow upper-level drivers to register their
own fault handlers.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..b4b32d31fc06 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	int idx = smmu_domain->cfg.cbndx;
+	int ret;
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
 	if (!(fsr & ARM_SMMU_FSR_FAULT))
@@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
 	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
 
-	dev_err_ratelimited(smmu->dev,
-	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
+	ret = report_iommu_fault(domain, NULL, iova,
+		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+
+	if (ret == -ENOSYS)
+		dev_err_ratelimited(smmu->dev,
+		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
 			    fsr, iova, fsynr, cbfrsynra, idx);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
-- 
2.31.1

