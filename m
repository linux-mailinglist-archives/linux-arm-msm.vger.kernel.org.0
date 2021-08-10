Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4393E823F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 20:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237705AbhHJSGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 14:06:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:53329 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237956AbhHJSCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 14:02:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628618530; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WLPvYheAPOEVnEEGUZ7JNJjmWu6w7el/8UnPDH2Q8/o=; b=eFcfaXxeIza9+nTr4/zUOI4LGa7nSwpPqwV46S37U8pyzNyOWq43Yx1jr3fvT1qfyqXHefGy
 gRw7pRJUbh6BIbTYRkLEEWuaep/F1qsEz8SmFJ0PAVg0DDmPeYn+IXarr7Eo12AysVAuu8UB
 GNDyBfhdkg81sTQ8r1Wr8SuwlBg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6112bf1491487ad520decaee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 18:01:56
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D60FC35972; Tue, 10 Aug 2021 18:01:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8834C3596C;
        Tue, 10 Aug 2021 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8834C3596C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        sboyd@kernel.org, mpubbise@codeaurora.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 3/3] remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
Date:   Tue, 10 Aug 2021 23:31:23 +0530
Message-Id: <1628618483-664-4-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628618483-664-1-git-send-email-pillair@codeaurora.org>
References: <1628618483-664-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PIL loading of WPSS processor for SC7280
WPSS boot will be requested by the wifi driver and hence
disable auto-boot for WPSS. Also add a separate shutdown
sequence handler for WPSS.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 70 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 8b0d8bb..178ee7e 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -32,6 +32,7 @@
 
 /* time out value */
 #define ACK_TIMEOUT			1000
+#define ACK_TIMEOUT_US			1000000
 #define BOOT_FSM_TIMEOUT		10000
 /* mask values */
 #define EVB_MASK			GENMASK(27, 4)
@@ -58,6 +59,8 @@ struct adsp_pil_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	bool is_wpss;
+	bool auto_boot;
 
 	const char **clk_ids;
 	int num_clks;
@@ -96,8 +99,46 @@ struct qcom_adsp {
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+
+	int (*shutdown)(struct qcom_adsp *adsp);
 };
 
+static int qcom_wpss_shutdown(struct qcom_adsp *adsp)
+{
+	unsigned int val;
+
+	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 1);
+
+	/* Wait for halt ACK from QDSP6 */
+	regmap_read_poll_timeout(adsp->halt_map,
+				 adsp->halt_lpass + LPASS_HALTACK_REG, val,
+				 val, 1000, ACK_TIMEOUT_US);
+
+	/* Assert the WPSS PDC Reset */
+	reset_control_assert(adsp->pdc_sync_reset);
+	/* Place the WPSS processor into reset */
+	reset_control_assert(adsp->restart);
+	/* wait after asserting subsystem restart from AOSS */
+	usleep_range(200, 205);
+	/* Remove the WPSS reset */
+	reset_control_deassert(adsp->restart);
+	/* De-assert the WPSS PDC Reset */
+	reset_control_deassert(adsp->pdc_sync_reset);
+
+	usleep_range(100, 105);
+
+	clk_bulk_disable_unprepare(adsp->num_clks, adsp->clks);
+
+	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 0);
+
+	/* Wait for halt ACK from QDSP6 */
+	regmap_read_poll_timeout(adsp->halt_map,
+				 adsp->halt_lpass + LPASS_HALTACK_REG, val,
+				 !val, 1000, ACK_TIMEOUT_US);
+
+	return 0;
+}
+
 static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 {
 	unsigned long timeout;
@@ -270,7 +311,7 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
 
-	ret = qcom_adsp_shutdown(adsp);
+	ret = adsp->shutdown(adsp);
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
@@ -439,6 +480,8 @@ static int adsp_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
 	}
+
+	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	adsp = (struct qcom_adsp *)rproc->priv;
@@ -447,6 +490,11 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->info_name = desc->sysmon_name;
 	platform_set_drvdata(pdev, adsp);
 
+	if (desc->is_wpss)
+		adsp->shutdown = qcom_wpss_shutdown;
+	else
+		adsp->shutdown = qcom_adsp_shutdown;
+
 	ret = adsp_alloc_memory_region(adsp);
 	if (ret)
 		goto free_rproc;
@@ -515,6 +563,8 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.is_wpss = false,
+	.auto_boot = true,
 	.clk_ids = (const char*[]) {
 		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
 		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
@@ -528,6 +578,8 @@ static const struct adsp_pil_data cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.is_wpss = false,
+	.auto_boot = true,
 	.clk_ids = (const char*[]) {
 		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
 		"q6_axim", NULL
@@ -535,8 +587,24 @@ static const struct adsp_pil_data cdsp_resource_init = {
 	.num_clks = 7,
 };
 
+static const struct adsp_pil_data wpss_resource_init = {
+	.crash_reason_smem = 626,
+	.firmware_name = "wpss.mdt",
+	.ssr_name = "wpss",
+	.sysmon_name = "wpss",
+	.ssctl_id = 0x19,
+	.is_wpss = true,
+	.auto_boot = false,
+	.clk_ids = (const char*[]) {
+		"gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
+		"gcc_wpss_rscp_clk", NULL
+	},
+	.num_clks = 3,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
 	{ },
 };
-- 
2.7.4

