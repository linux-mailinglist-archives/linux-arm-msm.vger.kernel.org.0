Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C3A6E2B50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 22:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDNUyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 16:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjDNUya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 16:54:30 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097F63C3B
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 13:54:29 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a76b2a36e2so419901fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681505667; x=1684097667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9cFFq/KYsVmXdRW5BoGPPdCt3V+TRMXS12ipPluoCk=;
        b=I38UCYH84Rgc9hSzF3d2E2pCxutrAD4gaIrN8dF/9+lawahHToFCecs36OEG3hJfCm
         wwDbAYe7A7us0KJu6Vlh9P1c+KrZqmfr0L9CPuqD6CuY2rdxVi4xthUy7qvgF7vv+JUz
         nHJdRyfGX6DH7bDV552BBN603R7e2ZquCWFaePWN+sUnCuDnTOKqaeHx+IGg9QnDWCkr
         UFz7ECuzpnEhLHt7S4mDBzMijvO5/qplA0snuhvjPEfRW5jdNN/7Gb0Ysxy+5ONK5sVY
         c2WPXNBgibr7UWfyqJwLPVrtUcTWii8o5vOFfyiEADAqyKn/tsGKrd02gbKGlbrhMDXo
         PdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681505667; x=1684097667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9cFFq/KYsVmXdRW5BoGPPdCt3V+TRMXS12ipPluoCk=;
        b=HHydgyX/YTmtgSRZxsoeeLOiJ+ARfaqXRMQCI5pYZP3nv9tdUliKdfwFP3+F2FjvYH
         b7PozZS86BSgHOc8uIHHTmFpPu+LEEa1rGMN8NtJLdeQBIAAHne01O5Y4eFfiOZVUOh5
         uWpnXrQ45INvIrXlEBTPfV71yTJeE89WhzP/POQTlSgyt5NL2iumZm6Ol+qNSnaBsRTT
         dG5abF/m+lK7MrKMl7XN3l/bk6U8pSu8IzQ1XfnwZrtCKMUkzBDF7APXB69hrlSqt2NB
         htX9xa+cVryhhYKe4SWzos7mZQk+ytgM/nJE9sj5ITh1QF5Ubp1DiIb0r8ilXGzbl39Z
         EExQ==
X-Gm-Message-State: AAQBX9f+NAhf/LqNqlzHuXZC2cnSh8LoehiP0c0H50ljDQlt3HrMicoY
        UGqYT6oBGr7PpNOTYXMSvIr3ZktayWx1ZQNc3NY=
X-Google-Smtp-Source: AKy350aIc+knsXz3Ima8K4XlqscLTViTEtHan5itjvGxmj/JhSbh1Igh+tw0ubW9oYJa0nxQySG4ZQ==
X-Received: by 2002:a05:6512:946:b0:4db:26b1:ec52 with SMTP id u6-20020a056512094600b004db26b1ec52mr39253lft.59.1681505667285;
        Fri, 14 Apr 2023 13:54:27 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d25-20020ac241d9000000b004ec87fb5ebcsm959734lfi.286.2023.04.14.13.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 13:54:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-qmp-pcie: correct sm8350 PHY tables
Date:   Fri, 14 Apr 2023 23:54:25 +0300
Message-Id: <20230414205425.3878902-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Correct sm8350 PCIe PHY tables according to the vendor dtsi file.
This accounts some additional differences between PHY programming on
sm8350 and sm8450.

The name for the PCS register 0x8 is not present in the vendor kernels,
but since on other generations the register prior to POWER_STATE_CONFIG2
is called POWER_STATE_CONFIG1, we can establish that as its name.

Fixes: c70052739d16 ("phy: qcom-qmp-pcie: add support for sm8350 platform")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 42 +++++++++++++++----
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |  1 +
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5182aeac43ee..cd3e031bf506 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1265,10 +1265,10 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen3_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE2_MODE0, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE1_MODE1, 0x4c),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE2_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
 };
 
 static const struct qmp_phy_init_tbl sm8450_qmp_gen3x1_pcie_rc_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_BUF_ENABLE, 0x07),
 };
 
@@ -1321,11 +1321,16 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen3x1_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_rc_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIAS_EN_CLKBUFLR_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_BUF_ENABLE, 0x07),
+};
+
 static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x75),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x1d),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0c),
 };
 
@@ -1334,6 +1339,25 @@ static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_rc_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET, 0x18),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0xa8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RATE_SLEW_CNTRL1, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x05),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_EQ_CONFIG2, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG1, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
 };
 
 static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_rx_tbl[] = {
@@ -2325,15 +2349,15 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x1_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_tx_tbl),
 		.rx		= sm8450_qmp_gen3_pcie_rx_tbl,
 		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen3_pcie_rx_tbl),
-		.pcs		= sm8450_qmp_gen3_pcie_pcs_tbl,
-		.pcs_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_pcs_tbl),
-		.pcs_misc	= sm8450_qmp_gen3x1_pcie_pcs_misc_tbl,
-		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_misc_tbl),
+		.pcs		= sm8350_qmp_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= sm8350_qmp_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_pcs_misc_tbl),
 	},
 
 	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
-		.serdes		= sm8450_qmp_gen3x1_pcie_rc_serdes_tbl,
-		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rc_serdes_tbl),
+		.serdes		= sm8350_qmp_gen3x1_pcie_rc_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_serdes_tbl),
 		.rx		= sm8350_qmp_gen3x1_pcie_rc_rx_tbl,
 		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_rx_tbl),
 	},
@@ -2369,6 +2393,8 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x2_pciephy_cfg = {
 	},
 
 	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sm8350_qmp_gen3x2_pcie_rc_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_serdes_tbl),
 		.rx		= sm8350_qmp_gen3x2_pcie_rc_rx_tbl,
 		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_rx_tbl),
 		.pcs		= sm8350_qmp_gen3x2_pcie_rc_pcs_tbl,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
index a469ae2a10a1..ea466e14ca12 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
@@ -8,6 +8,7 @@
 #define QCOM_PHY_QMP_PCS_PCIE_V5_H_
 
 /* Only for QMP V5 PHY - PCS_PCIE registers */
+#define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG1		0x08
 #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG2		0x0c
 #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG4		0x14
 #define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x20
-- 
2.39.2

