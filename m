Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D90726C419
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 17:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIPPW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 11:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgIPPVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 11:21:40 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF637C061A2E;
        Wed, 16 Sep 2020 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254284;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=J+iGngwCGYxclOGTcT3cISjTv2EqEawPbyBBaYfvQ4g=;
        b=oYwTQpUPB+NwwfRrk36R07EOEmhyhBNtuiwcNjvfXSmcakqSw/d6NiHBWfVK/OYA5/
        YSV3Qe4tJfFSp/eA4unQpvD2YdnysvzXkHZ4yPGefq/y615Rti9HeRVy89ubwR58GtEf
        qbCAnL/zzuGW+kRP3Wpo0rYFDx/RZkJF2GeBGBpRL4gxa6et+70kt2ab+DMIrVmxLMck
        asT6OOEVVMaN6v6h+6XEpu0b4eQzldXKzulq49UTHAyjFvet8y4KOHkAF+g7sLdbgPXp
        3DlEkOh/xZN/euUEOPpRA8JrUnM3c0cLoSHH9B+GYQRjIaDpr+vVt+YTPMUT+LGznmRS
        Se7Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfrzlV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:53 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 08/10] remoteproc: qcom_wcnss: Allow replacing regulators with power domains
Date:   Wed, 16 Sep 2020 12:41:33 +0200
Message-Id: <20200916104135.25085-9-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So far we have been doing all proxy votes by voting for raw voltages/load
through the regulator interface. But actually VDDCX and VDDMX represent
power domains that should be preferably managed using corner votes
through the power domain interface.

Looking closer the code was actually never doing the proxy votes
correctly: The vddcx regulator is specified as:

	{ "vddcx", .super_turbo = true },

which is supposed to say that we should vote for the maximum corner
of the VDDCX power domain. But actually "super_turbo" is unused so
all we did so far is to enable the power domain. We did not vote for
it to scale to the maximum performance state.

Using them through the power domain interface allows voting for the
maximum performance state. However, we still need to support using
them through the regulator interface for old device trees.

The way this is implemented here is that we check if attaching the
two power domain succeeds. If yes, we skip the first "num_pd_vregs"
regulators in the "vregs" list and only request the remaining ones.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/remoteproc/qcom_wcnss.c | 109 +++++++++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index e2573f79a137..f95854255c70 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -17,6 +17,8 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
@@ -51,12 +53,15 @@
 #define WCNSS_PMU_XO_MODE_19p2		0
 #define WCNSS_PMU_XO_MODE_48		3
 
+#define WCNSS_MAX_PDS			2
+
 struct wcnss_data {
 	size_t pmu_offset;
 	size_t spare_offset;
 
+	const char *pd_names[WCNSS_MAX_PDS];
 	const struct wcnss_vreg_info *vregs;
-	size_t num_vregs;
+	size_t num_vregs, num_pd_vregs;
 };
 
 struct qcom_wcnss {
@@ -80,6 +85,8 @@ struct qcom_wcnss {
 	struct mutex iris_lock;
 	struct qcom_iris *iris;
 
+	struct device *pds[WCNSS_MAX_PDS];
+	size_t num_pds;
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
 
@@ -111,24 +118,28 @@ static const struct wcnss_data pronto_v1_data = {
 	.pmu_offset = 0x1004,
 	.spare_offset = 0x1088,
 
+	.pd_names = { "mx", "cx" },
 	.vregs = (struct wcnss_vreg_info[]) {
 		{ "vddmx", 950000, 1150000, 0 },
 		{ "vddcx", .super_turbo = true},
 		{ "vddpx", 1800000, 1800000, 0 },
 	},
-	.num_vregs = 3,
+	.num_pd_vregs = 2,
+	.num_vregs = 1,
 };
 
 static const struct wcnss_data pronto_v2_data = {
 	.pmu_offset = 0x1004,
 	.spare_offset = 0x1088,
 
+	.pd_names = { "mx", "cx" },
 	.vregs = (struct wcnss_vreg_info[]) {
 		{ "vddmx", 1287500, 1287500, 0 },
 		{ "vddcx", .super_turbo = true },
 		{ "vddpx", 1800000, 1800000, 0 },
 	},
-	.num_vregs = 3,
+	.num_pd_vregs = 2,
+	.num_vregs = 1,
 };
 
 void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
@@ -219,7 +230,7 @@ static void wcnss_configure_iris(struct qcom_wcnss *wcnss)
 static int wcnss_start(struct rproc *rproc)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
-	int ret;
+	int ret, i;
 
 	mutex_lock(&wcnss->iris_lock);
 	if (!wcnss->iris) {
@@ -228,9 +239,18 @@ static int wcnss_start(struct rproc *rproc)
 		goto release_iris_lock;
 	}
 
+	for (i = 0; i < wcnss->num_pds; i++) {
+		dev_pm_genpd_set_performance_state(wcnss->pds[i], INT_MAX);
+		ret = pm_runtime_get_sync(wcnss->pds[i]);
+		if (ret < 0) {
+			pm_runtime_put_noidle(wcnss->pds[i]);
+			goto disable_pds;
+		}
+	}
+
 	ret = regulator_bulk_enable(wcnss->num_vregs, wcnss->vregs);
 	if (ret)
-		goto release_iris_lock;
+		goto disable_pds;
 
 	ret = qcom_iris_enable(wcnss->iris);
 	if (ret)
@@ -262,6 +282,11 @@ static int wcnss_start(struct rproc *rproc)
 	qcom_iris_disable(wcnss->iris);
 disable_regulators:
 	regulator_bulk_disable(wcnss->num_vregs, wcnss->vregs);
+disable_pds:
+	for (i--; i >= 0; i--) {
+		pm_runtime_put(wcnss->pds[i]);
+		dev_pm_genpd_set_performance_state(wcnss->pds[i], 0);
+	}
 release_iris_lock:
 	mutex_unlock(&wcnss->iris_lock);
 
@@ -371,14 +396,54 @@ static irqreturn_t wcnss_stop_ack_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int wcnss_init_pds(struct qcom_wcnss *wcnss,
+			  const char * const pd_names[WCNSS_MAX_PDS])
+{
+	int i, ret;
+
+	for (i = 0; i < WCNSS_MAX_PDS; i++) {
+		if (!pd_names[i])
+			break;
+
+		wcnss->pds[i] = dev_pm_domain_attach_by_name(wcnss->dev, pd_names[i]);
+		if (IS_ERR_OR_NULL(wcnss->pds[i])) {
+			ret = PTR_ERR(wcnss->pds[i]) ? : -ENODATA;
+			for (i--; i >= 0; i--)
+				dev_pm_domain_detach(wcnss->pds[i], false);
+			return ret;
+		}
+	}
+	wcnss->num_pds = i;
+
+	return 0;
+}
+
+static void wcnss_release_pds(struct qcom_wcnss *wcnss)
+{
+	int i;
+
+	for (i = 0; i < wcnss->num_pds; i++)
+		dev_pm_domain_detach(wcnss->pds[i], false);
+}
+
 static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
 				 const struct wcnss_vreg_info *info,
-				 int num_vregs)
+				 int num_vregs, int num_pd_vregs)
 {
 	struct regulator_bulk_data *bulk;
 	int ret;
 	int i;
 
+	/*
+	 * If attaching the power domains suceeded we can skip requesting
+	 * the regulators for the power domains. For old device trees we need to
+	 * reserve extra space to manage them through the regulator interface.
+	 */
+	if (wcnss->num_pds)
+		info += num_pd_vregs;
+	else
+		num_vregs += num_pd_vregs;
+
 	bulk = devm_kcalloc(wcnss->dev,
 			    num_vregs, sizeof(struct regulator_bulk_data),
 			    GFP_KERNEL);
@@ -514,33 +579,42 @@ static int wcnss_probe(struct platform_device *pdev)
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-	ret = wcnss_init_regulators(wcnss, data->vregs, data->num_vregs);
-	if (ret)
+	/*
+	 * We might need to fallback to regulators instead of power domains
+	 * for old device trees. Don't report an error in that case.
+	 */
+	ret = wcnss_init_pds(wcnss, data->pd_names);
+	if (ret && (ret != -ENODATA || !data->num_pd_vregs))
 		goto free_rproc;
 
+	ret = wcnss_init_regulators(wcnss, data->vregs, data->num_vregs,
+				    data->num_pd_vregs);
+	if (ret)
+		goto detach_pds;
+
 	ret = wcnss_request_irq(wcnss, pdev, "wdog", false, wcnss_wdog_interrupt);
 	if (ret < 0)
-		goto free_rproc;
+		goto detach_pds;
 	wcnss->wdog_irq = ret;
 
 	ret = wcnss_request_irq(wcnss, pdev, "fatal", false, wcnss_fatal_interrupt);
 	if (ret < 0)
-		goto free_rproc;
+		goto detach_pds;
 	wcnss->fatal_irq = ret;
 
 	ret = wcnss_request_irq(wcnss, pdev, "ready", true, wcnss_ready_interrupt);
 	if (ret < 0)
-		goto free_rproc;
+		goto detach_pds;
 	wcnss->ready_irq = ret;
 
 	ret = wcnss_request_irq(wcnss, pdev, "handover", true, wcnss_handover_interrupt);
 	if (ret < 0)
-		goto free_rproc;
+		goto detach_pds;
 	wcnss->handover_irq = ret;
 
 	ret = wcnss_request_irq(wcnss, pdev, "stop-ack", true, wcnss_stop_ack_interrupt);
 	if (ret < 0)
-		goto free_rproc;
+		goto detach_pds;
 	wcnss->stop_ack_irq = ret;
 
 	if (wcnss->stop_ack_irq) {
@@ -548,7 +622,7 @@ static int wcnss_probe(struct platform_device *pdev)
 						   &wcnss->stop_bit);
 		if (IS_ERR(wcnss->state)) {
 			ret = PTR_ERR(wcnss->state);
-			goto free_rproc;
+			goto detach_pds;
 		}
 	}
 
@@ -556,15 +630,17 @@ static int wcnss_probe(struct platform_device *pdev)
 	wcnss->sysmon = qcom_add_sysmon_subdev(rproc, "wcnss", WCNSS_SSCTL_ID);
 	if (IS_ERR(wcnss->sysmon)) {
 		ret = PTR_ERR(wcnss->sysmon);
-		goto free_rproc;
+		goto detach_pds;
 	}
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto free_rproc;
+		goto detach_pds;
 
 	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 
+detach_pds:
+	wcnss_release_pds(wcnss);
 free_rproc:
 	rproc_free(rproc);
 
@@ -582,6 +658,7 @@ static int wcnss_remove(struct platform_device *pdev)
 
 	qcom_remove_sysmon_subdev(wcnss->sysmon);
 	qcom_remove_smd_subdev(wcnss->rproc, &wcnss->smd_subdev);
+	wcnss_release_pds(wcnss);
 	rproc_free(wcnss->rproc);
 
 	return 0;
-- 
2.28.0

