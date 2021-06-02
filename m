Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67233990BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhFBQwR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:52:17 -0400
Received: from mail-pj1-f48.google.com ([209.85.216.48]:40887 "EHLO
        mail-pj1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhFBQwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:52:11 -0400
Received: by mail-pj1-f48.google.com with SMTP id jz2-20020a17090b14c2b0290162cf0b5a35so3771654pjb.5;
        Wed, 02 Jun 2021 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ttH2lB2Q3iQhWxz0MO6TSPDv0IHfj1scw5R0SMtBJU=;
        b=nvCYD3LtO/CuojD7wCnU+c6O+R2pp2pb1KXMOskVgNnkGQajATVAekeuE6ORBh0Ejc
         R+rirwTVetIxLdBoJvcWUyV/gTioLE6JphhTZET6wlb79RKHV9XvZeWHYR6je6dKHZhF
         V9BbncwWr9HZVyJY1PRwvutwmxgKkuv8CpK/MGzO/FlSs4oHWlD92lTft0nt3i7IDq7o
         rYIzeDd6rqGScVllo4n47EJUGx0wKYSvfhhA9Z3pyjsJXJZMYyVf1+exgCwiMrudG5CO
         0qy3xgJ8A/YEyVDXLulIRaX6UkQU9K3uybFEK4T83wm52schJGyQx/lKR2yp0XXccXP1
         PthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ttH2lB2Q3iQhWxz0MO6TSPDv0IHfj1scw5R0SMtBJU=;
        b=o1wzIbytkiSHN0ntGFzIb0FS+KmX4QzHRapfQGOADzGorhpdWo3g8g2Bwz33hmT7fM
         XtigAYIjWDwoQPRLSDQIBIRu81f6az/riVQQfx/61bFcWjKt87CgzgcHND9XruKuLQcZ
         liCtEdqd1+Us0tjGjks33NHWubl0qfy/Z/mzOasGcEHmFmPMhKkFtonxuK0iLQRjd3wF
         VYqj3h3ceG1qagGzGmRkNiqijOhuA7kuXjWAh1YxMtosSMDTj5x/I59IsDRjHjXpilnN
         tLovdAJsLSKzmT+iSemF8VWdSo+k9vspl84s/yStkA2ySOZZHRPKP6fmPDmrR2yufRfd
         q2Aw==
X-Gm-Message-State: AOAM532Hs5kTGPbUr5Vy8BRYFJGzXS21y20Sr40PuZc/58L+en36zJrA
        UUdVf5YXJuWhc8GRmLiTJzY=
X-Google-Smtp-Source: ABdhPJyNuM1C0B/N7VSYw14UuHjXqYthGnVv3VSYDW7n4ueLVcZgKCAnAlLqEclUOMb0/oghQizYeA==
X-Received: by 2002:a17:90a:de0c:: with SMTP id m12mr32297535pjv.54.1622652568268;
        Wed, 02 Jun 2021 09:49:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z5sm155302pfa.172.2021.06.02.09.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:49:27 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v4 1/6] iommu/arm-smmu: Add support for driver IOMMU fault handlers
Date:   Wed,  2 Jun 2021 09:52:44 -0700
Message-Id: <20210602165313.553291-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602165313.553291-1-robdclark@gmail.com>
References: <20210602165313.553291-1-robdclark@gmail.com>
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

