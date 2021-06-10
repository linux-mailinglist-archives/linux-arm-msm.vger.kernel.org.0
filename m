Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089873A362E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 23:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFJVqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 17:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhFJVqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 17:46:08 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E141C061574;
        Thu, 10 Jun 2021 14:44:11 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id m7so2712514pfa.10;
        Thu, 10 Jun 2021 14:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HIFc0p7RPawTOWte2X5RUNbAQ3QNHzruJUPp0tR4Akc=;
        b=KYwyEPKzt7IprV/LmCS2jquVSyghQ2tyc9lbmuIJqsZKZEDVtv6iDeAY6UAgg8Th53
         MiZUcU9/fmKz0rOx2+PLIqbUESjJZjPUTQKriWDpv0LTUDUq0xmrdqzR6UCDdUH7nmW3
         hKUgwI9RfaeXkLafMG2y6isYxug2+LMPcqoJMNT0l+s8yp+1MySNQxaioRXjk3RY8KjG
         2aSXfKdcmLKO5DuvdpCLDJxDQQoQJUPs+jWYRt/vNxIIlscepbnHow0mbAWqr/tXVz8O
         n9him5RUAH3VgfigS/jMsOfXeM+wcjNMQ5hd5Qb36dHXFv17p0eckDTbH5ybcok0mUR/
         JzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HIFc0p7RPawTOWte2X5RUNbAQ3QNHzruJUPp0tR4Akc=;
        b=cbKb+dUfwGSFLNMw9myUeenOTa+yV/epeZm7dFrJpFzERqmkopJHRgYme4I/+voE9b
         E1c/vstB5gl87ZuENUlWFC+KkB2SinibB3bU6FUEhTWUCMQYP+u6/V1Fd7bYQgsnqK0g
         VurtBHBvqJvd2oZG4e0rZc1E3xrgPjM8IR01ckOGpcLv+NnerMzC6V2ueV43DbZdCmm2
         pDdFw3uuTKFHQKC++wNGuefOk/D/twK/poTcdajSMnOevvGHVaiQGcZXxbT6WG7MZnIE
         fDkDR8eR+Wvf/RYvIfvnfAdrv1uB3V7m8CpkywUG9cTNURZZ8NfOQmepfj8GNHD9+5gF
         EEKA==
X-Gm-Message-State: AOAM532LkprcT24dXFmU8Lefkdjc2V9wmr8OE8xTyHMAByU79uTIQC82
        S02OAtvScOfyKO4VJsA0My8=
X-Google-Smtp-Source: ABdhPJx8TK8Z6LeedF51uN0HKCXtO0+L5zVZPp5Zt7RLf6pwy5Sz5ZLTcm/OeWpE0zZWB9Uj6hRDJw==
X-Received: by 2002:a62:8803:0:b029:2d9:180d:c2c4 with SMTP id l3-20020a6288030000b02902d9180dc2c4mr4996054pfd.62.1623361451002;
        Thu, 10 Jun 2021 14:44:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id h18sm3415741pgl.87.2021.06.10.14.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:44:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 2/5] iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault info
Date:   Thu, 10 Jun 2021 14:44:10 -0700
Message-Id: <20210610214431.539029-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610214431.539029-1-robdclark@gmail.com>
References: <20210610214431.539029-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Add a callback in adreno-smmu-priv to read interesting SMMU
registers to provide an opportunity for a richer debug experience
in the GPU driver.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 17 ++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 include/linux/adreno-smmu-priv.h           | 31 +++++++++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 98b3a1c2a181..b2e31ea84128 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -32,6 +32,22 @@ static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
+static void qcom_adreno_smmu_get_fault_info(const void *cookie,
+		struct adreno_smmu_fault_info *info)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+
+	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
+	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
+	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
+	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
+	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
+	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
+	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -156,6 +172,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->cookie = smmu_domain;
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
+	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index c31a59d35c64..84c21c4b0691 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -224,6 +224,8 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_FSYNR0		0x68
 #define ARM_SMMU_FSYNR0_WNR		BIT(4)
 
+#define ARM_SMMU_CB_FSYNR1		0x6c
+
 #define ARM_SMMU_CB_S1_TLBIVA		0x600
 #define ARM_SMMU_CB_S1_TLBIASID		0x610
 #define ARM_SMMU_CB_S1_TLBIVAL		0x620
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index a889f28afb42..53fe32fb9214 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -8,6 +8,32 @@
 
 #include <linux/io-pgtable.h>
 
+/**
+ * struct adreno_smmu_fault_info - container for key fault information
+ *
+ * @far: The faulting IOVA from ARM_SMMU_CB_FAR
+ * @ttbr0: The current TTBR0 pagetable from ARM_SMMU_CB_TTBR0
+ * @contextidr: The value of ARM_SMMU_CB_CONTEXTIDR
+ * @fsr: The fault status from ARM_SMMU_CB_FSR
+ * @fsynr0: The value of FSYNR0 from ARM_SMMU_CB_FSYNR0
+ * @fsynr1: The value of FSYNR1 from ARM_SMMU_CB_FSYNR0
+ * @cbfrsynra: The value of CBFRSYNRA from ARM_SMMU_GR1_CBFRSYNRA(idx)
+ *
+ * This struct passes back key page fault information to the GPU driver
+ * through the get_fault_info function pointer.
+ * The GPU driver can use this information to print informative
+ * log messages and provide deeper GPU specific insight into the fault.
+ */
+struct adreno_smmu_fault_info {
+	u64 far;
+	u64 ttbr0;
+	u32 contextidr;
+	u32 fsr;
+	u32 fsynr0;
+	u32 fsynr1;
+	u32 cbfrsynra;
+};
+
 /**
  * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
  *
@@ -17,6 +43,8 @@
  * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
  *                 NULL config disables TTBR0 translation, otherwise
  *                 TTBR0 translation is enabled with the specified cfg
+ * @get_fault_info: Called by the GPU fault handler to get information about
+ *                  the fault
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -31,6 +59,7 @@ struct adreno_smmu_priv {
     const void *cookie;
     const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
+    void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
 };
 
-#endif /* __ADRENO_SMMU_PRIV_H */
\ No newline at end of file
+#endif /* __ADRENO_SMMU_PRIV_H */
-- 
2.31.1

