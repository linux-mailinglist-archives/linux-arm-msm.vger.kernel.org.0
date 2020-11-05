Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F322A76A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 05:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731230AbgKEEuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 23:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730737AbgKEEud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 23:50:33 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D91C0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 20:50:33 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id i18so302696ots.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 20:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0AMfzJQSHdnGOYZqMbBXX9tseE50EVF4YR2bSIdLe74=;
        b=PPET8LLKlL/3si+aNNv7BOs1O+rwB3JVqNTsq0aFIm/JVqMT9eplyCNqgJ+JAKQofe
         d6NYoWOjL2wi2VFtMyJnPxWEF/A2XlzI8OW8Vt26dzsP5r/es5NDTeMtG6XpqZxFvyvB
         ESs04WnX21nn7MAqMnAwQGOLJUbjJLR2fSpO8UTcjzTaUyCi1RWGeLLTxgagjCz/ymlE
         yTv+4bnvpYz++eDqfKIIbhtpsGkyWqOqJ2Hi4AObBYGfazImOeCQHoXzcRypBkTJ5pfv
         vZp4zGRdArrIlqO78Jxj/SCGdz3EmjA0Ta0cdrIm6ICTunc9FP4qlM4KdBsclPqXRoBe
         TG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0AMfzJQSHdnGOYZqMbBXX9tseE50EVF4YR2bSIdLe74=;
        b=BG5jpEJUeO+8jfau24kNGgEoHPc3PG9UdddFfSa4m+bbSz7axtrGghK3n0CQ6KZPto
         UNcOed6StPwf+DVl0P09Sgs4GNzVhAflHJKy6I/E3WeBWD4xzLbGvCe5/SUhM5WemXP/
         +K82vhXicCClQXX/BVQATssZBWGxidFK64vkguF7Y2EcG62J5hjMLb4gRmsGFj5QaMlG
         Dh0NpPuH22xmc0B5+OB1LHQO7n56zm7xWOe0U/xp+QMq4e8Icirv1dWyojOuLcGc5PXV
         CMXfmgfOnEViPZidgSDEfrk2iwmkLMIwyS4yZlDXjHGk0ZZ5O2i/lmuW0ILolvxvgrON
         xsgg==
X-Gm-Message-State: AOAM531dhYyTOYLYfcnp2jPVMXjcramGPcQdptO1EA66JUHj8xuW+6IE
        ljU+NdqevoDFgbDLZRpF0566MpiwpXAqwQ==
X-Google-Smtp-Source: ABdhPJwcQsdhkwET5pl7CJPqv/BumVDviK7CSwbVN1yVJNzQSMnsLW0S7LwnZeiOF+0RckMkJFCIYA==
X-Received: by 2002:a9d:6b08:: with SMTP id g8mr424994otp.272.1604551832794;
        Wed, 04 Nov 2020 20:50:32 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm100553ooi.41.2020.11.04.20.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 20:50:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] remoteproc: sysmon: Expose the shutdown result
Date:   Wed,  4 Nov 2020 20:50:49 -0800
Message-Id: <20201105045051.1365780-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A graceful shutdown of the Qualcomm remote processors where
traditionally performed by invoking a shared memory state signal and
waiting for the associated ack.

This was later superseded by the "sysmon" mechanism, where some form of
shared memory bus is used to send a "graceful shutdown request" message
and one of more signals comes back to indicate its success.

But when this newer mechanism is in effect the firmware is shut down by
the time the older mechanism, implemented in the remoteproc drivers,
attempts to perform a graceful shutdown - and as such it will never
receive an ack back.

This patch therefor track the success of the latest shutdown attempt in
sysmon and exposes a new function in the API that the remoteproc driver
can use to query the success and the necessity of invoking the older
mechanism.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/remoteproc/qcom_common.h |  6 +++
 drivers/remoteproc/qcom_sysmon.c | 82 ++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index dfc641c3a98b..8ba9052955bd 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -51,6 +51,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   const char *name,
 					   int ssctl_instance);
 void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
+bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
 #else
 static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 							 const char *name,
@@ -62,6 +63,11 @@ static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 static inline void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
 {
 }
+
+static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 38f63c968fa8..1c42f00010d3 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -44,6 +44,7 @@ struct qcom_sysmon {
 	struct mutex lock;
 
 	bool ssr_ack;
+	bool shutdown_acked;
 
 	struct qmi_handle qmi;
 	struct sockaddr_qrtr ssctl;
@@ -115,10 +116,13 @@ static void sysmon_send_event(struct qcom_sysmon *sysmon,
 /**
  * sysmon_request_shutdown() - request graceful shutdown of remote
  * @sysmon:	sysmon context
+ *
+ * Return: boolean indicator of the remote processor acking the request
  */
-static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
+static bool sysmon_request_shutdown(struct qcom_sysmon *sysmon)
 {
 	char *req = "ssr:shutdown";
+	bool acked = false;
 	int ret;
 
 	mutex_lock(&sysmon->lock);
@@ -141,9 +145,13 @@ static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
 	if (!sysmon->ssr_ack)
 		dev_err(sysmon->dev,
 			"unexpected response to sysmon shutdown request\n");
+	else
+		acked = true;
 
 out_unlock:
 	mutex_unlock(&sysmon->lock);
+
+	return acked;
 }
 
 static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
@@ -297,14 +305,33 @@ static struct qmi_msg_handler qmi_indication_handler[] = {
 	{}
 };
 
+static bool ssctl_request_shutdown_wait(struct qcom_sysmon *sysmon)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&sysmon->shutdown_comp, 10 * HZ);
+	if (ret)
+		return true;
+
+	ret = try_wait_for_completion(&sysmon->ind_comp);
+	if (ret)
+		return true;
+
+	dev_err(sysmon->dev, "timeout waiting for shutdown ack\n");
+	return false;
+}
+
 /**
  * ssctl_request_shutdown() - request shutdown via SSCTL QMI service
  * @sysmon:	sysmon context
+ *
+ * Return: boolean indicator of the remote processor acking the request
  */
-static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
+static bool ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 {
 	struct ssctl_shutdown_resp resp;
 	struct qmi_txn txn;
+	bool acked = false;
 	int ret;
 
 	reinit_completion(&sysmon->ind_comp);
@@ -312,7 +339,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, &resp);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
-		return;
+		return false;
 	}
 
 	ret = qmi_send_request(&sysmon->qmi, &sysmon->ssctl, &txn,
@@ -320,27 +347,23 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to send shutdown request\n");
 		qmi_txn_cancel(&txn);
-		return;
+		return false;
 	}
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sysmon->dev, "failed receiving QMI response\n");
-	else if (resp.resp.result)
+	} else if (resp.resp.result) {
 		dev_err(sysmon->dev, "shutdown request failed\n");
-	else
+	} else {
 		dev_dbg(sysmon->dev, "shutdown request completed\n");
-
-	if (sysmon->shutdown_irq > 0) {
-		ret = wait_for_completion_timeout(&sysmon->shutdown_comp,
-						  10 * HZ);
-		if (!ret) {
-			ret = try_wait_for_completion(&sysmon->ind_comp);
-			if (!ret)
-				dev_err(sysmon->dev,
-					"timeout waiting for shutdown ack\n");
-		}
+		acked = true;
 	}
+
+	if (sysmon->shutdown_irq > 0)
+		return ssctl_request_shutdown_wait(sysmon);
+
+	return acked;
 }
 
 /**
@@ -508,6 +531,9 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		.subsys_name = sysmon->name,
 		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
 	};
+	bool acked;
+
+	sysmon->shutdown_acked = false;
 
 	mutex_lock(&sysmon->state_lock);
 	sysmon->state = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
@@ -519,9 +545,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		return;
 
 	if (sysmon->ssctl_version)
-		ssctl_request_shutdown(sysmon);
+		acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
-		sysmon_request_shutdown(sysmon);
+		acked = sysmon_request_shutdown(sysmon);
+
+	sysmon->shutdown_acked = acked;
 }
 
 static void sysmon_unprepare(struct rproc_subdev *subdev)
@@ -679,6 +707,22 @@ void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_sysmon_subdev);
 
+/**
+ * qcom_sysmon_shutdown_acked() - query the success of the last shutdown
+ * @sysmon:	sysmon context
+ *
+ * When sysmon is used to request a graceful shutdown of the remote processor
+ * this can be used by the remoteproc driver to query the success, in order to
+ * know if it should fall back to other means of requesting a shutdown.
+ *
+ * Return: boolean indicator of the success of the last shutdown request
+ */
+bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
+{
+	return sysmon && sysmon->shutdown_acked;
+}
+EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
+
 /**
  * sysmon_probe() - probe sys_mon channel
  * @rpdev:	rpmsg device handle
-- 
2.28.0

