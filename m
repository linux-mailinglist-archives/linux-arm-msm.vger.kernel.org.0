Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6A7100DF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfKRVnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:17 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:48862
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113395;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=8oQJ27mqWZReYsreFp6AVMVj1iVaJDt5oaCZSva+LmQ=;
        b=GVl3PLeU4EOpyLv7QEZ66ZqodiA/EzYW1aTGCTZ7FVrISLhLPjMB8V/IVEWzPDFq
        zhmmY6MLrQv+4vQhujRg0/MBZKKbuWMJxRuJxwaRNdTXVt0u5ZdGUZPcCdtK5gFJB8V
        gv1hQBXEaKwdnpRV/ainfUe5CmUH+C0etYkLQgG8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113395;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=8oQJ27mqWZReYsreFp6AVMVj1iVaJDt5oaCZSva+LmQ=;
        b=RGIIXp6p2zkAK7rM+eVL2U17xEdS0IrwauolTQ5XpkuaHsO92nWX1eJQaS49zyVS
        xTU73iMb0MlgQvROnP1o3edECSZ952+MogEycRRv/y1HZ1550IPZrHsybKUK4EJKLAZ
        gPfXHXQwDmGYjx0VxMSsXbfXS2gQ8/WB15afXFgQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14529C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 02/16] remoteproc: q6v5-mss: Streamline the MSS out of reset sequence
Date:   Mon, 18 Nov 2019 21:43:15 +0000
Message-ID: <0101016e80784451-873bf09d-3517-480d-80a2-c89750d0ae12-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Streamline the MSS out of reset sequence to reuse common code across
MSM8998/MSM8996/MSM8974/MSM8916 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 94 ++++++++++++++++--------------
 1 file changed, 51 insertions(+), 43 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2becf6dade936..06a57db3238db 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -505,21 +505,21 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		}
 
 		goto pbl_wait;
-	} else if (qproc->version == MSS_MSM8996 ||
-		   qproc->version == MSS_MSM8998) {
-		int mem_pwr_ctl;
+	}
 
-		/* Override the ACC value if required */
-		if (qproc->version == MSS_MSM8996)
-			writel(QDSP6SS_ACC_OVERRIDE_VAL,
-			       qproc->reg_base + QDSP6SS_STRAP_ACC);
+	/* Override the ACC value if required */
+	if (qproc->version == MSS_MSM8996)
+		writel(QDSP6SS_ACC_OVERRIDE_VAL,
+		       qproc->reg_base + QDSP6SS_STRAP_ACC);
 
-		/* Assert resets, stop core */
-		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
-		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+	/* Assert resets, stop core */
+	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+	val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
 
-		/* BHS require xo cbcr to be enabled */
+	/* BHS require xo cbcr to be enabled */
+	if (qproc->version == MSS_MSM8996 ||
+	    qproc->version == MSS_MSM8998) {
 		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
 		val |= 0x1;
 		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
@@ -533,26 +533,35 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				"xo cbcr enabling timed out (rc:%d)\n", ret);
 			return ret;
 		}
-		/* Enable power block headswitch and wait for it to stabilize */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	}
+
+	/* Enable power block headswitch and wait for it to stabilize */
+	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	if (qproc->version == MSS_MSM8996 ||
+	    qproc->version == MSS_MSM8998)
 		val |= QDSP6v56_BHS_ON;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		udelay(1);
-
-		/* wait for BHS_EN_REST_ACK to be set */
-		if (qproc->version == MSS_MSM8998) {
-			ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
-						 val, (val & QDSP6SS_BHS_EN_REST_ACK),
-						 1, BHS_CHECK_MAX_LOOPS);
-			if (ret) {
-				dev_err(qproc->dev,
-					"QDSP6SS_BHS_EN_REST_ACK timedout\n");
-				return -ETIMEDOUT;
-			}
+	else
+		val |= QDSS_BHS_ON | QDSS_LDO_BYP;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	udelay(1);
+
+	/* wait for BHS_EN_REST_ACK to be set */
+	if (qproc->version == MSS_MSM8998) {
+		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
+					 val, (val & QDSP6SS_BHS_EN_REST_ACK),
+					 1, BHS_CHECK_MAX_LOOPS);
+		if (ret) {
+			dev_err(qproc->dev,
+				"QDSP6SS_BHS_EN_REST_ACK timedout\n");
+			return -ETIMEDOUT;
 		}
+	}
 
+	if (qproc->version == MSS_MSM8996 ||
+	    qproc->version == MSS_MSM8998) {
 		/* Put LDO in bypass mode */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 		val |= QDSP6v56_LDO_BYP;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
@@ -564,7 +573,11 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		/* Deassert memory peripheral sleep and L2 memory standby */
 		val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	}
 
+	/* Turn on memories */
+	if (qproc->version == MSS_MSM8996 || qproc->version == MSS_MSM8998) {
+		int mem_pwr_ctl;
 		/* Turn on L1, L2, ETB and JU memories 1 at a time */
 		if (qproc->version == MSS_MSM8996) {
 			mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -586,22 +599,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			val |= readl(qproc->reg_base + mem_pwr_ctl);
 			udelay(1);
 		}
-		/* Remove word line clamp */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val &= ~QDSP6v56_CLAMP_WL;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	} else {
-		/* Assert resets, stop core */
-		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
-		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
-
-		/* Enable power block headswitch and wait for it to stabilize */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val |= QDSS_BHS_ON | QDSS_LDO_BYP;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		udelay(1);
 		/*
 		 * Turn on memories. L2 banks should be done individually
 		 * to minimize inrush current.
@@ -617,7 +615,17 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		val |= Q6SS_L2DATA_SLP_NRET_N_0;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	}
+
+	/* Remove word line clamp */
+	if (qproc->version == MSS_MSM8996 ||
+	    qproc->version == MSS_MSM8998) {
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val &= ~QDSP6v56_CLAMP_WL;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	}
+
 	/* Remove IO clamp */
+	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	val &= ~Q6SS_CLAMP_IO;
 	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

