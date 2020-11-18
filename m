Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87C62B829B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 18:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgKRRDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 12:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgKRRDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 12:03:20 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02E1C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 09:03:18 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id s8so2879259wrw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tHZNVtWV03wSSvt4VtOznFOQfn700bs7DZF5bDl/1hQ=;
        b=PycsmBXTWZTus1KYTPmF4oGleYgdhSLv1aXStm0xGjWjhKTnM1SCNSN0AwBOm1VT6A
         flIDpXbIoaJMUTcgkkEvXzBxD4nW2w0Z0BINIWH5CecWVZR448hJV0h889KMfaY5HGzH
         meWBkWmndzR0vsHkaJpUeY/2IkNR5T1sXFG+OdK86W/k6FbHSkXZvz69BftXR7CN6Yhg
         KoGxpqfutId+C7CZXoe+KpaZiY0rxKBtiiXfbL3KwCXZ04WGo7SB+be8AeYvdyfICLRl
         wa4EvZmNXNh2e25POTvTcmsoycB1forodFjpoRGl3KoHeksOF+TxmKL7fU/+9rpJg5Tt
         v7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tHZNVtWV03wSSvt4VtOznFOQfn700bs7DZF5bDl/1hQ=;
        b=eM6sg3p2q7HPtX/ekeTqJuLgE4jFQ70hgAZO/d+PZDVsrCUEp/Qq5AIvenmINqthpv
         4AnuOIWdNWrArhJDOS2fGvpPQ3sngRFrC0WhfgNWSCBtq3QKCPJFBSPCa97l4ulZ4l13
         iTo4O9ct3qpztboPAfZbfn4G3HhUPfsxGqjoPQfc34qe/bAO/M5SH6igeN15l7GU2tCC
         ISqkmO4f0LoAsT92sRIlvElNzw/pojkAUItK14nmOkWVsV2rMCoIYgwGpViYqjhLJ2t8
         na50ZrqjM+6RnzRd6dfuXAIcbcds9l9PaTbVzIgO/MsJdMR35fNYQFhA6JWGtgSminxp
         6l7A==
X-Gm-Message-State: AOAM531TDgvd5vGOKbZF8FpULKwqs039T/vBhZ29Xzn4Kuu1DhgQ/omU
        yp7vlU8VnjrDksFJlP8sImBe4Q==
X-Google-Smtp-Source: ABdhPJwEJ44xJF+widQnqNKYzPyysZEA4M2iF2krE5ccYKsEXq033m9D898E1yasLA+f2s1bf4jyZg==
X-Received: by 2002:adf:a198:: with SMTP id u24mr4381933wru.219.1605718997272;
        Wed, 18 Nov 2020 09:03:17 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id x13sm44233wmi.20.2020.11.18.09.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 09:03:16 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     srinivas.kandagatla@linaro.org, srini@kernel.org
Cc:     bjorn.andersson@linaro.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] slimbus: qcom-ngd-ctrl: add Sub System Restart support
Date:   Wed, 18 Nov 2020 17:02:45 +0000
Message-Id: <20201118170246.16588-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201118170246.16588-1-srinivas.kandagatla@linaro.org>
References: <20201118170246.16588-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds SSR(SubSystem Restart) support which includes, synchronisation
between SSR and QMI server notifications. Also with this patch now NGD is taken
down by SSR instead of QMI server down notification.

NGD up path now relies on both SSR and QMI notifications and particularly
sequence of SSR up followed by QMI server up notification.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/Kconfig         |  1 +
 drivers/slimbus/qcom-ngd-ctrl.c | 97 +++++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 8cd595148d17..7c950948a9ec 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -25,6 +25,7 @@ config SLIM_QCOM_NGD_CTRL
 	depends on HAS_IOMEM && DMA_ENGINE && NET
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_QMI_HELPERS
+	select QCOM_RPROC_COMMON
 	help
 	  Select driver if Qualcomm's SLIMbus Satellite Non-Generic Device
 	  Component is programmed using Linux kernel.
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 218aefc3531c..f62693653d2b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -13,6 +13,9 @@
 #include <linux/slimbus.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of.h>
 #include <linux/io.h>
 #include <linux/soc/qcom/qmi.h>
@@ -155,8 +158,14 @@ struct qcom_slim_ngd_ctrl {
 	struct qcom_slim_ngd_dma_desc txdesc[QCOM_SLIM_NGD_DESC_NUM];
 	struct completion reconf;
 	struct work_struct m_work;
+	struct work_struct ngd_up_work;
 	struct workqueue_struct *mwq;
+	struct completion qmi_up;
 	spinlock_t tx_buf_lock;
+	struct mutex tx_lock;
+	struct mutex ssr_lock;
+	struct notifier_block nb;
+	void *notifier;
 	enum qcom_slim_ngd_state state;
 	dma_addr_t rx_phys_base;
 	dma_addr_t tx_phys_base;
@@ -868,14 +877,18 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	if (txn->msg && txn->msg->wbuf)
 		memcpy(puc, txn->msg->wbuf, txn->msg->num_bytes);
 
+	mutex_lock(&ctrl->tx_lock);
 	ret = qcom_slim_ngd_tx_msg_post(ctrl, pbuf, txn->rl);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&ctrl->tx_lock);
 		return ret;
+	}
 
 	timeout = wait_for_completion_timeout(&tx_sent, HZ);
 	if (!timeout) {
 		dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 					txn->mt);
+		mutex_unlock(&ctrl->tx_lock);
 		return -ETIMEDOUT;
 	}
 
@@ -884,10 +897,12 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 		if (!timeout) {
 			dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x",
 				txn->mc, txn->mt);
+			mutex_unlock(&ctrl->tx_lock);
 			return -ETIMEDOUT;
 		}
 	}
 
+	mutex_unlock(&ctrl->tx_lock);
 	return 0;
 }
 
@@ -1200,6 +1215,13 @@ static void qcom_slim_ngd_master_worker(struct work_struct *work)
 	}
 }
 
+static int qcom_slim_ngd_update_device_status(struct device *dev, void *null)
+{
+	slim_report_absent(to_slim_device(dev));
+
+	return 0;
+}
+
 static int qcom_slim_ngd_runtime_resume(struct device *dev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = dev_get_drvdata(dev);
@@ -1267,7 +1289,7 @@ static int qcom_slim_ngd_qmi_new_server(struct qmi_handle *hdl,
 	qmi->svc_info.sq_node = service->node;
 	qmi->svc_info.sq_port = service->port;
 
-	qcom_slim_ngd_enable(ctrl, true);
+	complete(&ctrl->qmi_up);
 
 	return 0;
 }
@@ -1280,10 +1302,9 @@ static void qcom_slim_ngd_qmi_del_server(struct qmi_handle *hdl,
 	struct qcom_slim_ngd_ctrl *ctrl =
 		container_of(qmi, struct qcom_slim_ngd_ctrl, qmi);
 
+	reinit_completion(&ctrl->qmi_up);
 	qmi->svc_info.sq_node = 0;
 	qmi->svc_info.sq_port = 0;
-
-	qcom_slim_ngd_enable(ctrl, false);
 }
 
 static struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops = {
@@ -1333,6 +1354,64 @@ static const struct of_device_id qcom_slim_ngd_dt_match[] = {
 
 MODULE_DEVICE_TABLE(of, qcom_slim_ngd_dt_match);
 
+static void qcom_slim_ngd_down(struct qcom_slim_ngd_ctrl *ctrl)
+{
+	mutex_lock(&ctrl->ssr_lock);
+	device_for_each_child(ctrl->ctrl.dev, NULL,
+			      qcom_slim_ngd_update_device_status);
+	qcom_slim_ngd_enable(ctrl, false);
+	mutex_unlock(&ctrl->ssr_lock);
+}
+
+static void qcom_slim_ngd_up_worker(struct work_struct *work)
+{
+	struct qcom_slim_ngd_ctrl *ctrl;
+
+	ctrl = container_of(work, struct qcom_slim_ngd_ctrl, ngd_up_work);
+
+	/* Make sure qmi service is up before continuing */
+	wait_for_completion_interruptible(&ctrl->qmi_up);
+
+	mutex_lock(&ctrl->ssr_lock);
+	qcom_slim_ngd_enable(ctrl, true);
+	mutex_unlock(&ctrl->ssr_lock);
+}
+
+static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
+					unsigned long action)
+{
+	switch (action) {
+        case QCOM_SSR_BEFORE_SHUTDOWN:
+		/* Make sure the last dma xfer is finished */
+		mutex_lock(&ctrl->tx_lock);
+		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
+			pm_runtime_get_noresume(ctrl->dev);
+			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
+			qcom_slim_ngd_down(ctrl);
+			qcom_slim_ngd_exit_dma(ctrl);
+		}
+		mutex_unlock(&ctrl->tx_lock);
+                break;
+        case QCOM_SSR_AFTER_POWERUP:
+		schedule_work(&ctrl->ngd_up_work);
+		break;
+        default:
+                break;
+        }
+
+        return NOTIFY_OK;
+}
+
+static int qcom_slim_ngd_ssr_notify(struct notifier_block *nb,
+				    unsigned long action,
+				    void *data)
+{
+	struct qcom_slim_ngd_ctrl *ctrl = container_of(nb,
+					       struct qcom_slim_ngd_ctrl, nb);
+
+	return qcom_slim_ngd_ssr_pdr_notify(ctrl, action);
+}
+
 static int of_qcom_slim_ngd_register(struct device *parent,
 				     struct qcom_slim_ngd_ctrl *ctrl)
 {
@@ -1397,6 +1476,7 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	}
 
 	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
+	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
 	ctrl->mwq = create_singlethread_workqueue("ngd_master");
 	if (!ctrl->mwq) {
 		dev_err(&pdev->dev, "Failed to start master worker\n");
@@ -1444,6 +1524,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
+	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
+	if (IS_ERR(ctrl->notifier))
+		return PTR_ERR(ctrl->notifier);
+
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
 	ctrl->framer.superfreq =
@@ -1457,9 +1542,12 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
 
+	mutex_init(&ctrl->tx_lock);
+	mutex_init(&ctrl->ssr_lock);
 	spin_lock_init(&ctrl->tx_buf_lock);
 	init_completion(&ctrl->reconf);
 	init_completion(&ctrl->qmi.qmi_comp);
+	init_completion(&ctrl->qmi_up);
 
 	platform_driver_register(&qcom_slim_ngd_driver);
 	return of_qcom_slim_ngd_register(dev, ctrl);
@@ -1477,6 +1565,7 @@ static int qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
-- 
2.21.0

