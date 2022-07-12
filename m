Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 274E7571A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbiGLMqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbiGLMqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:46:11 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3B99D516;
        Tue, 12 Jul 2022 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=C7DbLRbpXMyCj1Q5o2dItOE2QtxA2TFViSasGpGNT8A=; b=noMebIsnOHWlnAj3FbV8akvwMT
        g1cZJw8JwiG/Xa3vUZlAqzDO3Aph2IAeawfKPlgqM6YS8lMFtlBgqm5Z2A5cRmug9du7OOwGbqdE2
        UDyQBhpe5rgxF98hyEgcUGcvs8NM0eA/R7dJupZzhzdC+36NOl3OArm7/03tGhXxS1pNwpeaz/0+F
        cHyOW8flGwdgxbTBvYW5MJNMJnsa5DJLTnibbrRzHraBHG2dDujFx4CLA4Gs5wwIbevEF8nDRIqV+
        1+2MxphWY4xU9SFYUPTcmBdjQagOqG7e0lTejGnSB4d355z3QBiX881Y4Q1vfzoBsNc3xBqnrP6fN
        YEBz5ccQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oBFH8-0087Gb-6S; Tue, 12 Jul 2022 14:46:02 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 6/6] remoteproc: qcom_q6v5_mss: Add support for MSM8909
Date:   Tue, 12 Jul 2022 14:44:21 +0200
Message-Id: <20220712124421.3129206-7-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Port the initialization sequence necessary for booting the modem remote
processor on the MSM8909 SoC from Qualcomm's msm-3.10 release [1].
The sequence is actually similar to the existing one for MSM8996 and
MSM8998 except that there is no separate QDSP6SS_MEM_PWR_CTL register
and most of the "memories" are enabled at once instead of sequentially.

To reuse the existing code just insert some if statements where needed
and add a configuration similar to the one from MSM8916.

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/56dcedc8dac8abff6b007f76a29430b2d0a44704

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 123 +++++++++++++++++++++--------
 1 file changed, 90 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index af217de75e4d..31f561619b19 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -110,6 +110,9 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+/* QDSP6v55 parameters */
+#define QDSP6V55_MEM_BITS		GENMASK(16, 8)
+
 /* QDSP6v56 parameters */
 #define QDSP6v56_LDO_BYP		BIT(25)
 #define QDSP6v56_BHS_ON		BIT(24)
@@ -233,6 +236,7 @@ struct q6v5 {
 };
 
 enum {
+	MSS_MSM8909,
 	MSS_MSM8916,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -686,13 +690,14 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			return ret;
 		}
 		goto pbl_wait;
-	} else if (qproc->version == MSS_MSM8996 ||
+	} else if (qproc->version == MSS_MSM8909 ||
+		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998) {
-		int mem_pwr_ctl;
 
-		/* Override the ACC value if required */
-		writel(QDSP6SS_ACC_OVERRIDE_VAL,
-		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+		if (qproc->version != MSS_MSM8909)
+			/* Override the ACC value if required */
+			writel(QDSP6SS_ACC_OVERRIDE_VAL,
+			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 
 		/* Assert resets, stop core */
 		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
@@ -724,36 +729,53 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		val |= QDSP6v56_LDO_BYP;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
-		/* Deassert QDSP6 compiler memory clamp */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val &= ~QDSP6v56_CLAMP_QMC_MEM;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-
-		/* Deassert memory peripheral sleep and L2 memory standby */
-		val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-
-		/* Turn on L1, L2, ETB and JU memories 1 at a time */
-		if (qproc->version == MSS_MSM8996) {
-			mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
-			i = 19;
+		if (qproc->version != MSS_MSM8909) {
+			int mem_pwr_ctl;
+
+			/* Deassert QDSP6 compiler memory clamp */
+			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+			val &= ~QDSP6v56_CLAMP_QMC_MEM;
+			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+			/* Deassert memory peripheral sleep and L2 memory standby */
+			val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
+			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+			/* Turn on L1, L2, ETB and JU memories 1 at a time */
+			if (qproc->version == MSS_MSM8996) {
+				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
+				i = 19;
+			} else {
+				/* MSS_MSM8998 */
+				mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
+				i = 28;
+			}
+			val = readl(qproc->reg_base + mem_pwr_ctl);
+			for (; i >= 0; i--) {
+				val |= BIT(i);
+				writel(val, qproc->reg_base + mem_pwr_ctl);
+				/*
+				 * Read back value to ensure the write is done then
+				 * wait for 1us for both memory peripheral and data
+				 * array to turn on.
+				 */
+				val |= readl(qproc->reg_base + mem_pwr_ctl);
+				udelay(1);
+			}
 		} else {
-			/* MSS_MSM8998 */
-			mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
-			i = 28;
-		}
-		val = readl(qproc->reg_base + mem_pwr_ctl);
-		for (; i >= 0; i--) {
-			val |= BIT(i);
-			writel(val, qproc->reg_base + mem_pwr_ctl);
-			/*
-			 * Read back value to ensure the write is done then
-			 * wait for 1us for both memory peripheral and data
-			 * array to turn on.
-			 */
-			val |= readl(qproc->reg_base + mem_pwr_ctl);
-			udelay(1);
+			/* Turn on memories */
+			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+			val |= Q6SS_SLP_RET_N | Q6SS_L2DATA_STBY_N |
+			       Q6SS_ETB_SLP_NRET_N | QDSP6V55_MEM_BITS;
+			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+			/* Turn on L2 banks 1 at a time */
+			for (i = 0; i <= 7; i++) {
+				val |= BIT(i);
+				writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+			}
 		}
+
 		/* Remove word line clamp */
 		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 		val &= ~QDSP6v56_CLAMP_WL;
@@ -2198,6 +2220,40 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.version = MSS_MSM8996,
 };
 
+static const struct rproc_hexagon_res msm8909_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{}
+	},
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"iface",
+		"bus",
+		"mem",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"mx",
+		"cx",
+		NULL
+	},
+	.need_mem_protection = false,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8909,
+};
+
 static const struct rproc_hexagon_res msm8916_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2298,6 +2354,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
-- 
2.30.2

