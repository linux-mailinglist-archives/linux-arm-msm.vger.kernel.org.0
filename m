Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17D925DEB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgIDPzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgIDPz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:26 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20DBC061261
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:22 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id e7so4927724qtj.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ls6xTeazp01VU5rx1tZcn8CZ6m3ZwOm0FhCvNs4H/UM=;
        b=tb1Sd+n9qybC0+ro/HdiC+RBRiJc3INwSffhtqG6iMH+37s6uZXFul1N9db1cLf0O+
         W0rjcAJiucucmVQfVxG2MUkMAVBzL72kxYXPDM94Y8Eog3yqNAhbIBZ0SvhdqCqHjDss
         eqJnjUevNWz0I2ajfvSEgBRETGT0byopb7rb3HjelVEJIa/NYG7qIZZfDuUsq9UT8H2o
         wmlglYCueMqRUyXl0caryl5xIGgDggZeBNuaZUM8AtvG0YPJM0pCBnwyWbzDQmzoIDUC
         8377oUebGf4yS6DRCQMoNRh9frdfOYrnjbWjR3K67Znyzlh8ybqe7mNP7I9znqOGTQSk
         sGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ls6xTeazp01VU5rx1tZcn8CZ6m3ZwOm0FhCvNs4H/UM=;
        b=HDJYyDgs+8gUXj8VHaKl2oEvGb57ZDpFejdKU+yuFKw4fKkUB1cfWiuBtr2R/sMRjk
         GKe113eod/mYek28+6EGZyGCuM0d0imZMQx1qZUOopKYDPAJZtPOwdpGzwchUe5HJRHO
         N9Z2qLpKjMZhj9B+dcCtHCitPmFWGgZwbc0Q9D7daydrzgXwf3X4dfci4FQD9DUs4/8C
         7FZ5nGai61spj25z2/AF+cL+ZFzFhC2l6w71GXwKlOGsWUy1XF8P87Suk6jjaLfH+oZV
         olhB6W+GjHu5Lnyijx+7RdYwnXXJebhajlOvDzJ6J2oMsynxq1s8xxe3gqEEJVYi8g/q
         mc4g==
X-Gm-Message-State: AOAM532o3t3ySVuTiit1lyU0+e8x9aYZ9fgeOmDyY6SO8Z+DiGLuybIM
        STlXa5Clg7bMw9KHNjB0v3rnqQ==
X-Google-Smtp-Source: ABdhPJyL88SwYtdr8vsyF/Q0nFNgzaGMkmnx++yP3wUNifIJQkEY1cF7fewzAafVU/vEqfUIMi+MHg==
X-Received: by 2002:ac8:17af:: with SMTP id o44mr9239269qtj.343.1599234921881;
        Fri, 04 Sep 2020 08:55:21 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot mappings
Date:   Fri,  4 Sep 2020 15:55:11 +0000
Message-Id: <20200904155513.282067-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new operation to allow platform implementations to inherit any
stream mappings from the boot loader.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch/interface

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 11 ++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  6 ++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index eb5c6ca5c138..4c4d302cd747 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -85,11 +85,6 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 		pm_runtime_put_autosuspend(smmu->dev);
 }
 
-static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
-{
-	return container_of(dom, struct arm_smmu_domain, domain);
-}
-
 static struct platform_driver arm_smmu_driver;
 static struct iommu_ops arm_smmu_ops;
 
@@ -2188,6 +2183,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (smmu->impl->inherit_mappings) {
+		err = smmu->impl->inherit_mappings(smmu);
+		if (err)
+			return err;
+	}
+
 	if (smmu->version == ARM_SMMU_V2) {
 		if (smmu->num_context_banks > smmu->num_context_irqs) {
 			dev_err(dev,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 235d9a3a6ab6..f58164976e74 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -378,6 +378,11 @@ struct arm_smmu_domain {
 	struct iommu_domain		domain;
 };
 
+static inline struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct arm_smmu_domain, domain);
+}
+
 struct arm_smmu_master_cfg {
 	struct arm_smmu_device		*smmu;
 	s16				smendx[];
@@ -442,6 +447,7 @@ struct arm_smmu_impl {
 	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
 				  struct arm_smmu_device *smmu,
 				  struct device *dev, int start);
+	int (*inherit_mappings)(struct arm_smmu_device *smmu);
 };
 
 #define INVALID_SMENDX			-1
-- 
2.28.0

