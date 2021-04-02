Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F953525E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 05:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhDBD4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 23:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhDBD4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 23:56:19 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB1CC0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 20:56:19 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f10so2837365pgl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 20:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3nQhD90sdJSzQdgo78ZKmX3OfUzD+szW/4QnSrBPjH4=;
        b=P3kuftwOPyckZywrWcQWSfwihuGdzQTnGOBic65JfGR5wzUcOgpXw89JlKDQT7rkS0
         RbqTYL/yLLalyBJs88wj5lqkVOya+/SIZptgBr18VHj4ZT/R4ZRnwaObwxukjsYcRe6f
         jaoRNyNZx9awptdKzVQJvSLmvekEBrXYls+B3UMG5ECMPaXT7Mhh8gzK1KsHe28zv3+U
         JBBmzgRn3GOTdrPevhVN2AclStD2Jxp0uJVW1Y0+DurvyijGHynD+AQyKBMps2aW6uYa
         pyfbVa+8zVXyIuaElf+Pckvgf2rG1bbuSpmJacHa8FCMHUWuyL4YX+XbRJfGzykFAqJI
         mYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3nQhD90sdJSzQdgo78ZKmX3OfUzD+szW/4QnSrBPjH4=;
        b=gxgVu7Np4m3DopuBpovn8/GaSXR6rBN+Nunjzhn4bqlJJXhZDEZF584n0QKFicbEl5
         lfsOCbEdkD65sMGod7NVbcb/dCG0w9q3Hx501oEuKb7YCrBj0jgyj/XouaK7SH96Rqv0
         NJrzalE+dcMbsT3P0lHVkSIqAVL+2hPUG78Z9LUALr8u/DJpaRwthmdxV3DQIdYQFeCQ
         tt+lCRCcNHZJdoxxgJKFG+sDeIz5iuvyyJKNYKsE/y94yRSV1iTz9VKVI4KBVyRFcc9A
         CoAhQh2pZC/2DfEaXR1AdeLYaSgwSsOeC6yUJY5ASCSHyHvNlFGV3DtLThECkJwoKxy0
         /jwQ==
X-Gm-Message-State: AOAM532bt7t7b347pJpOW5noL/nvOESk1ryUqu3hBft3mrWyuYLEnT7H
        jCI7sD3HofMNvt0wV+AjsEiJ3Q==
X-Google-Smtp-Source: ABdhPJy32aJ5h5W9VDt0+416R7LPGrBxJo/5XMIv4vXMiY/T97i7LwN6fp7RvRCavYrY/JMeod4r9A==
X-Received: by 2002:a63:78cc:: with SMTP id t195mr10067403pgc.196.1617335778655;
        Thu, 01 Apr 2021 20:56:18 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 81sm6875972pfu.164.2021.04.01.20.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 20:56:18 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 3/3] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI boot
Date:   Fri,  2 Apr 2021 11:56:02 +0800
Message-Id: <20210402035602.9484-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402035602.9484-1-shawn.guo@linaro.org>
References: <20210402035602.9484-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The hookup with qcom_smmu_impl is required to do ACPI boot on SC8180X
based devices like Lenovo Flex 5G laptop and Microsoft Surface Pro X.
Check IORT SMMU model identifier and create qcom_smmu_impl accordingly.

(np == NULL) is used to check ACPI boot, because fwnode of SMMU device
is a static allocation and thus helpers like has_acpi_companion() don't
work here.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 82c7edc6e025..7ced0f93bc99 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi_iort.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/of_device.h>
 #include <linux/qcom_scm.h>
@@ -340,6 +341,14 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 
+	if (np == NULL) {
+		/* ACPI boot */
+		struct iort_smmu_pdata *pdata = dev_get_platdata(smmu->dev);
+
+		if (pdata && pdata->model == IORT_SMMU_QCOM)
+			return qcom_smmu_create(smmu, &qcom_smmu_impl);
+	}
+
 	if (of_match_node(qcom_smmu_impl_of_match, np))
 		return qcom_smmu_create(smmu, &qcom_smmu_impl);
 
-- 
2.17.1

