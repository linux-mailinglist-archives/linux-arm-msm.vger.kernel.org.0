Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC0E32336C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 22:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhBWVrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 16:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhBWVrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 16:47:07 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A203BC061356
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:48 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id d2so2897292pjs.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bQ82+4Wlyq0DnXwmZdyFqiZHcz3GXFSdD4dVY14TJHw=;
        b=mxw6A/EXyvW/djy8xMHHCGfgykW6egYLebpF+cywRSNzN9MxAMDtiUKKUbdP3uf9yK
         Qow7e/nppWyTe0CMIiAnpsRu72u7jSsaI0Ba+07/d7gn0MVdtRGUOLGXx5fbTF3dJqA0
         Yqp7eM48ZRkEOWDTKCYUTGp59YzIlvMIGLmfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQ82+4Wlyq0DnXwmZdyFqiZHcz3GXFSdD4dVY14TJHw=;
        b=iabYUfYJB88CLMOFfPhoRpsresHeCOAn1tA5JpRsp4+2TdoQBSZzN4oXSPkzGF7xyZ
         fLpUJ6MyUaQE2lHCqJldw0rYl8XBlzge5wML8dhpsNJjidUTbcpiKWArHo9H49EKBPbZ
         qUtKEOUf8pMlw14i7rvqdJL4ONx11yJQZdc8kla9TYLladd8Z6yfAzVnKC8BHLkMrOC8
         dMjTQGZpb6NjDJwKIdFV7ME3p0d1tc3SNHGHBGkl0NhBiqgdEKJSJOrSGeQ1129beqjv
         ZrJj0tdpOb7niAhoK/aNSYVzb6gU8Q17O9zRohGbo5eDrfZ4Sh8x4bTvdufSgd3wHoWP
         MtOQ==
X-Gm-Message-State: AOAM531ikemGmKmMmx59XbtAGTyKTG9Cnm2VUVEWY5iQUj6QVimdt/2z
        /2+bd8J6ZlTHSOSKmHCf9kpK3g==
X-Google-Smtp-Source: ABdhPJwH/vZYxpmUX0wFXzI8odTIUydTmfuBNr0O1IX+Ecaj2dfweQ2toW/8srxEtSazl5DKLXqY0Q==
X-Received: by 2002:a17:90a:4cc6:: with SMTP id k64mr823487pjh.162.1614116748161;
        Tue, 23 Feb 2021 13:45:48 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id r68sm137951pfc.49.2021.02.23.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 13:45:47 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 6/6] firmware: qcom_scm: Only compile legacy calls on ARM
Date:   Tue, 23 Feb 2021 13:45:39 -0800
Message-Id: <20210223214539.1336155-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210223214539.1336155-1-swboyd@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These scm calls are never used outside of legacy ARMv7 based platforms.
That's because PSCI, mandated on arm64, implements them for modern SoCs
via the PSCI spec. Let's move them to the legacy file and only compile
the legacy file into the kernel when CONFIG_ARM=y. Otherwise provide
stubs and fail the calls. This saves a little bit of space in an
arm64 allmodconfig.

 $ ./scripts/bloat-o-meter vmlinux.before vmlinux.after
 add/remove: 0/8 grow/shrink: 5/7 up/down: 509/-4405 (-3896)
 Function                                     old     new   delta
 __qcom_scm_set_dload_mode.constprop          312     452    +140
 qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
 qcom_scm_io_writel                           288     408    +120
 qcom_scm_io_readl                            376     492    +116
 __param_str_download_mode                     23      28      +5
 __warned                                    4327    4326      -1
 qcom_iommu_init                              272     268      -4
 e843419@0b3f_00010432_324                      8       -      -8
 qcom_scm_call                                228     208     -20
 CSWTCH                                      5925    5877     -48
 _sub_I_65535_1                            163100  163040     -60
 _sub_D_65535_0                            163100  163040     -60
 qcom_scm_wb                                   64       -     -64
 qcom_scm_lock                                320     160    -160
 qcom_scm_call_atomic                         212       -    -212
 qcom_scm_cpu_power_down                      308       -    -308
 scm_legacy_call_atomic                       520       -    -520
 qcom_scm_set_warm_boot_addr                  720       -    -720
 qcom_scm_set_cold_boot_addr                  728       -    -728
 scm_legacy_call                             1492       -   -1492
 Total: Before=66737642, After=66733746, chg -0.01%

Commit 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and
legacy conventions") didn't mention any motivating factors for keeping
the legacy code around on arm64 kernels, i.e. presumably that commit
wasn't trying to support these legacy APIs on arm64 kernels.

Cc: Elliot Berman <eberman@codeaurora.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/Makefile          |   4 +-
 drivers/firmware/qcom_scm-legacy.c | 133 ++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.c        | 145 +----------------------------
 drivers/firmware/qcom_scm.h        |  33 +++++++
 include/linux/qcom_scm.h           |  21 +++--
 5 files changed, 183 insertions(+), 153 deletions(-)

diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 5e013b6a3692..0b7b35555a6c 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,7 +17,9 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom_scm_objs.o
+qcom_scm_objs-$(CONFIG_ARM)	+= qcom_scm-legacy.o
+qcom_scm_objs-$(CONFIG_QCOM_SCM) += qcom_scm.o qcom_scm-smc.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
index 1829ba220576..d909fa2716bc 100644
--- a/drivers/firmware/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2015 Linaro Ltd.
  */
 
+#include <linux/cpumask.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -240,3 +241,135 @@ int scm_legacy_call_atomic(struct device *unused,
 
 	return smc_res.a0;
 }
+
+#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
+#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
+#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
+#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
+
+#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
+#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
+#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
+#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
+
+struct qcom_scm_wb_entry {
+	int flag;
+	void *entry;
+};
+
+static struct qcom_scm_wb_entry qcom_scm_wb[] = {
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
+};
+
+/**
+ * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
+ * @entry: Entry point function for the cpus
+ * @cpus: The cpumask of cpus that will use the entry point
+ *
+ * Set the Linux entry point for the SCM to transfer control to when coming
+ * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ */
+int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
+{
+	int ret;
+	int flags = 0;
+	int cpu;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+		.arginfo = QCOM_SCM_ARGS(2),
+	};
+
+	/*
+	 * Reassign only if we are switching from hotplug entry point
+	 * to cpuidle entry point or vice versa.
+	 */
+	for_each_cpu(cpu, cpus) {
+		if (entry == qcom_scm_wb[cpu].entry)
+			continue;
+		flags |= qcom_scm_wb[cpu].flag;
+	}
+
+	/* No change in entry function */
+	if (!flags)
+		return 0;
+
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+
+	ret = scm_legacy_call(__scm->dev, &desc, NULL);
+	if (!ret) {
+		for_each_cpu(cpu, cpus)
+			qcom_scm_wb[cpu].entry = entry;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
+
+/**
+ * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
+ * @entry: Entry point function for the cpus
+ * @cpus: The cpumask of cpus that will use the entry point
+ *
+ * Set the cold boot address of the cpus. Any cpu outside the supported
+ * range would be removed from the cpu present mask.
+ */
+int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+{
+	int flags = 0;
+	int cpu;
+	int scm_cb_flags[] = {
+		QCOM_SCM_FLAG_COLDBOOT_CPU0,
+		QCOM_SCM_FLAG_COLDBOOT_CPU1,
+		QCOM_SCM_FLAG_COLDBOOT_CPU2,
+		QCOM_SCM_FLAG_COLDBOOT_CPU3,
+	};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+		.arginfo = QCOM_SCM_ARGS(2),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	if (!cpus || (cpus && cpumask_empty(cpus)))
+		return -EINVAL;
+
+	for_each_cpu(cpu, cpus) {
+		if (cpu < ARRAY_SIZE(scm_cb_flags))
+			flags |= scm_cb_flags[cpu];
+		else
+			set_cpu_present(cpu, false);
+	}
+
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+
+	return scm_legacy_call_atomic(NULL, &desc, NULL);
+}
+EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
+
+/**
+ * qcom_scm_cpu_power_down() - Power down the cpu
+ * @flags - Flags to flush cache
+ *
+ * This is an end point to power down cpu. If there was a pending interrupt,
+ * the control would return from this function, otherwise, the cpu jumps to the
+ * warm boot entry point set for this cpu upon reset.
+ */
+void qcom_scm_cpu_power_down(u32 flags)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
+		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	scm_legacy_call_atomic(NULL, &desc, NULL);
+}
+EXPORT_SYMBOL(qcom_scm_cpu_power_down);
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index ee9cb545e73b..29bce83f8a25 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -4,7 +4,6 @@
  */
 #include <linux/platform_device.h>
 #include <linux/init.h>
-#include <linux/cpumask.h>
 #include <linux/export.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -26,16 +25,6 @@ module_param(download_mode, bool, 0);
 #define SCM_HAS_IFACE_CLK	BIT(1)
 #define SCM_HAS_BUS_CLK		BIT(2)
 
-struct qcom_scm {
-	struct device *dev;
-	struct clk *core_clk;
-	struct clk *iface_clk;
-	struct clk *bus_clk;
-	struct reset_controller_dev reset;
-
-	u64 dload_mode_addr;
-};
-
 struct qcom_scm_current_perm_info {
 	__le32 vmid;
 	__le32 perm;
@@ -49,28 +38,6 @@ struct qcom_scm_mem_map_info {
 	__le64 mem_size;
 };
 
-#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
-#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
-#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
-#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
-
-#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
-#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
-#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
-#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
-
-struct qcom_scm_wb_entry {
-	int flag;
-	void *entry;
-};
-
-static struct qcom_scm_wb_entry qcom_scm_wb[] = {
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
-};
-
 static const char *qcom_scm_convention_names[] = {
 	[SMC_CONVENTION_UNKNOWN] = "unknown",
 	[SMC_CONVENTION_ARM_32] = "smc arm 32",
@@ -78,7 +45,7 @@ static const char *qcom_scm_convention_names[] = {
 	[SMC_CONVENTION_LEGACY] = "smc legacy",
 };
 
-static struct qcom_scm *__scm;
+struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
 {
@@ -260,116 +227,6 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 	return ret ? false : !!res.result[0];
 }
 
-/**
- * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
- * @entry: Entry point function for the cpus
- * @cpus: The cpumask of cpus that will use the entry point
- *
- * Set the Linux entry point for the SCM to transfer control to when coming
- * out of a power down. CPU power down may be executed on cpuidle or hotplug.
- */
-int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	int ret;
-	int flags = 0;
-	int cpu;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR,
-		.arginfo = QCOM_SCM_ARGS(2),
-	};
-
-	/*
-	 * Reassign only if we are switching from hotplug entry point
-	 * to cpuidle entry point or vice versa.
-	 */
-	for_each_cpu(cpu, cpus) {
-		if (entry == qcom_scm_wb[cpu].entry)
-			continue;
-		flags |= qcom_scm_wb[cpu].flag;
-	}
-
-	/* No change in entry function */
-	if (!flags)
-		return 0;
-
-	desc.args[0] = flags;
-	desc.args[1] = virt_to_phys(entry);
-
-	ret = qcom_scm_call(__scm->dev, &desc, NULL);
-	if (!ret) {
-		for_each_cpu(cpu, cpus)
-			qcom_scm_wb[cpu].entry = entry;
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
-
-/**
- * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
- * @entry: Entry point function for the cpus
- * @cpus: The cpumask of cpus that will use the entry point
- *
- * Set the cold boot address of the cpus. Any cpu outside the supported
- * range would be removed from the cpu present mask.
- */
-int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	int flags = 0;
-	int cpu;
-	int scm_cb_flags[] = {
-		QCOM_SCM_FLAG_COLDBOOT_CPU0,
-		QCOM_SCM_FLAG_COLDBOOT_CPU1,
-		QCOM_SCM_FLAG_COLDBOOT_CPU2,
-		QCOM_SCM_FLAG_COLDBOOT_CPU3,
-	};
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR,
-		.arginfo = QCOM_SCM_ARGS(2),
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	if (!cpus || (cpus && cpumask_empty(cpus)))
-		return -EINVAL;
-
-	for_each_cpu(cpu, cpus) {
-		if (cpu < ARRAY_SIZE(scm_cb_flags))
-			flags |= scm_cb_flags[cpu];
-		else
-			set_cpu_present(cpu, false);
-	}
-
-	desc.args[0] = flags;
-	desc.args[1] = virt_to_phys(entry);
-
-	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
-}
-EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
-
-/**
- * qcom_scm_cpu_power_down() - Power down the cpu
- * @flags - Flags to flush cache
- *
- * This is an end point to power down cpu. If there was a pending interrupt,
- * the control would return from this function, otherwise, the cpu jumps to the
- * warm boot entry point set for this cpu upon reset.
- */
-void qcom_scm_cpu_power_down(u32 flags)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
-		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
-		.arginfo = QCOM_SCM_ARGS(1),
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
-}
-EXPORT_SYMBOL(qcom_scm_cpu_power_down);
-
 int qcom_scm_set_remote_state(u32 state, u32 id)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 632fe3142462..be23f96557da 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -4,6 +4,24 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
+#include <linux/types.h>
+#include <linux/reset-controller.h>
+
+struct clk;
+struct device;
+
+struct qcom_scm {
+	struct device *dev;
+	struct clk *core_clk;
+	struct clk *iface_clk;
+	struct clk *bus_clk;
+	struct reset_controller_dev reset;
+
+	u64 dload_mode_addr;
+};
+
+extern struct qcom_scm *__scm;
+
 enum qcom_scm_convention {
 	SMC_CONVENTION_UNKNOWN,
 	SMC_CONVENTION_LEGACY,
@@ -68,11 +86,26 @@ extern int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	__scm_smc_call((dev), (desc), qcom_scm_convention, (res), (atomic))
 
 #define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
+#if IS_ENABLED(CONFIG_ARM)
 extern int scm_legacy_call_atomic(struct device *dev,
 				  const struct qcom_scm_desc *desc,
 				  struct qcom_scm_res *res);
 extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 			   struct qcom_scm_res *res);
+#else
+static inline int scm_legacy_call_atomic(struct device *dev,
+					 const struct qcom_scm_desc *desc,
+					 struct qcom_scm_res *res)
+{
+	return -EINVAL;
+}
+
+static inline int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
+				  struct qcom_scm_res *res)
+{
+	return -EINVAL;
+}
+#endif
 
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 0165824c5128..0ec905d56e1a 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -64,9 +64,6 @@ enum qcom_scm_ice_cipher {
 #if IS_ENABLED(CONFIG_QCOM_SCM)
 extern bool qcom_scm_is_available(void);
 
-extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
-extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
-extern void qcom_scm_cpu_power_down(u32 flags);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
 
 extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
@@ -115,11 +112,6 @@ extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
 
 static inline bool qcom_scm_is_available(void) { return false; }
 
-static inline int qcom_scm_set_cold_boot_addr(void *entry,
-		const cpumask_t *cpus) { return -ENODEV; }
-static inline int qcom_scm_set_warm_boot_addr(void *entry,
-		const cpumask_t *cpus) { return -ENODEV; }
-static inline void qcom_scm_cpu_power_down(u32 flags) {}
 static inline u32 qcom_scm_set_remote_state(u32 state,u32 id)
 		{ return -ENODEV; }
 
@@ -171,4 +163,17 @@ static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
 		{ return -ENODEV; }
 #endif
+
+#if IS_ENABLED(CONFIG_ARM) && IS_ENABLED(CONFIG_QCOM_SCM)
+extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
+extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
+extern void qcom_scm_cpu_power_down(u32 flags);
+#else
+static inline int qcom_scm_set_cold_boot_addr(void *entry,
+		const cpumask_t *cpus) { return -ENODEV; }
+static inline int qcom_scm_set_warm_boot_addr(void *entry,
+		const cpumask_t *cpus) { return -ENODEV; }
+static inline void qcom_scm_cpu_power_down(u32 flags) {}
+#endif
+
 #endif
-- 
https://chromeos.dev

