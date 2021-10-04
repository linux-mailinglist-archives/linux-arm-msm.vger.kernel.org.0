Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B514218BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbhJDUxR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:53:17 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.172]:24302 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237036AbhJDUxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380678;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=4JzDORqUQ81Z4+9+HWv9+hoAX8nPaZ2c+evyH8MVA+4=;
    b=lTnS6yUyLZaGMEQg577eJHMIBKIuQzzge/4HeLl59fSFK9jji6XsFBbtNwATyBLve/
    yxCGvMKpNFngCpKtMFphLnjARSR/b67Vf3kTOf18OMT9TsOtW00ZbR45Ghwuv/D0iziR
    3xKsmUitLG8TWG7opgwsbmbT/N757SJwOgQhoAVFkeMhCpuFkaaBwLiqYlL0bKCTm0tx
    q3s2ZxU9A2dFHSPtGBBRwz8FNMmXkgZjUzM1v+j/1lC4ArGE6muxgl0f5ILZU5F0BR2/
    Jwf5CnAOCSgvda8MoutiGAip1gFihwq93bEY4PxN6PmKiSdpyqbnFbM+RM+FR1zEqiBA
    0Puw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KpIKSp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:51:18 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 12/15] firmware: qcom: scm: Add support for MC boot address API
Date:   Mon,  4 Oct 2021 22:49:52 +0200
Message-Id: <20211004204955.21077-12-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It looks like the old QCOM_SCM_BOOT_SET_ADDR API is broken on some
MSM8916 firmware versions that implement the newer SMC32 calling
convention. It just returns -EINVAL no matter which arguments are
being passed.

This does not cause any problems downstream because it first tries
to use the new multi-cluster API replacement which is working fine.

Implement support for the multi-cluster variant of the SCM call
by attempting it first but still fallback to the old call in case
of an error. Also, to be absolutely sure only use the multi-cluster
variant with the SMC calling convention since older platforms should
not need this.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.

The diff generated by Git is a bit hard to read sadly, what I did
essentially is:

  1. Add __qcom_scm_set_boot_addr_mc()
  2. Rename original qcom_scm_set_cold/warm_boot_addr() to
     static __qcom_scm_set_cold/warm_boot_addr()
  3. Make new qcom_scm_set_cold/warm_boot_addr() call
     __qcom_scm_set_boot_addr_mc() first and then fall back to the old
     __qcom_scm_set_cold/warm_boot_addr() as before
---
 drivers/firmware/qcom_scm.c | 84 +++++++++++++++++++++++++++++--------
 drivers/firmware/qcom_scm.h |  4 ++
 2 files changed, 71 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index a861033616ee..75506a1bbcfc 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -17,6 +17,8 @@
 #include <linux/reset-controller.h>
 #include <linux/arm-smccc.h>
 
+#include <asm/smp_plat.h>
+
 #include "qcom_scm.h"
 
 static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
@@ -260,15 +262,36 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
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
+static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
+				       unsigned int flags)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR_MC,
+		.owner = ARM_SMCCC_OWNER_SIP,
+		.arginfo = QCOM_SCM_ARGS(6),
+	};
+	unsigned int cpu;
+	u64 map;
+
+	/* Need a device for DMA of the additional arguments */
+	if (!__scm || __get_convention() == SMC_CONVENTION_LEGACY)
+		return -EOPNOTSUPP;
+
+	desc.args[0] = virt_to_phys(entry);
+	for_each_cpu(cpu, cpus) {
+		map = cpu_logical_map(cpu);
+		desc.args[1] |= BIT(MPIDR_AFFINITY_LEVEL(map, 0));
+		desc.args[2] |= BIT(MPIDR_AFFINITY_LEVEL(map, 1));
+		desc.args[3] |= BIT(MPIDR_AFFINITY_LEVEL(map, 2));
+	}
+	desc.args[4] = ~0ULL; /* Reserved for affinity level 3 */
+	desc.args[5] = flags;
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+
+static int __qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 {
 	int ret;
 	int flags = 0;
@@ -304,17 +327,28 @@ int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 
 	return ret;
 }
-EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
 
 /**
- * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
+ * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
  * @entry: Entry point function for the cpus
  * @cpus: The cpumask of cpus that will use the entry point
  *
- * Set the cold boot address of the cpus. Any cpu outside the supported
- * range would be removed from the cpu present mask.
+ * Set the Linux entry point for the SCM to transfer control to when coming
+ * out of a power down. CPU power down may be executed on cpuidle or hotplug.
  */
-int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
+{
+	if (!cpus || cpumask_empty(cpus))
+		return -EINVAL;
+
+	if (__qcom_scm_set_boot_addr_mc(entry, cpus, QCOM_SCM_BOOT_MC_FLAG_WARMBOOT))
+		/* Fallback to old SCM call */
+		return __qcom_scm_set_warm_boot_addr(entry, cpus);
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
+
+static int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
 	int flags = 0;
 	int cpu;
@@ -331,9 +365,6 @@ int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	if (!cpus || cpumask_empty(cpus))
-		return -EINVAL;
-
 	for_each_cpu(cpu, cpus) {
 		if (cpu < ARRAY_SIZE(scm_cb_flags))
 			flags |= scm_cb_flags[cpu];
@@ -346,6 +377,25 @@ int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 
 	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
 }
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
+	if (!cpus || cpumask_empty(cpus))
+		return -EINVAL;
+
+	if (__qcom_scm_set_boot_addr_mc(entry, cpus, QCOM_SCM_BOOT_MC_FLAG_COLDBOOT))
+		/* Fallback to old SCM call */
+		return __qcom_scm_set_cold_boot_addr(entry, cpus);
+	return 0;
+}
 EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
 /**
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index d92156ceb3ac..2a6a87b75231 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -78,8 +78,12 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
 #define QCOM_SCM_BOOT_TERMINATE_PC	0x02
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE	0x10
+#define QCOM_SCM_BOOT_SET_ADDR_MC	0x11
 #define QCOM_SCM_BOOT_SET_REMOTE_STATE	0x0a
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
+#define QCOM_SCM_BOOT_MC_FLAG_AARCH64	BIT(0)
+#define QCOM_SCM_BOOT_MC_FLAG_COLDBOOT	BIT(1)
+#define QCOM_SCM_BOOT_MC_FLAG_WARMBOOT	BIT(2)
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
-- 
2.33.0

