Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEC8566659
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiGEJne (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiGEJnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:31 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C0E1102
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a4so19682214lfm.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mIrvLGqDU5CR7kV0iyLfa1/4w/JU3QRxYANlSIxDJ2U=;
        b=Xh8wLX/VpnA98cyIG3a5P8Hr4qlGQs9FJ8BWGLCOLuhnSzU6QWYg6ny8nIS40ogHQx
         jl2IPwbS7YNtloeTLIS/ZkEpdPG/+775x5A/6fWjkrd0OiWCHDqsC3a3GgPM6drSqExo
         8SrX5CCS/r6BHa4aJuAOi1BzKialkt+hptjsakkMrpOHRt7iBI91U89KjVLn7TRARjdo
         z5XBdtJraAje6UqHKTNmXePOEos3e6pSe5DsnJ+sJrwngmVEb4B1uafl+GEB/K5xwUZO
         yJccvETk+j692210qIE18MqaxsDMrP+3lkTOzgqechlDslWbtVek70aNVuabKudbSD5L
         TTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mIrvLGqDU5CR7kV0iyLfa1/4w/JU3QRxYANlSIxDJ2U=;
        b=cd5yYhHcsWEwQXkzaLdXV8GTbDlkScbWOZ/qTjZLalB5U+CkRZ1hGHywAocpug6N0u
         RsNY1TwNw+2qsYWq+Mdx9Yy6ZTRp1+d6fdl9VhJPiJAgmvLMcjGBtDHU6DWOjO5x16Zv
         daucvIbnDVZE7sycZdSbCIMYTVc/LgGKRQeQa7GFskgoW8MBfvrPVBi2rAzGvsh5n7YB
         Xtyvx2v6j7WtIeC+TYbpDrBa4j1Uo/a9s0+SGmngqpkEAvSueT0/5XPM2P3gnmZ72Od/
         I/Ip8nl27+Nb8tf0iLjKDeQ62/N+rGMVFLoTl9TVsyf1TVp6rXbsufRiHJApaQSnX2pN
         qX4w==
X-Gm-Message-State: AJIora9+rbp4EWeBg78zYxeIwBd+2wTsfJalemxAwqXkxT+44T4T6Jw9
        T5HDx9UPz9PxdEXM6FVkl7U6eA==
X-Google-Smtp-Source: AGRyM1v0RCCksE1zh2tCPrVmKOXnu6GPbX6UpLdYvWzA3z5n3UgcALXeGWgVlzYSTdD4OXBI4sQCZw==
X-Received: by 2002:a05:6512:130f:b0:47f:bf0b:234 with SMTP id x15-20020a056512130f00b0047fbf0b0234mr23235116lfu.351.1657014207159;
        Tue, 05 Jul 2022 02:43:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 07/28] phy: qcom-qmp: use QPHY_V4_PCS for ipq6018/ipq8074 PCIe gen3
Date:   Tue,  5 Jul 2022 12:42:59 +0300
Message-Id: <20220705094320.1313312-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PCS_COM_* symbols duplicate the QPHY_V4_PCS_*. PCS_PCIE_* symbols
duplicate the QPHY_V4_PCS_PCIE_*. Use generic register names for the
IPQ6018 and IPQ8074 tables and drop the custom PCS_COM_*/PCS_PCIE*
names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 80 ++++++++++++------------
 drivers/phy/qualcomm/phy-qcom-qmp.h      | 35 +----------
 2 files changed, 41 insertions(+), 74 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index e3404aa05e13..0f3ca0d93f34 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -354,25 +354,25 @@ static const struct qmp_phy_init_tbl ipq6018_pcie_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl ipq6018_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL1, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_REFGEN_REQ_CONFIG1, 0x0d),
-	QMP_PHY_INIT_CFG(PCS_COM_G12S1_TXDEEMPH_M3P5DB, 0x10),
-	QMP_PHY_INIT_CFG(PCS_COM_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_EQ_CONFIG5, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL1, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x01),
 };
 
 static const struct qmp_phy_init_tbl ipq6018_pcie_pcs_misc_tbl[] = {
-	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
-	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
-	QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
-	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG1, 0x11),
-	QMP_PHY_INIT_CFG(PCS_PCIE_PRESET_P10_PRE, 0x00),
-	QMP_PHY_INIT_CFG(PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
 };
 
 static const struct qmp_phy_init_tbl ipq8074_pcie_serdes_tbl[] = {
@@ -554,30 +554,30 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL2, 0x83),
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNT_VAL_L, 0x9),
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNT_VAL_H_TOL, 0x42),
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_MAN_CODE, 0x40),
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL1, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_H, 0x0),
-	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x1),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_ACTIONS, 0x0),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG1, 0x11),
-	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG2, 0xb),
-	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_CONFIG2, 0x52),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG2, 0x50),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG4, 0x1a),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x6),
-	QMP_PHY_INIT_CFG(PCS_COM_G12S1_TXDEEMPH_M3P5DB, 0x10),
-	QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
-	QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(PCS_COM_REFGEN_REQ_CONFIG1, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL2, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_L, 0x9),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_H_TOL, 0x42),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_MAN_CODE, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL1, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H, 0x0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x1),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG2, 0xb),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG2, 0x52),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG2, 0x50),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG4, 0x1a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x6),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
 };
 
 static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 64af9720b3f9..b2aeace96c09 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -64,40 +64,6 @@
 #define QSERDES_PLL_SVS_MODE_CLK_SEL			0x194
 #define QSERDES_PLL_CORECLK_DIV_MODE1			0x1b4
 
-/* QMP V2 PHY for PCIE gen3 ports - PCS registers */
-
-#define PCS_COM_FLL_CNTRL1				0x098
-#define PCS_COM_FLL_CNTRL2				0x09c
-#define PCS_COM_FLL_CNT_VAL_L				0x0a0
-#define PCS_COM_FLL_CNT_VAL_H_TOL			0x0a4
-#define PCS_COM_FLL_MAN_CODE				0x0a8
-#define PCS_COM_REFGEN_REQ_CONFIG1			0x0dc
-#define PCS_COM_G12S1_TXDEEMPH_M3P5DB			0x16c
-#define PCS_COM_RX_SIGDET_LVL				0x188
-#define PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L		0x1a4
-#define PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_H		0x1a8
-#define PCS_COM_RX_DCC_CAL_CONFIG			0x1d8
-#define PCS_COM_EQ_CONFIG5				0x1ec
-
-/* QMP V2 PHY for PCIE gen3 ports - PCS Misc registers */
-
-#define PCS_PCIE_POWER_STATE_CONFIG2			0x00c
-#define PCS_PCIE_POWER_STATE_CONFIG4			0x014
-#define PCS_PCIE_ENDPOINT_REFCLK_DRIVE			0x01c
-#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L		0x040
-#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H		0x044
-#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L		0x048
-#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H		0x04c
-#define PCS_PCIE_OSC_DTCT_CONFIG2			0x05c
-#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG2			0x078
-#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG4			0x080
-#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG5			0x084
-#define PCS_PCIE_OSC_DTCT_ACTIONS			0x090
-#define PCS_PCIE_EQ_CONFIG1				0x0a0
-#define PCS_PCIE_EQ_CONFIG2				0x0a4
-#define PCS_PCIE_PRESET_P10_PRE				0x0bc
-#define PCS_PCIE_PRESET_P10_POST			0x0e0
-
 /* Only for QMP V2 PHY - QSERDES COM registers */
 #define QSERDES_COM_BG_TIMER				0x00c
 #define QSERDES_COM_SSC_EN_CENTER			0x010
@@ -1014,6 +980,7 @@
 #define QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L	0x48
 #define QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x50
 #define QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS		0x90
+#define QPHY_V4_PCS_PCIE_EQ_CONFIG1			0xa0
 #define QPHY_V4_PCS_PCIE_EQ_CONFIG2			0xa4
 #define QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE		0xb4
 #define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
-- 
2.35.1

