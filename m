Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCB8333661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 08:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhCJH2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 02:28:47 -0500
Received: from z11.mailgun.us ([104.130.96.11]:64237 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231228AbhCJH2i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 02:28:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615361318; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qlOSLNFKSydtK2lqbeK6cbgiSYOFKDU287spEtLrDcs=; b=OeHs9neFOFSLuxJ7tTa3YwlSbvw6kilW/KQtAg/JmQDwvDiR8hcld7QnvPXh6lfJ/uLt1lMO
 Lol2e6h2v7ZWtEDpuC5/+vJUR11PooA38BwvQIQ6aBgkU7sDqrLra0mpIncvza1Jx2ElBfCb
 wdz69PWHtJ1/vSX3EeoYlZNU7Lc=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60487523b86af9bf233a4e33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 07:28:35
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79F9BC433ED; Wed, 10 Mar 2021 07:28:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84AE5C433CA;
        Wed, 10 Mar 2021 07:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84AE5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
Date:   Wed, 10 Mar 2021 12:58:10 +0530
Message-Id: <1615361290-19238-3-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PIL loading of WPSS processor for SC7280
WPSS boot will be requested by the wifi driver and hence
disable auto-boot for WPSS. Also add a separate shutdown
sequence handler for WPSS.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 77 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e024502..dc6b91d 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -58,6 +58,8 @@ struct adsp_pil_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	bool is_wpss;
+	bool auto_boot;
 
 	const char **clk_ids;
 	int num_clks;
@@ -96,8 +98,54 @@ struct qcom_adsp {
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+
+	int (*shutdown)(struct qcom_adsp *adsp);
 };
 
+static int qcom_wpss_shutdown(struct qcom_adsp *adsp)
+{
+	unsigned long timeout;
+	unsigned int val;
+	int ret;
+
+	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 1);
+
+	/* Wait for halt ACK from QDSP6 */
+	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
+	for (;;) {
+		ret = regmap_read(adsp->halt_map,
+				  adsp->halt_lpass + LPASS_HALTACK_REG, &val);
+		if (ret || val || time_after(jiffies, timeout))
+			break;
+
+		usleep_range(1000, 1100);
+	}
+
+	/* Place the WPSS processor into reset */
+	reset_control_assert(adsp->restart);
+	/* wait after asserting subsystem restart from AOSS */
+	usleep_range(100, 105);
+	/* Remove the WPSS reset */
+	reset_control_deassert(adsp->restart);
+
+	usleep_range(100, 105);
+
+	regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 0);
+
+	/* Wait for halt ACK from QDSP6 */
+	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
+	for (;;) {
+		ret = regmap_read(adsp->halt_map,
+				  adsp->halt_lpass + LPASS_HALTACK_REG, &val);
+		if (ret || !val || time_after(jiffies, timeout))
+			break;
+
+		usleep_range(1000, 1100);
+	}
+
+	return 0;
+}
+
 static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 {
 	unsigned long timeout;
@@ -270,7 +318,7 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
 
-	ret = qcom_adsp_shutdown(adsp);
+	ret = adsp->shutdown(adsp);
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
@@ -439,6 +487,8 @@ static int adsp_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
 	}
+
+	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	adsp = (struct qcom_adsp *)rproc->priv;
@@ -447,6 +497,11 @@ static int adsp_probe(struct platform_device *pdev)
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
@@ -515,6 +570,8 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.is_wpss = false,
+	.auto_boot = true;
 	.clk_ids = (const char*[]) {
 		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
 		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
@@ -528,6 +585,8 @@ static const struct adsp_pil_data cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.is_wpss = false,
+	.auto_boot = true;
 	.clk_ids = (const char*[]) {
 		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
 		"q6_axim", NULL
@@ -535,7 +594,23 @@ static const struct adsp_pil_data cdsp_resource_init = {
 	.num_clks = 7,
 };
 
+static const struct adsp_pil_data wpss_resource_init = {
+	.crash_reason_smem = 626,
+	.firmware_name = "wpss.mdt",
+	.ssr_name = "wpss",
+	.sysmon_name = "wpss",
+	.ssctl_id = 0x19,
+	.is_wpss = true,
+	.auto_boot = false;
+	.clk_ids = (const char*[]) {
+		"gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
+		"gcc_wpss_rscp_clk", NULL
+	},
+	.num_clks = 3,
+};
+
 static const struct of_device_id adsp_of_match[] = {
+	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
 	{ },
-- 
2.7.4

