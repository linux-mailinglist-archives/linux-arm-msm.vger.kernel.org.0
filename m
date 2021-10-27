Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A16443CC35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 16:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242558AbhJ0Oad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 10:30:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:46460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242551AbhJ0Oac (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 10:30:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C5A5603E5;
        Wed, 27 Oct 2021 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635344886;
        bh=Mmj309Iy00lc7nVQhNjWfw27f7+Uk5zEEgQ6LZXj8C8=;
        h=From:To:Cc:Subject:Date:From;
        b=tFP77WS2hf+g0F5rKeQ0Zoiv3yj/buZpIz06DhSh3R42tqS0LcuMIdtFRL31Rcm06
         P38iBrcOtLjAGuCizAVCbPzdYBc9qAeb7E/zoJQcmD4a7zX7DdTIGVLjqdMy3CA1e4
         YRygVSgrnhRKpluAGhvXWOzQ2wWAd+iWaLpckioAdJ98eeUzEYaOis6jGCC10ouOFj
         tD1MW4eAGxcdm/tqOVEtkQWT3ns0dBq230Y+LYkVXBJ3K9zEE7o/tAkdKgPTc/RaQt
         PeFm9cZhWOg8XY/dD4FFsCWns8EOfcR1zNQ1HeYQ3UefzmKse2FtjKMmArpEVJtE1/
         h//iJPDRCYQ6Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <swboyd@chromium.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "firmware: qcom: scm: Add support for MC boot address API"
Date:   Wed, 27 Oct 2021 16:27:40 +0200
Message-Id: <20211027142802.2060425-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This reverts commits 55845f46df03 and c50031f03dfe, since this still
causes a build failure when QCOM_SCM is a loadable module, or when
CONFIG_SMP is disabled:

ERROR: modpost: "cpu_logical_map" [drivers/firmware/qcom-scm.ko] undefined!

This be done better for 5.17, but it's too late now to rework
properly.

Fixes: c50031f03dfe ("firmware: qcom: scm: Don't break compile test on non-ARM platforms")
Fixes: 55845f46df03 ("firmware: qcom: scm: Add support for MC boot address API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---

I've applied this revert to the arm/drivers branch now

 drivers/firmware/qcom_scm.c | 94 +++++++------------------------------
 drivers/firmware/qcom_scm.h |  4 --
 2 files changed, 17 insertions(+), 81 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 11464f6502be..7db8066b19fd 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -17,10 +17,6 @@
 #include <linux/reset-controller.h>
 #include <linux/arm-smccc.h>
 
-#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-#include <asm/smp_plat.h>
-#endif
-
 #include "qcom_scm.h"
 
 static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
@@ -264,44 +260,15 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 	return ret ? false : !!res.result[0];
 }
 
-#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
-				       unsigned int flags)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR_MC,
-		.owner = ARM_SMCCC_OWNER_SIP,
-		.arginfo = QCOM_SCM_ARGS(6),
-	};
-	unsigned int cpu;
-	u64 map;
-
-	/* Need a device for DMA of the additional arguments */
-	if (!__scm || __get_convention() == SMC_CONVENTION_LEGACY)
-		return -EOPNOTSUPP;
-
-	desc.args[0] = virt_to_phys(entry);
-	for_each_cpu(cpu, cpus) {
-		map = cpu_logical_map(cpu);
-		desc.args[1] |= BIT(MPIDR_AFFINITY_LEVEL(map, 0));
-		desc.args[2] |= BIT(MPIDR_AFFINITY_LEVEL(map, 1));
-		desc.args[3] |= BIT(MPIDR_AFFINITY_LEVEL(map, 2));
-	}
-	desc.args[4] = ~0ULL; /* Reserved for affinity level 3 */
-	desc.args[5] = flags;
-
-	return qcom_scm_call(__scm->dev, &desc, NULL);
-}
-#else
-static inline int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
-					      unsigned int flags)
-{
-	return -EINVAL;
-}
-#endif
-
-static int __qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
+/**
+ * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
+ * @entry: Entry point function for the cpus
+ * @cpus: The cpumask of cpus that will use the entry point
+ *
+ * Set the Linux entry point for the SCM to transfer control to when coming
+ * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ */
+int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 {
 	int ret;
 	int flags = 0;
@@ -337,28 +304,17 @@ static int __qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 
 	return ret;
 }
+EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
 
 /**
- * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
+ * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
  * @cpus: The cpumask of cpus that will use the entry point
  *
- * Set the Linux entry point for the SCM to transfer control to when coming
- * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ * Set the cold boot address of the cpus. Any cpu outside the supported
+ * range would be removed from the cpu present mask.
  */
-int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	if (!cpus || cpumask_empty(cpus))
-		return -EINVAL;
-
-	if (__qcom_scm_set_boot_addr_mc(entry, cpus, QCOM_SCM_BOOT_MC_FLAG_WARMBOOT))
-		/* Fallback to old SCM call */
-		return __qcom_scm_set_warm_boot_addr(entry, cpus);
-	return 0;
-}
-EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
-
-static int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
 	int flags = 0;
 	int cpu;
@@ -375,6 +331,9 @@ static int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
+	if (!cpus || cpumask_empty(cpus))
+		return -EINVAL;
+
 	for_each_cpu(cpu, cpus) {
 		if (cpu < ARRAY_SIZE(scm_cb_flags))
 			flags |= scm_cb_flags[cpu];
@@ -387,25 +346,6 @@ static int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 
 	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
 }
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
-	if (!cpus || cpumask_empty(cpus))
-		return -EINVAL;
-
-	if (__qcom_scm_set_boot_addr_mc(entry, cpus, QCOM_SCM_BOOT_MC_FLAG_COLDBOOT))
-		/* Fallback to old SCM call */
-		return __qcom_scm_set_cold_boot_addr(entry, cpus);
-	return 0;
-}
 EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
 /**
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 2a6a87b75231..d92156ceb3ac 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -78,12 +78,8 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
 #define QCOM_SCM_BOOT_TERMINATE_PC	0x02
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE	0x10
-#define QCOM_SCM_BOOT_SET_ADDR_MC	0x11
 #define QCOM_SCM_BOOT_SET_REMOTE_STATE	0x0a
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
-#define QCOM_SCM_BOOT_MC_FLAG_AARCH64	BIT(0)
-#define QCOM_SCM_BOOT_MC_FLAG_COLDBOOT	BIT(1)
-#define QCOM_SCM_BOOT_MC_FLAG_WARMBOOT	BIT(2)
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
-- 
2.29.2

