Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E457624A92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiKJTW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiKJTW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:57 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8A145A12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:56 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id s24so2052810ljs.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSw5meRLWoDLsv9gtDfZAhn9Oz9zqObSpU+ljZXhZKs=;
        b=LHqI2SoZvmAfR/3okfzTONLJWAZPrD44JIY7Yzn1payeME9VqaR0EeLlu/eylLy0lm
         +cW0VqCqK9ZtQUOrXvG7fwIdIRL89eZ8Hy/6Dv6BUi+bG7lhsyh/eTydUMl6G/usW728
         0I0ZLFlZJi4NEANrUemjmqL3RE6o7hSExIY+H5apC0GBA4YQAZg87+EgsmwlsZDKTwSA
         AHtmf/6lC2j0aYwZIClyGMzTL++ox+PKD5hZ+GUGvYDY4hh+LQA/+aUYhw9gqKSJ2GAe
         /cQKkkIple9iqjwWXzh/yyZ/nTYNQZGXb8P8Yqgc2E3+3mJdYW3rjiMjPiPHODlI4541
         TYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSw5meRLWoDLsv9gtDfZAhn9Oz9zqObSpU+ljZXhZKs=;
        b=dr9xsOmT86i8YHid8pW45ycMWnhPbCUBMtjxhitO71zFnDRjxVhSRbwsrM9efq+XVb
         hcuNDwbmvn7NFGPlMzSU7VXfw+9d4M2SbJPuqcg7qVJ9ZwquEJayFPY3idAH2C+cHOrb
         kN6RRiFItqEFkhTHjPSunaz4G9dwhyW4KVUwFs2eBcksPIVKkuwUukStj/yEe568Tm7E
         Sc/+dHzezHzR4bztCNxWbKX7BLLo4K5EQDYVYLiHqkfe6Hp1HFBJg5NhlKaaRId6xpaa
         Rn1B7/CCU4TNU1aNF0a97A1vXtJXs/KyaGoKH9kUnF237mRDTv+B+8UoMmHG0/zwT6xv
         ZZtg==
X-Gm-Message-State: ACrzQf2dwRzNbdftXLKQoPzbm4XoBXlIooAD+899Jx9gFXGWvzhoQ4il
        CjCK+npCrSy6/xNyvDVoxyMFUQ==
X-Google-Smtp-Source: AMsMyM7SR/f2vsxysUG2HjHxZYl7cGZQYtznNchDBLUhGPucIIEMwQpYXnQ/kueRdMgXs1imdklRqQ==
X-Received: by 2002:a2e:9854:0:b0:277:8df:88a7 with SMTP id e20-20020a2e9854000000b0027708df88a7mr9663346ljj.139.1668108174809;
        Thu, 10 Nov 2022 11:22:54 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 08/13] phy: qcom-qmp-ufs: rename regs layout arrays
Date:   Thu, 10 Nov 2022 22:22:43 +0300
Message-Id: <20221110192248.873973-9-dmitry.baryshkov@linaro.org>
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
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    |  4 +++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 33 ++++++++++---------
 2 files changed, 21 insertions(+), 16 deletions(-)

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
index 8a7a3bfbd8d3..c9698e17b617 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -71,31 +71,32 @@ enum qphy_reg_layout {
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
@@ -647,7 +648,7 @@ static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 
-	.regs			= msm8996_ufsphy_regs_layout,
+	.regs			= ufsphy_v2_regs_layout,
 
 	.no_pcs_sw_reset	= true,
 };
@@ -669,7 +670,7 @@ static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v5_regs_layout,
 };
 
 static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
@@ -687,7 +688,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sdm845_ufsphy_regs_layout,
+	.regs			= ufsphy_v3_regs_layout,
 
 	.no_pcs_sw_reset	= true,
 };
@@ -707,7 +708,7 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm6115_ufsphy_regs_layout,
+	.regs			= ufsphy_v2_regs_layout,
 
 	.no_pcs_sw_reset	= true,
 };
@@ -727,7 +728,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v4_regs_layout,
 };
 
 static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
@@ -745,7 +746,7 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v5_regs_layout,
 };
 
 static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
@@ -763,7 +764,7 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
+	.regs			= ufsphy_v5_regs_layout,
 };
 
 static void qmp_ufs_configure_lane(void __iomem *base,
-- 
2.35.1

