Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C282A769C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 05:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731041AbgKEEug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 23:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgKEEue (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 23:50:34 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8163C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 20:50:34 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id l26so122586oop.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 20:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gB/8DdyhYbLhO5Kc+ec+n/kffS9x3KIVkFEGOmCDRJQ=;
        b=T/12uOtjxpMBCy+hcNVksK0w3Ds/WMLclOhdA8ZQlboyiWlsCIWN7K9VOfFekbEmsG
         DRdkefILdU8kv15wz0+46STpmtYnXqjCjY+XobWRyrBufATbkeL6mMeYyAnMZrJAUH6x
         Opm7dQKE+Y9ecV6Q/pTeklabK81olgrqfyU2yZipE1bu1IVuFgInoCro/maggP4Vv+7/
         O2OEUQwgm0gx/sVLlPsRdQElJzd0N6alU3U1nLwos1brzE9ZWhLm36cvUsYjp2W8oodn
         Uhnl8nwir1KQlC4M4XLjv41+9OP5B4Hl1U2TaRi04XzxV/cFs0PBhH6rUx+fxYSsKfJp
         lGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gB/8DdyhYbLhO5Kc+ec+n/kffS9x3KIVkFEGOmCDRJQ=;
        b=Mw/LDBiTGmgNUUxMM3f49DQr5afLXQD6+yVE/EISGwdrP/HdVbwDQFDpCnXCe3mSnF
         SFs/aaZeVoS3sCq52YBgmCFsfNledC7PXVmB/3x1YD4YsyD1CB+dsLuWzQSZF1/muMMZ
         0KFl94+OlyNcz+UEVX1ezx3gUlcORfRHVBmmdXGy1uITQ+clhJMdckohYdCgb/fCKIAE
         6Pm6/g1p91jJm7s1TdOZPBJFgMWhWIGPsIca5xjzbWnmGx4gRwwDsy/aTf4frAyEfCLu
         2Rl86tDE6wmYtP5MtfeJhzuar71HK833HFowy8D/wtFdnbEvfVb8mRLhANs2nG8GbY9Z
         z22A==
X-Gm-Message-State: AOAM530TaTm6c38n6o0M4hGMS55WTNw2Ujknuft9npb1rx8p+70uZzhz
        /NkICA7dwnzwTPNYml5QA0Xcuw==
X-Google-Smtp-Source: ABdhPJx4ZmvUrrA8jrXcstfyYpHmx/MurkeM5ac5qOudm3eTphho4ODrP1gQQJWpEx1sXanpYNrz4g==
X-Received: by 2002:a4a:9cc3:: with SMTP id d3mr561837ook.4.1604551834112;
        Wed, 04 Nov 2020 20:50:34 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm100553ooi.41.2020.11.04.20.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 20:50:33 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] remoteproc: qcom: q6v5: Query sysmon before graceful shutdown
Date:   Wed,  4 Nov 2020 20:50:50 -0800
Message-Id: <20201105045051.1365780-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Requesting a graceful shutdown through the shared memory state signals
will not be acked in the event that sysmon has already successfully shut
down the remote firmware. So extend the stop request API to optinally
take the remoteproc's sysmon instance and query if there's already been
a successful shutdown attempt, before doing the signal dance.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/remoteproc/qcom_q6v5.c      | 8 +++++++-
 drivers/remoteproc/qcom_q6v5.h      | 3 ++-
 drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  | 2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  | 2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c | 2 +-
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fd6fd36268d9..9627a950928e 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -13,6 +13,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/remoteproc.h>
+#include "qcom_common.h"
 #include "qcom_q6v5.h"
 
 #define Q6V5_PANIC_DELAY_MS	200
@@ -146,15 +147,20 @@ static irqreturn_t q6v5_stop_interrupt(int irq, void *data)
 /**
  * qcom_q6v5_request_stop() - request the remote processor to stop
  * @q6v5:	reference to qcom_q6v5 context
+ * @sysmon:	reference to the remote's sysmon instance, or NULL
  *
  * Return: 0 on success, negative errno on failure
  */
-int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
+int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
 {
 	int ret;
 
 	q6v5->running = false;
 
+	/* Don't perform SMP2P dance if sysmon already shut down the remote */
+	if (qcom_sysmon_shutdown_acked(sysmon))
+		return 0;
+
 	qcom_smem_state_update_bits(q6v5->state,
 				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
 
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index c4ed887c1499..1c212f670cbc 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -8,6 +8,7 @@
 
 struct rproc;
 struct qcom_smem_state;
+struct qcom_sysmon;
 
 struct qcom_q6v5 {
 	struct device *dev;
@@ -40,7 +41,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
-int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index efb2c1aa80a3..9db0380236e7 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -264,7 +264,7 @@ static int adsp_stop(struct rproc *rproc)
 	int handover;
 	int ret;
 
-	ret = qcom_q6v5_request_stop(&adsp->q6v5);
+	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 9a473cfef758..501764934014 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1370,7 +1370,7 @@ static int q6v5_stop(struct rproc *rproc)
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_request_stop(&qproc->q6v5);
+	ret = qcom_q6v5_request_stop(&qproc->q6v5, qproc->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "timed out on wait\n");
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3837f23995e0..ed1772bfa55d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -214,7 +214,7 @@ static int adsp_stop(struct rproc *rproc)
 	int handover;
 	int ret;
 
-	ret = qcom_q6v5_request_stop(&adsp->q6v5);
+	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
 
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 8846ef0b0f1a..d6639856069b 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -390,7 +390,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 	int ret;
 
 	/* WCSS powerdown */
-	ret = qcom_q6v5_request_stop(&wcss->q6v5);
+	ret = qcom_q6v5_request_stop(&wcss->q6v5, wcss->sysmon);
 	if (ret == -ETIMEDOUT) {
 		dev_err(wcss->dev, "timed out on wait\n");
 		return ret;
-- 
2.28.0

