Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316A75F0AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbiI3LiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiI3Lhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:37:50 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479B2156C0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j16so6434126lfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6oec05gZBuEQEFbRbXfoM2pNshyBZRih8R+HIQYjcxY=;
        b=lJXZwfqxVbk002gEVb1mMCTlLOHRAquLmjQpboZQVveOTUCqrEkfrgKdTsGOxo75Ds
         pnb7HqLuMN+h+KUtIdD7Ql1X/jCcEAyCovTuAJyjzbL1aXNMw4IjaBfE9ZMGnPzAPWSn
         o983tbtCECY5WalIIAb+5BcAgVJIvxRoyq59uwqY4KharSKMnc6T9DkAEcFobRBStEVN
         ZGlHBobpkt5dDU60CeyZQ9wKx5zDArhwpD13gsdrbZ5qblF8/v6qnsF6a6jyCKwpkEOU
         8hS8d+pUPWFVT85CACNK2dUvLGElWqCJovnT9KjrEZtLboEVngeXXCLiKk1t+1B0ofys
         /1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6oec05gZBuEQEFbRbXfoM2pNshyBZRih8R+HIQYjcxY=;
        b=mtVKYvHPXXLib6IE85uajKnJiwKHYnrXcUdsHKX6Edus08vhrh/sbXiODnPQMiqNxK
         zlHBHXlR+/fDlPIeNSEaiU8nncvaIlhU0Fqc01Su7+T2UlUAtnjdgw1lM84/p5AU1r2S
         MqtcgFP1yacz8Eud3EK2nGxwlrNX9Rk6zu+Y2l74bocsuM8ZOExxXnajNWxyiTlZmcEY
         e4ZbVwQVSphSwPDcrYaZcUepZGbEBEeh5Acj9d7WlBDKFC9l1SkhBf4DvEeItDlNofU9
         cIaFg+EZ0pOA9h0JLTFwEg2mdjDhqwis7BkoMBILUv73YganoZzNYnr27Nyqo1zDjtbX
         g0OA==
X-Gm-Message-State: ACrzQf1glNAEn0ljgW8T5ThzIzZe/xnITXiaw0gwfKuvbXWk9Js/sXi6
        WalA53wnk6Y6OwA+BGR3R/Lc8w==
X-Google-Smtp-Source: AMsMyM5v3tWjcO8yLPSJj4dVp+kPyltKz1w4cohbt8wSL5Py+W8BmYoj/HlR6upX/gmORoJw4PkH0g==
X-Received: by 2002:a05:6512:3b9d:b0:498:fc06:320b with SMTP id g29-20020a0565123b9d00b00498fc06320bmr2983192lfv.21.1664537369316;
        Fri, 30 Sep 2022 04:29:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 02/12] phy: qcom-qmp-pcie: rename regs layout arrays
Date:   Fri, 30 Sep 2022 14:29:16 +0300
Message-Id: <20220930112926.638543-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
References: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 053e2574254b..48b49719b7a5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -86,21 +86,14 @@ enum qphy_reg_layout {
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
@@ -114,7 +107,7 @@ static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
-static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int pciephy_v4_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
@@ -1467,7 +1460,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
 	.num_vregs		= 0,
-	.regs			= pciephy_regs_layout,
+	.regs			= pciephy_v2_regs_layout,
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1495,7 +1488,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
 	.num_vregs		= 0,
-	.regs			= ipq_pciephy_gen3_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1526,7 +1519,7 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
 	.num_vregs		= 0,
-	.regs			= ipq_pciephy_gen3_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1555,7 +1548,7 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sdm845_qmp_pciephy_regs_layout,
+	.regs			= pciephy_v3_regs_layout,
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1621,7 +1614,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1659,7 +1652,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1687,7 +1680,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= pciephy_regs_layout,
+	.regs			= pciephy_v3_regs_layout,
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1713,7 +1706,7 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1742,7 +1735,7 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
@@ -1772,7 +1765,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -1802,7 +1795,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
+	.regs			= pciephy_v4_regs_layout,
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-- 
2.35.1

