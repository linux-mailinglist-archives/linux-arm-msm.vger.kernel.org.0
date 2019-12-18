Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49FC1124C8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 17:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfLRQGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 11:06:42 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:63175 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727516AbfLRQG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 11:06:28 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Dec 2019 21:36:17 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Dec 2019 21:35:48 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 2918A3C52; Wed, 18 Dec 2019 21:35:46 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V4 03/10] remoteproc: qcom: Add support for split q6 + m3 wlan firmware
Date:   Wed, 18 Dec 2019 21:35:39 +0530
Message-Id: <1576685146-17135-4-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
References: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 supports split firmware for q6 and m3 as well.
So add support for loading the m3 firmware before q6.
Now the drivers works fine for both split and unified
firmwares.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
changes since v1: none
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 97e01f43..da0ce97 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -142,12 +142,14 @@ struct q6v5_wcss {
 	u32 version;
 	bool requires_force_stop;
 	bool need_mem_protection;
+	const char *m3_firmware_name;
 };
 
 struct wcss_data {
 	int (*init_clock)(struct q6v5_wcss *wcss);
 	int (*init_regulator)(struct q6v5_wcss *wcss);
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -788,7 +790,29 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
+	const struct firmware *m3_fw;
+	int ret;
+
+	if (wcss->m3_firmware_name) {
+		ret = request_firmware(&m3_fw, wcss->m3_firmware_name,
+				       wcss->dev);
+		if (ret)
+			goto skip_m3;
+
+		ret = qcom_mdt_load_no_init(wcss->dev, m3_fw,
+					    wcss->m3_firmware_name, 0,
+					    wcss->mem_region, wcss->mem_phys,
+					    wcss->mem_size, &wcss->mem_reloc);
+
+		release_firmware(m3_fw);
+
+		if (ret) {
+			dev_err(wcss->dev, "can't load m3_fw.bXX\n");
+			return ret;
+		}
+	}
 
+skip_m3:
 	if (wcss->need_mem_protection)
 		return qcom_mdt_load(wcss->dev, fw, rproc->firmware,
 				     WCNSS_PAS_ID, wcss->mem_region,
@@ -1061,7 +1085,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-			    desc->firmware_name, sizeof(*wcss));
+			    desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1074,6 +1098,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
 	wcss->need_mem_protection = desc->need_mem_protection;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1136,7 +1161,8 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 
 static const struct wcss_data wcss_ipq8074_res_init = {
 	.init_clock = ipq8074_init_clock,
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1149,7 +1175,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.init_clock = qcs404_init_clock,
 	.init_regulator = qcs404_init_regulator,
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
1.9.1

