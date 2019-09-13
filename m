Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722ABB1CD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 14:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387656AbfIMMCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 08:02:53 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:15352 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387600AbfIMMCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 08:02:52 -0400
X-Greylist: delayed 369 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Sep 2019 08:02:48 EDT
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Sep 2019 17:26:38 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Sep 2019 17:26:13 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id C7C3C372B; Fri, 13 Sep 2019 17:26:11 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V2 02/12] remoteproc: qcom: Add secure PIL support
Date:   Fri, 13 Sep 2019 17:26:01 +0530
Message-Id: <1568375771-22933-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 uses secure PIL. Hence, adding the support for the same.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index dc2bae4..8418f57 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/qcom_scm.h>
 #include "qcom_common.h"
 #include "qcom_q6v5.h"
 
@@ -83,6 +84,9 @@
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
 #define MAX_HALT_REG		3
+
+#define WCNSS_PAS_ID		6
+
 enum {
 	WCSS_IPQ8074,
 	WCSS_QCS404,
@@ -133,6 +137,7 @@ struct q6v5_wcss {
 	int crash_reason_smem;
 	u8 version;
 	bool requires_force_stop;
+	bool need_mem_protection;
 };
 
 struct wcss_data {
@@ -147,6 +152,7 @@ struct wcss_data {
 	int ssctl_id;
 	const struct rproc_ops *ops;
 	bool requires_force_stop;
+	bool need_mem_protection;
 };
 
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
@@ -246,6 +252,15 @@ static int q6v5_wcss_start(struct rproc *rproc)
 
 	qcom_q6v5_prepare(&wcss->q6v5);
 
+	if (wcss->need_mem_protection) {
+		ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
+		if (ret) {
+			dev_err(wcss->dev, "wcss_reset failed\n");
+			return ret;
+		}
+		goto wait_for_reset;
+	}
+
 	/* Release Q6 and WCSS reset */
 	ret = reset_control_deassert(wcss->wcss_reset);
 	if (ret) {
@@ -280,6 +295,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	if (ret)
 		goto wcss_q6_reset;
 
+wait_for_reset:
 	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
 	if (ret == -ETIMEDOUT)
 		dev_err(wcss->dev, "start timed out\n");
@@ -688,6 +704,15 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	if (wcss->need_mem_protection) {
+		ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
+		if (ret) {
+			dev_err(wcss->dev, "not able to shutdown\n");
+			return ret;
+		}
+		goto pas_done;
+	}
+
 	/* WCSS powerdown */
 	if (wcss->requires_force_stop) {
 		ret = qcom_q6v5_request_stop(&wcss->q6v5);
@@ -712,6 +737,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 			return ret;
 	}
 
+pas_done:
 	clk_disable_unprepare(wcss->prng_clk);
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
@@ -734,6 +760,12 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 
+	if (wcss->need_mem_protection)
+		return qcom_mdt_load(wcss->dev, fw, rproc->firmware,
+				     WCNSS_PAS_ID, wcss->mem_region,
+				     wcss->mem_phys, wcss->mem_size,
+				     &wcss->mem_reloc);
+
 	return qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
 				     0, wcss->mem_region, wcss->mem_phys,
 				     wcss->mem_size, &wcss->mem_reloc);
@@ -1019,6 +1051,9 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	if (desc->need_mem_protection && !qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
 			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
@@ -1032,6 +1067,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->need_mem_protection = desc->need_mem_protection;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1099,6 +1135,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.aon_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
+	.need_mem_protection = true,
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
-- 
1.9.1

