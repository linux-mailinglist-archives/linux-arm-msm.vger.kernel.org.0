Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61152BC3F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 06:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgKVFlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 00:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbgKVFlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 00:41:35 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AB2C0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 21:41:35 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id o25so15850078oie.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 21:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uxioNJ9Dz5N1bJTcNGO+4WH6L1qpmuMjGSsoszz+ZaE=;
        b=PFkpkKceOBIr0TBYveSoUMOMFU0eH5GW8YBPjYyEx3gpqllx11EdVxW27KUkjiFMVM
         EE/udUMkOdtkA0+87g46i5h3nTvjN0eIimbNeSVXsGxgkkH8KGpURKUHjTe4SBfGGNi6
         stdy4uEnadrfOydlixpckPziky/+4nncYvw9hUj6XRSDTJTYqb2e7u9gYrsOBtVWLYCM
         CfWiFv7omroy036DN6JdUSABtssXcvtJph0jVGDFU1STigZ+ApZOGUBamUBlXKHxJba8
         4cfHUuLwMT1xm+cTWBbUFcw32IgsqSQf+INZ1X3YEOhNnu0aVnSLOVngnqZUC3g36TPc
         pN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxioNJ9Dz5N1bJTcNGO+4WH6L1qpmuMjGSsoszz+ZaE=;
        b=gH0DgL62/8q/qAv+c7hPMhwR7EBu+KJeQDia/ZFVB+wBQ2cVthpf8BWB0zIwR9hYSI
         5gVEj5EepM5eca9G2Q0mLr3nufdQfOa/WZEPRzm36I+QZgpaQIZzka04yNtGfURR13ST
         Xd++mF/yYbizK+fipsLBZba3JmHsqAjj9hZzGIxmYW0NjXUif+rUWdG1u1BWgWGPoUsu
         h7IsareBILaTznLa54CTH6oQcsm7RS8wEOQrYyOhtb/xK8T6fO5EuukC2j4BiA4VBuhB
         hnTAfZNVyJvKv4n3gFP233chKdqSTrXUJuDfbxIp66hTR8Xvidp+R+Coy7WghBW/D2GP
         HLxA==
X-Gm-Message-State: AOAM5336wdkLUuvCSf4oWf27I0lNzMQDhJJQTLShB6IehGqj3gmr67cb
        4vNaNWYC2MUW3qzzx+zAqkEtTQ==
X-Google-Smtp-Source: ABdhPJyyGT5KbeBIkpt56QyndMzf+OOeuNWg+/InHojhwHsTZ+799ij/wr9vqnnxWzu/2dBWpqCV+A==
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr11814504oie.126.1606023695179;
        Sat, 21 Nov 2020 21:41:35 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4303132otr.4.2020.11.21.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:41:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 2/4] remoteproc: sysmon: Expose the shutdown result
Date:   Sat, 21 Nov 2020 21:41:33 -0800
Message-Id: <20201122054135.802935-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201122054135.802935-1-bjorn.andersson@linaro.org>
References: <20201122054135.802935-1-bjorn.andersson@linaro.org>
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

Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v2:
- None

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
index b37b111b15b3..a428b707a6de 100644
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
@@ -510,6 +533,9 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		.subsys_name = sysmon->name,
 		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
 	};
+	bool acked;
+
+	sysmon->shutdown_acked = false;
 
 	mutex_lock(&sysmon->state_lock);
 	sysmon->state = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
@@ -521,9 +547,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
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
@@ -681,6 +709,22 @@ void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
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

