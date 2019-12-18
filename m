Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3712480B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfLRNWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:22:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59368 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726921AbfLRNWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:22:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576675365; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PxfjUcjEFUwVYcN1dpIcKASKegoFgP0Ng7+TOoupFMo=; b=d6XleKqIG6sOce9veBSTDonDFDTsj7c/En9yXAsERKY4OStv5eG/JzAJS4JUQYO8yENaVXBu
 pBut1dpM5kPXAeILBmKJLLuITqos6hmjoujWWoz/lL23V2wvYPAM2NrWHZekC3OCC3t38yRy
 gpKDzK1tFPAT6frYVsr3N3dPKVM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa2822.7f31dfd1e500-smtp-out-n01;
 Wed, 18 Dec 2019 13:22:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82B7DC43383; Wed, 18 Dec 2019 13:22:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0189CC433A2;
        Wed, 18 Dec 2019 13:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0189CC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 3/5] remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
Date:   Wed, 18 Dec 2019 18:52:15 +0530
Message-Id: <20191218132217.28141-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191218132217.28141-1-sibis@codeaurora.org>
References: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for booting the Audio and Sensor DSPs found in
Qualcomm's MSM8998 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b890e6e305f31..edf9d0e1a235b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -499,6 +499,21 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.ssctl_id = 0x14,
 };
 
+static const struct adsp_data msm8998_adsp_resource = {
+		.crash_reason_smem = 423,
+		.firmware_name = "adsp.mdt",
+		.pas_id = 1,
+		.has_aggre2_clk = false,
+		.auto_boot = true,
+		.proxy_pd_names = (char*[]){
+			"cx",
+			NULL
+		},
+		.ssr_name = "lpass",
+		.sysmon_name = "adsp",
+		.ssctl_id = 0x14,
+};
+
 static const struct adsp_data cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -580,6 +595,21 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data msm8998_slpi_resource = {
+		.crash_reason_smem = 424,
+		.firmware_name = "slpi.mdt",
+		.pas_id = 12,
+		.has_aggre2_clk = true,
+		.auto_boot = true,
+		.proxy_pd_names = (char*[]){
+			"ssc_cx",
+			NULL
+		},
+		.ssr_name = "dsps",
+		.sysmon_name = "slpi",
+		.ssctl_id = 0x16,
+};
+
 static const struct adsp_data wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
@@ -594,6 +624,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &slpi_resource_init},
+	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8998_adsp_resource},
+	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8998_slpi_resource},
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
