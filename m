Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FC227995E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbgIZNAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729306AbgIZNAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:14 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F219C0613CE;
        Sat, 26 Sep 2020 06:00:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e11so1256074wme.0;
        Sat, 26 Sep 2020 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kfKqlQuYC0e0jDmwMTghnvCFGTLGac0UG8r/BLo/Ke0=;
        b=LlSED+QC3XXij9wjZJZMy/EDszLM/ISPhWAXpsfhsElXVvFu2qm+Tm6hTEqOppETcC
         y9uLte3DwjCtXi7qrAWx0gZevpCLoXydl4hYxJ2yl3Sk9crveMwDuUutqM3jNQjBhx8T
         k6PyThtfts4V1dxE3zcJINMzp0UcxdCky2UIk/1t+4Gagrl3/Ki4WQpBCz+yO2BaHWIt
         oD5vV8HrF69jOZin82O4P6qIb3mCdJ+k08wNg56Bgsxenp/dofyqomQMTVUhOb5jKcSP
         fvH6DWRB0tbx9CiPE/LbEepz+HxiO+0hJhZAVcJ0vbgtm/Zu1lT8s0w8LGrgpidUQLrC
         9QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kfKqlQuYC0e0jDmwMTghnvCFGTLGac0UG8r/BLo/Ke0=;
        b=hySozt6kDjQPUENO78F9I4HfNtrVVmRWQoHHJONE7jgKvt2/X0QrDAw3hoL+0xSs3K
         ICByGcGv4DTaFyX1dZqXYQ7xDDkF+IUK6aAnovyccJ0yJ572lskFr6KfFuk7Y15xgEw8
         JK1k+O+pcMzzqDVLAh9MgXNrjZSPz1J0HyKBRTEtHgqptOudT6+X4AmHCEZ6AFC0f2FZ
         qnjjEMyvv2j1HrZRANbOBgy6NUcZuMcfFdOwtbnHtBIkd6ZU/olyiv7P3Y86f2/LrhxE
         j1HvJzW8QlrdCudBZOg25aL38PYHeqJ2EgaeRfGMo4zbuE5Q1Zz9K8j/cx7lbXRfDBB5
         GFjw==
X-Gm-Message-State: AOAM532GanBbhDJsZRWbDzfd03vNkOHAOd9OFLPwvgN3kA7VZVrjha3l
        xUbX3W01PnQ30iehK2Qul88=
X-Google-Smtp-Source: ABdhPJzMcK+iZK0k6ZZgTjWyhO/xS6/OemqWzbpjQ6TO2WbiVL666VwtCSqyNrAtia99xD1QNxdu7Q==
X-Received: by 2002:a1c:6487:: with SMTP id y129mr2668961wmb.90.1601125212771;
        Sat, 26 Sep 2020 06:00:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] iommu/arm-smmu: Support test_smr_masks implementation detail deviation
Date:   Sat, 26 Sep 2020 15:00:00 +0200
Message-Id: <20200926130004.13528-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

At least some Qualcomm SoCs do need to override the function
arm_smmu_test_smr_masks entirely: add a test_smr_masks function
to the implementation details structure and call it properly.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 09c42af9f31e..446a78dde9cd 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -977,6 +977,12 @@ static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
 
 	if (!smmu->smrs)
 		return;
+
+	if (smmu->impl && smmu->impl->test_smr_masks) {
+		smmu->impl->test_smr_masks(smmu);
+		return;
+	}
+
 	/*
 	 * If we've had to accommodate firmware memory regions, we may
 	 * have live SMRs by now; tread carefully...
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d890a4a968e8..2cd3d126f675 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -387,6 +387,7 @@ struct arm_smmu_impl {
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
 	int (*init_context)(struct arm_smmu_domain *smmu_domain);
+	void (*test_smr_masks)(struct arm_smmu_device *smmu);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
-- 
2.28.0

