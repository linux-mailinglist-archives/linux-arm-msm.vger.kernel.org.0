Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B54F40E4BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 19:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347312AbhIPRFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 13:05:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:53431 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344322AbhIPQ6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 12:58:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631811402; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BnpmpTOul3sL/rm3fd5aPfjp22EiVTbKDu+/dve1ghY=; b=CQSg/hVE4XgCP1/K3aFlEadCqDHBhQd9VtRbtNV6srLiBjrJ2iTQTq/vtXemwd0IP3O9ep7P
 MCl9R6ISj/b3fwdlLzZRU/kwVcDRMkI96ArGknE9q9imqtup/XuWy/ifI7kM4l+/PxqWvzNU
 t0Fyt4XnwTCn+OLqUF6Q/12wTJE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6143773bec62f57c9ac8eb05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:56:27
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75B44C35A20; Thu, 16 Sep 2021 16:56:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA390C48B24;
        Thu, 16 Sep 2021 16:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DA390C48B24
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v3 3/3] remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
Date:   Thu, 16 Sep 2021 22:25:53 +0530
Message-Id: <1631811353-503-4-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PIL loading of WPSS processor for SC7280
- WPSS boot will be requested by the wifi driver and hence
  disable auto-boot for WPSS.
- Add a separate shutdown sequence handler for WPSS.
- Add multiple power-domain voting support

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 141 +++++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 098362e6..f05e749 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -32,6 +32,7 @@
 
 /* time out value */
 #define ACK_TIMEOUT			1000
+#define ACK_TIMEOUT_US			1000000
 #define BOOT_FSM_TIMEOUT		10000
 /* mask values */
 #define EVB_MASK			GENMASK(27, 4)
@@ -51,6 +52,8 @@
 #define QDSP6SS_CORE_CBCR	0x20
 #define QDSP6SS_SLEEP_CBCR	0x3c
 
+#define QCOM_Q6V5_RPROC_PROXY_PD_MAX	3
+
 struct adsp_pil_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -58,9 +61,13 @@ struct adsp_pil_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	bool is_wpss;
+	bool auto_boot;
 
 	const char **clk_ids;
 	int num_clks;
+	const char **proxy_pd_names;
+	const char *load_state;
 };
 
 struct qcom_adsp {
@@ -93,11 +100,91 @@ struct qcom_adsp {
 	void *mem_region;
 	size_t mem_size;
 
+	struct device *proxy_pds[QCOM_Q6V5_RPROC_PROXY_PD_MAX];
+	int proxy_pd_count;
+
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+
+	int (*shutdown)(struct qcom_adsp *adsp);
 };
 
+static int qcom_rproc_pds_attach(struct device *dev, struct device **devs,
+				 const char **pd_names)
+{
+	size_t num_pds = 0;
+	int ret;
+	int i;
+
+	if (!pd_names)
+		return 0;
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
+}
+
+static void qcom_rproc_pds_detach(struct qcom_adsp *adsp, struct device **pds,
+				  size_t pd_count)
+{
+	int i;
+
+	for (i = 0; i < pd_count; i++)
+		dev_pm_domain_detach(pds[i], false);
+}
+
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
@@ -272,7 +359,7 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
 
-	ret = qcom_adsp_shutdown(adsp);
+	ret = adsp->shutdown(adsp);
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
@@ -441,6 +528,8 @@ static int adsp_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
 	}
+
+	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	adsp = (struct qcom_adsp *)rproc->priv;
@@ -449,6 +538,11 @@ static int adsp_probe(struct platform_device *pdev)
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
@@ -457,6 +551,14 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = qcom_rproc_pds_attach(adsp->dev, adsp->proxy_pds,
+				    desc->proxy_pd_names);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to attach proxy power domains\n");
+		goto free_rproc;
+	}
+	adsp->proxy_pd_count = ret;
+
 	pm_runtime_enable(adsp->dev);
 
 	ret = adsp_init_reset(adsp);
@@ -467,8 +569,8 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_pm;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, NULL,
-			     qcom_adsp_pil_handover);
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
+			     desc->load_state, qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
@@ -490,6 +592,8 @@ static int adsp_probe(struct platform_device *pdev)
 
 disable_pm:
 	pm_runtime_disable(adsp->dev);
+	qcom_rproc_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+
 free_rproc:
 	rproc_free(rproc);
 
@@ -507,6 +611,7 @@ static int adsp_remove(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
 	pm_runtime_disable(adsp->dev);
+	qcom_rproc_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	rproc_free(adsp->rproc);
 
 	return 0;
@@ -518,11 +623,16 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.is_wpss = false,
+	.auto_boot = true,
 	.clk_ids = (const char*[]) {
 		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
 		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
 	},
 	.num_clks = 7,
+	.proxy_pd_names = (const char*[]) {
+		"cx", NULL
+	},
 };
 
 static const struct adsp_pil_data cdsp_resource_init = {
@@ -531,15 +641,40 @@ static const struct adsp_pil_data cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.is_wpss = false,
+	.auto_boot = true,
 	.clk_ids = (const char*[]) {
 		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
 		"q6_axim", NULL
 	},
 	.num_clks = 7,
+	.proxy_pd_names = (const char*[]) {
+		"cx", NULL
+	},
+};
+
+static const struct adsp_pil_data wpss_resource_init = {
+	.crash_reason_smem = 626,
+	.firmware_name = "wpss.mdt",
+	.ssr_name = "wpss",
+	.sysmon_name = "wpss",
+	.ssctl_id = 0x19,
+	.is_wpss = true,
+	.auto_boot = false,
+	.load_state = "wpss",
+	.clk_ids = (const char*[]) {
+		"gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
+		"gcc_wpss_rscp_clk", NULL
+	},
+	.num_clks = 3,
+	.proxy_pd_names = (const char*[]) {
+		"cx", "mx", NULL
+	},
 };
 
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
 	{ },
 };
-- 
2.7.4

