Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE41E3888
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 07:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgE0Ft4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 01:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgE0Ftz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 01:49:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDAFC03E96F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 22:49:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id fs4so1066676pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnA35zHvU/q4Ug549J18s7p9ju0gIHtANDBiW2rNg3c=;
        b=HmLpReePF2D16pzn6KogQrblvto9ead4+MPpsV2F2Tlh3acCcn4p2EVCMa9CGpPTW1
         j+jiQrXy8ge0InE05XffziVek7VJxqiCcAohBDYcdF4dIbKgqmr1MvMfEDBC9AB9dApS
         BVZNrBjveL24Pwg5pPK+vgdPUy3BDKBzdq/0vKwWZEYbpY5PIaChpBgGslTU/JyaUG1i
         0FlLD/Ew2WzeBCaQNjIafHm9maijLRfiGd8U7A9iHXk5T+hMaJzur8XTrZU/TWj2E8ag
         c6dqs/maLvsfYpaK9ySuc/n1sE/tyqOsj6x8YxTY22zmRos0OINpI2gsiFD51btCIZlN
         XSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnA35zHvU/q4Ug549J18s7p9ju0gIHtANDBiW2rNg3c=;
        b=EwuXGh6sq3DCLuZiNUZpHBAeh44lEu9v1VSn1cTGnPVgvFreTOPT1ruB7mw42CxKiS
         7OX3WSBG7HHzGqcgilP0jRLLz6B0A5aZuplpUc2uzP2ppjr7qjP++aFhNMFkZg/mScKe
         1oiorKiHiNdNPmF7nLGzIM9jB81s4RE453aTSEsOh+8zrClxmWRG2OmHh4Bvva+sqnHk
         aUiN9aJjrWoJUHTrtsqpjzXvI7LlPt3PZg6pZK63ja0ccTvfRgP/xESZrC7bIswMNATz
         LOiaY+30esuPH1943tQCE7DzV39H15s4uLh7m8OPH65lPvJAk1+KgPJO3oRIlZA8wEhH
         q/8g==
X-Gm-Message-State: AOAM530hC69FPkmIJ+riGBYW+1ltgymoYRtKNQ8TTw/WSxSfEp6DW0cc
        CMn8uCA330BDFUZvjwCIqTBodQ==
X-Google-Smtp-Source: ABdhPJzIkT0ca2I9R0ZjPxYqQDbhPQzI+FptLN5gFo/WG7pcYoSMKK5nbXDZQxsENZw70fTJJH06Pg==
X-Received: by 2002:a17:90b:1218:: with SMTP id gl24mr3040695pjb.215.1590558595044;
        Tue, 26 May 2020 22:49:55 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 3/5] remoteproc: qcom: Update PIL relocation info on load
Date:   Tue, 26 May 2020 22:48:47 -0700
Message-Id: <20200527054850.2067032-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
References: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the PIL relocation information in IMEM with information about
where the firmware for various remoteprocs are loaded.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Added select QCOM_PIL_INFO to all relevant Kconfig options
- Replaced mem_reloc with mem_phys, to get the start of the memory region,
  rather than the bottom address prior to relocation.
- Include qcom_pil_info.h in qcom_q6v5_wcss.c

 drivers/remoteproc/Kconfig          |  5 +++++
 drivers/remoteproc/qcom_q6v5_adsp.c | 16 +++++++++++++---
 drivers/remoteproc/qcom_q6v5_mss.c  |  3 +++
 drivers/remoteproc/qcom_q6v5_pas.c  | 15 ++++++++++++---
 drivers/remoteproc/qcom_q6v5_wcss.c | 14 +++++++++++---
 drivers/remoteproc/qcom_wcnss.c     | 14 +++++++++++---
 6 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index f4bd96d1a1a3..3e8d5d1a2b9e 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -135,6 +135,7 @@ config QCOM_Q6V5_ADSP
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
+	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
@@ -151,6 +152,7 @@ config QCOM_Q6V5_MSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
 	select QCOM_Q6V5_COMMON
 	select QCOM_Q6V5_IPA_NOTIFY
 	select QCOM_RPROC_COMMON
@@ -167,6 +169,7 @@ config QCOM_Q6V5_PAS
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
+	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
@@ -185,6 +188,7 @@ config QCOM_Q6V5_WCSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
@@ -218,6 +222,7 @@ config QCOM_WCNSS_PIL
 	depends on QCOM_SMEM
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index d2a2574dcf35..efb2c1aa80a3 100644
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
+	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
 
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
index feb70283b6a2..dd37e462ed61 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -29,6 +29,7 @@
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
+#include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 
 #include <linux/qcom_scm.h>
@@ -1189,6 +1190,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
 
+	qcom_pil_info_store("modem", qproc->mpss_phys, qproc->mpss_size);
+
 release_firmware:
 	release_firmware(fw);
 out:
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 61791a03f648..3837f23995e0 100644
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
 
+	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
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
 
 	device_wakeup_enable(adsp->dev);
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 88c76b9417fa..8846ef0b0f1a 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -14,6 +14,7 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include "qcom_common.h"
+#include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 
 #define WCSS_CRASH_REASON		421
@@ -424,10 +425,17 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len)
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
+	qcom_pil_info_store("wcnss", wcss->mem_phys, wcss->mem_size);
 
-	return qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				     0, wcss->mem_region, wcss->mem_phys,
-				     wcss->mem_size, &wcss->mem_reloc);
+	return ret;
 }
 
 static const struct rproc_ops q6v5_wcss_ops = {
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 5d65e1a9329a..e2573f79a137 100644
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
+	qcom_pil_info_store("wcnss", wcnss->mem_phys, wcnss->mem_size);
 
-	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			     wcnss->mem_region, wcnss->mem_phys,
-			     wcnss->mem_size, &wcnss->mem_reloc);
+	return 0;
 }
 
 static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
-- 
2.26.2

