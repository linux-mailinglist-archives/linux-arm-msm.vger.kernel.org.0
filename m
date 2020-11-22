Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6762BC3F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 06:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgKVFlq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 00:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgKVFlg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 00:41:36 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB35C061A4A
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 21:41:36 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id 79so12875940otc.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 21:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Mu+dWZCO3tL9VhrtmkYCgByiYUNNJtCg8o7EBl4LbY=;
        b=Dw43r0cpkVNP4J6hIFwMxTkUOA20gaysCq4H+9QCOnXZSbp7ee/b7HZ5k6XHdg6TL3
         8j9tw8ef9qwdjWzsYYEpo6XRpa5cpL+ekwgtNWGdKEIjRt9vtlh7s7576moo5iDUwl8m
         st1XacbCo2mD9HTFL0bh8fW6TGVcAYuxCZGwjkVHDEx66cC4Gj9jJtyfCq+xU1bU6yh0
         bAsqlGVsZC5MFcZV4zgzLhco2l9t/1kLOTRGHBxZMcgj3cGuoVJ52de1rYWxEChEMQyp
         iCuuuJ3A1JsHDhqJvu/JT1jl0WD4eYpAS8bEXHuAdD6gSvf3Z3zPnvqk4X+GVuPAcZOE
         GLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Mu+dWZCO3tL9VhrtmkYCgByiYUNNJtCg8o7EBl4LbY=;
        b=bWQWWMN+AsOyKoBDD1Iv9bSQQ+gigSm1PAQWJJt9iWkWoifSNXo5Hnv05NjeI7UAx1
         iYp2mfqtyfLfmeOEIbcyFzLD0pyFlwzXaflM0ma6ffqFO/5Dfq8ClZmB7VVc3pZionU/
         R1ScHH+WEPvlB0tVEI9MUwQLBv8nRWiuW/DRcAoVG4zt7AbikoGIHtfmPQaDxw6gj/Aq
         BJUKU9XUNMFN2dDYkbySylvq01NoF42oQYwuKpmPGfpPifkEmJVK0pf/rXSSjyteh17r
         phW/1gj6AVh8jN35exzyWbybLzdAksHeySisE9miJdnMNuqUha5X8taGAn9YBtmkuQqb
         vcsA==
X-Gm-Message-State: AOAM5300qYY/tUPgjb5SBYxUhaubZTOpIhrocAFyyXjSx4BDgvbb60gh
        4MWDTcUarqiy2A6gNQ5m0K1QzA8P1WvsKQ==
X-Google-Smtp-Source: ABdhPJyjiYCewLDWj4DRROyBGjc0tJrW+kPIe/zJJooxQI8y/UHfKPGd0DcDhL5fZlmKKaeFuZNQ1g==
X-Received: by 2002:a05:6830:12c2:: with SMTP id a2mr19346062otq.162.1606023696218;
        Sat, 21 Nov 2020 21:41:36 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4303132otr.4.2020.11.21.21.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:41:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 3/4] remoteproc: qcom: q6v5: Query sysmon before graceful shutdown
Date:   Sat, 21 Nov 2020 21:41:34 -0800
Message-Id: <20201122054135.802935-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201122054135.802935-1-bjorn.andersson@linaro.org>
References: <20201122054135.802935-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Requesting a graceful shutdown through the shared memory state signals
will not be acked in the event that sysmon has already successfully shut
down the remote firmware. So extend the stop request API to optionally
take the remoteproc's sysmon instance and query if there's already been
a successful shutdown attempt, before doing the signal dance.

Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v2:
- Fixed spelling of optionally in commit message

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
index f0b7363b5b26..2f8f38408eb7 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -266,7 +266,7 @@ static int adsp_stop(struct rproc *rproc)
 	int handover;
 	int ret;
 
-	ret = qcom_q6v5_request_stop(&adsp->q6v5);
+	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ac289e08062e..55f7c5740920 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1373,7 +1373,7 @@ static int q6v5_stop(struct rproc *rproc)
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_request_stop(&qproc->q6v5);
+	ret = qcom_q6v5_request_stop(&qproc->q6v5, qproc->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "timed out on wait\n");
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0678b417707e..49ea0133ff04 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -217,7 +217,7 @@ static int adsp_stop(struct rproc *rproc)
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

