Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33607566669
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbiGEJnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiGEJnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8AD26F7
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z13so19544659lfj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIdFXRLuyHwl2KtnH8DDGKGfr4AeRryJyRCeyJpHfz4=;
        b=tIoFZ1Kj3f59OiaI06kke+AmQUayWlypVssAItKIjzPsWfr76whqzCPhHSMNLYpO4e
         MbJCqojIJIO9ZB7Ouye5QoAtl4Z/ZYWfV2DtGk26Fc3rVNS2tJoZUYgw47Zo4c0gN1DC
         F6yExgyk+ITsT1JcMWexCQsfMmt83EwSXE840oWTWwwHULZEDjjTJwMHMlsUMv4Bz2w3
         BlLdVhepvclqXDN+1dhhVvgsrqW1aaO/ZRpdJbh/jor+uLqb3PYFmfrtVGO0mPKJ7MO5
         sCU4A/02MddtuzAT2kAymM9kGrfpeVA/VeJMskqgg/gmi162oX41Zqf6UJ1XfL9jU6j7
         4MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIdFXRLuyHwl2KtnH8DDGKGfr4AeRryJyRCeyJpHfz4=;
        b=mFI2941Z2jCEt/Q8mztaS3NnJu8/nzJZowvYHpHNtcxWa6RHIPcQV8zYuGzguKIdNN
         iPqkvcyqBQeIu/MZExWJDUeOadFor4/26U+z44CrRsIgOET02eifn05pHSWyZKstGzil
         I67aVzdseIi4tzxxuhU7+hDCFN89BKEKgUgbbInDBkxzVPjEOS9X6kx70MCZPCwVxWx3
         t1epTEhzJxmeJCt4Ag6DYo5PjKDT3VPIR10KChzlBomr7AjKujZThnI+c+bUj24TiaA2
         SRoWUzr1L1z57acpIsW2YRzDtMTt5rWyFbYvw5UltuH+F36m9bhqMMTw1qwhon0yzXYX
         mTcA==
X-Gm-Message-State: AJIora9/7efV/Z5Ou+U7WyO8nGzlDIPFfjSAVe9ETaWLzFvtaDxEDmGX
        psdtmtJZ3AzTjsREEfyr7/6O0BUMqxhBLQ==
X-Google-Smtp-Source: AGRyM1uWlJytJ2R3GfCKBrptpts63MxNfzNpgO5ve9twiPpNX1RcTsIF3lOCKddG+RBw6IN6zNc9CQ==
X-Received: by 2002:a05:6512:2209:b0:483:6989:300b with SMTP id h9-20020a056512220900b004836989300bmr1869205lfu.646.1657014219793;
        Tue, 05 Jul 2022 02:43:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 22/28] phy: qcom-qmp: qserdes-com-v3: add missing registers
Date:   Tue,  5 Jul 2022 12:43:14 +0300
Message-Id: <20220705094320.1313312-23-dmitry.baryshkov@linaro.org>
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
- msm-4.4's phy-qcom-ufs-qmp-v3.h

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../qualcomm/phy-qcom-qmp-qserdes-com-v3.h    | 25 +++++++++++++++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h   |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
index a61f8d36d01e..c0bd54e0e7b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
@@ -27,6 +27,10 @@
 #define QSERDES_V3_COM_SYSCLK_BUF_ENABLE		0x040
 #define QSERDES_V3_COM_PLL_EN				0x044
 #define QSERDES_V3_COM_PLL_IVCO				0x048
+#define QSERDES_V3_COM_CMN_IETRIM			0x04c
+#define QSERDES_V3_COM_CMN_IPTRIM			0x050
+#define QSERDES_V3_COM_EP_CLOCK_DETECT_CTR		0x054
+#define QSERDES_V3_COM_SYSCLK_DET_COMP_STATUS		0x058
 #define QSERDES_V3_COM_CLK_EP_DIV			0x05c
 #define QSERDES_V3_COM_CP_CTRL_MODE0			0x060
 #define QSERDES_V3_COM_CP_CTRL_MODE1			0x064
@@ -34,7 +38,10 @@
 #define QSERDES_V3_COM_PLL_RCTRL_MODE1			0x06c
 #define QSERDES_V3_COM_PLL_CCTRL_MODE0			0x070
 #define QSERDES_V3_COM_PLL_CCTRL_MODE1			0x074
+#define QSERDES_V3_COM_PLL_CNTRL			0x078
+#define QSERDES_V3_COM_BIAS_EN_CTRL_BY_PSM		0x07c
 #define QSERDES_V3_COM_SYSCLK_EN_SEL			0x080
+#define QSERDES_V3_COM_CML_SYSCLK_SEL			0x084
 #define QSERDES_V3_COM_RESETSM_CNTRL			0x088
 #define QSERDES_V3_COM_RESETSM_CNTRL2			0x08c
 #define QSERDES_V3_COM_LOCK_CMP_EN			0x090
@@ -54,10 +61,12 @@
 #define QSERDES_V3_COM_DIV_FRAC_START2_MODE1		0x0c8
 #define QSERDES_V3_COM_DIV_FRAC_START3_MODE1		0x0cc
 #define QSERDES_V3_COM_INTEGLOOP_INITVAL		0x0d0
+#define QSERDES_V3_COM_INTEGLOOP_EN			0x0d4
 #define QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0		0x0d8
 #define QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0		0x0dc
 #define QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE1		0x0e0
 #define QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE1		0x0e4
+#define QSERDES_V3_COM_VCOCAL_DEADMAN_CTRL		0x0e8
 #define QSERDES_V3_COM_VCO_TUNE_CTRL			0x0ec
 #define QSERDES_V3_COM_VCO_TUNE_MAP			0x0f0
 #define QSERDES_V3_COM_VCO_TUNE1_MODE0			0x0f4
@@ -66,21 +75,37 @@
 #define QSERDES_V3_COM_VCO_TUNE2_MODE1			0x100
 #define QSERDES_V3_COM_VCO_TUNE_INITVAL1		0x104
 #define QSERDES_V3_COM_VCO_TUNE_INITVAL2		0x108
+#define QSERDES_V3_COM_VCO_TUNE_MINVAL1			0x10c
+#define QSERDES_V3_COM_VCO_TUNE_MINVAL2			0x110
+#define QSERDES_V3_COM_VCO_TUNE_MAXVAL1			0x114
+#define QSERDES_V3_COM_VCO_TUNE_MAXVAL2			0x118
 #define QSERDES_V3_COM_VCO_TUNE_TIMER1			0x11c
 #define QSERDES_V3_COM_VCO_TUNE_TIMER2			0x120
+#define QSERDES_V3_COM_CMN_STATUS			0x124
+#define QSERDES_V3_COM_RESET_SM_STATUS			0x128
+#define QSERDES_V3_COM_RESTRIM_CODE_STATUS		0x12c
+#define QSERDES_V3_COM_PLLCAL_CODE1_STATUS		0x130
+#define QSERDES_V3_COM_PLLCAL_CODE2_STATUS		0x134
 #define QSERDES_V3_COM_CLK_SELECT			0x138
 #define QSERDES_V3_COM_HSCLK_SEL			0x13c
+#define QSERDES_V3_COM_INTEGLOOP_BINCODE_STATUS		0x140
+#define QSERDES_V3_COM_PLL_ANALOG			0x144
 #define QSERDES_V3_COM_CORECLK_DIV_MODE0		0x148
 #define QSERDES_V3_COM_CORECLK_DIV_MODE1		0x14c
+#define QSERDES_V3_COM_SW_RESET				0x150
 #define QSERDES_V3_COM_CORE_CLK_EN			0x154
 #define QSERDES_V3_COM_C_READY_STATUS			0x158
 #define QSERDES_V3_COM_CMN_CONFIG			0x15c
+#define QSERDES_V3_COM_CMN_RATE_OVERRIDE		0x160
 #define QSERDES_V3_COM_SVS_MODE_CLK_SEL			0x164
 #define QSERDES_V3_COM_DEBUG_BUS0			0x168
 #define QSERDES_V3_COM_DEBUG_BUS1			0x16c
 #define QSERDES_V3_COM_DEBUG_BUS2			0x170
 #define QSERDES_V3_COM_DEBUG_BUS3			0x174
 #define QSERDES_V3_COM_DEBUG_BUS_SEL			0x178
+#define QSERDES_V3_COM_CMN_MISC1			0x17c
+#define QSERDES_V3_COM_CMN_MISC2			0x180
 #define QSERDES_V3_COM_CMN_MODE				0x184
+#define QSERDES_V3_COM_CMN_VREG_SEL			0x188
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h
index 2c7238df38d7..161e6df30ea8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h
@@ -26,6 +26,8 @@
 #define QSERDES_V3_TX_TX_POL_INV			0x064
 #define QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
 #define QSERDES_V3_TX_LANE_MODE_1			0x08c
+#define QSERDES_V3_TX_LANE_MODE_2			0x090
+#define QSERDES_V3_TX_LANE_MODE_3			0x094
 #define QSERDES_V3_TX_RCV_DETECT_LVL_2			0x0a4
 #define QSERDES_V3_TX_TRAN_DRVR_EMP_EN			0x0c0
 #define QSERDES_V3_TX_TX_INTERFACE_MODE			0x0c4
@@ -48,6 +50,7 @@
 #define QSERDES_V3_RX_VGA_CAL_CNTRL2			0x0c0
 #define QSERDES_V3_RX_RX_EQ_GAIN2_LSB			0x0c8
 #define QSERDES_V3_RX_RX_EQ_GAIN2_MSB			0x0cc
+#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL1		0x0d0
 #define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d4
 #define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3		0x0d8
 #define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4		0x0dc
-- 
2.35.1

