Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEC5546CFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348082AbiFJTJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350459AbiFJTJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:58 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B682B324
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:56 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y29so124265ljd.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bmWZlPEoCc7yEV5QZRYCeDhywSKKKMfq64KU+sXfyIs=;
        b=xvdtV/P6EdR9qYA4RZoPkQb1V9jAQPLrhOQxwhQp1ClZoXdIWnpCnbqDrZ/wkKgg+b
         35tBB+HkI0uH6p8zVdBRMDZt5rya8KLDkuVMxAKEUJK+YLun0nhFcdV+PpD1WNLGHDoS
         kz2E+WPZ3s1SQWEfviTZqAFaf9MDNH/fNUDFelzxgFxTGkcF6OBVe052eRv0Wysb2YTg
         cfy7jZ+8SyZ/aF/781Vnwpa8uDdMmX8lpze0LcoUqB/HYYRIVinanAk+wbU0nOF0J+3G
         fFm/ZiP4vxzG0QVeZC6yq9dkMtAtkoXHFbG7wLVhQ/LGyUcDfRTFmQfocyyXVPe5+TGT
         GqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bmWZlPEoCc7yEV5QZRYCeDhywSKKKMfq64KU+sXfyIs=;
        b=SgxNNGJOIN0dlckK61s3JZi/93wNFIYdYTDp66EClHQtWdl6DmE4rl24Rw7mJ+tTkB
         oi6CyeojlLjnKvmFNrcvpIicWJzUTQ3bpUG2560gdisDe8m6Gue5+By5lpy4gUi3SMnk
         SG2xwzed4Ok2zL5p+M+YHHgx8mDNir0O2+t8MzOAb8m82cGW2SMNR6+bFoNoavP/yBCQ
         crOfnUxrGKPga1lQ9CIZCaScIj6URhzIraOL2mV0gOsEhLeQFO9jhlPb/zGoe3RYxNRA
         egPXbe5/vytSS76VLE/liMwBlwaJmaUWpjxCp1+MzQAlCIjQkrqbuAGxDUwrZjrXQSZU
         mDdw==
X-Gm-Message-State: AOAM530PaqDWPhWHMf8VoO+EgksmYRY/B0rI6itZ4nQc7Lln93d8AVlO
        EVcV1Q0XZn6Rgs/DQJddElkAAg==
X-Google-Smtp-Source: ABdhPJyQDvHCdqiw/YfDwKyyhuUi6UGkIAtyX8L03S6JiC8E1/e1ioVS+XobmTQPmWaMef8o74sFyA==
X-Received: by 2002:a2e:b903:0:b0:255:790d:90e0 with SMTP id b3-20020a2eb903000000b00255790d90e0mr22304540ljb.163.1654888194995;
        Fri, 10 Jun 2022 12:09:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 17/28] phy: qcom-qmp: move PCIE QHP registers to separate header
Date:   Fri, 10 Jun 2022 22:09:14 +0300
Message-Id: <20220610190925.3670081-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move PCIE QHP registers to the separate header. QHP is a sepecial PHY
kind used on sdm845 to drive one of PCIe links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h | 123 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h          | 116 +----------------
 2 files changed, 125 insertions(+), 114 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h
new file mode 100644
index 000000000000..e4a4d2cd85eb
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCIE_QHP_H_
+#define QCOM_PHY_QMP_PCIE_QHP_H_
+
+/* PCIE GEN3 COM registers */
+#define PCIE_GEN3_QHP_COM_SSC_EN_CENTER			0x14
+#define PCIE_GEN3_QHP_COM_SSC_PER1			0x20
+#define PCIE_GEN3_QHP_COM_SSC_PER2			0x24
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1		0x28
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2		0x2c
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1		0x34
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1		0x38
+#define PCIE_GEN3_QHP_COM_BIAS_EN_CKBUFLR_EN		0x54
+#define PCIE_GEN3_QHP_COM_CLK_ENABLE1			0x58
+#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0		0x6c
+#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0		0x70
+#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1		0x78
+#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1		0x7c
+#define PCIE_GEN3_QHP_COM_BGV_TRIM			0x98
+#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE0			0xb4
+#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE1			0xb8
+#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0		0xc0
+#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1		0xc4
+#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0		0xcc
+#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1		0xd0
+#define PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL			0xdc
+#define PCIE_GEN3_QHP_COM_RESTRIM_CTRL2			0xf0
+#define PCIE_GEN3_QHP_COM_LOCK_CMP_EN			0xf8
+#define PCIE_GEN3_QHP_COM_DEC_START_MODE0		0x100
+#define PCIE_GEN3_QHP_COM_DEC_START_MODE1		0x108
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0		0x11c
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0		0x120
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0		0x124
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1		0x128
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1		0x12c
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1		0x130
+#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0		0x150
+#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1		0x158
+#define PCIE_GEN3_QHP_COM_VCO_TUNE_MAP			0x178
+#define PCIE_GEN3_QHP_COM_BG_CTRL			0x1c8
+#define PCIE_GEN3_QHP_COM_CLK_SELECT			0x1cc
+#define PCIE_GEN3_QHP_COM_HSCLK_SEL1			0x1d0
+#define PCIE_GEN3_QHP_COM_CORECLK_DIV			0x1e0
+#define PCIE_GEN3_QHP_COM_CORE_CLK_EN			0x1e8
+#define PCIE_GEN3_QHP_COM_CMN_CONFIG			0x1f0
+#define PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL		0x1fc
+#define PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1		0x21c
+#define PCIE_GEN3_QHP_COM_CMN_MODE			0x224
+#define PCIE_GEN3_QHP_COM_VREGCLK_DIV1			0x228
+#define PCIE_GEN3_QHP_COM_VREGCLK_DIV2			0x22c
+
+/* PCIE GEN3 QHP Lane registers */
+#define PCIE_GEN3_QHP_L0_DRVR_CTRL0			0xc
+#define PCIE_GEN3_QHP_L0_DRVR_CTRL1			0x10
+#define PCIE_GEN3_QHP_L0_DRVR_CTRL2			0x14
+#define PCIE_GEN3_QHP_L0_DRVR_TAP_EN			0x18
+#define PCIE_GEN3_QHP_L0_TX_BAND_MODE			0x60
+#define PCIE_GEN3_QHP_L0_LANE_MODE			0x64
+#define PCIE_GEN3_QHP_L0_PARALLEL_RATE			0x7c
+#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE0			0xc0
+#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE1			0xc4
+#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE2			0xc8
+#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1		0xd0
+#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2		0xd4
+#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0		0xd8
+#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1		0xdc
+#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2		0xe0
+#define PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE		0xfc
+#define PCIE_GEN3_QHP_L0_CGA_THRESH_DFE			0x100
+#define PCIE_GEN3_QHP_L0_RXENGINE_EN0			0x108
+#define PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME		0x114
+#define PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME		0x118
+#define PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME		0x11c
+#define PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME		0x120
+#define PCIE_GEN3_QHP_L0_VGA_GAIN			0x124
+#define PCIE_GEN3_QHP_L0_DFE_GAIN			0x128
+#define PCIE_GEN3_QHP_L0_EQ_GAIN			0x130
+#define PCIE_GEN3_QHP_L0_OFFSET_GAIN			0x134
+#define PCIE_GEN3_QHP_L0_PRE_GAIN			0x138
+#define PCIE_GEN3_QHP_L0_VGA_INITVAL			0x13c
+#define PCIE_GEN3_QHP_L0_EQ_INTVAL			0x154
+#define PCIE_GEN3_QHP_L0_EDAC_INITVAL			0x160
+#define PCIE_GEN3_QHP_L0_RXEQ_INITB0			0x168
+#define PCIE_GEN3_QHP_L0_RXEQ_INITB1			0x16c
+#define PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1		0x178
+#define PCIE_GEN3_QHP_L0_RXEQ_CTRL			0x180
+#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0		0x184
+#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1		0x188
+#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2		0x18c
+#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0		0x190
+#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1		0x194
+#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2		0x198
+#define PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG			0x19c
+#define PCIE_GEN3_QHP_L0_RX_BAND			0x1a4
+#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0		0x1c0
+#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1		0x1c4
+#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2		0x1c8
+#define PCIE_GEN3_QHP_L0_SIGDET_ENABLES			0x230
+#define PCIE_GEN3_QHP_L0_SIGDET_CNTRL			0x234
+#define PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL		0x238
+#define PCIE_GEN3_QHP_L0_DCC_GAIN			0x2a4
+#define PCIE_GEN3_QHP_L0_RSM_START			0x2a8
+#define PCIE_GEN3_QHP_L0_RX_EN_SIGNAL			0x2ac
+#define PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL			0x2b0
+#define PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0			0x2b8
+#define PCIE_GEN3_QHP_L0_TS0_TIMER			0x2c0
+#define PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE		0x2c4
+#define PCIE_GEN3_QHP_L0_RX_RESETCODE_OFFSET		0x2cc
+
+/* PCIE GEN3 PCS registers */
+#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M3P5DB		0x2c
+#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M3P5DB		0x40
+#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M6DB		0x54
+#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M6DB		0x68
+#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG		0x15c
+#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG5		0x16c
+#define PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG		0x174
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 9d93ae785b16..59510d927fec 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -35,6 +35,8 @@
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-ufs-v5.h"
 
+#include "phy-qcom-qmp-pcie-qhp.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
@@ -152,120 +154,6 @@
 #define QSERDES_V4_20_RX_DFE_CTLE_POST_CAL_OFFSET	0x20c
 #define QSERDES_V4_20_RX_MARG_COARSE_CTRL2		0x23c
 
-/* PCIE GEN3 COM registers */
-#define PCIE_GEN3_QHP_COM_SSC_EN_CENTER			0x14
-#define PCIE_GEN3_QHP_COM_SSC_PER1			0x20
-#define PCIE_GEN3_QHP_COM_SSC_PER2			0x24
-#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1		0x28
-#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2		0x2c
-#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1		0x34
-#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1		0x38
-#define PCIE_GEN3_QHP_COM_BIAS_EN_CKBUFLR_EN		0x54
-#define PCIE_GEN3_QHP_COM_CLK_ENABLE1			0x58
-#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0		0x6c
-#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0		0x70
-#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1		0x78
-#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1		0x7c
-#define PCIE_GEN3_QHP_COM_BGV_TRIM			0x98
-#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE0			0xb4
-#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE1			0xb8
-#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0		0xc0
-#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1		0xc4
-#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0		0xcc
-#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1		0xd0
-#define PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL			0xdc
-#define PCIE_GEN3_QHP_COM_RESTRIM_CTRL2			0xf0
-#define PCIE_GEN3_QHP_COM_LOCK_CMP_EN			0xf8
-#define PCIE_GEN3_QHP_COM_DEC_START_MODE0		0x100
-#define PCIE_GEN3_QHP_COM_DEC_START_MODE1		0x108
-#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0		0x11c
-#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0		0x120
-#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0		0x124
-#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1		0x128
-#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1		0x12c
-#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1		0x130
-#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0		0x150
-#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1		0x158
-#define PCIE_GEN3_QHP_COM_VCO_TUNE_MAP			0x178
-#define PCIE_GEN3_QHP_COM_BG_CTRL			0x1c8
-#define PCIE_GEN3_QHP_COM_CLK_SELECT			0x1cc
-#define PCIE_GEN3_QHP_COM_HSCLK_SEL1			0x1d0
-#define PCIE_GEN3_QHP_COM_CORECLK_DIV			0x1e0
-#define PCIE_GEN3_QHP_COM_CORE_CLK_EN			0x1e8
-#define PCIE_GEN3_QHP_COM_CMN_CONFIG			0x1f0
-#define PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL		0x1fc
-#define PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1		0x21c
-#define PCIE_GEN3_QHP_COM_CMN_MODE			0x224
-#define PCIE_GEN3_QHP_COM_VREGCLK_DIV1			0x228
-#define PCIE_GEN3_QHP_COM_VREGCLK_DIV2			0x22c
-
-/* PCIE GEN3 QHP Lane registers */
-#define PCIE_GEN3_QHP_L0_DRVR_CTRL0			0xc
-#define PCIE_GEN3_QHP_L0_DRVR_CTRL1			0x10
-#define PCIE_GEN3_QHP_L0_DRVR_CTRL2			0x14
-#define PCIE_GEN3_QHP_L0_DRVR_TAP_EN			0x18
-#define PCIE_GEN3_QHP_L0_TX_BAND_MODE			0x60
-#define PCIE_GEN3_QHP_L0_LANE_MODE			0x64
-#define PCIE_GEN3_QHP_L0_PARALLEL_RATE			0x7c
-#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE0			0xc0
-#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE1			0xc4
-#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE2			0xc8
-#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1		0xd0
-#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2		0xd4
-#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0		0xd8
-#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1		0xdc
-#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2		0xe0
-#define PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE		0xfc
-#define PCIE_GEN3_QHP_L0_CGA_THRESH_DFE			0x100
-#define PCIE_GEN3_QHP_L0_RXENGINE_EN0			0x108
-#define PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME		0x114
-#define PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME		0x118
-#define PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME		0x11c
-#define PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME		0x120
-#define PCIE_GEN3_QHP_L0_VGA_GAIN			0x124
-#define PCIE_GEN3_QHP_L0_DFE_GAIN			0x128
-#define PCIE_GEN3_QHP_L0_EQ_GAIN			0x130
-#define PCIE_GEN3_QHP_L0_OFFSET_GAIN			0x134
-#define PCIE_GEN3_QHP_L0_PRE_GAIN			0x138
-#define PCIE_GEN3_QHP_L0_VGA_INITVAL			0x13c
-#define PCIE_GEN3_QHP_L0_EQ_INTVAL			0x154
-#define PCIE_GEN3_QHP_L0_EDAC_INITVAL			0x160
-#define PCIE_GEN3_QHP_L0_RXEQ_INITB0			0x168
-#define PCIE_GEN3_QHP_L0_RXEQ_INITB1			0x16c
-#define PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1		0x178
-#define PCIE_GEN3_QHP_L0_RXEQ_CTRL			0x180
-#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0		0x184
-#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1		0x188
-#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2		0x18c
-#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0		0x190
-#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1		0x194
-#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2		0x198
-#define PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG			0x19c
-#define PCIE_GEN3_QHP_L0_RX_BAND			0x1a4
-#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0		0x1c0
-#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1		0x1c4
-#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2		0x1c8
-#define PCIE_GEN3_QHP_L0_SIGDET_ENABLES			0x230
-#define PCIE_GEN3_QHP_L0_SIGDET_CNTRL			0x234
-#define PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL		0x238
-#define PCIE_GEN3_QHP_L0_DCC_GAIN			0x2a4
-#define PCIE_GEN3_QHP_L0_RSM_START			0x2a8
-#define PCIE_GEN3_QHP_L0_RX_EN_SIGNAL			0x2ac
-#define PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL			0x2b0
-#define PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0			0x2b8
-#define PCIE_GEN3_QHP_L0_TS0_TIMER			0x2c0
-#define PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE		0x2c4
-#define PCIE_GEN3_QHP_L0_RX_RESETCODE_OFFSET		0x2cc
-
-/* PCIE GEN3 PCS registers */
-#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M3P5DB		0x2c
-#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M3P5DB		0x40
-#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M6DB		0x54
-#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M6DB		0x68
-#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG		0x15c
-#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG5		0x16c
-#define PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG		0x174
-
 /* Only for QMP V4_20 PHY - USB/PCIe PCS registers */
 #define QPHY_V4_20_PCS_RX_SIGDET_LVL			0x188
 #define QPHY_V4_20_PCS_EQ_CONFIG2			0x1d8
-- 
2.35.1

