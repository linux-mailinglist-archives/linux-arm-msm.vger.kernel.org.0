Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB19100E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfKRVnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:45 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:56606
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726910AbfKRVnn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113421;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=flKHUsYs1zOKMZchrBSATu115CvnspEsNpoZHOaPoLw=;
        b=EJ4QRIijrB+7An1yHbQnI3lW+Oqb7ogaoL2vHoF/etVSLgTbQnhBE+lL3Shmg7jx
        9M7JjC/lAFJM9C9+6gCB3SmA/s0VMEByhvpHtGfORG7NYkdB68hiq/IKSoUqf3luxuL
        bJoSgIj83q9YBePkkNq1lEDdkhnC4LnzlYdus7gE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113421;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=flKHUsYs1zOKMZchrBSATu115CvnspEsNpoZHOaPoLw=;
        b=HTArpOCRl9Kqc0OBjSvqlEvXbmJoiti3H6n06HRM1YIPDXg3bVfguw85JuYuPaFU
        umObfFkkR8DUAxqidAp2XBUQIMZIrIXT1oGm1dTsA8bLkAKCeafWckGwMMJHV85LK6S
        3PEMIuvdLUj+RkSARweiJj+l9WXPkIbaNwR8j4do=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76F9EC58C31
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 07/16] remoteproc: qcom: pas: Vote for active/proxy power domains
Date:   Mon, 18 Nov 2019 21:43:41 +0000
Message-ID: <0101016e8078a71a-9ae99638-9e15-49a5-b769-85552526ae89-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8150 SoCs ADSP, CDSP and MPSS need to proxy vote on multiple
rpmh ARC resources and active vote on QMP AOSS Power domains. Add
support to vote for multiple active and proxy power domains.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 137 ++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0fdd3748398aa..b60cca093400a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -15,6 +15,8 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
@@ -32,6 +34,9 @@ struct adsp_data {
 	int pas_id;
 	bool has_aggre2_clk;
 
+	char **active_pd_names;
+	char **proxy_pd_names;
+
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -49,6 +54,12 @@ struct qcom_adsp {
 	struct regulator *cx_supply;
 	struct regulator *px_supply;
 
+	struct device *active_pds[1];
+	struct device *proxy_pds[3];
+
+	int active_pd_count;
+	int proxy_pd_count;
+
 	int pas_id;
 	int crash_reason_smem;
 	bool has_aggre2_clk;
@@ -67,6 +78,41 @@ struct qcom_adsp {
 	struct qcom_sysmon *sysmon;
 };
 
+static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
+			   size_t pd_count)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < pd_count; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = pm_runtime_get_sync(pds[i]);
+		if (ret < 0)
+			goto unroll_pd_votes;
+	}
+
+	return 0;
+
+unroll_pd_votes:
+	for (i--; i >= 0; i--) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+
+	return ret;
+};
+
+static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
+			     size_t pd_count)
+{
+	int i;
+
+	for (i = 0; i < pd_count; i++) {
+		dev_pm_genpd_set_performance_state(pds[i], 0);
+		pm_runtime_put(pds[i]);
+	}
+}
+
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -84,9 +130,17 @@ static int adsp_start(struct rproc *rproc)
 
 	qcom_q6v5_prepare(&adsp->q6v5);
 
+	ret = adsp_pds_enable(adsp, adsp->active_pds, adsp->active_pd_count);
+	if (ret < 0)
+		goto disable_irqs;
+
+	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	if (ret < 0)
+		goto disable_active_pds;
+
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
-		goto disable_irqs;
+		goto disable_proxy_pds;
 
 	ret = clk_prepare_enable(adsp->aggre2_clk);
 	if (ret)
@@ -124,6 +178,10 @@ static int adsp_start(struct rproc *rproc)
 	clk_disable_unprepare(adsp->aggre2_clk);
 disable_xo_clk:
 	clk_disable_unprepare(adsp->xo);
+disable_proxy_pds:
+	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+disable_active_pds:
+	adsp_pds_disable(adsp, adsp->active_pds, adsp->active_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
@@ -138,6 +196,7 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 	regulator_disable(adsp->cx_supply);
 	clk_disable_unprepare(adsp->aggre2_clk);
 	clk_disable_unprepare(adsp->xo);
+	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 }
 
 static int adsp_stop(struct rproc *rproc)
@@ -154,6 +213,7 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
+	adsp_pds_disable(adsp, adsp->active_pds, adsp->active_pd_count);
 	handover = qcom_q6v5_unprepare(&adsp->q6v5);
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
@@ -219,6 +279,59 @@ static int adsp_init_regulator(struct qcom_adsp *adsp)
 	return PTR_ERR_OR_ZERO(adsp->px_supply);
 }
 
+static int adsp_pds_attach(struct device *dev, struct device **devs,
+			   char **pd_names)
+{
+	size_t num_pds = 0;
+	int ret;
+	int i;
+
+	if (!pd_names)
+		return 0;
+
+	/* Handle single power domain */
+	if (dev->pm_domain) {
+		devs[0] = dev;
+		pm_runtime_enable(dev);
+		return 1;
+	}
+
+	while (pd_names[num_pds])
+		num_pds++;
+
+	for (i = 0; i < num_pds; i++) {
+		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
+		if (IS_ERR_OR_NULL(devs[i])) {
+			ret = PTR_ERR(devs[i]) ? : -ENODATA;
+			goto unroll_attach;
+		}
+	}
+
+	return num_pds;
+
+unroll_attach:
+	for (i--; i >= 0; i--)
+		dev_pm_domain_detach(devs[i], false);
+
+	return ret;
+};
+
+static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
+			    size_t pd_count)
+{
+	struct device *dev = adsp->dev;
+	int i;
+
+	/* Handle single power domain */
+	if (dev->pm_domain && pd_count) {
+		pm_runtime_disable(dev);
+		return;
+	}
+
+	for (i = 0; i < pd_count; i++)
+		dev_pm_domain_detach(pds[i], false);
+}
+
 static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 {
 	struct device_node *node;
@@ -294,10 +407,22 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = adsp_pds_attach(&pdev->dev, adsp->active_pds,
+			      desc->active_pd_names);
+	if (ret < 0)
+		goto free_rproc;
+	adsp->active_pd_count = ret;
+
+	ret = adsp_pds_attach(&pdev->dev, adsp->proxy_pds,
+			      desc->proxy_pd_names);
+	if (ret < 0)
+		goto detach_active_pds;
+	adsp->proxy_pd_count = ret;
+
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
 			     qcom_pas_handover);
 	if (ret)
-		goto free_rproc;
+		goto detach_proxy_pds;
 
 	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
@@ -307,15 +432,19 @@ static int adsp_probe(struct platform_device *pdev)
 					      desc->ssctl_id);
 	if (IS_ERR(adsp->sysmon)) {
 		ret = PTR_ERR(adsp->sysmon);
-		goto free_rproc;
+		goto detach_proxy_pds;
 	}
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto free_rproc;
+		goto detach_proxy_pds;
 
 	return 0;
 
+detach_proxy_pds:
+	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+detach_active_pds:
+	adsp_pds_detach(adsp, adsp->active_pds, adsp->active_pd_count);
 free_rproc:
 	rproc_free(rproc);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

