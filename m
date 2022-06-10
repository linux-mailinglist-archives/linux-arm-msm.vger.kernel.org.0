Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDFC546CFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346977AbiFJTKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350467AbiFJTKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:06 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9672621A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:05 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 20so4741196lfz.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIdFXRLuyHwl2KtnH8DDGKGfr4AeRryJyRCeyJpHfz4=;
        b=NDqKISQQOsX+CfV3yn5bqcKda08lSc/g9uEyaanSDlu74qaCu+hhmUFVuqu7UVEf8R
         UeTO/+mkQfrsiYQn5kYWQZI+Ki3RlObArElkCJN+mTY5RtANcCkkDP57RhcfJzY73RMC
         62+kE++ZQjWbFk+3BX8sgssjDLfksLWX5hhZZU9nCnqSo1y5KyPg1ITiL2x5+1MXuj1T
         /VKUjKCbV/BUxqyCTgF1YMD/aDkmA9ExUlhl2L1L5zTJKuarl5LGb4lEaPnbvnHF7bvK
         6IWc3HsVLQ2jWhuNKBPk1iYVhw2kfD8DS4+tk5yyaekj1vVA6IG2IIJTy5o0BO755zJU
         EWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIdFXRLuyHwl2KtnH8DDGKGfr4AeRryJyRCeyJpHfz4=;
        b=3VLU5tM6PeBNfAg7vgitdZw/f7EfYehlwTLfISH46cAoirFUQm3oIvRDBQy7dhpJ39
         QG1RNqd5tTz7cuyPbmWRugkc/ow6/1+9ium7Y1ZlhEdbNuM6FnPggnWYVHN1hdxFnFCa
         extO2Jz+0+pdpWjgNOybPmlHYepRojJtARgRww6d45MAXQNH5rf0TTwexP84Kk+kFi26
         qg2Xn0HEeTNXN5T1cKveDYGwwSJDSPnDW7rX0s7TIW4tBYF85trXid6Cjxn85yrLyuXT
         cf6irtAVejDA9CPXRzxPGXdnPVP2t8WtMFfTxKlihVqf4NsCHAhN5VG45fhrCtwVUpp8
         29eQ==
X-Gm-Message-State: AOAM532kUBPI045RrBm3i/rf6+AIQviQbtzTBDUx+j267C90+idFnaB8
        Pp7U3wPTe6G3KS7y7jCirQVt2g==
X-Google-Smtp-Source: ABdhPJyBIQvlebf49UlKJirrPZqNIGDeRl6RQhVH3CkhYqb4ljsjl1XzXd9C0EVm8Is1ITnPSoZZYg==
X-Received: by 2002:ac2:47f1:0:b0:479:7517:d41 with SMTP id b17-20020ac247f1000000b0047975170d41mr10310220lfp.254.1654888203775;
        Fri, 10 Jun 2022 12:10:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:10:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 22/28] phy: qcom-qmp: qserdes-com-v3: add missing registers
Date:   Fri, 10 Jun 2022 22:09:19 +0300
Message-Id: <20220610190925.3670081-23-dmitry.baryshkov@linaro.org>
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

