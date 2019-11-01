Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EDBEBC10
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 03:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbfKACpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 22:45:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46810 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfKACpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 22:45:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id q21so3660314plr.13;
        Thu, 31 Oct 2019 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2alu0Zc/ft6aP0mMKc3T9tiyxMrXfO91QDsxper6hEU=;
        b=ehpdFbf9etA7HW62oqX1LZFKJYoVBbPQJudG07hAzBC8Og6HDH61qiMQ+BoApygcx7
         k4M4QURpehSj5Bf6xW8xD0TR3ZveBXnF0CrejEW9xdyohY+Ct54ePpe4fTLWuL/PY8EZ
         51aGcxxyFVTnM9L92Rkx6bUf2y0UWYrA0zztnFrwyy2jOzvAAnHUVAg3/9hXLFeansxV
         fsHnL82XtkqpyvS8v8eVGOzZzDEg2kAk7xNZbc6VdBkNESHRj2flPiqtfybbwBWpK2+S
         qESYgQCuX/I6AQZz4wDTI77agsVXerggJem0FahjKdWti7PNUOyWH5CZxkcn+gomZyt/
         btHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2alu0Zc/ft6aP0mMKc3T9tiyxMrXfO91QDsxper6hEU=;
        b=iP2MNpT7P7x57KkYLXFAo6AIcae9uIMVYWOBlr2FwfBJxFha03S5qA1QEDIP2Cu/GW
         Ay4jKBnHJxON/fhMu+ACO48JbFl/biyfkBCVq40aoR8xS235PT2xrGTwadFYQZ9Ya3TD
         L4dW4jl3iAiaoGEaXLuraCvYU1Uzn2x1oPlqHitHPg9RWugvvsutCflodA4pgNBiw1/p
         nFKuZtdT8iRkZLW5BCMFW0eylgvmA8GFoR5RKBVtBtOplgYlimHKl+UtxX1sW9Sy1vl8
         dYcfCksCD3OJQIhVWYEgL1dgoz3g1Tr8Rzsva8obUOvmmHYsYJBc8JZ/Wq7lf9+5ehxf
         F0zg==
X-Gm-Message-State: APjAAAWpyoFZrciEXkv4ydEJ5ynP2c2MwEXLHBNtwbIIre2LWynXGyDu
        D87poF7hP5K0rtrWpKlh52w=
X-Google-Smtp-Source: APXvYqwePioh5LZFvobRYjFvfwGYHFfaowQT003aLyNZ6K7yaoHsR9ZUDrhlk3TRnP0FADX8XNgH/Q==
X-Received: by 2002:a17:902:6f01:: with SMTP id w1mr10214320plk.35.1572576305307;
        Thu, 31 Oct 2019 19:45:05 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id e71sm6641948pgc.91.2019.10.31.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 19:45:04 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Add support for MSM8998
Date:   Thu, 31 Oct 2019 19:45:01 -0700
Message-Id: <20191101024501.22026-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8998 sits between MSM8996 and SDM845 in terms of functionality needed to
boot the modem subsystem.  Booting mss allows for servicing the traditional
cellular usecases along with the wireless usecases such as wifi.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 52 ++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index bdf1dd00b89b..685182368aa7 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -61,6 +61,7 @@
 #define QDSP6SS_GFMUX_CTL_REG		0x020
 #define QDSP6SS_PWR_CTL_REG		0x030
 #define QDSP6SS_MEM_PWR_CTL		0x0B0
+#define QDSP6V6SS_MEM_PWR_CTL		0x034
 #define QDSP6SS_STRAP_ACC		0x110
 
 /* AXI Halt Register Offsets */
@@ -196,6 +197,7 @@ enum {
 	MSS_MSM8916,
 	MSS_MSM8974,
 	MSS_MSM8996,
+	MSS_MSM8998,
 	MSS_SDM845,
 };
 
@@ -504,7 +506,10 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		}
 
 		goto pbl_wait;
-	} else if (qproc->version == MSS_MSM8996) {
+	} else if (qproc->version == MSS_MSM8996 ||
+		   qproc->version == MSS_MSM8998) {
+		int mem_pwr_ctl;
+
 		/* Override the ACC value if required */
 		writel(QDSP6SS_ACC_OVERRIDE_VAL,
 		       qproc->reg_base + QDSP6SS_STRAP_ACC);
@@ -549,17 +554,24 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 		/* Turn on L1, L2, ETB and JU memories 1 at a time */
-		val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
-		for (i = 19; i >= 0; i--) {
+		if (qproc->version == MSS_MSM8996) {
+			mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
+			i = 19;
+		} else {
+			/* MSS_MSM8998 */
+			mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
+			i = 28;
+		}
+		val = readl(qproc->reg_base + mem_pwr_ctl);
+		for (; i >= 0; i--) {
 			val |= BIT(i);
-			writel(val, qproc->reg_base +
-						QDSP6SS_MEM_PWR_CTL);
+			writel(val, qproc->reg_base + mem_pwr_ctl);
 			/*
 			 * Read back value to ensure the write is done then
 			 * wait for 1us for both memory peripheral and data
 			 * array to turn on.
 			 */
-			val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+			val |= readl(qproc->reg_base + mem_pwr_ctl);
 			udelay(1);
 		}
 		/* Remove word line clamp */
@@ -1592,6 +1604,33 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.version = MSS_SDM845,
 };
 
+static const struct rproc_hexagon_res msm8998_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+			"xo",
+			"qdss",
+			"mem",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"mem",
+			"gpll0_mss",
+			"mnoc_axi",
+			"snoc_axi",
+			NULL
+	},
+	.proxy_pd_names = (char*[]){
+			"cx",
+			"mx",
+			NULL
+	},
+	.need_mem_protection = true,
+	.has_alt_reset = false,
+	.version = MSS_MSM8998,
+};
+
 static const struct rproc_hexagon_res msm8996_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -1698,6 +1737,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
+	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
 	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
 	{ },
 };
-- 
2.17.1

