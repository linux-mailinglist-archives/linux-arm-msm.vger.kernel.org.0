Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8290C140BA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 14:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgAQNvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 08:51:55 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:47190 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728913AbgAQNvz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 08:51:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579269114; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AxuWgrzG90ZthftQ+DLM+LUe/P9hM/saP5os2D5mfEY=; b=GHbmoo+LvWIBgSIMPZYyVlFE/HfIf3l6KinEiYBC99CdTgx4gNljJLIkKvn/2nEuYpppn4Cd
 I8Sr9nXg7HDujpXzSJojMM/9qakqNRmy00BchmW2HYqUiPYMASEh8hKfGChgmvy+yHFLvUkc
 AhrbAGIq7iu9HkATgsLKLI13kXI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e21bbf8.7fd2fc92a458-smtp-out-n01;
 Fri, 17 Jan 2020 13:51:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0969C447AD; Fri, 17 Jan 2020 13:51:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81D7FC447A5;
        Fri, 17 Jan 2020 13:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81D7FC447A5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, evgreen@chromium.org,
        p.zabel@pengutronix.de
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/4] remoteproc: qcom: q6v5-mss: Improve readability across clk handling
Date:   Fri, 17 Jan 2020 19:21:28 +0530
Message-Id: <20200117135130.3605-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define CLKEN and CLKOFF for improving readability of Q6SS clock
handling.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 32 +++++++++++++++++-------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index f20b39c6ff0ed..e1784446d3da3 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -80,6 +80,11 @@
 #define Q6SS_CORE_ARES			BIT(1)
 #define Q6SS_BUS_ARES_ENABLE		BIT(2)
 
+/* QDSP6SS CBCR */
+#define Q6SS_CBCR_CLKEN			BIT(0)
+#define Q6SS_CBCR_CLKOFF		BIT(31)
+#define Q6SS_CBCR_TIMEOUT_US		200
+
 /* QDSP6SS_GFMUX_CTL */
 #define Q6SS_CLK_ENABLE			BIT(1)
 
@@ -100,7 +105,6 @@
 #define QDSP6v56_BHS_ON		BIT(24)
 #define QDSP6v56_CLAMP_WL		BIT(21)
 #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
-#define HALT_CHECK_MAX_LOOPS		200
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
 
@@ -502,12 +506,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 	if (qproc->version == MSS_SDM845) {
 		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
 
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_SLEEP,
-					 val, !(val & BIT(31)), 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "QDSP6SS Sleep clock timed out\n");
 			return -ETIMEDOUT;
@@ -530,12 +534,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		goto pbl_wait;
 	} else if (qproc->version == MSS_SC7180) {
 		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
 
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_SLEEP,
-					 val, !(val & BIT(31)), 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "QDSP6SS Sleep clock timed out\n");
 			return -ETIMEDOUT;
@@ -543,12 +547,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* Turn on the XO clock needed for PLL setup */
 		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
-					 val, !(val & BIT(31)), 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "QDSP6SS XO clock timed out\n");
 			return -ETIMEDOUT;
@@ -556,7 +560,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* Configure Q6 core CBCR to auto-enable after reset sequence */
 		val = readl(qproc->reg_base + QDSP6SS_CORE_CBCR);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_CORE_CBCR);
 
 		/* De-assert the Q6 stop core signal */
@@ -591,13 +595,13 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* BHS require xo cbcr to be enabled */
 		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
 		/* Read CLKOFF bit to go low indicating CLK is enabled */
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
-					 val, !(val & BIT(31)), 1,
-					 HALT_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev,
 				"xo cbcr enabling timed out (rc:%d)\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
