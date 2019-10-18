Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7EEDC6AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 15:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405729AbfJRN5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 09:57:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47600 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404643AbfJRN5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 09:57:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5F04D6039C; Fri, 18 Oct 2019 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571407057;
        bh=6TuQ6nCpDLMux+e/43G2SQvK4dtK8spEXGo3KZVUS0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a0XTkJZpYlvPg1JgaDkoORHm3q4OHZuHvWxAAQT/fIsEbDTpyetxh28Xrn0WpQ1Q/
         eSy79ZBH3Gk9KUXiWtN6pjPocDlN3lEL1jO0QkeC5ZDi9obCrXV+j18qffnltu5UDs
         bICZXchAAk9YThNPcH7Vwa8Hj8cjUcgCslITl+G4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94B3A611A8;
        Fri, 18 Oct 2019 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571407056;
        bh=6TuQ6nCpDLMux+e/43G2SQvK4dtK8spEXGo3KZVUS0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BV9//Zj7NdQ1sPF6EPJG4Ex0r1gG340RAbq0UToR3H0EgYW9yGCN8fhqyfeO01O9K
         oUpa9+Xv7/3fQm5uxpzjmiMM8CHAz+Lj0DYIGpuBmsf1CUd812EMiL+75qNUC2ZhU+
         70uKooxtXRSW3kd5bX9v0xyVxtt/xvnVg1fmm0Gg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94B3A611A8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 1/2] soc: qcom: llcc: Add configuration data for SC7180
Date:   Fri, 18 Oct 2019 19:27:08 +0530
Message-Id: <d0fd71fbeff6cd040335846cb65e125a89412d43.1571406041.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Add llcc configuration data for SC7180 SoC which controls
llcc behaviour.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 4bd982a294ce..4acb52f8536b 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -91,6 +91,13 @@ struct qcom_llcc_config {
 	int size;
 };
 
+static struct llcc_slice_config sc7180_data[] =  {
+	{ LLCC_CPUSS,    1,  256, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 1 },
+	{ LLCC_MDM,      8,  128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPUHTW,   11, 128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPU,      12, 128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
+};
+
 static struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1 },
 	{ LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0 },
@@ -112,6 +119,11 @@ static struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0 },
 };
 
+static const struct qcom_llcc_config sc7180_cfg = {
+	.sct_data	= sc7180_data,
+	.size		= ARRAY_SIZE(sc7180_data),
+};
+
 static const struct qcom_llcc_config sdm845_cfg = {
 	.sct_data	= sdm845_data,
 	.size		= ARRAY_SIZE(sdm845_data),
@@ -485,6 +497,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
 	{ }
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

