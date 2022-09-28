Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC215EE9F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiI1XKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbiI1XKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7B340E2D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:23 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id j24so15930269lja.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RzM6oG5KE0UQHyUy9DXhvNhkfU1/HJx9u02ula3G0dk=;
        b=Zg/jexQa/2/TUCTMu6s+YkSBISFsIoiTJYlNORWF8Vrpezv8Wzwl1U8U/AM3iO4m9J
         eK2L4260K6vadnRBPngwNm9z/bMq8PEwBkbH7sIY6sfWcwG6TNQmE4ylOt/U9UFIP+S5
         fDUsCpGSlbaNcqRc1cBqNoJBCmOfmPd/TN9zhqjNAaOTUejOtrolgWlahtcyUkuQw91Q
         SB3vYN4yOr6EXpR3MJdWp3hK/IeoFYxekfqW6F4/31v6UKTH57/FKd7s1Xyl608+Xelb
         zSX1eDa/VydSPvTUkxEXIkDBoNBzm0JmbWTyBn94Nr5X6UyOkbWxVtjWW+Ze31dCwVwD
         5e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RzM6oG5KE0UQHyUy9DXhvNhkfU1/HJx9u02ula3G0dk=;
        b=VNq0GhoPbw7zWYyiZe8hj+NMzb7fa8D4haanBH4XqEaucIf96UsQKvkltgEcwBtbBD
         Hv7/d6cEHpqwK0UTW0IjxzIDunP4GcZNivTFpyO15bOrvRFEnWMwsBAqO69uZnZzc3Cb
         hE8heG6uZOfppvo+LsJQxtXzNISTyElA5LfxrfnE2VASpuH3BA9n6F+nC7QTBlxi82Ed
         GliY71TKMd5YpCGq2T9utth1Y/1bJDlqbjvLejcABtMMnArttu7/ujal3eZLnHkmpmSY
         6QeoYczRNZy6M7gwL/74/ZHpbXTFzGdtWh5kZfhH/aPT2QKAdvF2E5/uA705OJZP8YM7
         qeQg==
X-Gm-Message-State: ACrzQf0wvvSyMGWzz+6UU/UjQGoAEzn3oicHb+f0igRj+cBGJLbdh4eQ
        LB0nl81HCLSzVrRLOIrScxtxiw==
X-Google-Smtp-Source: AMsMyM4z50TVRzfN3Fp7111dX49lquGVhigTtPSJZDmAPonJ47iUSFuUFv/CXfWYzG2gpfFujhSBfA==
X-Received: by 2002:a2e:a54c:0:b0:26c:50c6:75c1 with SMTP id e12-20020a2ea54c000000b0026c50c675c1mr57651ljn.408.1664406622241;
        Wed, 28 Sep 2022 16:10:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 08/18] phy: qcom-qmp-pcie: rename regs layout arrays
Date:   Thu, 29 Sep 2022 02:10:04 +0300
Message-Id: <20220928231014.455201-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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
index c68815be8d4d..688d9eb78a82 100644
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

