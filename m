Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805E45EE9F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbiI1XKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbiI1XK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D55B3E744
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g20so15915533ljg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ToJBL2tH33Cym3hzvn/YFz4wd+xYafmsyQurLLHni98=;
        b=L/Ch/vGH1j3bvLAnF8YiWz+8Pk4tQNjqUbA/6VJ0PEO/Xz0mvh+f+B+AQ9DUYi2pk3
         4rxzoBQvLPDmPOjOq4TPjigOwR+8E4ZS1eradRfVqRgQkn39PXt9/Mx1BMR4CPf883Yg
         N50ZixhVqIKte6tNbhYxIw8mR+i+FF1ljTGD8AgLDQOfJCax5G33INHQaNgge6fLqot3
         kx6J/EMdIRCK1lahNkF22VaNrDtWHkDbsEoy0f6w0yAQbvDtv5q7aB6bsAIYZVy0V0xO
         JlXuRorrjXhGkVJqmZ7J/5eWFaLD0DFKzaXfexTI3nBFV7StzC501QzeIf3YUZSNtyBi
         areg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ToJBL2tH33Cym3hzvn/YFz4wd+xYafmsyQurLLHni98=;
        b=oaBUCwPSSqUoaoMWKnroh+CkKNiksaxN9vBEtapT6XXRphZXW066E3Aw5bxd9QOcgC
         coCTbIkXqSNsNTy7DTw51KxvslREK2SAyHOkvBru+CN8mWzB3eo+KimQFxEp0zuTploq
         +bDrZ9fFUJiu7Gz+YCCURiLzzY+W82nC+BCTHuzBgfaA3qaCsSe/vzkOQj7tFQhV0wEl
         9/WO+Ha4oOH7sZoRpyZtmj57Ez0fRxrvsqx0hQSc4W0gL0rNGv0vcir3UYsObCIYnA2J
         nrTc2lEoVSmRsNgJ7Yg3B6Vu3LakGMa1xVk1wQ0ZzBOf9y1du+p8UH7yf1/OKwBs0J3K
         ov+Q==
X-Gm-Message-State: ACrzQf2acF8nOJJO5OVssFr2/eSiyZetKDVeCK+tLjpa3wJMfqo+qKHu
        CA8BScTpl4D0AY0n1FtIAocnJA==
X-Google-Smtp-Source: AMsMyM4uU2xRw9njee6LWaEasFm5fJJLjPBwobjLOZjMWNaywWcrnz9fH90E/FKLJFpsvBX7LLCarg==
X-Received: by 2002:a2e:3a19:0:b0:26a:a3b3:3430 with SMTP id h25-20020a2e3a19000000b0026aa3b33430mr53355lja.247.1664406624403;
        Wed, 28 Sep 2022 16:10:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 11/18] phy: qcom-qmp-ufs: rename regs layout arrays
Date:   Thu, 29 Sep 2022 02:10:07 +0300
Message-Id: <20220928231014.455201-12-dmitry.baryshkov@linaro.org>
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
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    |  4 +++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 31 ++++++++++---------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
index bcca23493b7e..43255e8bf038 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
@@ -8,6 +8,9 @@
 #define QCOM_PHY_QMP_PCS_UFS_V5_H_
 
 /* Only for QMP V5 PHY - UFS PCS registers */
+#define QPHY_V5_PCS_UFS_PHY_START			0x000
+#define QPHY_V5_PCS_UFS_POWER_DOWN_CONTROL		0x004
+#define QPHY_V5_PCS_UFS_SW_RESET			0x008
 #define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
 #define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
 #define QPHY_V5_PCS_UFS_PLL_CNTL			0x02c
@@ -21,6 +24,7 @@
 #define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2			0x158
 #define QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND		0x160
 #define QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND			0x168
+#define QPHY_V5_PCS_UFS_READY_STATUS			0x180
 #define QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
 #define QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 72cae70d0507..593173167b8a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -86,31 +86,32 @@ enum qphy_reg_layout {
 	QPHY_LAYOUT_SIZE
 };
 
-static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int ufsphy_v2_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= QPHY_V2_PCS_UFS_PHY_START,
 	[QPHY_PCS_READY_STATUS]		= QPHY_V2_PCS_UFS_READY_STATUS,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V2_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
-static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int ufsphy_v3_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= QPHY_V3_PCS_UFS_PHY_START,
 	[QPHY_PCS_READY_STATUS]		= QPHY_V3_PCS_UFS_READY_STATUS,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
-static const unsigned int sm6115_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= QPHY_V2_PCS_UFS_PHY_START,
-	[QPHY_PCS_READY_STATUS]		= QPHY_V2_PCS_UFS_READY_STATUS,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V2_PCS_UFS_POWER_DOWN_CONTROL,
-};
-
-static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+static const unsigned int ufsphy_v4_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
 	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int ufsphy_v5_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V5_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_UFS_SW_RESET,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_UFS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
@@ -677,7 +678,7 @@ static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 
-	.regs			= msm8996_ufsphy_regs_layout,
+	.regs			= ufsphy_v2_regs_layout,
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
@@ -701,7 +702,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sdm845_ufsphy_regs_layout,
+	.regs			= ufsphy_v3_regs_layout,
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
@@ -725,7 +726,7 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm6115_ufsphy_regs_layout,
+	.regs			= ufsphy_v2_regs_layout,
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
@@ -748,7 +749,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v4_regs_layout,
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
@@ -770,7 +771,7 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v5_regs_layout,
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
@@ -792,7 +793,7 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v5_regs_layout,
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
-- 
2.35.1

