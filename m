Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC79526EE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiENBRI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 21:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiENBRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 21:17:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2232A4F23FF
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:48:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id d5so13342968wrb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CKMWbsqhUqRcv5cL/MZG/jSUCVckqZL5PQJo3104saM=;
        b=xuQE4hpHFKbh9ohIroypOCagmO2u8A3Uiiux75LNFnmK6FYx7Ul0jwhDPZVpHE1pDo
         vpc16MDWu+10GSRBWihg2SafCC4eX8XFxaRDyozDLQLvh1z1TGyP06foUOm1KjIG/Vy7
         SRXDJx0cUMCfbZnL1hEqZyBUPvgoXYaI4FBPGffE8hIjefSkzucfYFDVN5/N4ADZRHlM
         PUfgf2l7/+yDklvXfBQ3RwAWbheedDfRn5Uc4V7hB+xOrfc7LNg7o32zwiQURYvMTiJm
         UFiCkd8wyIe9slXZLSO0nzcICb2NeJ702UbQuGnnNeha54Ee1vAVQYbrABiVmP0U731K
         VXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKMWbsqhUqRcv5cL/MZG/jSUCVckqZL5PQJo3104saM=;
        b=ptIC2Qlbt6pV2WjeHxjSH3AU49pREx9sroAcMDI6Twqsz25pHr/+GjXj29qh3KdJ6y
         tPb/fZUCD9GYJ1rsZkIVZSmuh9O5wBg4JHJfSMUSBIsb4Bf5tYuGhcw6aFUyh6STC3om
         gx1cQ4nsNBr7DfnAOFZv7CzzS9/2DXAMXjmRQLMQ5eFRm4m2/Doj16q8lNJ5s3YdInxp
         7KR4x+EvukM4U236ALw7IdZgI4gu1ZFTn3s62+J7l6ggFXm0D6po9E3KOGMzwB2mxJ9E
         V8fEhSrFABDGn0T+FN+b3GjsDsKr/MCQz7GCuYbGA7dv+3crE1IEE+wnT4XZpremHN/d
         O3eA==
X-Gm-Message-State: AOAM530EMqYnoOJ2ZvMTynp0TG0aqDnzgOZ4/w363bb8NquHDl/OeTAY
        zb9VxyvcIzeOx5nv5l6WOuWyJnKxv/8alA==
X-Google-Smtp-Source: ABdhPJyW5xDxxvf+POhxEPJqCACn/yfmuA2FY9yVqaPnFutRliQSHZtoA+T5X7wNewa37Y9zdp5Puw==
X-Received: by 2002:a05:6512:220e:b0:473:cd23:2c3f with SMTP id h14-20020a056512220e00b00473cd232c3fmr5210508lfu.349.1652486472437;
        Fri, 13 May 2022 17:01:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>
Subject: [PATCH 3/4] remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660 MSS remoteproc
Date:   Sat, 14 May 2022 03:01:07 +0300
Message-Id: <20220514000108.3070363-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

This adds support for sdm630/636/660 modem subsystem
remote processor.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
[DB: fixed commit message, removed note about modem restarting regularly]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 111 +++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index af217de75e4d..7a4cca30db8a 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -68,6 +68,7 @@
 #define QDSP6SS_MEM_PWR_CTL		0x0B0
 #define QDSP6V6SS_MEM_PWR_CTL		0x034
 #define QDSP6SS_STRAP_ACC		0x110
+#define QDSP6V62SS_BHS_STATUS		0x0C4
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
@@ -117,6 +118,9 @@
 #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
+#define QDSP6v55_BHS_EN_REST_ACK        BIT(0)
+
+#define BHS_CHECK_MAX_LOOPS             (200)
 
 /* QDSP6v65 parameters */
 #define QDSP6SS_CORE_CBCR		0x20
@@ -239,6 +243,7 @@ enum {
 	MSS_MSM8998,
 	MSS_SC7180,
 	MSS_SC7280,
+	MSS_SDM660,
 	MSS_SDM845,
 };
 
@@ -754,6 +759,79 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			val |= readl(qproc->reg_base + mem_pwr_ctl);
 			udelay(1);
 		}
+		/* Remove word line clamp */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val &= ~QDSP6v56_CLAMP_WL;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	} else if (qproc->version == MSS_SDM660) {
+		int mem_pwr_ctl;
+
+		/* Override the ACC value if required */
+		writel(QDSP6SS_ACC_OVERRIDE_VAL,
+		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+
+		/* Assert resets, stop core */
+		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+		/* BHS require xo cbcr to be enabled */
+		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
+		val |= 1;
+		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
+
+		/* Enable power block headswitch and wait for it to stabilize */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= QDSP6v56_BHS_ON;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		mb();
+		udelay(1);
+
+		for (i = BHS_CHECK_MAX_LOOPS; i > 0; i--) {
+			if (readl_relaxed(qproc->reg_base + QDSP6V62SS_BHS_STATUS)
+			    & QDSP6v55_BHS_EN_REST_ACK)
+				break;
+			udelay(1);
+		}
+		if (!i) {
+			pr_err("%s: BHS_EN_REST_ACK not set!\n", __func__);
+			return -ETIMEDOUT;
+		}
+
+		/* Put LDO in bypass mode */
+		val |= QDSP6v56_LDO_BYP;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Remove QMC_MEM clamp */
+		val &= ~QDSP6v56_CLAMP_QMC_MEM;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Deassert QDSP6 compiler memory clamp */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val &= ~QDSP6v56_CLAMP_QMC_MEM;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Deassert memory peripheral sleep and L2 memory standby */
+		val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Turn on L1, L2, ETB and JU memories 1 at a time */
+		mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
+		i = 29;
+
+		val = readl(qproc->reg_base + mem_pwr_ctl);
+		for (; i >= 0; i--) {
+			val |= BIT(i);
+			writel(val, qproc->reg_base + mem_pwr_ctl);
+			/*
+			 * Read back value to ensure the write is done then
+			 * wait for 1us for both memory peripheral and data
+			 * array to turn on.
+			 */
+			val |= readl(qproc->reg_base + mem_pwr_ctl);
+			udelay(1);
+		}
+
 		/* Remove word line clamp */
 		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 		val &= ~QDSP6v56_CLAMP_WL;
@@ -785,6 +863,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		val |= Q6SS_L2DATA_SLP_NRET_N_0;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	}
+
 	/* Remove IO clamp */
 	val &= ~Q6SS_CLAMP_IO;
 	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -2098,6 +2177,37 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.version = MSS_SC7280,
 };
 
+static const struct rproc_hexagon_res sdm660_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+			"xo",
+			"qdss",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"gpll0_mss",
+			"mnoc_axi",
+			"snoc_axi",
+			"mem",
+			NULL
+	},
+	.proxy_pd_names = (char*[]){
+			"cx",
+			"mx",
+			NULL
+	},
+	.need_mem_protection = true,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_SDM660,
+};
+
 static const struct rproc_hexagon_res sdm845_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_clk_names = (char*[]){
@@ -2304,6 +2414,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
 	{ .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss},
 	{ .compatible = "qcom,sc7280-mss-pil", .data = &sc7280_mss},
+	{ .compatible = "qcom,sdm660-mss-pil", .data = &sdm660_mss},
 	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
 	{ },
 };
-- 
2.35.1

