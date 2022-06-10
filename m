Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21DF9546CF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348291AbiFJTJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348272AbiFJTJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:39 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D2C324
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p18so2649013lfr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xOkvmGqe76WvB416Dq7dNuzpEoY+woxf30ocIkciSaM=;
        b=jRHEIN3czu+apZzgB5STvWh6j7MDTEl+mZkbI2pkTiZAm07trldiEVZDglHgUoKhsK
         6o1vtTQSfq4b2PqKyiKOrAkwqRjjaZpj3HEZuzO7Ee/tCpCltis07CXmxSAPwbgzCTO4
         yVX55puaq9VXriS2WXh93jTL7LXY+KWgXSRVCq/iP/aNCkqH+D5PaLellPNojlsnCmLE
         r+sAsurgSTSxGhHvEOD8SNS3G3oPdT0t6XGlQp5Zkl4GF3PLgN661UChOc+eELv5Fse7
         cQBiD4oSzzrlUvCKD33BFZ+SbO4tyT66dbsN/jF3dJApWz/5fM5ZBByq7p/+YzP1DOiP
         +lAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xOkvmGqe76WvB416Dq7dNuzpEoY+woxf30ocIkciSaM=;
        b=auMyBNvnVTAQ9tKZXLITplFXcIyqq383MVPMzUiMxF2Bxclint5gkgYWFkyJmUFhe2
         n/0B/CCM0qwnJIF2yPGqRcPbGVw8n/ytEpnvr+I4ZqfQdIGRJEB2i6nLUZ308WkGr/p7
         Oan9pjY7xA2seACbV1LgRA/zvu2ATGnDgAFCb8jh+2RKXIoFukBu5p+dEwn7ErAgc/zS
         8qRIr3cGswWAbG6alf/Kxn8DOFFvdYvRDqLUpNeMgGb8z56s0PL7Ui20daH4zx0WUgs+
         rzJeMhjs+40FWhk8Qpu9EoiwN16cZTWsfkpkbhfvde/9lePftXnbUy1zn1iIe7/mFsGC
         8rHQ==
X-Gm-Message-State: AOAM531CXwWrZx3egUM7ol/t+pL2wbVG/2vZ4XZHeNdp6EUHMHaM3hs1
        ejNQpGDh2o2gU+hz7e4sR20amA==
X-Google-Smtp-Source: ABdhPJzIAAkGg2zgpnHn3vhtWCm4E+wIzVhkutbdB0Ft8buEy5AARlOzT7OQFRhW+/DVA8/WZL1Bwg==
X-Received: by 2002:a05:6512:39c1:b0:471:b37e:fe5a with SMTP id k1-20020a05651239c100b00471b37efe5amr73659217lfu.527.1654888175803;
        Fri, 10 Jun 2022 12:09:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 06/28] phy: qcom-qmp: rename QMP V2 PCS registers
Date:   Fri, 10 Jun 2022 22:09:03 +0300
Message-Id: <20220610190925.3670081-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
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
index 21103c41ba08..90a4bb8e86a4 100644
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
index 5e984ad3d3a1..161be7a94acc 100644
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
@@ -1824,7 +1824,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 				cfg->pwrdn_ctrl);
 	else
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
 				cfg->pwrdn_ctrl);
 
 	return 0;
@@ -1933,7 +1933,7 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 	 * Pull out PHY from POWER DOWN state.
 	 * This is active low enable signal to power-down PHY.
 	 */
-	qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
+	qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
@@ -1981,7 +1981,7 @@ static int qcom_qmp_phy_pcie_power_off(struct phy *phy)
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
index b1f2f825bd21..fd169daffb02 100644
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

