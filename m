Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCBC27995B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729445AbgIZNAk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgIZNAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:16 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F1DC0613CE;
        Sat, 26 Sep 2020 06:00:16 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z4so6893634wrr.4;
        Sat, 26 Sep 2020 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=70iPHflSEGgCFhe7eol4g0//LPxM9Uw4CZ8Bcxeu3u8=;
        b=PMlg9ZK3JuN7Y6fqEN8tuT9ELtastIFo61T1CCaYeRV+bqqTB6DqjIJKqHwQ2cXt3V
         s5MyRrRF/S8xe3R0jrqCx60Sjm34FSgQjy/KbYNAeD4FhyGNs+vSszskn6IVw8EsiBD+
         YSpPIpStoZK2QiMM9FJ/qLLRyjzM1noqesSS3yLbm379G9sXx2HUC5+OuFNLZTCGqdeZ
         +tah/3wCH2xYYFfVEVS0jIG3AvQKtI+ECFC7JPa0YAGr6gms231zW2ZwfUv4ZOgtJpDO
         Cqvn7XhmDD6Zx23kdcY2hOSbVLnUPA1WXS0oNoSMIjUdYN0BZZQaabuRDad9Y9/hMcK0
         4jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=70iPHflSEGgCFhe7eol4g0//LPxM9Uw4CZ8Bcxeu3u8=;
        b=P9m8kqH8jzR2pYQD7RxgXTMb++gHWWFAefM8yFQH9JGzYEbT3Bo4vFHndMfBdtYywo
         XK1M9gKOE9v5xJXYHrQ2vfk1VOU0yVbCB6NYInSSB/3lK0mXGnj2PeuWVBfl4mEalqf5
         Xs5k+jNG7cUQeOCkvVY3PwBDK6UciC716bFMGawTBCLz2ePtO4EFfzO6STVCbVkZcj25
         0uyYhLmjMwFD/p2YaKQl+nL7kyW7l8nHh8wSlO4/rJAefOsxWHCTkN6eiNI5RJLHq3Pi
         o8CQipwgKw+sG3LwJvp19IdJL0XYFg2aVqSxXwmO8Obf+fJBt+JnN0xo3pv3WNz+IaFS
         F/xw==
X-Gm-Message-State: AOAM533HIgD+WKLXbJTqj3bA22Qg7Z+/ykcc5t3AgwDnsWxYxsRpjXJQ
        uEHi1gEtqe8J8cEKKrzwEok=
X-Google-Smtp-Source: ABdhPJzuLf5KNnk1jEMc1alD8vO2sG/Pon0y40jQ0yj4ie8CDb8avchUdJHdJd04Wubyb10gAyaHGQ==
X-Received: by 2002:adf:f24f:: with SMTP id b15mr10117061wrp.301.1601125215004;
        Sat, 26 Sep 2020 06:00:15 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:14 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] iommu/arm-smmu: Move stream mapping reset to separate function
Date:   Sat, 26 Sep 2020 15:00:02 +0200
Message-Id: <20200926130004.13528-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Move the stream mapping reset logic from arm_smmu_device_reset into
a separate arm_smmu_stream_mapping_reset function, in preparation
for implementing an implementation detail.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 446a78dde9cd..8c070c493315 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1652,14 +1652,9 @@ static struct iommu_ops arm_smmu_ops = {
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 };
 
-static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static void arm_smmu_stream_mapping_reset(struct arm_smmu_device *smmu)
 {
 	int i;
-	u32 reg;
-
-	/* clear global FSR */
-	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
-	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, reg);
 
 	/*
 	 * Reset stream mapping groups: Initial values mark all SMRn as
@@ -1673,6 +1668,18 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		arm_smmu_write_context_bank(smmu, i);
 		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_FAULT);
 	}
+}
+
+static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
+{
+	u32 reg;
+
+	/* clear global FSR */
+	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, reg);
+
+	/* Reset stream mapping */
+	arm_smmu_stream_mapping_reset(smmu);
 
 	/* Invalidate the TLB, just in case */
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_TLBIALLH, QCOM_DUMMY_VAL);
-- 
2.28.0

