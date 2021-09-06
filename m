Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4584017DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240888AbhIFI0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:26:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27955 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240865AbhIFI0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:26:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630916701; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=auLomwUCulcodaVTVig9OHUV2sfR4cNS2YohiAmD/T0=; b=vOf1RE9vQIdyLkLJ2giFS5JJ/jGKIgCrOOn3FbkqI9HBECXghwXM7FrCrgWIqRr8nM9oh5e7
 Kr0UmYNEyQF9Y2CgDAoFH3FamLX+TXGBS/UtttGiUxFoQ5wv9LLDgUOBRBrRxJlDhjiPbNEo
 hL175dwdRdifQhIOopZrBwdhc4Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6135d044e0fcecca19e49e53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:24:36
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA377C43635; Mon,  6 Sep 2021 08:24:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4711AC43616;
        Mon,  6 Sep 2021 08:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4711AC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6 04/13] remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state
Date:   Mon,  6 Sep 2021 13:53:48 +0530
Message-Id: <1630916637-4278-5-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
References: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The power domains exposed by the AOSS QMP driver control the load state
resources linked to modem, adsp, cdsp remoteprocs. These are used to
notify the Always on Subsystem (AOSS) that a particular co-processor is
up/down. AOSS uses this information to wait for the co-processors to
suspend before starting its sleep sequence.

These co-processors enter low-power modes independent to that of the
application processor and the load state resources linked to them are
expected to remain unaltered across system suspend/resume cycles. To
achieve this behavior lets stop using the power-domains exposed by the
AOSS QMP node and replace them with generic qmp_send interface instead.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/remoteproc/qcom_q6v5.c      | 57 ++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5.h      |  7 ++-
 drivers/remoteproc/qcom_q6v5_adsp.c |  7 ++-
 drivers/remoteproc/qcom_q6v5_mss.c  | 44 ++++---------------
 drivers/remoteproc/qcom_q6v5_pas.c  | 85 +++++++++----------------------------
 drivers/remoteproc/qcom_q6v5_wcss.c |  4 +-
 6 files changed, 96 insertions(+), 108 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 7e9244c748da..eada7e34f3af 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -16,8 +16,30 @@
 #include "qcom_common.h"
 #include "qcom_q6v5.h"
 
+#define Q6V5_LOAD_STATE_MSG_LEN	64
 #define Q6V5_PANIC_DELAY_MS	200
 
+static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
+{
+	char buf[Q6V5_LOAD_STATE_MSG_LEN];
+	int ret;
+
+	if (!q6v5->qmp)
+		return 0;
+
+	ret = snprintf(buf, sizeof(buf),
+		       "{class: image, res: load_state, name: %s, val: %s}",
+		       q6v5->load_state, enable ? "on" : "off");
+
+	WARN_ON(ret >= Q6V5_LOAD_STATE_MSG_LEN);
+
+	ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
+	if (ret)
+		dev_err(q6v5->dev, "failed to toggle load state\n");
+
+	return ret;
+}
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -26,6 +48,12 @@
  */
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 {
+	int ret;
+
+	ret = q6v5_load_state_toggle(q6v5, true);
+	if (ret)
+		return ret;
+
 	reinit_completion(&q6v5->start_done);
 	reinit_completion(&q6v5->stop_done);
 
@@ -47,6 +75,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 {
 	disable_irq(q6v5->handover_irq);
+	q6v5_load_state_toggle(q6v5, false);
 
 	return !q6v5->handover_issued;
 }
@@ -196,12 +225,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  * @pdev:	platform_device reference for acquiring resources
  * @rproc:	associated remoteproc instance
  * @crash_reason: SMEM id for crash reason string, or 0 if none
+ * @load_state: load state resource string
  * @handover:	function to be called when proxy resources should be released
  *
  * Return: 0 on success, negative errno on failure
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason,
+		   struct rproc *rproc, int crash_reason, const char *load_state,
 		   void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
@@ -286,9 +316,34 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		return PTR_ERR(q6v5->state);
 	}
 
+	q6v5->load_state = devm_kstrdup_const(&pdev->dev, load_state, GFP_KERNEL);
+	q6v5->qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(q6v5->qmp)) {
+		if (PTR_ERR(q6v5->qmp) != -ENODEV)
+			return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->qmp),
+					     "failed to acquire load state\n");
+		q6v5->qmp = NULL;
+	} else if (!q6v5->load_state) {
+		if (!load_state)
+			dev_err(&pdev->dev, "load state resource string empty\n");
+
+		qmp_put(q6v5->qmp);
+		return load_state ? -ENOMEM : -EINVAL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_init);
 
+/**
+ * qcom_q6v5_deinit() - deinitialize the q6v5 common struct
+ * @q6v5:	reference to qcom_q6v5 context to be deinitialized
+ */
+void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5)
+{
+	qmp_put(q6v5->qmp);
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_deinit);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Q6V5");
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 1c212f670cbc..f35e04471ed7 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/completion.h>
+#include <linux/soc/qcom/qcom_aoss.h>
 
 struct rproc;
 struct qcom_smem_state;
@@ -15,6 +16,8 @@ struct qcom_q6v5 {
 	struct rproc *rproc;
 
 	struct qcom_smem_state *state;
+	struct qmp *qmp;
+
 	unsigned stop_bit;
 
 	int wdog_irq;
@@ -32,12 +35,14 @@ struct qcom_q6v5 {
 
 	bool running;
 
+	const char *load_state;
 	void (*handover)(struct qcom_q6v5 *q6v5);
 };
 
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason,
+		   struct rproc *rproc, int crash_reason, const char *load_state,
 		   void (*handover)(struct qcom_q6v5 *q6v5));
+void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 8b0d8bbacd2e..098362e6e233 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -185,7 +185,9 @@ static int adsp_start(struct rproc *rproc)
 	int ret;
 	unsigned int val;
 
-	qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
@@ -465,7 +467,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_pm;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, NULL,
 			     qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
@@ -500,6 +502,7 @@ static int adsp_remove(struct platform_device *pdev)
 
 	rproc_del(adsp->rproc);
 
+	qcom_q6v5_deinit(&adsp->q6v5);
 	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 423b31dfa574..7a1422bd7925 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -137,7 +137,6 @@ struct rproc_hexagon_res {
 	char **proxy_clk_names;
 	char **reset_clk_names;
 	char **active_clk_names;
-	char **active_pd_names;
 	char **proxy_pd_names;
 	int version;
 	bool need_mem_protection;
@@ -169,12 +168,10 @@ struct q6v5 {
 	struct clk *active_clks[8];
 	struct clk *reset_clks[4];
 	struct clk *proxy_clks[4];
-	struct device *active_pds[1];
 	struct device *proxy_pds[3];
 	int active_clk_count;
 	int reset_clk_count;
 	int proxy_clk_count;
-	int active_pd_count;
 	int proxy_pd_count;
 
 	struct reg_info active_regs[1];
@@ -895,18 +892,14 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	int xfermemop_ret;
 	bool mba_load_err = false;
 
-	qcom_q6v5_prepare(&qproc->q6v5);
-
-	ret = q6v5_pds_enable(qproc, qproc->active_pds, qproc->active_pd_count);
-	if (ret < 0) {
-		dev_err(qproc->dev, "failed to enable active power domains\n");
-		goto disable_irqs;
-	}
+	ret = qcom_q6v5_prepare(&qproc->q6v5);
+	if (ret)
+		return ret;
 
 	ret = q6v5_pds_enable(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 	if (ret < 0) {
 		dev_err(qproc->dev, "failed to enable proxy power domains\n");
-		goto disable_active_pds;
+		goto disable_irqs;
 	}
 
 	ret = q6v5_regulator_enable(qproc, qproc->fallback_proxy_regs,
@@ -1039,8 +1032,6 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 			       qproc->fallback_proxy_reg_count);
 disable_proxy_pds:
 	q6v5_pds_disable(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
-disable_active_pds:
-	q6v5_pds_disable(qproc, qproc->active_pds, qproc->active_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&qproc->q6v5);
 
@@ -1076,7 +1067,6 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 			 qproc->active_clk_count);
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 			       qproc->active_reg_count);
-	q6v5_pds_disable(qproc, qproc->active_pds, qproc->active_pd_count);
 
 	/* In case of failure or coredump scenario where reclaiming MBA memory
 	 * could not happen reclaim it here.
@@ -1756,14 +1746,6 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_reg_count = ret;
 
-	ret = q6v5_pds_attach(&pdev->dev, qproc->active_pds,
-			      desc->active_pd_names);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to attach active power domains\n");
-		goto free_rproc;
-	}
-	qproc->active_pd_count = ret;
-
 	ret = q6v5_pds_attach(&pdev->dev, qproc->proxy_pds,
 			      desc->proxy_pd_names);
 	/* Fallback to regulators for old device trees */
@@ -1773,12 +1755,12 @@ static int q6v5_probe(struct platform_device *pdev)
 					  desc->fallback_proxy_supply);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Failed to get fallback proxy regulators.\n");
-			goto detach_active_pds;
+			goto free_rproc;
 		}
 		qproc->fallback_proxy_reg_count = ret;
 	} else if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to init power domains\n");
-		goto detach_active_pds;
+		goto free_rproc;
 	} else {
 		qproc->proxy_pd_count = ret;
 	}
@@ -1792,7 +1774,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->need_mem_protection = desc->need_mem_protection;
 	qproc->has_mba_logs = desc->has_mba_logs;
 
-	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
+	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
 			     qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
@@ -1822,8 +1804,6 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 detach_proxy_pds:
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
-detach_active_pds:
-	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 free_rproc:
 	rproc_free(rproc);
 
@@ -1837,13 +1817,13 @@ static int q6v5_remove(struct platform_device *pdev)
 
 	rproc_del(rproc);
 
+	qcom_q6v5_deinit(&qproc->q6v5);
 	qcom_remove_sysmon_subdev(qproc->sysmon);
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
-	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 
 	rproc_free(rproc);
 
@@ -1867,10 +1847,6 @@ static const struct rproc_hexagon_res sc7180_mss = {
 		"nav",
 		NULL
 	},
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mx",
@@ -1903,10 +1879,6 @@ static const struct rproc_hexagon_res sdm845_mss = {
 			"mnoc_axi",
 			NULL
 	},
-	.active_pd_names = (char*[]){
-			"load_state",
-			NULL
-	},
 	.proxy_pd_names = (char*[]){
 			"cx",
 			"mx",
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 401b1ec90785..7036e6e9eff4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -37,9 +37,9 @@ struct adsp_data {
 	bool has_aggre2_clk;
 	bool auto_boot;
 
-	char **active_pd_names;
 	char **proxy_pd_names;
 
+	const char *load_state;
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -57,10 +57,8 @@ struct qcom_adsp {
 	struct regulator *cx_supply;
 	struct regulator *px_supply;
 
-	struct device *active_pds[1];
 	struct device *proxy_pds[3];
 
-	int active_pd_count;
 	int proxy_pd_count;
 
 	int pas_id;
@@ -149,15 +147,13 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int ret;
 
-	qcom_q6v5_prepare(&adsp->q6v5);
-
-	ret = adsp_pds_enable(adsp, adsp->active_pds, adsp->active_pd_count);
-	if (ret < 0)
-		goto disable_irqs;
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		return ret;
 
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
-		goto disable_active_pds;
+		goto disable_irqs;
 
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
@@ -201,8 +197,6 @@ static int adsp_start(struct rproc *rproc)
 	clk_disable_unprepare(adsp->xo);
 disable_proxy_pds:
 	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
-disable_active_pds:
-	adsp_pds_disable(adsp, adsp->active_pds, adsp->active_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
@@ -234,7 +228,6 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
-	adsp_pds_disable(adsp, adsp->active_pds, adsp->active_pd_count);
 	handover = qcom_q6v5_unprepare(&adsp->q6v5);
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
@@ -456,19 +449,13 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_pds_attach(&pdev->dev, adsp->active_pds,
-			      desc->active_pd_names);
-	if (ret < 0)
-		goto free_rproc;
-	adsp->active_pd_count = ret;
-
 	ret = adsp_pds_attach(&pdev->dev, adsp->proxy_pds,
 			      desc->proxy_pd_names);
 	if (ret < 0)
-		goto detach_active_pds;
+		goto free_rproc;
 	adsp->proxy_pd_count = ret;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
 			     qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
@@ -492,8 +479,6 @@ static int adsp_probe(struct platform_device *pdev)
 
 detach_proxy_pds:
 	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
-detach_active_pds:
-	adsp_pds_detach(adsp, adsp->active_pds, adsp->active_pd_count);
 free_rproc:
 	rproc_free(rproc);
 
@@ -506,6 +491,7 @@ static int adsp_remove(struct platform_device *pdev)
 
 	rproc_del(adsp->rproc);
 
+	qcom_q6v5_deinit(&adsp->q6v5);
 	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
@@ -532,14 +518,11 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.pas_id = 1,
 		.has_aggre2_clk = false,
 		.auto_boot = true,
-		.active_pd_names = (char*[]){
-			"load_state",
-			NULL
-		},
 		.proxy_pd_names = (char*[]){
 			"cx",
 			NULL
 		},
+		.load_state = "adsp",
 		.ssr_name = "lpass",
 		.sysmon_name = "adsp",
 		.ssctl_id = 0x14,
@@ -551,15 +534,12 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.pas_id = 1,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"lcx",
 		"lmx",
 		NULL
 	},
+	.load_state = "adsp",
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
@@ -571,15 +551,12 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.pas_id = 1,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"lcx",
 		"lmx",
 		NULL
 	},
+	.load_state = "adsp",
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
@@ -617,14 +594,11 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.pas_id = 18,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"cx",
 		NULL
 	},
+	.load_state = "cdsp",
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
@@ -636,14 +610,11 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.pas_id = 18,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"cx",
 		NULL
 	},
+	.load_state = "cdsp",
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
@@ -655,14 +626,11 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.pas_id = 18,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"cx",
 		NULL
 	},
+	.load_state = "cdsp",
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
@@ -675,15 +643,12 @@ static const struct adsp_data mpss_resource_init = {
 	.minidump_id = 3,
 	.has_aggre2_clk = false,
 	.auto_boot = false,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mss",
 		NULL
 	},
+	.load_state = "modem",
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
@@ -695,14 +660,11 @@ static const struct adsp_data sc8180x_mpss_resource = {
 	.pas_id = 4,
 	.has_aggre2_clk = false,
 	.auto_boot = false,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"cx",
 		NULL
 	},
+	.load_state = "modem",
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
@@ -725,15 +687,12 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.pas_id = 12,
 		.has_aggre2_clk = false,
 		.auto_boot = true,
-		.active_pd_names = (char*[]){
-			"load_state",
-			NULL
-		},
 		.proxy_pd_names = (char*[]){
 			"lcx",
 			"lmx",
 			NULL
 		},
+		.load_state = "slpi",
 		.ssr_name = "dsps",
 		.sysmon_name = "slpi",
 		.ssctl_id = 0x16,
@@ -745,15 +704,12 @@ static const struct adsp_data sm8250_slpi_resource = {
 	.pas_id = 12,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"lcx",
 		"lmx",
 		NULL
 	},
+	.load_state = "slpi",
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
@@ -765,15 +721,12 @@ static const struct adsp_data sm8350_slpi_resource = {
 	.pas_id = 12,
 	.has_aggre2_clk = false,
 	.auto_boot = true,
-	.active_pd_names = (char*[]){
-		"load_state",
-		NULL
-	},
 	.proxy_pd_names = (char*[]){
 		"lcx",
 		"lmx",
 		NULL
 	},
+	.load_state = "slpi",
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 20d50ec7eff1..0689288a2425 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1044,8 +1044,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
 	if (ret)
 		goto free_rproc;
 
@@ -1075,6 +1074,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
+	qcom_q6v5_deinit(&qproc->q6v5);
 	rproc_del(rproc);
 	rproc_free(rproc);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

