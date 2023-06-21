Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19AF73894C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjFUPdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233412AbjFUPdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:33:24 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E3310DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f87592ecaeso4659576e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361600; x=1689953600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6UGMmKiSJ87dVKJCq6xTOUGaCMzpqDueTLzydEjdu0=;
        b=Mu+WVXKpIjJYcciQD/H1Dxv8o5yIljsuIe6f6yWaDh6uUZ6kBHySSKuRh4G2K9RXfP
         SjbGXieD1oU/wepmQ/PT5dVE3zVrOmeBLGSZaw+MQRoQjpHn+c7+KqUX6LqgsTStMxRP
         +CWdKhDZXPDKdYugi48QJ+rFcAzfiEqHMpxAlDwehKuZVpMBT0bNXtDUgFk73Weiun59
         k0gcrpStMwnaW136isVu17W44mK1c+wjgT4A+QyRSkBHY7h0ltgVCdf6T+1Lt1c7Y4aS
         wlm4/RJO7IFa6/dBj0SUerAsqCVddfewjBYSYAm19nEHQKeKT9cvHIKMtGQ8q5p0Afjj
         OBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361600; x=1689953600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6UGMmKiSJ87dVKJCq6xTOUGaCMzpqDueTLzydEjdu0=;
        b=MreZaNHXBAjNcQt9qC6ks1GEVN+pSRWX1JkI16EChiPg82WKHPlm+XBc5sN1yTTejD
         qfgWBcS8TnSwQZDPp43BaelhsW60unNV/p3c53eZtYnX+u1lM/q1Q9Vg78WNcgQNta/7
         urbHJ5RZ+ZoB65AxF+SpkIPms3IFlBU78+Zibj44Xnip6VdBI28+47wht+MIiif2WUG7
         hcuZhn1FDjOpw7Kh15ToT1143ObYHu/qV6a8ZXFso7lwQyx9g3KSWXxCXLkcimB5OjHQ
         dr569HuVqV2x7DEc/KaBwD35Q6D4RG/vU7tkVjybN2AVT2SPh0clr6BQTdEeeYE3LdlK
         QdWQ==
X-Gm-Message-State: AC+VfDw30ShkLZ2cEJg1caAoJ57RQLkTPHKVUyHnGPSCnkkRsuT18zD6
        D+GLiMSyVrLE+cxdFjr6H6ysfQ==
X-Google-Smtp-Source: ACHHUZ4KHx0DukzCIDUFE6zXVA/3ThJ57bA2cCsVJEsayLh7CQFVlTtZ5qC+vP8JdvU55DdumL6/Kg==
X-Received: by 2002:a19:4402:0:b0:4f9:5a61:194f with SMTP id r2-20020a194402000000b004f95a61194fmr1759483lfa.11.1687361600319;
        Wed, 21 Jun 2023 08:33:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:33:19 -0700 (PDT)
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
Subject: [RESEND PATCH 2/7] phy: qcom: qmp-combo: reuse register layouts for more registers
Date:   Wed, 21 Jun 2023 18:33:12 +0300
Message-Id: <20230621153317.1025914-3-dmitry.baryshkov@linaro.org>
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

Instead of passing additional registers to qmp_v456_configure_dp_phy(),
reuse qphy_reg_layout and add those registers to register layout maps.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 100 ++++++++++++++--------
 1 file changed, 64 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9d03b7b8e00c..5a0966e66cc1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -106,6 +106,13 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
+
+	QPHY_COM_RESETSM_CNTRL,
+	QPHY_COM_C_READY_STATUS,
+	QPHY_COM_CMN_STATUS,
+
+	QPHY_DP_PHY_STATUS,
+
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -117,9 +124,15 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V3_DP_PHY_STATUS,
 };
 
-static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
@@ -128,6 +141,29 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	/* In PCS_USB */
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V4_DP_PHY_STATUS,
+};
+
+static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
@@ -1564,7 +1600,7 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x300,
 
 	.has_pwrdn_delay	= true,
@@ -1612,7 +1648,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 };
 
 static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
@@ -1702,7 +1738,7 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x300,
 
 	.has_pwrdn_delay	= true,
@@ -1752,7 +1788,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v45_usb3phy_regs_layout,
 
 	.has_pwrdn_delay	= true,
 };
@@ -1795,7 +1831,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v6_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v6_usb3phy_regs_layout,
 	.clk_list		= qmp_v4_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -1994,6 +2030,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 
@@ -2034,9 +2071,9 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x20, qmp->dp_serdes + QSERDES_V3_COM_RESETSM_CNTRL);
+	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
 
-	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_V3_COM_C_READY_STATUS,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
@@ -2045,7 +2082,7 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V3_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2056,7 +2093,7 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	return readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V3_DP_PHY_STATUS,
+	return readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2148,13 +2185,10 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 			QSERDES_V4_TX_TX_EMP_POST1_LVL);
 }
 
-static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
-				     unsigned int com_resetm_ctrl_reg,
-				     unsigned int com_c_ready_status_reg,
-				     unsigned int com_cmn_status_reg,
-				     unsigned int dp_phy_status_reg)
+static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 
@@ -2199,23 +2233,23 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x20, qmp->dp_serdes + com_resetm_ctrl_reg);
+	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
 
-	if (readl_poll_timeout(qmp->dp_serdes + com_c_ready_status_reg,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	if (readl_poll_timeout(qmp->dp_serdes + com_cmn_status_reg,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	if (readl_poll_timeout(qmp->dp_serdes + com_cmn_status_reg,
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2224,14 +2258,14 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
 
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + dp_phy_status_reg,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + dp_phy_status_reg,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2243,16 +2277,14 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp,
 
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp, QSERDES_V4_COM_RESETSM_CNTRL,
-					QSERDES_V4_COM_C_READY_STATUS,
-					QSERDES_V4_COM_CMN_STATUS,
-					QSERDES_V4_DP_PHY_STATUS);
+	ret = qmp_v456_configure_dp_phy(qmp);
 	if (ret < 0)
 		return ret;
 
@@ -2287,7 +2319,7 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V4_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2308,16 +2340,14 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 
 static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp, QSERDES_V4_COM_RESETSM_CNTRL,
-					QSERDES_V4_COM_C_READY_STATUS,
-					QSERDES_V4_COM_CMN_STATUS,
-					QSERDES_V4_DP_PHY_STATUS);
+	ret = qmp_v456_configure_dp_phy(qmp);
 	if (ret < 0)
 		return ret;
 
@@ -2347,7 +2377,7 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V4_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
 			((status & BIT(1)) > 0),
 			500,
@@ -2368,16 +2398,14 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 
 static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp, QSERDES_V6_COM_RESETSM_CNTRL,
-					QSERDES_V6_COM_C_READY_STATUS,
-					QSERDES_V6_COM_CMN_STATUS,
-					QSERDES_V6_DP_PHY_STATUS);
+	ret = qmp_v456_configure_dp_phy(qmp);
 	if (ret < 0)
 		return ret;
 
@@ -2407,7 +2435,7 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 	udelay(2000);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V6_DP_PHY_STATUS,
+	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			       status,
 			       ((status & BIT(1)) > 0),
 			       500,
-- 
2.39.2

