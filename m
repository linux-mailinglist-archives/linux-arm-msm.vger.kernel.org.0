Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4F46CE7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 15:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390353AbfGRNC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 09:02:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41600 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfGRNC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 09:02:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F04CD6063A; Thu, 18 Jul 2019 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563454976;
        bh=AAlofaZlRPh2eBBfdFBOMKM6f3GSdH6TLjVVhuevYXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WD2LpSjP5cNOdIDb9aDfFkh7AADItz7/x2Fa7iE2+m4Q8gaZeKHy7oclpFjoYYBx6
         jmIybfki6zF3yZJL/JTKM1TtuCDMvTzCYFP/wqUeIko/lfs4uJTcMXb0UWQDkrg1jX
         4od0BdImHLZPoQTly54xP5UJqkgf9AYtFRCE0EIU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A00360F3C;
        Thu, 18 Jul 2019 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563454973;
        bh=AAlofaZlRPh2eBBfdFBOMKM6f3GSdH6TLjVVhuevYXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IbtZ5ArCtVdf8xgiWYm/ddPAkjuvYeIm9gmV3xmgYZV1aj6G+/4lyOMq/M5CMenYj
         7LaWLhq6Dtc+L79I8myWdcITUc55tJyAmkFZGXDh71F48ZQsm5OHurqLGiDizAgBON
         gmOPGIPTfNk+y31vooQ0eDGv6nB0ZqoydJHwlrd4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A00360F3C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        rishabhb@codeaurora.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 1/3] soc: qcom: llcc cleanup to get rid of sdm845 specific driver file
Date:   Thu, 18 Jul 2019 18:32:36 +0530
Message-Id: <20190718130238.11324-2-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
In-Reply-To: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A single file should suffice the need to program the llcc for
various platforms. Get rid of sdm845 specific driver file to
make way for a more generic driver.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/qcom/Kconfig           |  14 ++----
 drivers/soc/qcom/Makefile          |   1 -
 drivers/soc/qcom/llcc-sdm845.c     | 100 -------------------------------------
 drivers/soc/qcom/llcc-slice.c      |  60 +++++++++++++++++++---
 include/linux/soc/qcom/llcc-qcom.h |  57 ++++++++-------------
 5 files changed, 77 insertions(+), 155 deletions(-)
 delete mode 100644 drivers/soc/qcom/llcc-sdm845.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index a6d1bfb17279..b6cc5816a94b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -58,17 +58,9 @@ config QCOM_LLCC
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Qualcomm Technologies, Inc. platform specific
-	  Last Level Cache Controller(LLCC) driver. This provides interfaces
-	  to clients that use the LLCC. Say yes here to enable LLCC slice
-	  driver.
-
-config QCOM_SDM845_LLCC
-	tristate "Qualcomm Technologies, Inc. SDM845 LLCC driver"
-	depends on QCOM_LLCC
-	help
-	  Say yes here to enable the LLCC driver for SDM845. This provides
-	  data required to configure LLCC so that clients can start using the
-	  LLCC slices.
+	  Last Level Cache Controller(LLCC) driver for platforms such as,
+	  SDM845. This provides interfaces to clients that use the LLCC.
+	  Say yes here to enable LLCC slice driver.
 
 config QCOM_MDT_LOADER
 	tristate
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index eeb088beb15f..386bf197e0e5 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -21,6 +21,5 @@ obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-slice.o
-obj-$(CONFIG_QCOM_SDM845_LLCC) += llcc-sdm845.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
diff --git a/drivers/soc/qcom/llcc-sdm845.c b/drivers/soc/qcom/llcc-sdm845.c
deleted file mode 100644
index 86600d97c36d..000000000000
--- a/drivers/soc/qcom/llcc-sdm845.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
- *
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/soc/qcom/llcc-qcom.h>
-
-/*
- * SCT(System Cache Table) entry contains of the following members:
- * usecase_id: Unique id for the client's use case
- * slice_id: llcc slice id for each client
- * max_cap: The maximum capacity of the cache slice provided in KB
- * priority: Priority of the client used to select victim line for replacement
- * fixed_size: Boolean indicating if the slice has a fixed capacity
- * bonus_ways: Bonus ways are additional ways to be used for any slice,
- *		if client ends up using more than reserved cache ways. Bonus
- *		ways are allocated only if they are not reserved for some
- *		other client.
- * res_ways: Reserved ways for the cache slice, the reserved ways cannot
- *		be used by any other client than the one its assigned to.
- * cache_mode: Each slice operates as a cache, this controls the mode of the
- *             slice: normal or TCM(Tightly Coupled Memory)
- * probe_target_ways: Determines what ways to probe for access hit. When
- *                    configured to 1 only bonus and reserved ways are probed.
- *                    When configured to 0 all ways in llcc are probed.
- * dis_cap_alloc: Disable capacity based allocation for a client
- * retain_on_pc: If this bit is set and client has maintained active vote
- *               then the ways assigned to this client are not flushed on power
- *               collapse.
- * activate_on_init: Activate the slice immediately after the SCT is programmed
- */
-#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \
-	{					\
-		.usecase_id = uid,		\
-		.slice_id = sid,		\
-		.max_cap = mc,			\
-		.priority = p,			\
-		.fixed_size = fs,		\
-		.bonus_ways = bway,		\
-		.res_ways = rway,		\
-		.cache_mode = cmod,		\
-		.probe_target_ways = ptw,	\
-		.dis_cap_alloc = dca,		\
-		.retain_on_pc = rp,		\
-		.activate_on_init = a,		\
-	}
-
-static struct llcc_slice_config sdm845_data[] =  {
-	SCT_ENTRY(LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1),
-	SCT_ENTRY(LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_VIDSC1,   3,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_ROTATOR,  4,  563,  2, 1, 0x0,   0x00e, 2, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_VOICE,    5,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_AUDIO,    6,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_MDMHPGRW, 7,  1024, 2, 0, 0xfc,  0xf00, 0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_MDM,      8,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_CMPT,     10, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_GPUHTW,   11, 512,  1, 1, 0xc,   0x0,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_GPU,      12, 2304, 1, 0, 0xff0, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_MMUHWT,   13, 256,  2, 0, 0x0,   0x1,   0, 0, 1, 0, 1),
-	SCT_ENTRY(LLCC_CMPTDMA,  15, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_DISP,     16, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_VIDFW,    17, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_MDMHPFX,  20, 1024, 2, 1, 0x0,   0xf00, 0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_MDMPNG,   21, 1024, 0, 1, 0x1e,  0x0,   0, 0, 1, 1, 0),
-	SCT_ENTRY(LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0),
-};
-
-static int sdm845_qcom_llcc_remove(struct platform_device *pdev)
-{
-	return qcom_llcc_remove(pdev);
-}
-
-static int sdm845_qcom_llcc_probe(struct platform_device *pdev)
-{
-	return qcom_llcc_probe(pdev, sdm845_data, ARRAY_SIZE(sdm845_data));
-}
-
-static const struct of_device_id sdm845_qcom_llcc_of_match[] = {
-	{ .compatible = "qcom,sdm845-llcc", },
-	{ }
-};
-
-static struct platform_driver sdm845_qcom_llcc_driver = {
-	.driver = {
-		.name = "sdm845-llcc",
-		.of_match_table = sdm845_qcom_llcc_of_match,
-	},
-	.probe = sdm845_qcom_llcc_probe,
-	.remove = sdm845_qcom_llcc_remove,
-};
-module_platform_driver(sdm845_qcom_llcc_driver);
-
-MODULE_DESCRIPTION("QCOM sdm845 LLCC driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slice.c
index 9090ea12eaf3..574bb5bf20bc 100644
--- a/drivers/soc/qcom/llcc-slice.c
+++ b/drivers/soc/qcom/llcc-slice.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  *
  */
 
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/sizes.h>
@@ -46,6 +47,27 @@
 
 #define BANK_OFFSET_STRIDE	      0x80000
 
+static struct llcc_slice_config sdm845_data[] =  {
+	{ LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1 },
+	{ LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0 },
+	{ LLCC_VIDSC1,   3,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0 },
+	{ LLCC_ROTATOR,  4,  563,  2, 1, 0x0,   0x00e, 2, 0, 1, 1, 0 },
+	{ LLCC_VOICE,    5,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_AUDIO,    6,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_MDMHPGRW, 7,  1024, 2, 0, 0xfc,  0xf00, 0, 0, 1, 1, 0 },
+	{ LLCC_MDM,      8,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_CMPT,     10, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_GPUHTW,   11, 512,  1, 1, 0xc,   0x0,   0, 0, 1, 1, 0 },
+	{ LLCC_GPU,      12, 2304, 1, 0, 0xff0, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_MMUHWT,   13, 256,  2, 0, 0x0,   0x1,   0, 0, 1, 0, 1 },
+	{ LLCC_CMPTDMA,  15, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_DISP,     16, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_VIDFW,    17, 2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+	{ LLCC_MDMHPFX,  20, 1024, 2, 1, 0x0,   0xf00, 0, 0, 1, 1, 0 },
+	{ LLCC_MDMPNG,   21, 1024, 0, 1, 0x1e,  0x0,   0, 0, 1, 1, 0 },
+	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0 },
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 static const struct regmap_config llcc_regmap_config = {
@@ -301,13 +323,12 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 	return ret;
 }
 
-int qcom_llcc_remove(struct platform_device *pdev)
+static int qcom_llcc_remove(struct platform_device *pdev)
 {
 	/* Set the global pointer to a error code to avoid referencing it */
 	drv_data = ERR_PTR(-ENODEV);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(qcom_llcc_remove);
 
 static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		const char *name)
@@ -326,8 +347,8 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 	return devm_regmap_init_mmio(&pdev->dev, base, &llcc_regmap_config);
 }
 
-int qcom_llcc_probe(struct platform_device *pdev,
-		      const struct llcc_slice_config *llcc_cfg, u32 sz)
+static int qcom_llcc_probe(struct platform_device *pdev,
+			   const struct llcc_slice_config *llcc_cfg, u32 sz)
 {
 	u32 num_banks;
 	struct device *dev = &pdev->dev;
@@ -407,6 +428,31 @@ int qcom_llcc_probe(struct platform_device *pdev,
 	drv_data = ERR_PTR(-ENODEV);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_llcc_probe);
+
+static int sdm845_qcom_llcc_remove(struct platform_device *pdev)
+{
+	return qcom_llcc_remove(pdev);
+}
+
+static int sdm845_qcom_llcc_probe(struct platform_device *pdev)
+{
+	return qcom_llcc_probe(pdev, sdm845_data, ARRAY_SIZE(sdm845_data));
+}
+
+static const struct of_device_id sdm845_qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,sdm845-llcc", },
+	{ }
+};
+
+static struct platform_driver sdm845_qcom_llcc_driver = {
+	.driver = {
+		.name = "sdm845-llcc",
+		.of_match_table = sdm845_qcom_llcc_of_match,
+	},
+	.probe = sdm845_qcom_llcc_probe,
+	.remove = sdm845_qcom_llcc_remove,
+};
+module_platform_driver(sdm845_qcom_llcc_driver);
+
+MODULE_DESCRIPTION("QCOM sdm845 LLCC driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Qualcomm Last Level Cache Controller");
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index eb71a50b8afc..d5cad6f7953c 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -39,18 +39,27 @@ struct llcc_slice_desc {
 
 /**
  * llcc_slice_config - Data associated with the llcc slice
- * @usecase_id: usecase id for which the llcc slice is used
- * @slice_id: llcc slice id assigned to each slice
- * @max_cap: maximum capacity of the llcc slice
- * @priority: priority of the llcc slice
- * @fixed_size: whether the llcc slice can grow beyond its size
- * @bonus_ways: bonus ways associated with llcc slice
- * @res_ways: reserved ways associated with llcc slice
- * @cache_mode: mode of the llcc slice
- * @probe_target_ways: Probe only reserved and bonus ways on a cache miss
- * @dis_cap_alloc: Disable capacity based allocation
- * @retain_on_pc: Retain through power collapse
- * @activate_on_init: activate the slice on init
+ * @usecase_id: Unique id for the client's use case
+ * @slice_id: llcc slice id for each client
+ * @max_cap: The maximum capacity of the cache slice provided in KB
+ * @priority: Priority of the client used to select victim line for replacement
+ * @fixed_size: Boolean indicating if the slice has a fixed capacity
+ * @bonus_ways: Bonus ways are additional ways to be used for any slice,
+ *		if client ends up using more than reserved cache ways. Bonus
+ *		ways are allocated only if they are not reserved for some
+ *		other client.
+ * @res_ways: Reserved ways for the cache slice, the reserved ways cannot
+ *		be used by any other client than the one its assigned to.
+ * @cache_mode: Each slice operates as a cache, this controls the mode of the
+ *             slice: normal or TCM(Tightly Coupled Memory)
+ * @probe_target_ways: Determines what ways to probe for access hit. When
+ *                    configured to 1 only bonus and reserved ways are probed.
+ *                    When configured to 0 all ways in llcc are probed.
+ * @dis_cap_alloc: Disable capacity based allocation for a client
+ * @retain_on_pc: If this bit is set and client has maintained active vote
+ *               then the ways assigned to this client are not flushed on power
+ *               collapse.
+ * @activate_on_init: Activate the slice immediately after it is programmed
  */
 struct llcc_slice_config {
 	u32 usecase_id;
@@ -154,20 +163,6 @@ int llcc_slice_activate(struct llcc_slice_desc *desc);
  */
 int llcc_slice_deactivate(struct llcc_slice_desc *desc);
 
-/**
- * qcom_llcc_probe - program the sct table
- * @pdev: platform device pointer
- * @table: soc sct table
- * @sz: Size of the config table
- */
-int qcom_llcc_probe(struct platform_device *pdev,
-		      const struct llcc_slice_config *table, u32 sz);
-
-/**
- * qcom_llcc_remove - remove the sct table
- * @pdev: Platform device pointer
- */
-int qcom_llcc_remove(struct platform_device *pdev);
 #else
 static inline struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 {
@@ -197,16 +192,6 @@ static inline int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 {
 	return -EINVAL;
 }
-static inline int qcom_llcc_probe(struct platform_device *pdev,
-		      const struct llcc_slice_config *table, u32 sz)
-{
-	return -ENODEV;
-}
-
-static inline int qcom_llcc_remove(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
 #endif
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

