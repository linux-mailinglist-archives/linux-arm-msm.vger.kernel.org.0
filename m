Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58AD1D06B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 07:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgEMF5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 01:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729153AbgEMF5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 01:57:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3CFC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 22:57:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id hi11so10621734pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HD1LTSNg68RqiJimoByZ/l0w6Op63ozOb2M6v+ilFQY=;
        b=WBtnkwOLFmhCHo+vvKyGoGHo0zPNi9prg8+FntowXgGxJ0tQV/nRlakPpm6ZVtKWfz
         FQ1L1cJzSyzeX8mFgXT7M0Zm/uauiZd69xv16K4UMeuf48nKI2L54U+Ws8YwaAVY1s/t
         SYcTiV+XLVw12oMV/hG51HXbgtVx41778rNZn7tgdb1IUj+CRo4wmq56LsjnAn3HSGxk
         c/NvVvN8B7EVHqf9BluxU9gyhqmyA9EqJyXsZkcjZhsuM/JNnPgccOOLedc6rI13eMOd
         702faH5FquR5/WV7N+XI4J42AQ9Dbp1NmTIlGbb3t2KXzA4MO3saT6JKp1GgcGxIddr+
         iJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HD1LTSNg68RqiJimoByZ/l0w6Op63ozOb2M6v+ilFQY=;
        b=Y38M4depnSy2U47OocVL6Zs2KZQyZ6cY2DHwlnhBUn6zY1w8fBhkJNFQyxh6i/XdsY
         7F8q4vh72MF0WYCNZer26F0CgszQ9573gTOHbE3YsXVDvuHaZbhu5nzGCF0SHdX5WJHh
         npy192OdzPy2eF7yE8qKGFReQCsuxT0/7tB0KMDmLRJUmDRGgSRA9PuTN1+V/Pxse5DC
         aZ+Z6up0zTXYmzlnqFr9FMPlHkEpBaz8n8NHp0tr6Ev8GB9fyyhBO7SJGbM7Hvn6buL2
         JKmU3f25crfCdamY0fzX0VUKYKBEEVSI7KB0dQYgWUO2RSle+m3JHqj6AMFDDm1Aqc3i
         ahfg==
X-Gm-Message-State: AGi0PubLu3UExw/UPym/2RdnImXYNeYjhXjLS2rNU0X+tjh6zs/hOPeY
        givEjkpD78f6HivvJIeh6anKbA==
X-Google-Smtp-Source: APiQypLDDkd+StRc8gr0UPPFKfagj2CMjB2o3KGymYSjqmWSIjhiBol14ODv/PRGDc0HXy9magNEHw==
X-Received: by 2002:a17:902:6b48:: with SMTP id g8mr21578357plt.96.1589349452608;
        Tue, 12 May 2020 22:57:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w192sm14131161pff.126.2020.05.12.22.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 22:57:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] remoteproc: qcom: Update PIL relocation info on load
Date:   Tue, 12 May 2020 22:56:39 -0700
Message-Id: <20200513055641.1413100-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the PIL relocation information in IMEM with information about
where the firmware for various remoteprocs are loaded.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Dropped unnecessary comment about ignoring return value.

 drivers/remoteproc/Kconfig          |  3 +++
 drivers/remoteproc/qcom_q6v5_adsp.c | 16 +++++++++++++---
 drivers/remoteproc/qcom_q6v5_mss.c  |  3 +++
 drivers/remoteproc/qcom_q6v5_pas.c  | 15 ++++++++++++---
 drivers/remoteproc/qcom_q6v5_wcss.c | 14 +++++++++++---
 drivers/remoteproc/qcom_wcnss.c     | 14 +++++++++++---
 6 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 8088ca4dd6dc..6bd42a411ca8 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -126,6 +126,7 @@ config QCOM_Q6V5_ADSP
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
+	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
@@ -158,6 +159,7 @@ config QCOM_Q6V5_PAS
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
+	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
@@ -209,6 +211,7 @@ config QCOM_WCNSS_PIL
 	depends on QCOM_SMEM
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index d2a2574dcf35..c539e89664cb 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -26,6 +26,7 @@
 #include <linux/soc/qcom/smem_state.h>
 
 #include "qcom_common.h"
+#include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
 
@@ -82,6 +83,7 @@ struct qcom_adsp {
 	unsigned int halt_lpass;
 
 	int crash_reason_smem;
+	const char *info_name;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -164,10 +166,17 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+	int ret;
+
+	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
+				    adsp->mem_region, adsp->mem_phys,
+				    adsp->mem_size, &adsp->mem_reloc);
+	if (ret)
+		return ret;
+
+	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
 
-	return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
-			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
-			     &adsp->mem_reloc);
+	return 0;
 }
 
 static int adsp_start(struct rproc *rproc)
@@ -436,6 +445,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
 	adsp->rproc = rproc;
+	adsp->info_name = desc->sysmon_name;
 	platform_set_drvdata(pdev, adsp);
 
 	ret = adsp_alloc_memory_region(adsp);
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c4936f4d1e80..fdbcae11ae64 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -29,6 +29,7 @@
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
+#include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 
 #include <linux/qcom_scm.h>
@@ -1221,6 +1222,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
 
+	qcom_pil_info_store("modem", mpss_reloc, qproc->mpss_size);
+
 release_firmware:
 	release_firmware(fw);
 out:
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3bb69f58e086..84cb19231c35 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -25,6 +25,7 @@
 #include <linux/soc/qcom/smem_state.h>
 
 #include "qcom_common.h"
+#include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
 
@@ -64,6 +65,7 @@ struct qcom_adsp {
 	int pas_id;
 	int crash_reason_smem;
 	bool has_aggre2_clk;
+	const char *info_name;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -117,11 +119,17 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+	int ret;
 
-	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
-			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
-			     &adsp->mem_reloc);
+	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
+			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
+			    &adsp->mem_reloc);
+	if (ret)
+		return ret;
 
+	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
+
+	return 0;
 }
 
 static int adsp_start(struct rproc *rproc)
@@ -405,6 +413,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->pas_id = desc->pas_id;
 	adsp->has_aggre2_clk = desc->has_aggre2_clk;
+	adsp->info_name = desc->sysmon_name;
 	platform_set_drvdata(pdev, adsp);
 
 	ret = adsp_alloc_memory_region(adsp);
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index f1924b740a10..962e37a86b8b 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -421,10 +421,18 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len)
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
+	int ret;
+
+	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
+				    0, wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_size, &wcss->mem_reloc);
+	if (ret)
+		return ret;
+
+	/* Failures only affect post mortem debugging, so ignore return value */
+	qcom_pil_info_store("wcnss", wcss->mem_reloc, wcss->mem_size);
 
-	return qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				     0, wcss->mem_region, wcss->mem_phys,
-				     wcss->mem_size, &wcss->mem_reloc);
+	return ret;
 }
 
 static const struct rproc_ops q6v5_wcss_ops = {
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 5d65e1a9329a..229482b3231f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -27,6 +27,7 @@
 
 #include "qcom_common.h"
 #include "remoteproc_internal.h"
+#include "qcom_pil_info.h"
 #include "qcom_wcnss.h"
 
 #define WCNSS_CRASH_REASON_SMEM		422
@@ -145,10 +146,17 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
 static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
+	int ret;
+
+	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
+			    wcnss->mem_region, wcnss->mem_phys,
+			    wcnss->mem_size, &wcnss->mem_reloc);
+	if (ret)
+		return ret;
+
+	qcom_pil_info_store("wcnss", wcnss->mem_reloc, wcnss->mem_size);
 
-	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			     wcnss->mem_region, wcnss->mem_phys,
-			     wcnss->mem_size, &wcnss->mem_reloc);
+	return 0;
 }
 
 static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
-- 
2.26.2

