Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2D6100E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKRVoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:44:10 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:43032
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfKRVoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113448;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=khQIPUgGxiGbXkPhysdJAeyYc+QiENpgZ6OZddpn7R8=;
        b=Q3CgWA7jcaZRxs+7JxcW/4OlME26U1l1bPvO57SRJlVgPq2CLzbE8D9S75XnqCv8
        sLq/BwlTWuiEPQQ+GtgNWRVJ3PxBrG4g7OclIvEE8nvu6GCuEovKjVALT3R0ZWHplbF
        s4q7EG1AUoLY/xJexDqWf3qN810te3SQJjT98LBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113448;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=khQIPUgGxiGbXkPhysdJAeyYc+QiENpgZ6OZddpn7R8=;
        b=FDBCh9vUNqd/Ncc9nceOqO7EfElf60vjJX3WI36O4lTTrYQNhaqDdVX8wDETBAma
        nxOXjnWfHklSaj333nJ3/ER47IuYdXJHsISXbUC7K6YibYfJe9OSGurXPTLHMU7+3Ia
        9Fz3LkGys7Gz54NaL++uCHWPzhGO6GguUvAfAZjU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0FCD3C3275B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 12/16] remoteproc: qcom: pas: Add auto_boot flag
Date:   Mon, 18 Nov 2019 21:44:08 +0000
Message-ID: <0101016e8079129e-50ebd142-fc69-4652-99fd-6abf3cd186af-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add auto_boot flag and set it to false for modem. This allows for
the delayed boot up of modem after the dependencies are met in
userspace.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 98e9336302844..b5b6aee6e54a3 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -33,6 +33,7 @@ struct adsp_data {
 	const char *firmware_name;
 	int pas_id;
 	bool has_aggre2_clk;
+	bool auto_boot;
 
 	char **active_pd_names;
 	char **proxy_pd_names;
@@ -388,6 +389,8 @@ static int adsp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rproc->auto_boot = desc->auto_boot;
+
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
 	adsp->rproc = rproc;
@@ -471,6 +474,7 @@ static const struct adsp_data adsp_resource_init = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.ssr_name = "lpass",
 		.sysmon_name = "adsp",
 		.ssctl_id = 0x14,
@@ -481,6 +485,7 @@ static const struct adsp_data msm8998_adsp_resource = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"cx",
 			NULL
@@ -495,6 +500,7 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.active_pd_names = (char*[]){
 			"load_state",
 			NULL
@@ -513,6 +519,7 @@ static const struct adsp_data cdsp_resource_init = {
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.has_aggre2_clk = false,
+	.auto_boot = true,
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
@@ -523,6 +530,7 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.has_aggre2_clk = false,
+	.auto_boot = true,
 	.active_pd_names = (char*[]){
 		"load_state",
 		NULL
@@ -541,6 +549,7 @@ static const struct adsp_data mpss_resource_init = {
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.has_aggre2_clk = false,
+	.auto_boot = false,
 	.active_pd_names = (char*[]){
 		"load_state",
 		NULL
@@ -560,6 +569,7 @@ static const struct adsp_data slpi_resource_init = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = true,
+		.auto_boot = true,
 		.ssr_name = "dsps",
 		.sysmon_name = "slpi",
 		.ssctl_id = 0x16,
@@ -570,6 +580,7 @@ static const struct adsp_data msm8998_slpi_resource = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = true,
+		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"ssc_cx",
 			NULL
@@ -584,6 +595,7 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.active_pd_names = (char*[]){
 			"load_state",
 			NULL
@@ -602,6 +614,7 @@ static const struct adsp_data wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
 	.pas_id = 6,
+	.auto_boot = true,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

