Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF6573894E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbjFUPdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbjFUPdZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:33:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D669610F6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f122ff663eso8327773e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361602; x=1689953602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MicCFkNBouLiXbSIH4JKKed61jEBtgAzBmipuLWTl/4=;
        b=aVPaow9xhb3xYotbyBCYo5A5C7RiiRO3yZG+j5v40/WJe+geF1e/7xUCsze5BjeCGD
         //VthO92/bjexjZIpNC/4HjssldnYZXmz6q7PwwoRY5ip3Lzbf4388LeRGnb8qoBCUUr
         dyNRozhwmGqto7XlePF2MZRCmftZ3QW4r74Rb4ofOa9OMa8RQJK6mZnNq479wDJzZ1k0
         trnx3t7MtuELbUFy+Hjfe5wzeqRWi8JymNOrgFLPCOI+nRX0Kk01rFudbx7cZdUlvSHX
         58ZX03GpAtDR0eeFI1f4cx4x6ZNkH4axt2Suw0wvRUAGbz7R8XxcEqULbnNFysvsDgsN
         LKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361602; x=1689953602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MicCFkNBouLiXbSIH4JKKed61jEBtgAzBmipuLWTl/4=;
        b=ROeQjZzEDvusCO6QL2GySjlSpA795boiyYPiqexIiL5awOh5Tv4Q4be97KH8EKNq1s
         dYgn6DkiCEF5XfIICLyxiGMb7tYLTkNcv8k9mmtYmJS3hqYZYT3UeC1GvwZ/H3l2b35w
         WMfR75t5fsZKftG1HYnTqOMFyb4Z3e3+9dWw/OlmEdQmTd18iurpiy6E+zBu75fytros
         8wn7dOLO66dabZrjO18a6+TM7koJM/4lGl1wqxlE5a0V4l0zpjdOKTMfj38Nn7u5MOiZ
         wAPvGY9YE9Q1HG3l9CNL4nf62rzaHDqiivOe3aEOGo40xh0bZs+3U74aw12z1Aca9NR/
         exIg==
X-Gm-Message-State: AC+VfDzC2SMJxhCLKIl+4s7VO6grtcTfOCSDhJnQNQwbxF3EXqtgJe9O
        VNqwreB+KhV6XAFajWsWIWzckOBKjYxiv3/InEI=
X-Google-Smtp-Source: ACHHUZ5Ay+e1qvAcNp8A1s2flxC/4+7psevy6GnCjLquxSCTm79PTFphiu8SNNSg70r7jqNkNsbSfQ==
X-Received: by 2002:a05:6512:3110:b0:4f9:5682:3b54 with SMTP id n16-20020a056512311000b004f956823b54mr2440803lfb.28.1687361602115;
        Wed, 21 Jun 2023 08:33:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:33:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: [RESEND PATCH 4/7] phy: qcom: qmp-combo: reuse register layouts for some more registers
Date:   Wed, 21 Jun 2023 18:33:14 +0300
Message-Id: <20230621153317.1025914-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use register layout for TX_HIGHZ_DRVR_EN and TX_TRANSCEIVER_BIAS_EN
registers. This will allow us to unify qmp_v[456]_configure_dp_phy()
functions in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 34 ++++++++++++-------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |  2 ++
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2f95e29110df..d034b4f45bd3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -116,6 +116,8 @@ enum qphy_reg_layout {
 	QPHY_TX_TX_POL_INV,
 	QPHY_TX_TX_DRV_LVL,
 	QPHY_TX_TX_EMP_POST1_LVL,
+	QPHY_TX_HIGHZ_DRVR_EN,
+	QPHY_TX_TRANSCEIVER_BIAS_EN,
 
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
@@ -138,6 +140,8 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V3_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V3_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V3_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V3_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V3_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -159,6 +163,8 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V4_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V4_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V4_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V4_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V4_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -180,6 +186,8 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V5_5NM_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V5_5NM_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V5_5NM_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V5_5NM_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V5_5NM_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -201,6 +209,8 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V6_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V6_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_TX_TRANSCEIVER_BIAS_EN,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
@@ -2346,10 +2356,10 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 		drvr1_en = 0x10;
 	}
 
-	writel(drvr0_en, qmp->dp_tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias0_en, qmp->dp_tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr1_en, qmp->dp_tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias1_en, qmp->dp_tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(2000);
@@ -2406,10 +2416,10 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 		drvr1_en = 0x10;
 	}
 
-	writel(drvr0_en, qmp->dp_tx + QSERDES_V5_5NM_TX_HIGHZ_DRVR_EN);
-	writel(bias0_en, qmp->dp_tx + QSERDES_V5_5NM_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr1_en, qmp->dp_tx2 + QSERDES_V5_5NM_TX_HIGHZ_DRVR_EN);
-	writel(bias1_en, qmp->dp_tx2 + QSERDES_V5_5NM_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(2000);
@@ -2464,10 +2474,10 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 		drvr1_en = 0x10;
 	}
 
-	writel(drvr0_en, qmp->dp_tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias0_en, qmp->dp_tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr1_en, qmp->dp_tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
-	writel(bias1_en, qmp->dp_tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
+	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
+	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(2000);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
index b4810c48dc20..8883e1de730e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
@@ -17,6 +17,8 @@
 #define QSERDES_V6_TX_RES_CODE_LANE_RX				0x38
 #define QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX			0x3c
 #define QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX			0x40
+#define QSERDES_V6_TX_TRANSCEIVER_BIAS_EN			0x54
+#define QSERDES_V6_TX_HIGHZ_DRVR_EN				0x58
 #define QSERDES_V6_TX_TX_POL_INV				0x5c
 #define QSERDES_V6_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
 #define QSERDES_V6_TX_BIST_PATTERN7				0x7c
-- 
2.39.2

