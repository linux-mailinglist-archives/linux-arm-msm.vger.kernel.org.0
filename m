Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8081410B222
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 16:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfK0PN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 10:13:29 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:37917 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726937AbfK0PN3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 10:13:29 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 20:43:25 +0530
IronPort-SDR: ImJMVPScDt34ERmQWbLC0inb+f6wQ4x25rzqH1w1Ae9JPQoyWeYdG52N0AHHYAEW2LylusJVyy
 cMNvR2yigHCS+7AFdtdRMbJ5e1A0gEva3OETALqjD5A96QgB9bUCeSPz1xEv0KJaD51Q/KXibO
 6XKkWGtwVT3Zy/pYV9wDBH4Kz39L5BbF2dL6aKovgY9f+tPD6O0zejST9u0bt4evlzlU9npCoD
 /ZWGHwanenlj40JKyzqa7wzveoofM5aH6eK2v+dVrsrGuj3DTyKmX4CDYL2wX/o3dG4ReTbyO4
 hHCxBBXxCyjWVKzO4TtId04p
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Nov 2019 20:42:56 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 9961E3988; Wed, 27 Nov 2019 20:42:55 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V3 02/10] remoteproc: qcom: Add secure PIL support
Date:   Wed, 27 Nov 2019 20:42:46 +0530
Message-Id: <1574867574-2216-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
References: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 uses secure PIL. Hence, adding the support for the same.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e5cc064..49d98d3 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/qcom_scm.h>
 #include "qcom_common.h"
 #include "qcom_q6v5.h"
 
@@ -86,6 +87,9 @@
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
 #define MAX_HALT_REG		3
+
+#define WCNSS_PAS_ID		6
+
 enum {
 	WCSS_IPQ8074,
 	WCSS_QCS404,
@@ -137,6 +141,7 @@ struct q6v5_wcss {
 	int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	bool need_mem_protection;
 };
 
 struct wcss_data {
@@ -152,6 +157,7 @@ struct wcss_data {
 	int ssctl_id;
 	const struct rproc_ops *ops;
 	bool requires_force_stop;
+	bool need_mem_protection;
 };
 
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
@@ -251,6 +257,15 @@ static int q6v5_wcss_start(struct rproc *rproc)
 
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
@@ -285,6 +300,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	if (ret)
 		goto wcss_q6_reset;
 
+wait_for_reset:
 	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
 	if (ret == -ETIMEDOUT)
 		dev_err(wcss->dev, "start timed out\n");
@@ -717,6 +733,15 @@ static int q6v5_wcss_stop(struct rproc *rproc)
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
@@ -741,6 +766,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 			return ret;
 	}
 
+pas_done:
 	clk_disable_unprepare(wcss->prng_clk);
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
@@ -763,6 +789,12 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
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
@@ -1038,6 +1070,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->need_mem_protection = desc->need_mem_protection;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1106,6 +1139,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.wcss_q6_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
+	.need_mem_protection = true,
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
-- 
1.9.1

