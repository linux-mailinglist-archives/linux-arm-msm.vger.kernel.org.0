Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E987A100DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfKRVnL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:11 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:52312
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113390;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=+QRIzXUN4UQQH+WPXjIxi8CVUjuQZ51NskQD5SVQHTc=;
        b=iX+bHDol57gVgHxmCkF0k4Dh5FGuRUNGx6gJAJqk38zffkj6AG6ARiBwzugks9Yy
        /EtZRtJgeku3b3BNk9t+7A6e12WGQRK2rX4MvRJnII9Mf2R8eLM3Vufpl2oyDCLjerH
        my4eeAaJYIR4zGT8EKdT9i5XcpAoPv5mvLQ+iSnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113390;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=+QRIzXUN4UQQH+WPXjIxi8CVUjuQZ51NskQD5SVQHTc=;
        b=O1eLzytKZQS7oYnVQt8VLsj5rqPHvmvM8yNTSMuvTEZNFYgmsxPgDn7dGIhXQLgy
        yvz6bQlot1ZVjaiggGSnw0atZeOo+3XgvUp09tqj2d9GzJ6JRGw30atDXkIei4QtlbK
        ASrOxNtkt8LBZdRc2frKZo9apBewUm+PUvXDaccg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6875CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 01/16] remoteproc: q6v5-mss: fixup MSM8998 MSS out of reset sequence
Date:   Mon, 18 Nov 2019 21:43:10 +0000
Message-ID: <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixup the following in the MSS out of reset sequence on MSM8998:
* skip ACC override on MSM8998.
* wait for BHS_EN_REST_ACK to be set before setting the LDO to bypass.
* remove "mem" clock from the active pool.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 471128a2e7239..2becf6dade936 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -100,6 +100,11 @@
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
 
+/* QDSP6v62 parameters */
+#define QDSP6SS_BHS_EN_REST_ACK		BIT(0)
+#define BHS_CHECK_MAX_LOOPS		200
+#define QDSP6SS_BHS_STATUS		0x0C4
+
 /* QDSP6v65 parameters */
 #define QDSP6SS_SLEEP                   0x3C
 #define QDSP6SS_BOOT_CORE_START         0x400
@@ -505,8 +510,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		int mem_pwr_ctl;
 
 		/* Override the ACC value if required */
-		writel(QDSP6SS_ACC_OVERRIDE_VAL,
-		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+		if (qproc->version == MSS_MSM8996)
+			writel(QDSP6SS_ACC_OVERRIDE_VAL,
+			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 
 		/* Assert resets, stop core */
 		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
@@ -534,6 +540,18 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 		udelay(1);
 
+		/* wait for BHS_EN_REST_ACK to be set */
+		if (qproc->version == MSS_MSM8998) {
+			ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
+						 val, (val & QDSP6SS_BHS_EN_REST_ACK),
+						 1, BHS_CHECK_MAX_LOOPS);
+			if (ret) {
+				dev_err(qproc->dev,
+					"QDSP6SS_BHS_EN_REST_ACK timedout\n");
+				return -ETIMEDOUT;
+			}
+		}
+
 		/* Put LDO in bypass mode */
 		val |= QDSP6v56_LDO_BYP;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -1594,7 +1612,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.active_clk_names = (char*[]){
 			"iface",
 			"bus",
-			"mem",
 			"gpll0_mss",
 			"mnoc_axi",
 			"snoc_axi",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

