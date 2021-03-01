Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134EE327857
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 08:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbhCAHkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 02:40:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhCAHjv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 02:39:51 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756AFC06178B
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 23:40:30 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id g20so9329312plo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 23:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=U1gpWsvGyBC5E6Jh4WcIRAYp0x0ZA6uSR3HnwYKMrgg=;
        b=iX1ByBKQaJbVS89EmpIaqn6Jn+50kfPrUmnYX93T/Oao91ktUiEPoNVmoiS3mzMly3
         iDeXtXmASnToxBa+Zx4Yb/Sz5ZNZMyiV625hv74V7QAzhSKf43vTYo23di+aN3F5a7DQ
         DZ8rqOPUdFUiMP2uNSvsW/rYWGMuHJB3lI9rNCpO/5CHB1mvIMIgAEhAZ6/odfAY90Ku
         rU3cKAOzN9AM92xc3ltY8mJ73NkfxwqUecl+4pSsms7O227mUBMoD5ZzlS6YnHDfTELj
         9xjN2AHp34Nnkr3VTCUdjidJwY9lahOxS0tCZ/3ljvW9H+yrYVtTaW+0Uo5xAp9SgzyH
         Q/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U1gpWsvGyBC5E6Jh4WcIRAYp0x0ZA6uSR3HnwYKMrgg=;
        b=DrdXANuCfAUOQpxaO/660HR1WOuErlk3yDDyYmlvPWTWiY1FEbRKfg//E0gYa4GMwa
         0kq8lCQctGX2QcIpjWcihdmC3JyRK+t8uy85uZOflXRn0691/On5nhXOWE6ob2S2ffAl
         v4x+xjOrjklcjYTEHTC/WtkbaMSi7PK2W3QuAsnzM+BTde/ZmmMPXnFKLUQnY4pffiVT
         lhfOBgrMCDRUFcYHQ44bKZKJgO8p9GxwgWho4/dNU+xrQDBmptagvIVFzOsWG6T1AsWK
         uqZAzBAopsrWQ4xs4pPazoV0qCw9Yexg5JXd/lIZog0sQmxjlN4FpdE7Ohkgw22ul2SX
         Pkdw==
X-Gm-Message-State: AOAM532Qfo9tLlzXQmJdsigUhZiiyQlEy+qqXWlFpQYr26ewhx/qOQ92
        uDqL4CLEDoiv085rN715LM/4cg==
X-Google-Smtp-Source: ABdhPJwmn7Yt2qQ/FjR4R62H2dp1v7EH6erGPRR9C3XMgQrZM+NxNLsfwIKPIFlp9cPlaF8ynjskqw==
X-Received: by 2002:a17:90b:4a89:: with SMTP id lp9mr16249508pjb.170.1614584430113;
        Sun, 28 Feb 2021 23:40:30 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z3sm4203566pfn.7.2021.02.28.23.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 23:40:29 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Date:   Mon,  1 Mar 2021 15:40:21 +0800
Message-Id: <20210301074021.20059-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Though qcom_adreno_smmu_impl is not used by ACPI boot right now,
qcom_smmu_impl is already required at least to boot up Lenovo Flex 5G
laptop.  Let's check asl_compiler_id in IORT header to ensure we are
running a QCOM SMMU and create qcom_smmu_impl for it.

!np is used to check ACPI boot, because fwnode of SMMU device is
a static allocation and thus has_acpi_companion() doesn't work here.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 98b3a1c2a181..5e8779483367 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/acpi_iort.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/of_device.h>
 #include <linux/qcom_scm.h>
@@ -339,10 +340,42 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ }
 };
 
+#ifdef CONFIG_ACPI
+static bool is_qcom_iort(struct arm_smmu_device *smmu)
+{
+	struct acpi_table_header *iort;
+	acpi_status status;
+	bool ret = false;
+
+	status = acpi_get_table(ACPI_SIG_IORT, 0, &iort);
+	if (ACPI_FAILURE(status)) {
+		dev_err(smmu->dev, "failed to get IORT\n");
+		goto done;
+	}
+
+	if (strncmp(iort->asl_compiler_id, "QCOM", 4) == 0) {
+		ret = true;
+		goto done;
+	}
+
+done:
+	acpi_put_table(iort);
+	return ret;
+}
+#else
+static bool is_qcom_iort(struct arm_smmu_device *smmu)
+{
+	return false;
+}
+#endif
+
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 
+	if (!np && is_qcom_iort(smmu))
+		return qcom_smmu_create(smmu, &qcom_smmu_impl);
+
 	if (of_match_node(qcom_smmu_impl_of_match, np))
 		return qcom_smmu_create(smmu, &qcom_smmu_impl);
 
-- 
2.17.1

