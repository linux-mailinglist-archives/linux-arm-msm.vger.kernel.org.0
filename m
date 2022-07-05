Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F336F56666B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbiGEJnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiGEJnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:42 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01805F21
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i18so19580348lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q2ylLQDRKfkVOaLp3EpqmpeiL0RlC8b8W7NBkSZRz40=;
        b=K8mGYyHcGMmv87RVfnsuUlxpAa+vbpUetuT9xTYwZgwKE2kc/zYwjHNOnVvzl/0zpT
         7trDWXKE/TDzWhp0FxDgwei2sqMG5s27GBA3/FmyQQrXlv0DToMk3S/48+PE+PrZmkxw
         dMXY1wQzPsEHo0IX+X/tkb4aY0giOmJgzP1lVO0dUMVllg2vsNqYxvYqbESbpEEVshzK
         9YPO5Ic8ZAGHZH1BpvlkiX93DeOkYqmJHAItFsU6PxgQiIfOpTd6jxaCyZeUmSTL0zRx
         y7G8wRplGDjx7peTHXEAo5DKUUpekFzXwkensd+YN42MvOV2c1fL79QCVpkWWOctwcy+
         gjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q2ylLQDRKfkVOaLp3EpqmpeiL0RlC8b8W7NBkSZRz40=;
        b=00fHEqScJS2HONmZVfvAvDuZe76eI8xWnljD1JOdzOz2rL0f7aP3mFm2eIZzCoNqW2
         RG/Kkq8VVk9Zq214jgSN/Kpxn29pqEXkdxxJfALOT4rq08mitzbMpItvnb+ENqMFjNNl
         OXJOMEeL2+MJI3ZCTCXels7nCqidLhAiSoku88J/6Kr2+IZcCSpwMrZ9d7+Ke8SmotgQ
         /U5F4dOYftWidOOr4JmvdPZiEdSKBgEqt+KAFl/vi6YDevr6RUEi+G8thNBhZ6g2KYao
         khiGVF1VObC/sQd7lROG4X9Qcbi91C8QDqbXfFmSVMH9GGpPLOYnPQuox64izkE3GKTH
         matg==
X-Gm-Message-State: AJIora+yj2+n/++IW7463P1SjKu/v1FOZzYnVbOslU+gyo4BGxUIvcMZ
        Q0Xl1XFvz+P630ADPIn5bVsZHqL2toTHSw==
X-Google-Smtp-Source: AGRyM1t0x98s4CWkiM+fhKeOnMSUQ+DUBjBK1kpdx1/yLUwmumQaEqPeMfuSTFtBL8O8HDbUiXZgQg==
X-Received: by 2002:a05:6512:2986:b0:47f:b3e9:dbdb with SMTP id du6-20020a056512298600b0047fb3e9dbdbmr22530226lfb.329.1657014220484;
        Tue, 05 Jul 2022 02:43:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 23/28] phy: qcom-qmp: qserdes-com-v4: add missing registers
Date:   Tue,  5 Jul 2022 12:43:15 +0300
Message-Id: <20220705094320.1313312-24-dmitry.baryshkov@linaro.org>
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

Add missing registers, verified against:
- msm-4.19's qcom,kona-qmp-usb3.h

The 0x1a0 register name was corrected, verified via msm-4.14's
qcom,sdxprairie-qmp-usb3.h.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |   2 +-
 .../qualcomm/phy-qcom-qmp-qserdes-com-v4.h    |  47 +++++-
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h   | 141 ++++++++++++++++++
 3 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5afa9132804d..fb41c90ed96a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1085,7 +1085,7 @@ static const struct qmp_phy_init_tbl sdx55_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_MISC1, 0x88),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTERNAL_DIG_CORECLK_DIV, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_MISC2, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_MODE, 0x17),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_DC_LEVEL_CTRL, 0x0b),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x56),
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
index af8662ca9ee0..b0e3298d990d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
@@ -7,29 +7,47 @@
 #define QCOM_PHY_QMP_QSERDES_COM_V4_H_
 
 /* Only for QMP V4 PHY - QSERDES COM registers */
+#define QSERDES_V4_COM_ATB_SEL1				0x000
+#define QSERDES_V4_COM_ATB_SEL2				0x004
+#define QSERDES_V4_COM_FREQ_UPDATE			0x008
 #define QSERDES_V4_COM_BG_TIMER				0x00c
 #define QSERDES_V4_COM_SSC_EN_CENTER			0x010
 #define QSERDES_V4_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_V4_COM_SSC_ADJ_PER2			0x018
 #define QSERDES_V4_COM_SSC_PER1				0x01c
 #define QSERDES_V4_COM_SSC_PER2				0x020
 #define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0		0x024
 #define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0		0x028
+#define QSERDES_V4_COM_SSC_STEP_SIZE3_MODE0		0x02c
 #define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1		0x030
 #define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1		0x034
+#define QSERDES_V4_COM_SSC_STEP_SIZE3_MODE1		0x038
+#define QSERDES_V4_COM_POST_DIV				0x03c
+#define QSERDES_V4_COM_POST_DIV_MUX			0x040
 #define QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN		0x044
 #define QSERDES_V4_COM_CLK_ENABLE1			0x048
 #define QSERDES_V4_COM_SYS_CLK_CTRL			0x04c
 #define QSERDES_V4_COM_SYSCLK_BUF_ENABLE		0x050
+#define QSERDES_V4_COM_PLL_EN				0x054
 #define QSERDES_V4_COM_PLL_IVCO				0x058
+#define QSERDES_V4_COM_CMN_IETRIM			0x05c
 #define QSERDES_V4_COM_CMN_IPTRIM			0x060
+#define QSERDES_V4_COM_EP_CLOCK_DETECT_CTRL		0x064
+#define QSERDES_V4_COM_SYSCLK_DET_COMP_STATUS		0x068
+#define QSERDES_V4_COM_CLK_EP_DIV_MODE0			0x06c
+#define QSERDES_V4_COM_CLK_EP_DIV_MODE1			0x070
 #define QSERDES_V4_COM_CP_CTRL_MODE0			0x074
 #define QSERDES_V4_COM_CP_CTRL_MODE1			0x078
 #define QSERDES_V4_COM_PLL_RCTRL_MODE0			0x07c
 #define QSERDES_V4_COM_PLL_RCTRL_MODE1			0x080
 #define QSERDES_V4_COM_PLL_CCTRL_MODE0			0x084
 #define QSERDES_V4_COM_PLL_CCTRL_MODE1			0x088
+#define QSERDES_V4_COM_PLL_CNTRL			0x08c
+#define QSERDES_V4_COM_BIAS_EN_CTRL_BY_PSM		0x090
 #define QSERDES_V4_COM_SYSCLK_EN_SEL			0x094
+#define QSERDES_V4_COM_CML_SYSCLK_SEL			0x098
 #define QSERDES_V4_COM_RESETSM_CNTRL			0x09c
+#define QSERDES_V4_COM_RESETSM_CNTRL2			0x0a0
 #define QSERDES_V4_COM_LOCK_CMP_EN			0x0a4
 #define QSERDES_V4_COM_LOCK_CMP_CFG			0x0a8
 #define QSERDES_V4_COM_LOCK_CMP1_MODE0			0x0ac
@@ -37,36 +55,63 @@
 #define QSERDES_V4_COM_LOCK_CMP1_MODE1			0x0b4
 #define QSERDES_V4_COM_LOCK_CMP2_MODE1			0x0b8
 #define QSERDES_V4_COM_DEC_START_MODE0			0x0bc
+#define QSERDES_V4_COM_DEC_START_MSB_MODE0		0x0c0
 #define QSERDES_V4_COM_DEC_START_MODE1			0x0c4
+#define QSERDES_V4_COM_DEC_START_MSB_MODE1		0x0c8
 #define QSERDES_V4_COM_DIV_FRAC_START1_MODE0		0x0cc
 #define QSERDES_V4_COM_DIV_FRAC_START2_MODE0		0x0d0
 #define QSERDES_V4_COM_DIV_FRAC_START3_MODE0		0x0d4
 #define QSERDES_V4_COM_DIV_FRAC_START1_MODE1		0x0d8
 #define QSERDES_V4_COM_DIV_FRAC_START2_MODE1		0x0dc
 #define QSERDES_V4_COM_DIV_FRAC_START3_MODE1		0x0e0
+#define QSERDES_V4_COM_INTEGLOOP_INITVAL		0x0e4
+#define QSERDES_V4_COM_INTEGLOOP_EN			0x0e8
 #define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0		0x0ec
 #define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0		0x0f0
 #define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE1		0x0f4
 #define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE1		0x0f8
+#define QSERDES_V4_COM_INTEGLOOP_P_PATH_GAIN0		0x0fc
+#define QSERDES_V4_COM_INTEGLOOP_P_PATH_GAIN1		0x100
+#define QSERDES_V4_COM_VCOCAL_DEADMAN_CTRL		0x104
 #define QSERDES_V4_COM_VCO_TUNE_CTRL			0x108
 #define QSERDES_V4_COM_VCO_TUNE_MAP			0x10c
 #define QSERDES_V4_COM_VCO_TUNE1_MODE0			0x110
 #define QSERDES_V4_COM_VCO_TUNE2_MODE0			0x114
 #define QSERDES_V4_COM_VCO_TUNE1_MODE1			0x118
 #define QSERDES_V4_COM_VCO_TUNE2_MODE1			0x11c
+#define QSERDES_V4_COM_VCO_TUNE_INITVAL1		0x120
 #define QSERDES_V4_COM_VCO_TUNE_INITVAL2		0x124
+#define QSERDES_V4_COM_VCO_TUNE_MINVAL1			0x128
+#define QSERDES_V4_COM_VCO_TUNE_MINVAL2			0x12c
+#define QSERDES_V4_COM_VCO_TUNE_MAXVAL1			0x130
+#define QSERDES_V4_COM_VCO_TUNE_MAXVAL2			0x134
+#define QSERDES_V4_COM_VCO_TUNE_TIMER1			0x138
+#define QSERDES_V4_COM_VCO_TUNE_TIMER2			0x13c
 #define QSERDES_V4_COM_CMN_STATUS			0x140
+#define QSERDES_V4_COM_RESET_SM_STATUS			0x144
+#define QSERDES_V4_COM_RESTRIM_CODE_STATUS		0x148
+#define QSERDES_V4_COM_PLLCAL_CODE1_STATUS		0x14c
+#define QSERDES_V4_COM_PLLCAL_CODE2_STATUS		0x150
 #define QSERDES_V4_COM_CLK_SELECT			0x154
 #define QSERDES_V4_COM_HSCLK_SEL			0x158
 #define QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL		0x15c
+#define QSERDES_V4_COM_INTEGLOOP_BINCODE_STATUS		0x160
+#define QSERDES_V4_COM_PLL_ANALOG			0x164
 #define QSERDES_V4_COM_CORECLK_DIV_MODE0		0x168
 #define QSERDES_V4_COM_CORECLK_DIV_MODE1		0x16c
+#define QSERDES_V4_COM_SW_RESET				0x170
 #define QSERDES_V4_COM_CORE_CLK_EN			0x174
 #define QSERDES_V4_COM_C_READY_STATUS			0x178
 #define QSERDES_V4_COM_CMN_CONFIG			0x17c
+#define QSERDES_V4_COM_CMN_RATE_OVERRIDE		0x180
 #define QSERDES_V4_COM_SVS_MODE_CLK_SEL			0x184
+#define QSERDES_V4_COM_DEBUG_BUS0			0x188
+#define QSERDES_V4_COM_DEBUG_BUS1			0x18c
+#define QSERDES_V4_COM_DEBUG_BUS2			0x190
+#define QSERDES_V4_COM_DEBUG_BUS3			0x194
+#define QSERDES_V4_COM_DEBUG_BUS_SEL			0x198
 #define QSERDES_V4_COM_CMN_MISC1			0x19c
-#define QSERDES_V4_COM_INTERNAL_DIG_CORECLK_DIV		0x1a0
+#define QSERDES_V4_COM_CMN_MISC2			0x1a0
 #define QSERDES_V4_COM_CMN_MODE				0x1a4
 #define QSERDES_V4_COM_VCO_DC_LEVEL_CTRL		0x1a8
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h
index 1716932bdf1a..6ee3bec9ac4a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h
@@ -7,38 +7,115 @@
 #define QCOM_PHY_QMP_QSERDES_TXRX_V4_H_
 
 /* Only for QMP V4 PHY - TX registers */
+#define QSERDES_V4_TX_BIST_MODE_LANENO			0x000
+#define QSERDES_V4_TX_BIST_INVERT			0x004
 #define QSERDES_V4_TX_CLKBUF_ENABLE			0x008
 #define QSERDES_V4_TX_TX_EMP_POST1_LVL			0x00c
+#define QSERDES_V4_TX_TX_IDLE_LVL_LARGE_AMP		0x010
 #define QSERDES_V4_TX_TX_DRV_LVL			0x014
+#define QSERDES_V4_TX_TX_DRV_LVL_OFFSET			0x018
 #define QSERDES_V4_TX_RESET_TSYNC_EN			0x01c
 #define QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN		0x020
 #define QSERDES_V4_TX_TX_BAND				0x024
+#define QSERDES_V4_TX_SLEW_CNTL				0x028
 #define QSERDES_V4_TX_INTERFACE_SELECT			0x02c
+#define QSERDES_V4_TX_LPB_EN				0x030
 #define QSERDES_V4_TX_RES_CODE_LANE_TX			0x034
 #define QSERDES_V4_TX_RES_CODE_LANE_RX			0x038
 #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX		0x03c
 #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX		0x040
+#define QSERDES_V4_TX_PERL_LENGTH1			0x044
+#define QSERDES_V4_TX_PERL_LENGTH2			0x048
+#define QSERDES_V4_TX_SERDES_BYP_EN_OUT			0x04c
+#define QSERDES_V4_TX_DEBUG_BUS_SEL			0x050
 #define QSERDES_V4_TX_TRANSCEIVER_BIAS_EN		0x054
 #define QSERDES_V4_TX_HIGHZ_DRVR_EN			0x058
 #define QSERDES_V4_TX_TX_POL_INV			0x05c
 #define QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN	0x060
+#define QSERDES_V4_TX_BIST_PATTERN1			0x064
+#define QSERDES_V4_TX_BIST_PATTERN2			0x068
+#define QSERDES_V4_TX_BIST_PATTERN3			0x06c
+#define QSERDES_V4_TX_BIST_PATTERN4			0x070
+#define QSERDES_V4_TX_BIST_PATTERN5			0x074
+#define QSERDES_V4_TX_BIST_PATTERN6			0x078
+#define QSERDES_V4_TX_BIST_PATTERN7			0x07c
+#define QSERDES_V4_TX_BIST_PATTERN8			0x080
 #define QSERDES_V4_TX_LANE_MODE_1			0x084
 #define QSERDES_V4_TX_LANE_MODE_2			0x088
+#define QSERDES_V4_TX_LANE_MODE_3			0x08c
+#define QSERDES_V4_TX_ATB_SEL1				0x090
+#define QSERDES_V4_TX_ATB_SEL2				0x094
+#define QSERDES_V4_TX_RCV_DETECT_LVL			0x098
 #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x09c
+#define QSERDES_V4_TX_PRBS_SEED1			0x0a0
+#define QSERDES_V4_TX_PRBS_SEED2			0x0a4
+#define QSERDES_V4_TX_PRBS_SEED3			0x0a8
+#define QSERDES_V4_TX_PRBS_SEED4			0x0ac
+#define QSERDES_V4_TX_RESET_GEN				0x0b0
+#define QSERDES_V4_TX_RESET_GEN_MUXES			0x0b4
 #define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0x0b8
 #define QSERDES_V4_TX_TX_INTERFACE_MODE			0x0bc
+#define QSERDES_V4_TX_PWM_CTRL				0x0c0
+#define QSERDES_V4_TX_PWM_ENCODED_OR_DATA		0x0c4
+#define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND2		0x0c8
+#define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND2		0x0cc
+#define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND2		0x0d0
+#define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND2		0x0d4
 #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x0d8
 #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x0dc
 #define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x0e0
 #define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x0e4
 #define QSERDES_V4_TX_VMODE_CTRL1			0x0e8
+#define QSERDES_V4_TX_ALOG_OBSV_BUS_CTRL_1		0x0ec
+#define QSERDES_V4_TX_BIST_STATUS			0x0f0
+#define QSERDES_V4_TX_BIST_ERROR_COUNT1			0x0f4
+#define QSERDES_V4_TX_BIST_ERROR_COUNT2			0x0f8
+#define QSERDES_V4_TX_ALOG_OBSV_BUS_STATUS_1		0x0fc
+#define QSERDES_V4_TX_LANE_DIG_CONFIG			0x100
 #define QSERDES_V4_TX_PI_QEC_CTRL			0x104
+#define QSERDES_V4_TX_PRE_EMPH				0x108
+#define QSERDES_V4_TX_SW_RESET				0x10c
+#define QSERDES_V4_TX_DCC_OFFSET			0x110
+#define QSERDES_V4_TX_DIG_BKUP_CTRL			0x114
+#define QSERDES_V4_TX_DEBUG_BUS0			0x118
+#define QSERDES_V4_TX_DEBUG_BUS1			0x11c
+#define QSERDES_V4_TX_DEBUG_BUS2			0x120
+#define QSERDES_V4_TX_DEBUG_BUS3			0x124
+#define QSERDES_V4_TX_READ_EQCODE			0x128
+#define QSERDES_V4_TX_READ_OFFSETCODE			0x12c
+#define QSERDES_V4_TX_IA_ERROR_COUNTER_LOW		0x130
+#define QSERDES_V4_TX_IA_ERROR_COUNTER_HIGH		0x134
+#define QSERDES_V4_TX_VGA_READ_CODE			0x138
+#define QSERDES_V4_TX_VTH_READ_CODE			0x13c
+#define QSERDES_V4_TX_DFE_TAP1_READ_CODE		0x140
+#define QSERDES_V4_TX_DFE_TAP2_READ_CODE		0x144
+#define QSERDES_V4_TX_IDAC_STATUS_I			0x148
+#define QSERDES_V4_TX_IDAC_STATUS_IBAR			0x14c
+#define QSERDES_V4_TX_IDAC_STATUS_Q			0x150
+#define QSERDES_V4_TX_IDAC_STATUS_QBAR			0x154
+#define QSERDES_V4_TX_IDAC_STATUS_A			0x158
+#define QSERDES_V4_TX_IDAC_STATUS_ABAR			0x15c
+#define QSERDES_V4_TX_IDAC_STATUS_SM_ON			0x160
+#define QSERDES_V4_TX_IDAC_STATUS_CAL_DONE		0x164
+#define QSERDES_V4_TX_IDAC_STATUS_SIGNERROR		0x168
+#define QSERDES_V4_TX_DCC_CAL_STATUS			0x16c
 
 /* Only for QMP V4 PHY - RX registers */
+#define QSERDES_V4_RX_UCDR_FO_GAIN_HALF			0x000
+#define QSERDES_V4_RX_UCDR_FO_GAIN_QUARTER		0x004
 #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V4_RX_UCDR_SO_GAIN_HALF			0x00c
+#define QSERDES_V4_RX_UCDR_SO_GAIN_QUARTER		0x010
 #define QSERDES_V4_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V4_RX_UCDR_SVS_FO_GAIN_HALF		0x018
+#define QSERDES_V4_RX_UCDR_SVS_FO_GAIN_QUARTER		0x01c
+#define QSERDES_V4_RX_UCDR_SVS_FO_GAIN			0x020
+#define QSERDES_V4_RX_UCDR_SVS_SO_GAIN_HALF		0x024
+#define QSERDES_V4_RX_UCDR_SVS_SO_GAIN_QUARTER		0x028
+#define QSERDES_V4_RX_UCDR_SVS_SO_GAIN			0x02c
 #define QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN		0x030
 #define QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V4_RX_UCDR_FO_TO_SO_DELAY		0x038
 #define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
 #define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
 #define QSERDES_V4_RX_UCDR_PI_CONTROLS			0x044
@@ -47,14 +124,41 @@
 #define QSERDES_V4_RX_UCDR_SB2_THRESH2			0x050
 #define QSERDES_V4_RX_UCDR_SB2_GAIN1			0x054
 #define QSERDES_V4_RX_UCDR_SB2_GAIN2			0x058
+#define QSERDES_V4_RX_AUX_CONTROL			0x05c
 #define QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE		0x060
 #define QSERDES_V4_RX_RCLK_AUXDATA_SEL			0x064
 #define QSERDES_V4_RX_AC_JTAG_ENABLE			0x068
+#define QSERDES_V4_RX_AC_JTAG_INITP			0x06c
+#define QSERDES_V4_RX_AC_JTAG_INITN			0x070
+#define QSERDES_V4_RX_AC_JTAG_LVL			0x074
 #define QSERDES_V4_RX_AC_JTAG_MODE			0x078
+#define QSERDES_V4_RX_AC_JTAG_RESET			0x07c
 #define QSERDES_V4_RX_RX_TERM_BW			0x080
+#define QSERDES_V4_RX_RX_RCVR_IQ_EN			0x084
+#define QSERDES_V4_RX_RX_IDAC_I_DC_OFFSETS		0x088
+#define QSERDES_V4_RX_RX_IDAC_IBAR_DC_OFFSETS		0x08c
+#define QSERDES_V4_RX_RX_IDAC_Q_DC_OFFSETS		0x090
+#define QSERDES_V4_RX_RX_IDAC_QBAR_DC_OFFSETS		0x094
+#define QSERDES_V4_RX_RX_IDAC_A_DC_OFFSETS		0x098
+#define QSERDES_V4_RX_RX_IDAC_ABAR_DC_OFFSETS		0x09c
+#define QSERDES_V4_RX_RX_IDAC_EN			0x0a0
+#define QSERDES_V4_RX_RX_IDAC_ENABLES			0x0a4
+#define QSERDES_V4_RX_RX_IDAC_SIGN			0x0a8
+#define QSERDES_V4_RX_RX_HIGHZ_HIGHRATE			0x0ac
+#define QSERDES_V4_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET 0x0b0
+#define QSERDES_V4_RX_DFE_1				0x0b4
+#define QSERDES_V4_RX_DFE_2				0x0b8
+#define QSERDES_V4_RX_DFE_3				0x0bc
+#define QSERDES_V4_RX_DFE_4				0x0c0
+#define QSERDES_V4_RX_TX_ADAPT_PRE_THRESH1		0x0c4
+#define QSERDES_V4_RX_TX_ADAPT_PRE_THRESH2		0x0c8
+#define QSERDES_V4_RX_TX_ADAPT_POST_THRESH		0x0cc
+#define QSERDES_V4_RX_TX_ADAPT_MAIN_THRESH		0x0d0
 #define QSERDES_V4_RX_VGA_CAL_CNTRL1			0x0d4
 #define QSERDES_V4_RX_VGA_CAL_CNTRL2			0x0d8
 #define QSERDES_V4_RX_GM_CAL				0x0dc
+#define QSERDES_V4_RX_RX_VGA_GAIN2_LSB			0x0e0
+#define QSERDES_V4_RX_RX_VGA_GAIN2_MSB			0x0e4
 #define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1		0x0e8
 #define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
 #define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
@@ -62,6 +166,9 @@
 #define QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW		0x0f8
 #define QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
 #define QSERDES_V4_RX_RX_IDAC_MEASURE_TIME		0x100
+#define QSERDES_V4_RX_RX_IDAC_ACCUMULATOR		0x104
+#define QSERDES_V4_RX_RX_EQ_OFFSET_LSB			0x108
+#define QSERDES_V4_RX_RX_EQ_OFFSET_MSB			0x10c
 #define QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
 #define QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x114
 #define QSERDES_V4_RX_SIGDET_ENABLES			0x118
@@ -69,6 +176,23 @@
 #define QSERDES_V4_RX_SIGDET_LVL			0x120
 #define QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL		0x124
 #define QSERDES_V4_RX_RX_BAND				0x128
+#define QSERDES_V4_RX_CDR_FREEZE_UP_DN			0x12c
+#define QSERDES_V4_RX_CDR_RESET_OVERRIDE		0x130
+#define QSERDES_V4_RX_RX_INTERFACE_MODE			0x134
+#define QSERDES_V4_RX_JITTER_GEN_MODE			0x138
+#define QSERDES_V4_RX_SJ_AMP1				0x13c
+#define QSERDES_V4_RX_SJ_AMP2				0x140
+#define QSERDES_V4_RX_SJ_PER1				0x144
+#define QSERDES_V4_RX_SJ_PER2				0x148
+#define QSERDES_V4_RX_PPM_OFFSET1			0x14c
+#define QSERDES_V4_RX_PPM_OFFSET2			0x150
+#define QSERDES_V4_RX_SIGN_PPM_PERIOD1			0x154
+#define QSERDES_V4_RX_SIGN_PPM_PERIOD2			0x158
+#define QSERDES_V4_RX_RX_PWM_ENABLE_AND_DATA		0x15c
+#define QSERDES_V4_RX_RX_PWM_GEAR1_TIMEOUT_COUNT	0x160
+#define QSERDES_V4_RX_RX_PWM_GEAR2_TIMEOUT_COUNT	0x164
+#define QSERDES_V4_RX_RX_PWM_GEAR3_TIMEOUT_COUNT	0x168
+#define QSERDES_V4_RX_RX_PWM_GEAR4_TIMEOUT_COUNT	0x16c
 #define QSERDES_V4_RX_RX_MODE_00_LOW			0x170
 #define QSERDES_V4_RX_RX_MODE_00_HIGH			0x174
 #define QSERDES_V4_RX_RX_MODE_00_HIGH2			0x178
@@ -84,9 +208,26 @@
 #define QSERDES_V4_RX_RX_MODE_10_HIGH2			0x1a0
 #define QSERDES_V4_RX_RX_MODE_10_HIGH3			0x1a4
 #define QSERDES_V4_RX_RX_MODE_10_HIGH4			0x1a8
+#define QSERDES_V4_RX_PHPRE_CTRL			0x1ac
+#define QSERDES_V4_RX_PHPRE_INITVAL			0x1b0
 #define QSERDES_V4_RX_DFE_EN_TIMER			0x1b4
 #define QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET		0x1b8
 #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
+#define QSERDES_V4_RX_DCC_CTRL2				0x1c0
 #define QSERDES_V4_RX_VTH_CODE				0x1c4
+#define QSERDES_V4_RX_VTH_MIN_THRESH			0x1c8
+#define QSERDES_V4_RX_VTH_MAX_THRESH			0x1cc
+#define QSERDES_V4_RX_ALOG_OBSV_BUS_CTRL_1		0x1d0
+#define QSERDES_V4_RX_PI_CTRL1				0x1d4
+#define QSERDES_V4_RX_PI_CTRL2				0x1d8
+#define QSERDES_V4_RX_PI_QUAD				0x1dc
+#define QSERDES_V4_RX_IDATA1				0x1e0
+#define QSERDES_V4_RX_IDATA2				0x1e4
+#define QSERDES_V4_RX_AUX_DATA1				0x1e8
+#define QSERDES_V4_RX_AUX_DATA2				0x1ec
+#define QSERDES_V4_RX_AC_JTAG_OUTP			0x1f0
+#define QSERDES_V4_RX_AC_JTAG_OUTN			0x1f4
+#define QSERDES_V4_RX_RX_SIGDET				0x1f8
+#define QSERDES_V4_RX_ALOG_OBSV_BUS_STATUS_1		0x1fc
 
 #endif
-- 
2.35.1

