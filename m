Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFEB56665C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbiGEJne (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiGEJnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:31 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A8910D8
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:28 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y18so2951547ljj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w0EDj3lhCdr76veW19BuwtDNTETtoQp/u51JMb8YeOk=;
        b=xhYB/k7jd9eqBiCB1aQ8valpooT7mXOnsN/0GShXEn8jNk2IVmmhlcQYP5I4DkAjxp
         v1Ljvjv5Dlg+jAIc4Fd1xD+TepKzyodZCICdtP4B9epJ+4+7IsNr/Ud9GsZJqDb8y8Am
         SHsyUukMIFprpDSmB8Zp8Gcn0jD5RomXssCItFcuQNj4Su669Rv52JymnIQU3bB0et1k
         ZElFAOBr4sBrCUofaG+YJo22o7GLbhTAc4z6e5E/PV5DbiAZpoFtgZjDFghGlJ7EZc2Q
         AEZZOSJIDJXX1PJlJ9VcbfVODwjv9uX0d1BkFBZno5LnwkSQyy5mizfiTkCJbPiHd8Mq
         4wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w0EDj3lhCdr76veW19BuwtDNTETtoQp/u51JMb8YeOk=;
        b=7IbbPeFfXAm17aowzRWE9ug14qDagNOMIx1sI4fAEY1gmKOjBZ4LhqQFd6htpGkj0X
         +OvstkwDfSLapqFu+dVKoHz9+kOnuDRR0Yo9k7BY/cwdj+iWS3MNMwc/u8sJdwwkGNVV
         XMzlv9qGdE5ayu19n/cOaaOTKAsMCs8NlmEHbVY7rwCug4jgXrDfKN8Mj0aRM/f7bmcE
         2956HNh2Jy7Q3D5ruHtk2BGDvyglH63p04Y8D4wcdyqZNI864CpXyQofGtKZ9M9sHcah
         P5ISRmUoH2PciVGKzhEOCQ3O3vWdGv5mhuGHfZ9VFj1YaWxeKahvn8KnJQJyaWRsuXJd
         WRlw==
X-Gm-Message-State: AJIora9CYIL5C2s5aWYpYknS0nA2ZGxho9dUYKQ+TjaARHWsdD+nJ+oc
        eAiwBpTtnZxqGotTgnGeasJtVQ==
X-Google-Smtp-Source: AGRyM1u11QAySZ4vvMVXMru3JrfDyNXnbiA17k1lEB5xo0X4d0rhPJeZXfIlwwk/5WUYJqLQm/EnIQ==
X-Received: by 2002:a2e:a54b:0:b0:25c:5d6:ec6e with SMTP id e11-20020a2ea54b000000b0025c05d6ec6emr12186445ljn.403.1657014206338;
        Tue, 05 Jul 2022 02:43:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 06/28] phy: qcom-qmp: rename QMP V2 PCS registers
Date:   Tue,  5 Jul 2022 12:42:58 +0300
Message-Id: <20220705094320.1313312-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename QMP V2 PCS registers to follow the usual pattern of
QPHY_V2_PCS_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  4 +-
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 20 +++----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 26 ++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 22 ++++----
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 12 ++---
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 54 +++++++++----------
 6 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fd7a9c25f27d..2335658affdb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1667,7 +1667,7 @@ static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 				cfg->pwrdn_ctrl);
 	else
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -1829,7 +1829,7 @@ static int qcom_qmp_phy_combo_power_off(struct phy *phy)
 			qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 				     cfg->pwrdn_ctrl);
 		} else {
-			qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+			qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 					cfg->pwrdn_ctrl);
 		}
 	}
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 502ea4de3044..4b6ddc7ec862 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -222,17 +222,17 @@ static const struct qmp_phy_init_tbl msm8996_pcie_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_RX_IDLE_DTCT_CNTRL, 0x4c),
-	QMP_PHY_INIT_CFG(QPHY_PWRUP_RESET_DLY_TIME_AUXCLK, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_IDLE_DTCT_CNTRL, 0x4c),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
 
 	QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x05),
 
-	QMP_PHY_INIT_CFG(QPHY_ENDPOINT_REFCLK_DRIVE, 0x05),
-	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG4, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG1, 0xa3),
-	QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M3P5DB_V0, 0x0e),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_POWER_DOWN_CONTROL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_POWER_STATE_CONFIG4, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_POWER_STATE_CONFIG1, 0xa3),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0, 0x0e),
 };
 
 struct qmp_phy;
@@ -637,7 +637,7 @@ static int qcom_qmp_phy_pcie_msm8996_power_on(struct phy *phy)
 	 * Pull out PHY from POWER DOWN state.
 	 * This is active low enable signal to power-down PHY.
 	 */
-	qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
+	qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
@@ -687,7 +687,7 @@ static int qcom_qmp_phy_pcie_msm8996_power_off(struct phy *phy)
 		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			     cfg->pwrdn_ctrl);
 	} else {
-		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 	}
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5a16aaef3e97..e3404aa05e13 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -438,17 +438,17 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl ipq8074_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_ENDPOINT_REFCLK_DRIVE, 0x4),
-	QMP_PHY_INIT_CFG(QPHY_OSC_DTCT_ACTIONS, 0x0),
-	QMP_PHY_INIT_CFG(QPHY_PWRUP_RESET_DLY_TIME_AUXCLK, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x0),
-	QMP_PHY_INIT_CFG(QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB, 0x0),
-	QMP_PHY_INIT_CFG(QPHY_LP_WAKEUP_DLY_TIME_AUXCLK, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE, 0x4),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_OSC_DTCT_ACTIONS, 0x0),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x0),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB, 0x0),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x40),
 	QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x73),
-	QMP_PHY_INIT_CFG(QPHY_RX_SIGDET_LVL, 0x99),
-	QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M6DB_V0, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M3P5DB_V0, 0xe),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SIGDET_LVL, 0x99),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M6DB_V0, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0, 0xe),
 	QMP_PHY_INIT_CFG_L(QPHY_SW_RESET, 0x0),
 	QMP_PHY_INIT_CFG_L(QPHY_START_CTRL, 0x3),
 };
@@ -1984,7 +1984,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 				cfg->pwrdn_ctrl);
 	else
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 
 	return 0;
@@ -2093,7 +2093,7 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 	 * Pull out PHY from POWER DOWN state.
 	 * This is active low enable signal to power-down PHY.
 	 */
-	qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
+	qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
@@ -2141,7 +2141,7 @@ static int qcom_qmp_phy_pcie_power_off(struct phy *phy)
 		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			     cfg->pwrdn_ctrl);
 	} else {
-		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 	}
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 83330f7ec64c..bfe5f562bcd0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -310,15 +310,15 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_RX_PWM_GEAR_BAND, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_TX_LARGE_AMP_DRV_LVL, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
-	QMP_PHY_INIT_CFG(QPHY_RX_SYM_RESYNC_CTRL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
-	QMP_PHY_INIT_CFG(QPHY_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_PWM_GEAR_BAND, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_SYM_RESYNC_CTRL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
 };
 
 static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
@@ -941,7 +941,7 @@ static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 			     cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			     cfg->pwrdn_ctrl);
 	else
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 			     cfg->pwrdn_ctrl);
 
 	return 0;
@@ -1083,7 +1083,7 @@ static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
 		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			     cfg->pwrdn_ctrl);
 	} else {
-		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 	}
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 597edeb2d8c3..40ac61bcadac 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -325,10 +325,10 @@ static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG_L(QPHY_FLL_MAN_CODE, 0x85),
 
 	/* Lock Det settings */
-	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG1, 0xd1),
-	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG2, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG3, 0x47),
-	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG2, 0x08),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LOCK_DETECT_CONFIG1, 0xd1),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LOCK_DETECT_CONFIG2, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_LOCK_DETECT_CONFIG3, 0x47),
+	QMP_PHY_INIT_CFG(QPHY_V2_PCS_POWER_STATE_CONFIG2, 0x08),
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
@@ -2095,7 +2095,7 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 			     cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			     cfg->pwrdn_ctrl);
 	else
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 			     cfg->pwrdn_ctrl);
 
 	return 0;
@@ -2223,7 +2223,7 @@ static int qcom_qmp_phy_usb_power_off(struct phy *phy)
 		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			     cfg->pwrdn_ctrl);
 	} else {
-		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 	}
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 6cb660455088..64af9720b3f9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -208,33 +208,33 @@
 #define QSERDES_RX_RX_INTERFACE_MODE			0x12c
 
 /* Only for QMP V2 PHY - PCS registers */
-#define QPHY_POWER_DOWN_CONTROL				0x04
-#define QPHY_TXDEEMPH_M6DB_V0				0x24
-#define QPHY_TXDEEMPH_M3P5DB_V0				0x28
-#define QPHY_TX_LARGE_AMP_DRV_LVL			0x34
-#define QPHY_TX_LARGE_AMP_POST_EMP_LVL			0x38
-#define QPHY_TX_SMALL_AMP_DRV_LVL			0x3c
-#define QPHY_TX_SMALL_AMP_POST_EMP_LVL			0x40
-#define QPHY_ENDPOINT_REFCLK_DRIVE			0x54
-#define QPHY_RX_IDLE_DTCT_CNTRL				0x58
-#define QPHY_POWER_STATE_CONFIG1			0x60
-#define QPHY_POWER_STATE_CONFIG2			0x64
-#define QPHY_POWER_STATE_CONFIG4			0x6c
-#define QPHY_LOCK_DETECT_CONFIG1			0x80
-#define QPHY_LOCK_DETECT_CONFIG2			0x84
-#define QPHY_LOCK_DETECT_CONFIG3			0x88
-#define QPHY_PWRUP_RESET_DLY_TIME_AUXCLK		0xa0
-#define QPHY_LP_WAKEUP_DLY_TIME_AUXCLK			0xa4
-#define QPHY_RX_MIN_STALL_NOCONFIG_TIME_CAP		0xcc
-#define QPHY_RX_SYM_RESYNC_CTRL				0x13c
-#define QPHY_RX_MIN_HIBERN8_TIME			0x140
-#define QPHY_RX_SIGDET_CTRL2				0x148
-#define QPHY_RX_PWM_GEAR_BAND				0x154
-#define QPHY_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB		0x1a8
-#define QPHY_OSC_DTCT_ACTIONS				0x1ac
-#define QPHY_RX_SIGDET_LVL				0x1d8
-#define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB		0x1dc
-#define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB		0x1e0
+#define QPHY_V2_PCS_POWER_DOWN_CONTROL				0x04
+#define QPHY_V2_PCS_TXDEEMPH_M6DB_V0				0x24
+#define QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0				0x28
+#define QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL			0x34
+#define QPHY_V2_PCS_TX_LARGE_AMP_POST_EMP_LVL			0x38
+#define QPHY_V2_PCS_TX_SMALL_AMP_DRV_LVL			0x3c
+#define QPHY_V2_PCS_TX_SMALL_AMP_POST_EMP_LVL			0x40
+#define QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE			0x54
+#define QPHY_V2_PCS_RX_IDLE_DTCT_CNTRL				0x58
+#define QPHY_V2_PCS_POWER_STATE_CONFIG1			0x60
+#define QPHY_V2_PCS_POWER_STATE_CONFIG2			0x64
+#define QPHY_V2_PCS_POWER_STATE_CONFIG4			0x6c
+#define QPHY_V2_PCS_LOCK_DETECT_CONFIG1			0x80
+#define QPHY_V2_PCS_LOCK_DETECT_CONFIG2			0x84
+#define QPHY_V2_PCS_LOCK_DETECT_CONFIG3			0x88
+#define QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0xa0
+#define QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK			0xa4
+#define QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP		0xcc
+#define QPHY_V2_PCS_RX_SYM_RESYNC_CTRL				0x13c
+#define QPHY_V2_PCS_RX_MIN_HIBERN8_TIME			0x140
+#define QPHY_V2_PCS_RX_SIGDET_CTRL2				0x148
+#define QPHY_V2_PCS_RX_PWM_GEAR_BAND				0x154
+#define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB		0x1a8
+#define QPHY_V2_PCS_OSC_DTCT_ACTIONS				0x1ac
+#define QPHY_V2_PCS_RX_SIGDET_LVL				0x1d8
+#define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB		0x1dc
+#define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB		0x1e0
 
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
-- 
2.35.1

