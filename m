Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0581E5B25B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 20:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbiIHSZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 14:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiIHSZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 14:25:21 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D965755E;
        Thu,  8 Sep 2022 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WBBqvuD23pVFyH19PIjBMg4Ty5jObI0mZNIBrrEOCn4=; b=fDIwVHioUDQ+4+JIu62IvEfpDw
        xyZau0gBdWiusdtosxRYODSwBrIW2ZZdIs5dQE2LydRF8B9Yi5coNgKOAtGCt//1tQgNYiay2g3zN
        iPqkQQwmJxWHOBzE3m/8kmh/mNjS4qwG5xId6gyCs1f03iARAZa4xhxBqufB13VPkubz0axTsn+Kx
        owJdrILbzGVmLbf4DbL0iW6tjdTPK+L7XDltonvSZ26SVTAqtBYymsbxyN8TnwmeporcmRpyQ2p31
        u37AK0a0Y126/aSWFO3blIJkNzgBoGyqxPMf+5zApaNWjHYhDD/Q/v5pKx/ZygpvG4MLjsVIkmj1f
        kbQfhiLA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oWMD9-004g9E-9T; Thu, 08 Sep 2022 20:25:11 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
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
Subject: [PATCH v4 7/7] remoteproc: qcom: q6v5-mss: Add modem support on MSM8953
Date:   Thu,  8 Sep 2022 20:24:33 +0200
Message-Id: <20220908182433.466908-8-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
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

From: Sireesh Kodali <sireeshkodali1@gmail.com>

The modem on the MSM8953 platform is similar to the modem on the MSM8996
platform in terms of set up. It differs primarily in that TZ needs to be
informed of the modem start address and pas_id.

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Changes in v4: None
Changes in v3: Combine series with Sireesh's patches for MSM8953
---
 drivers/remoteproc/qcom_q6v5_mss.c | 55 ++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2555f06dfc74..2f4027664a0e 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -40,6 +40,8 @@
 
 #define MBA_LOG_SIZE			SZ_4K
 
+#define MPSS_PAS_ID			5
+
 /* RMB Status Register Values */
 #define RMB_PBL_SUCCESS			0x1
 
@@ -239,6 +241,7 @@ struct q6v5 {
 enum {
 	MSS_MSM8909,
 	MSS_MSM8916,
+	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
 	MSS_MSM8998,
@@ -692,10 +695,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		}
 		goto pbl_wait;
 	} else if (qproc->version == MSS_MSM8909 ||
+		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998) {
 
-		if (qproc->version != MSS_MSM8909)
+		if (qproc->version != MSS_MSM8909 &&
+		    qproc->version != MSS_MSM8953)
 			/* Override the ACC value if required */
 			writel(QDSP6SS_ACC_OVERRIDE_VAL,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
@@ -743,7 +748,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
-			if (qproc->version == MSS_MSM8996) {
+			if (qproc->version == MSS_MSM8953 ||
+			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
 			} else {
@@ -1365,6 +1371,15 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
+	if (qproc->version == MSS_MSM8953) {
+		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
+		if (ret) {
+			dev_err(qproc->dev,
+				"setting up mpss memory failed: %d\n", ret);
+			goto release_firmware;
+		}
+	}
+
 	/*
 	 * In case of a modem subsystem restart on secure devices, the modem
 	 * memory can be reclaimed only after MBA is loaded.
@@ -2341,6 +2356,41 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.version = MSS_MSM8916,
 };
 
+static const struct rproc_hexagon_res msm8953_mss = {
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
+	.proxy_pd_names = (char*[]) {
+		"cx",
+		"mx",
+		"mss",
+		NULL
+	},
+	.need_mem_protection = false,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8953,
+};
+
 static const struct rproc_hexagon_res msm8974_mss = {
 	.hexagon_mba_image = "mba.b00",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2398,6 +2448,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
 	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
-- 
2.30.2

