Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5AE5635150
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235801AbiKWHsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235857AbiKWHsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:48:43 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A809A5CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:48:42 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y4so15943215plb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEZJoTwhQ3gMKVRNOyr1QQaSSeZV4Cc6rt58FdaM0ug=;
        b=T1b7VEEleMjpIKF5hl4CzQavZ639wHFKorulZTx9Bb+TUJk7XU1LPMm0Gmn87Gfthm
         Rg38SkGksnP/4/docKQY/s+m+Rykbi4GkvR/yUEGQbhcAE79KpcYUDTJs/WYpwFK/foo
         ApG3F5JLqDiloW216TJHQa/z71tQpld0df179spbUCTuZ8uwsexIYQeXguhU/+qQKJ+8
         Dsl/AY7xbLFJ3kUUY9nRMHdyUs9+O8DNi0VNHm9NKNDSgZzHyOozOuyZlEAvrmikYXJd
         xxUoxdL/E5nbuoR1H1kuYbKW3E5YYiQURmoTtieCAGuYxV3JZRh3iHBclzc6N6tfJZy1
         v73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEZJoTwhQ3gMKVRNOyr1QQaSSeZV4Cc6rt58FdaM0ug=;
        b=y88AzpXex5/e4bU3+kHdOn53vTIkVN2lN801rKeKX/6rVeN5j3D6toBJGjpnjIaUbb
         6EguPdNxBxt8Jhxd3lTo1fx0C0pxl1tk5afjMo0vQRAOS7Sazg/m/YufkR3WjEULnbFp
         epq/9ztMk/A4L+Yq4Y06zsjfaLMcU2C6PTQTR8qI6dpg6NOdNsWBSItqfYIfeYkmt4ve
         1osThg/mC0BUmqL7BngSrbDouENATZmDjAnPyfZO9+b6U7qL+zmwXfkLz4daus7jQwRs
         SLnO136HXVotF6poSkbUlWxQg/erMnXlZqmnCVV/BvSV+WCUn6gs/Lw3fxguM6AJ+Tas
         qiCQ==
X-Gm-Message-State: ANoB5pn1sTaKCyOZhO7WCZwCqxTi/nO2DF3PCPqfKMDQlRHsIgshW3G+
        pFPWjKxbVE/EEU6esuMFP0tb
X-Google-Smtp-Source: AA0mqf4kVuMW5FcbHtjO5FqfYjL4hacm1PmBX8Z+CPL2JkDNu3/OYU/CRZGh96Zc/rlqnqoE9a115Q==
X-Received: by 2002:a17:90a:ca13:b0:218:cf25:1e7a with SMTP id x19-20020a17090aca1300b00218cf251e7amr6783916pjt.29.1669189721600;
        Tue, 22 Nov 2022 23:48:41 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:48:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 01/20] phy: qcom-qmp-ufs: Remove _tbl suffix from qmp_phy_init_tbl definitions
Date:   Wed, 23 Nov 2022 13:18:07 +0530
Message-Id: <20221123074826.95369-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following the other QMP PHY drivers like PCIe, let's remove the "_tbl"
suffix from the qmp_phy_init_tbl definitions. This helps in maintaining
the uniformity across all of the QMP PHY drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 130 ++++++++++++------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index c08d34ad1313..047f06c3313a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -107,7 +107,7 @@ static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl msm8996_ufs_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
@@ -156,12 +156,12 @@ static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_tx_tbl[] = {
+static const struct qmp_phy_init_tbl msm8996_ufs_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
 	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_rx_tbl[] = {
+static const struct qmp_phy_init_tbl msm8996_ufs_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
@@ -175,7 +175,7 @@ static const struct qmp_phy_init_tbl msm8996_ufs_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
 };
 
-static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
@@ -231,12 +231,12 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x44),
 };
 
-static const struct qmp_phy_init_tbl sm6115_ufsphy_tx_tbl[] = {
+static const struct qmp_phy_init_tbl sm6115_ufsphy_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
 	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
 };
 
-static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
+static const struct qmp_phy_init_tbl sm6115_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x0F),
 	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x40),
@@ -254,7 +254,7 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5B),
 };
 
-static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
+static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_PWM_GEAR_BAND, 0x15),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SIGDET_CTRL2, 0x6d),
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL, 0x0f),
@@ -266,7 +266,7 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
 };
 
-static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
@@ -308,13 +308,13 @@ static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x44),
 };
 
-static const struct qmp_phy_init_tbl sdm845_ufsphy_tx_tbl[] = {
+static const struct qmp_phy_init_tbl sdm845_ufsphy_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x07),
 };
 
-static const struct qmp_phy_init_tbl sdm845_ufsphy_rx_tbl[] = {
+static const struct qmp_phy_init_tbl sdm845_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
@@ -333,7 +333,7 @@ static const struct qmp_phy_init_tbl sdm845_ufsphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_MODE_00, 0x59),
 };
 
-static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs_tbl[] = {
+static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_RX_SIGDET_CTRL2, 0x6e),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
@@ -344,7 +344,7 @@ static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
-static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
@@ -374,7 +374,7 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x06),
 };
 
-static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
+static const struct qmp_phy_init_tbl sm8150_ufsphy_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
@@ -383,7 +383,7 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
+static const struct qmp_phy_init_tbl sm8150_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
@@ -421,7 +421,7 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
 
 };
 
-static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
+static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
@@ -431,7 +431,7 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
-static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00),
@@ -461,7 +461,7 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
 };
 
-static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
+static const struct qmp_phy_init_tbl sm8350_ufsphy_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
@@ -473,7 +473,7 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
+static const struct qmp_phy_init_tbl sm8350_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
@@ -513,7 +513,7 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs_tbl[] = {
+static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
@@ -660,12 +660,12 @@ static const char * const qmp_phy_vreg_l[] = {
 static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= msm8996_ufs_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufs_serdes_tbl),
-	.tx_tbl			= msm8996_ufs_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufs_tx_tbl),
-	.rx_tbl			= msm8996_ufs_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufs_rx_tbl),
+	.serdes_tbl		= msm8996_ufs_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufs_serdes),
+	.tx_tbl			= msm8996_ufs_tx,
+	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufs_tx),
+	.rx_tbl			= msm8996_ufs_rx,
+	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufs_rx),
 
 	.clk_list		= msm8996_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(msm8996_ufs_phy_clk_l),
@@ -685,14 +685,14 @@ static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sdm845_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_serdes_tbl),
-	.tx_tbl			= sdm845_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_tx_tbl),
-	.rx_tbl			= sdm845_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_rx_tbl),
-	.pcs_tbl		= sdm845_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_pcs_tbl),
+	.serdes_tbl		= sdm845_ufsphy_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_serdes),
+	.tx_tbl			= sdm845_ufsphy_tx,
+	.tx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_tx),
+	.rx_tbl			= sdm845_ufsphy_rx,
+	.rx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_rx),
+	.pcs_tbl		= sdm845_ufsphy_pcs,
+	.pcs_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_pcs),
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -709,14 +709,14 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= sm6115_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
-	.tx_tbl			= sm6115_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_tx_tbl),
-	.rx_tbl			= sm6115_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_rx_tbl),
-	.pcs_tbl		= sm6115_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_pcs_tbl),
+	.serdes_tbl		= sm6115_ufsphy_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_serdes),
+	.tx_tbl			= sm6115_ufsphy_tx,
+	.tx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_tx),
+	.rx_tbl			= sm6115_ufsphy_rx,
+	.rx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_rx),
+	.pcs_tbl		= sm6115_ufsphy_pcs,
+	.pcs_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_pcs),
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -732,14 +732,14 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8150_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
-	.rx_tbl			= sm8150_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
+	.serdes_tbl		= sm8150_ufsphy_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes),
+	.tx_tbl			= sm8150_ufsphy_tx,
+	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx),
+	.rx_tbl			= sm8150_ufsphy_rx,
+	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx),
+	.pcs_tbl		= sm8150_ufsphy_pcs,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs),
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -754,14 +754,14 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8350_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
-	.rx_tbl			= sm8350_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+	.serdes_tbl		= sm8350_ufsphy_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes),
+	.tx_tbl			= sm8350_ufsphy_tx,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx),
+	.rx_tbl			= sm8350_ufsphy_rx,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx),
+	.pcs_tbl		= sm8350_ufsphy_pcs,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs),
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -776,14 +776,14 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8350_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
-	.rx_tbl			= sm8350_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+	.serdes_tbl		= sm8350_ufsphy_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes),
+	.tx_tbl			= sm8350_ufsphy_tx,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx),
+	.rx_tbl			= sm8350_ufsphy_rx,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx),
+	.pcs_tbl		= sm8350_ufsphy_pcs,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs),
 	.clk_list		= sm8450_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
-- 
2.25.1

