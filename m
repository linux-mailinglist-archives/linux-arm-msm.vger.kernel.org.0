Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D011B5165
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 02:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgDWAiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 20:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726287AbgDWAiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 20:38:12 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E410CC08E934
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x3so2026559pfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGHZwN0LAtzrhReD8egvVxlgtUx+R63R7VOmTzodM+8=;
        b=efBg576eZ3LUkjyh6JULzCvgRV6yCqC5mm4AgOB3N/VfTEEiHJimPGf8zeU1nm5wxM
         ZA1vW/k9iqnx1GqD8FhQtgyeAEi2QhPzNlYobt2OVT2wYNL9VVLoWtwUNe1GhUuB4mlA
         EJplX/hsPmC6c0fY009d2HbeAioIMxQPcTURTtSHZbrDjTVJ4Ta1TcG0xurKjpJvblsf
         bPg/4P1FV+cJEGCMWKzQ37qXDVdi/72wEoLihvqgKZYNgx9g2Ml6vIug8aO5pH8YYzEn
         ZYvSTCOXf+122Z+97YBazi0uVR4s/lMlcVW45nhgdgWZAG8sOVYZhXv9AxPp4WVqu+8t
         boVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGHZwN0LAtzrhReD8egvVxlgtUx+R63R7VOmTzodM+8=;
        b=IUzKhGjwRqGQEQmmS9Nw0RiqiN/r4PS2JNQWPwbAXi7A/PYXFSCXcWvCEQvVGl1m+q
         5CzPiIjL8I1UnG7CvqSD3g/5UA1Zfncaa6lnzm4V7BTfVAo2AGJFJF+vWgaFjLe2AyFp
         iSG9ypkiR2ZsLHhryJoprXapjNNocpqnK76TFqWb7FbI96ZMGcDP3jiVBdjc0u1+v/Si
         /SJZOFVvFM6o/WAI+prLus9oI6t7i6yS4MiXdI6X8png/aGnr2you7V0NbpgNgjrVxXr
         jLwZMCeyOIncZg3pOgJJItk+0VN1vKHZKQ2WONKxrCpQc+Kb2qpPDW4g6vLXM2jF9uDG
         BJGg==
X-Gm-Message-State: AGi0Pua4m7GpfmYfZmE9OwJvzeyCHgc2obWGYK2fCn6zamXBm9tNaEsM
        gtA52aJOD2UWVkvQgRUzGHxh+A==
X-Google-Smtp-Source: APiQypLw7baTFhOiMTOokbF+ufVlwrh986MOwTUTryb0kDUEMg0FFP2DHqyjonVdeqr6H3GxSDFX8w==
X-Received: by 2002:a62:6585:: with SMTP id z127mr1191227pfb.217.1587602291258;
        Wed, 22 Apr 2020 17:38:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm432225pgz.0.2020.04.22.17.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:38:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 3/4] rpmsg: glink: Integrate glink_ssr in qcom_glink
Date:   Wed, 22 Apr 2020 17:37:35 -0700
Message-Id: <20200423003736.2027371-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In all but the very special case of a system with _only_ glink_rpm,
GLINK is dependent on glink_ssr, so move it to rpmsg and combine it with
qcom_glink_native in the new qcom_glink kernel module.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/Kconfig                                    | 6 +++---
 drivers/rpmsg/Makefile                                   | 3 ++-
 drivers/{soc/qcom/glink_ssr.c => rpmsg/qcom_glink_ssr.c} | 4 ----
 drivers/soc/qcom/Kconfig                                 | 9 ---------
 drivers/soc/qcom/Makefile                                | 1 -
 include/linux/rpmsg/qcom_glink.h                         | 7 +------
 6 files changed, 6 insertions(+), 24 deletions(-)
 rename drivers/{soc/qcom/glink_ssr.c => rpmsg/qcom_glink_ssr.c} (97%)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index a9108ff563dc..f96716893c2a 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -24,13 +24,13 @@ config RPMSG_MTK_SCP
 	  remote processors in MediaTek platforms.
 	  This use IPI and IPC to communicate with remote processors.
 
-config RPMSG_QCOM_GLINK_NATIVE
+config RPMSG_QCOM_GLINK
 	tristate
 	select RPMSG
 
 config RPMSG_QCOM_GLINK_RPM
 	tristate "Qualcomm RPM Glink driver"
-	select RPMSG_QCOM_GLINK_NATIVE
+	select RPMSG_QCOM_GLINK
 	depends on HAS_IOMEM
 	depends on MAILBOX
 	help
@@ -40,7 +40,7 @@ config RPMSG_QCOM_GLINK_RPM
 
 config RPMSG_QCOM_GLINK_SMEM
 	tristate "Qualcomm SMEM Glink driver"
-	select RPMSG_QCOM_GLINK_NATIVE
+	select RPMSG_QCOM_GLINK
 	depends on MAILBOX
 	depends on QCOM_SMEM
 	help
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index ae92a7fb08f6..ffe932ef6050 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -2,8 +2,9 @@
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
+qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
+obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
-obj-$(CONFIG_RPMSG_QCOM_GLINK_NATIVE) += qcom_glink_native.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
similarity index 97%
rename from drivers/soc/qcom/glink_ssr.c
rename to drivers/rpmsg/qcom_glink_ssr.c
index 847d79c935f1..dcd1ce616974 100644
--- a/drivers/soc/qcom/glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -164,7 +164,3 @@ static struct rpmsg_driver qcom_glink_ssr_driver = {
 	},
 };
 module_rpmsg_driver(qcom_glink_ssr_driver);
-
-MODULE_ALIAS("rpmsg:glink_ssr");
-MODULE_DESCRIPTION("Qualcomm GLINK SSR notifier");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 19332ea40234..5140bd82f1be 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -35,15 +35,6 @@ config QCOM_GENI_SE
 	  driver is also used to manage the common aspects of multiple Serial
 	  Engines present in the QUP.
 
-config QCOM_GLINK_SSR
-	tristate "Qualcomm Glink SSR driver"
-	depends on RPMSG
-	depends on QCOM_RPROC_COMMON
-	help
-	  Say y here to enable GLINK SSR support. The GLINK SSR driver
-	  implements the SSR protocol for notifying the remote processor about
-	  neighboring subsystems going up or down.
-
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 5d6b83dc58e8..e9cacc9ad401 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -3,7 +3,6 @@ CFLAGS_rpmh-rsc.o := -I$(src)
 obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
 obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
-obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
index 09daa0acde2c..daded9fddf36 100644
--- a/include/linux/rpmsg/qcom_glink.h
+++ b/include/linux/rpmsg/qcom_glink.h
@@ -12,6 +12,7 @@ struct qcom_glink;
 struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 					    struct device_node *node);
 void qcom_glink_smem_unregister(struct qcom_glink *glink);
+void qcom_glink_ssr_notify(const char *ssr_name);
 
 #else
 
@@ -23,12 +24,6 @@ qcom_glink_smem_register(struct device *parent,
 }
 
 static inline void qcom_glink_smem_unregister(struct qcom_glink *glink) {}
-
-#endif
-
-#if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SSR)
-void qcom_glink_ssr_notify(const char *ssr_name);
-#else
 static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
 #endif
 
-- 
2.24.0

