Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982B7346D74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 23:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbhCWWno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 18:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbhCWWnj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 18:43:39 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF80C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 15:43:39 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c204so15854288pfc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 15:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qF+AWlKhTZ9lcdwki3lbXK0HlacZ0ucavrJ11SbfMrk=;
        b=kdQ5bSdESUAxdaPg7ItJ9zGDgl9NrF1GxQBp9mIMs/bcsBhWPXcYw/xN/0iNo6g/C5
         8jKTcoDxwVe84jcrMVdQPPwzN8spXVQU8e4kJsOBN4UALEB2FrIlsKIBDvTgYL/ZpQnc
         PkDouaV0HPbHlNmuMMQIAD+8Zy5cY/7ZA6MuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qF+AWlKhTZ9lcdwki3lbXK0HlacZ0ucavrJ11SbfMrk=;
        b=nMVawBfsGZxpb1d/1rlaHzVsxTBtnDhJzSY5wftIpqPFcmB386oHLU/uPyYTmFSplI
         t3Sf1RhW36nu+phFgQmUx+NhzLcJG4EfpzvmF+Pkn2TgWlhvlW6QjO1nLXghhiH4sXNK
         7Y64MmtUE4l5k2CbshY9GN5DTBOdtWTml17xffWQ6oDXETh6JFdtOznqs0PrgyeWmNr8
         cCZpvtB9/I4Tb4DyD5C/w38YNU2wvZ95mSnHuUA+rzonuyzeEiBfiPtOBvokQIuucHwH
         trQd/CMlozXuEXZIo5IdwVkH/D0WAvfS8SjRhJXncXz7A6iBVeFldO5NtmxGWoj+oARu
         3frg==
X-Gm-Message-State: AOAM533MjQYW7klNdFRFOTaMkzV3p2q62LH0VP94q/ciGzEwPFbEnJZP
        KG9f3kN2EsO6SP98jwBJ4Hbtdg==
X-Google-Smtp-Source: ABdhPJyS5K+BvRb4euquz9n553hVXyaVydJkkkWAP1WY9wTfm6ZNHqr1wNmZn6nPlABEXTUOjhCjvQ==
X-Received: by 2002:a63:4652:: with SMTP id v18mr398720pgk.87.1616539418454;
        Tue, 23 Mar 2021 15:43:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id s3sm208068pfs.185.2021.03.23.15.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:43:38 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
Date:   Tue, 23 Mar 2021 15:43:36 -0700
Message-Id: <20210323224336.1311783-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
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
 add/remove: 0/8 grow/shrink: 5/6 up/down: 509/-4401 (-3892)
 Function                                     old     new   delta
 __qcom_scm_set_dload_mode.constprop          312     452    +140
 qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
 qcom_scm_io_writel                           288     408    +120
 qcom_scm_io_readl                            376     492    +116
 __param_str_download_mode                     23      28      +5
 __warned                                    4327    4326      -1
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
 Total: Before=66737606, After=66733714, chg -0.01%

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

Followup to v1 (https://lore.kernel.org/r/20210223214539.1336155-7-swboyd@chromium.org):
 * Don't change the legacy file to use legacy calls only
 * Wrap more things in CONFIG_ARM checks

 drivers/firmware/Makefile   |  4 +++-
 drivers/firmware/qcom_scm.c | 47 ++++++++++++++++++++-----------------
 drivers/firmware/qcom_scm.h | 15 ++++++++++++
 include/linux/qcom_scm.h    | 21 ++++++++++-------
 4 files changed, 56 insertions(+), 31 deletions(-)

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
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index ee9cb545e73b..747808a8ddf4 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -49,28 +49,6 @@ struct qcom_scm_mem_map_info {
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
@@ -260,6 +238,30 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 	return ret ? false : !!res.result[0];
 }
 
+#if IS_ENABLED(CONFIG_ARM)
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
 /**
  * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
  * @entry: Entry point function for the cpus
@@ -369,6 +371,7 @@ void qcom_scm_cpu_power_down(u32 flags)
 	qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
+#endif
 
 int qcom_scm_set_remote_state(u32 state, u32 id)
 {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 632fe3142462..735e975320e4 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -68,11 +68,26 @@ extern int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
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

base-commit: 3b9cdafb5358eb9f3790de2f728f765fef100731
prerequisite-patch-id: 77da2cfd7591b1d7c35e879dca67d4f037f40e48
prerequisite-patch-id: 021337034973fa8ce52fc8c84787f40dabb33df6
prerequisite-patch-id: 5d374e97d8f0d384098a46e91006811ab89c84b0
prerequisite-patch-id: 892de894cc937f7fe6ddb8f95ec9e2e3557830c7
prerequisite-patch-id: 33b2442181aeb8adfa1c08d9a167d3bcbd1660fe
-- 
https://chromeos.dev

