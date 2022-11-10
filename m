Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BEF624A8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiKJTW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiKJTWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:55 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2252450B2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:53 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c1so5038036lfi.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbih8lazdYkhOIyI3tNjlHQP6Or75XRh9og5hx/f3jM=;
        b=DyCRGlUOao0uPlDe8d4+2Ygz5bbnj8Sy1BmfTFJE7L/8ofIuKE7mEUzmTdpXzUruzr
         VA6PtLpPJT30Fcd2Tnepy+ImJosxR8ayQvGN/heGsnde5tp73bdpxj2NwruPoSJ+AwNc
         VJOWlFbZ4ZspDSgNLngQ6zAy+HhQ7k1XqWThsc3FuCBWIu/7Wa4D5nJXs0pSX5wUBwZK
         gEXUko0l/Tp5UFfIEZWMFM0H9nczFp/OqBsGM1bf/ePFcj3O9NajEuztJ1FHLCFpm6p5
         TeI4ijiQGqpKfsu7BEW50WvTeIAY8xBJ9Vjgg5gyTsl3YxGmwfT6xvgO65EjGXS1UcDc
         JaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbih8lazdYkhOIyI3tNjlHQP6Or75XRh9og5hx/f3jM=;
        b=h5AaUNftNeYkmYaC5hGk+i+jsOIOcJ8OTbRO/vuJ1QJFrNLx6HDWie7XEH5VzuA6ol
         ssqZd2uwM7LnkDCEAiPXUVbc59vFTa1CROOA3wCp8XPf3PHrT6EMzAFhrfR9mMQNL05T
         Ea9SyLwweutwQpdqcyq0BWPDbIFviiMFwm3xLVjHLBoB6SXZoWjSnIeXZ+VX7hNgWkad
         iCYVoRgIYTOx4bbMlrzJwpGBSSOtGHbV4OIxqwjSHXUB+oa69UoyRF0ImsH6WlF3N6+k
         czlZcTvA7T8hGziksHHgvvu7pwKXbAjW+628CCbpq+Vw5I6jC6AvK9eZ/2yuWd0vkXlB
         x0lA==
X-Gm-Message-State: ACrzQf0Lfmdsnlpcv879utCy6MEcnEN9UrmzUc8zaP9NPMAkCRD7iNde
        x4bhcOyTnlQMVmmDuKbckHMfS+dGw+Xyfg==
X-Google-Smtp-Source: AMsMyM55tKGuzmUlioa51u5t3DLEAJr6tpQcWTnpt6YqNkjbkQqcFKzbnXLqfGDEBTnQQftdiAQO+g==
X-Received: by 2002:a19:5507:0:b0:48a:b5ef:c49d with SMTP id n7-20020a195507000000b0048ab5efc49dmr1946258lfe.313.1668108172323;
        Thu, 10 Nov 2022 11:22:52 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 04/13] phy: qcom-qmp-pcie: rename regs layout arrays
Date:   Thu, 10 Nov 2022 22:22:39 +0300
Message-Id: <20221110192248.873973-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename regs layouts to follow the QMP PHY version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 52 +++++++++++-----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h |  4 ++
 2 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 7de0ac23ff0b..4bab804a2ed8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -76,21 +76,14 @@ enum qphy_reg_layout {
 	QPHY_LAYOUT_SIZE
 };
 
-static const unsigned int ipq_pciephy_gen3_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]				= QPHY_V4_PCS_SW_RESET,
-	[QPHY_START_CTRL]			= QPHY_V4_PCS_START_CONTROL,
-	[QPHY_PCS_STATUS]			= QPHY_V4_PCS_PCS_STATUS1,
-	[QPHY_PCS_POWER_DOWN_CONTROL]		= QPHY_V4_PCS_POWER_DOWN_CONTROL,
-};
-
-static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int pciephy_v2_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V2_PCS_SW_RESET,
 	[QPHY_START_CTRL]		= QPHY_V2_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V2_PCS_PCI_PCS_STATUS,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V2_PCS_POWER_DOWN_CONTROL,
 };
 
-static const unsigned int sdm845_qmp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int pciephy_v3_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
 	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
@@ -104,13 +97,20 @@ static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
-static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int pciephy_v4_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v5_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -1678,7 +1678,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
 	.num_vregs		= 0,
-	.regs			= pciephy_regs_layout,
+	.regs			= pciephy_v2_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1705,7 +1705,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
 	.num_vregs		= 0,
-	.regs			= ipq_pciephy_gen3_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1734,7 +1734,7 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
 	.num_vregs		= 0,
-	.regs			= ipq_pciephy_gen3_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1761,7 +1761,7 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sdm845_qmp_pciephy_regs_layout,
+	.regs			= pciephy_v3_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1823,7 +1823,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1860,7 +1860,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1885,7 +1885,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= pciephy_regs_layout,
+	.regs			= pciephy_v3_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1914,7 +1914,7 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1949,7 +1949,7 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -1984,7 +1984,7 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x2_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -2022,7 +2022,7 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x4_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -2049,7 +2049,7 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN,
 	.phy_status		= PHYSTATUS_4_20,
@@ -2086,7 +2086,7 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -2123,7 +2123,7 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x2_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -2158,7 +2158,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
@@ -2200,7 +2200,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS_4_20,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
index 04f260711ea1..36cc80bb9059 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
@@ -7,6 +7,10 @@
 #define QCOM_PHY_QMP_PCS_V5_H_
 
 /* Only for QMP V5 PHY - USB/PCIe PCS registers */
+#define QPHY_V5_PCS_SW_RESET				0x000
+#define QPHY_V5_PCS_PCS_STATUS1				0x014
+#define QPHY_V5_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V5_PCS_START_CONTROL			0x044
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG1			0x0c4
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG2			0x0c8
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG3			0x0cc
-- 
2.35.1

