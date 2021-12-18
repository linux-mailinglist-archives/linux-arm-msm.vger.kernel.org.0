Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C08D479AED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Dec 2021 14:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhLRNAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Dec 2021 08:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbhLRNAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Dec 2021 08:00:47 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D8AC061748
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 05:00:44 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e5so9375262wrc.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 05:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p5i8bAyKNCVvvWULTiQQCBvHxMUgvB2ssJ2ppV6n34w=;
        b=ydyFnsfD0j+C/gkrXEBeottbW99utAA/sHLtcRwhIV96kBnR+kfAxiD804powfEdk3
         ESRlm07ZyRHgcy0GXsdDDVTyepYfgM4cCrHVqBhN18vLwSeyaZijRkkEOFLjsQQDDgDw
         O4315YNQUfUL6GBHqaQ15dOHXQfp11u/HitiBLwoBJJePbDScrP3vxTwX4NN4G/Y/2d2
         q6tcBpa4zVIA7S8P1OBo6XEY6miO366xOg/sy15cmckMSzPPquYfS+dJL7srkMI/yfE5
         0+KH7frWDAr1SY8W7TUeEIcewXYTz8ezpcU31B3rAA3LcMf3tIEevPZqrZv6nXNiEKFw
         f83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p5i8bAyKNCVvvWULTiQQCBvHxMUgvB2ssJ2ppV6n34w=;
        b=d7aqmnrY2B6WMCpCj6Cjz4V1GBMie5OyRX7RnLsd/3kWC1WBdsjasTBQe+2KE7Ll/9
         pA0Y28byTzuL3ZC3UTfSB7gkiSc/SRhLYYJZNa9BzDp2JBWTtzozRPTEWBJ5BGzN9TVa
         hKt+EJ+TsmAdx6lnFT/JzP6u0uD8ioZLN2Z/TsdlseiMOWcbIGxpegHm9EcQYOxRzBM6
         nnbQFwaZiA3Oqk9jYMBcIzV0ewacvi3n0arnuwJeqx8CW/5h+ey/6FnG6moWnTITlZwT
         Mbj7jN5DS0vDbHT7Hr8HuPqqmivO74SdYu5L+GPlPKmmzx+G8k2UxTWwfmOcPVzx8MaC
         HC+Q==
X-Gm-Message-State: AOAM530nn/SQ6yLm0gW7h9r8hKM0Ju5vpMewUu8vUhPqsaQwUOCJhoAn
        XDc6C2DATQSVMgC+2QQ03d6RDA==
X-Google-Smtp-Source: ABdhPJys+xI4SwBaTi9xDAxJhmT8aMjKzm6rvNQgmGmf6cpusjutiCLuPZdAGACX4Zk4RK0Me0NI6Q==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr1281979wrr.271.1639832442739;
        Sat, 18 Dec 2021 05:00:42 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ed2f:f020:1f0f:c9b8:ee5c:5c2f])
        by smtp.gmail.com with ESMTPSA id j16sm1465785wms.12.2021.12.18.05.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 05:00:42 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rjw@rjwysocki.net
Cc:     lukasz.luba@arm.com, robh@kernel.org, heiko@sntech.de,
        arnd@linaro.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, ulf.hansson@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH v5 6/6] qcom/soc/drivers: Add DTPM description for sdm845
Date:   Sat, 18 Dec 2021 14:00:14 +0100
Message-Id: <20211218130014.4037640-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218130014.4037640-1-daniel.lezcano@linaro.org>
References: <20211218130014.4037640-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DTPM framework does support now the hierarchy description.

The platform specific code can call the hierarchy creation function
with an array of struct dtpm_node pointing to their parents.

This patch provides a description of the big and Little CPUs and the
GPU and tie them together under a virtual package name. Only sdm845 is
described.

The description could be extended in the future with the memory
controller with devfreq if it has the energy information.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/soc/qcom/Kconfig  |  9 ++++++
 drivers/soc/qcom/Makefile |  1 +
 drivers/soc/qcom/dtpm.c   | 65 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 drivers/soc/qcom/dtpm.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index e718b8735444..f21c1df2f2f9 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -228,4 +228,13 @@ config QCOM_APR
 	  application processor and QDSP6. APR is
 	  used by audio driver to configure QDSP6
 	  ASM, ADM and AFE modules.
+
+config QCOM_DTPM
+	tristate "Qualcomm DTPM hierarchy"
+	depends on DTPM
+	help
+	 Describe the hierarchy for the Dynamic Thermal Power
+	 Management tree on this platform. That will create all the
+	 power capping capable devices.
+
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 70d5de69fd7b..cf38496c3f61 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
 obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
+obj-$(CONFIG_QCOM_DTPM) += dtpm.o
diff --git a/drivers/soc/qcom/dtpm.c b/drivers/soc/qcom/dtpm.c
new file mode 100644
index 000000000000..c15283f59494
--- /dev/null
+++ b/drivers/soc/qcom/dtpm.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2021 Linaro Limited
+ *
+ * Author: Daniel Lezcano <daniel.lezcano@linaro.org>
+ *
+ * DTPM hierarchy description
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/dtpm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static struct dtpm_node __initdata sdm845_hierarchy[] = {
+	[0]{ .name = "sdm845" },
+	[1]{ .name = "package",
+	     .parent = &sdm845_hierarchy[0] },
+	[2]{ .name = "/cpus/cpu@0",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[3]{ .name = "/cpus/cpu@100",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[4]{ .name = "/cpus/cpu@200",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[5]{ .name = "/cpus/cpu@300",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[6]{ .name = "/cpus/cpu@400",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[7]{ .name = "/cpus/cpu@500",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[8]{ .name = "/cpus/cpu@600",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[9]{ .name = "/cpus/cpu@700",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[10]{ .name = "/soc@0/gpu@5000000",
+	     .type = DTPM_NODE_DT,
+	     .parent = &sdm845_hierarchy[1] },
+	[11]{ },
+};
+
+static struct of_device_id __initdata sdm845_dtpm_match_table[] = {
+        { .compatible = "qcom,sdm845", .data = sdm845_hierarchy },
+        {},
+};
+
+static int __init sdm845_dtpm_init(void)
+{
+	return dtpm_create_hierarchy(sdm845_dtpm_match_table);
+}
+late_initcall(sdm845_dtpm_init);
+
+MODULE_DESCRIPTION("Qualcomm DTPM driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:dtpm");
+MODULE_AUTHOR("Daniel Lezcano <daniel.lezcano@kernel.org");
+
-- 
2.25.1

