Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42133774EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 May 2021 04:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhEIC1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 22:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhEIC1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 22:27:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA664C061573
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 May 2021 19:26:19 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id j12so4790589pgh.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 May 2021 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ZOEuc25/rIIOwe8p+eLjzGoMo3mvFf6W/TQMu7+jAHg=;
        b=k/8/yNmCbKkPmo4ByTCqYGLPl51ZMyZtE3J5Z5lVdod4QpXMBm7kcT18cZNEuRJ5RA
         ua4TpXH9myCyuNd+dV6B6v+lPGTGc8zi6F6/mifD1Dabfrcijh+0fKSmf2ZUGb6Zs9Mw
         sx3RTktdLO1nM/EDByG4UbZhOyNfVoAY7XCP5zuPuHlYleNyJ5LXYZmIohLDx5uOs2bz
         19MibDa/pjNzlS9Hl+B3QupBlQMqEPpnwYXGKTIiIo8LC6O56dSOa6GoVcucVG+wEDbb
         B03XSYp+PBrqwR6Bijcv86cSHOxCM2WA8QDDupcDCA6FsSuaqYgz8VCOxjQgzwBDFIo5
         DjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZOEuc25/rIIOwe8p+eLjzGoMo3mvFf6W/TQMu7+jAHg=;
        b=BHQkmupAGZ4HmLrw16puL9IpBmpDUXJs4j6v+OSZIhm39av6jbARzXLnLtdxDEyH3x
         n/zy8rKEJrYzvNVmgtN+jM6HOaqOjrtAWArur09iNC145389QuKNp+MUqASYGxNnJTUG
         vlN6I3dL1PZjfAvAua3KpKK+RqOBs4kTYGSGCCQK/z0ut/r177WjCRmmo4zK6rQ0vO39
         w3U17hSBOi5hOAnLNEKVlS3XE8BVCngz/D1XPDmdDgMlbI8BmTMmb59szhvoS4h0g9eZ
         9wPAFWxtlhweVtmgL96S2ccMieB/RCKNKh/2WlEEe+tA1wobCIb0GV0tf8xHqJ2nkdjY
         l+WA==
X-Gm-Message-State: AOAM531ozBiayr+HRxK9wWG0t+pq8J9QGhSfj0cAF2exLV6C5A0agtQ3
        hTKF/SvqaSlMF8qV5b73P0s/eA==
X-Google-Smtp-Source: ABdhPJw/KH5aZ66Q2gfOHCYVOHIcrtLWODGjTcGA+5soPJUhKRQM8qzwIhL+Hs3pNyPcI6QSSGG1jQ==
X-Received: by 2002:a63:930d:: with SMTP id b13mr18394002pge.213.1620527179357;
        Sat, 08 May 2021 19:26:19 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v188sm7798025pfv.119.2021.05.08.19.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 19:26:18 -0700 (PDT)
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
Subject: [PATCH v3] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI boot
Date:   Sun,  9 May 2021 10:26:07 +0800
Message-Id: <20210509022607.17534-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The hookup with qcom_smmu_impl is required to do ACPI boot on SC8180X
based devices like Lenovo Flex 5G laptop and Microsoft Surface Pro X.
Define acpi_platform_list for these platforms and match them using
acpi_match_platform_list() call, and create qcom_smmu_impl accordingly.

(np == NULL) is used to check ACPI boot, because fwnode of SMMU device
is a static allocation and thus helpers like has_acpi_companion() don't
work here.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for v3:
 - Call acpi_match_platform_list() to match platform in qcom smmu
   driver rather than IORT code.

Changes for v2:
 - Rather than using asl_compiler_id in IORT table, follow suggestion
   from Robin Murphy to use acpi_match_platform_list() to match platform.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 98b3a1c2a181..f7e187f3fa66 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/of_device.h>
 #include <linux/qcom_scm.h>
@@ -339,10 +340,22 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ }
 };
 
+static struct acpi_platform_list qcom_acpi_platlist[] = {
+	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
+	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
+	{ }
+};
+
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 
+	if (np == NULL) {
+		/* Match platform for ACPI boot */
+		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
+			return qcom_smmu_create(smmu, &qcom_smmu_impl);
+	}
+
 	if (of_match_node(qcom_smmu_impl_of_match, np))
 		return qcom_smmu_create(smmu, &qcom_smmu_impl);
 
-- 
2.17.1

