Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4CF56666A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiGEJnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiGEJnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:42 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98104B1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:40 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j21so19665337lfe.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+suCRXdLtJr9zWCrdueK8B4w2QfoBM9hQ11w4iXGSsI=;
        b=acy30udj/lTo7vyAIZ45zn8WC03RVT+s9xQEz+sRH5Yv2t+f3N5AEqsckSMzJxditv
         VY94Yl/Ju/fg/U8WuYPnhQrBVpKx+BI/7DafpxuyiR9Am6d18U3u4QOWUclgtr8XluV6
         DFw5/7SlaZ01ulHLHfvki87laz+ztWfcm//6FQnfiP2eAQm4NEftXrto60gMkrtxBaJN
         y/WVSVtjRkkGGA6vjtyQpECSjmN1oi6OAUZ73QKM1raKMpfyFtTbIxzqnWPA7R63KbGv
         zamUbXNP5rHI5g4MJqo8pJ0u4Im5Tu48IQ54GfZA5QzQ53kkUGWZ4sPKObKF056Aknyy
         vdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+suCRXdLtJr9zWCrdueK8B4w2QfoBM9hQ11w4iXGSsI=;
        b=zcPPsGat+/yEdC+Mv1bSt/N8rbAoWuHSpYwyw+Edk/Kmgxfa8+ljdBLX/TrUa3brU3
         WjSgRR0GZmyaqn1hpTW4TVd7VunfRCPu8TSpi8Nb1K9+hCAWf7momq5GcbouZ7DUBm/J
         VdwNjD5er1IZBuDaujCUVbvaSV5rEU9MLl0YerOzE0LVlQAL6ezVdOdeaqaBJhXIsNsJ
         7K7aRPHUOj9cYve1ahWVzwbaDVkW/Ykq6mYOBfrIrSgMfVWqMB80xceOHDf0aAJIPHsB
         kV7Vg5Gvz2pgW2Xn0jQPaviw5sEooHruTJJo4IXlpWsS+CPpnUKEmz668/3cgPIgrQDY
         qCSQ==
X-Gm-Message-State: AJIora9/xo8XNo1tBwb92i81qBhwX0HQ1lV1IYRoYDi7+4LOQ4eVxnF7
        C7xrQHFMQlAXF5fL2OllY31IIg==
X-Google-Smtp-Source: AGRyM1vyS5m3VhFQxbH1o52Ox1BNYmPgbRYrKUDo5Oj0WpBS7ldm8pIfiY1iL1yW4Br9wlmSBZR4og==
X-Received: by 2002:a19:ee0f:0:b0:483:cbef:3c50 with SMTP id g15-20020a19ee0f000000b00483cbef3c50mr1177434lfb.7.1657014218919;
        Tue, 05 Jul 2022 02:43:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 21/28] phy: qcom-qmp: qserdes-com: add missing registers
Date:   Tue,  5 Jul 2022 12:43:13 +0300
Message-Id: <20220705094320.1313312-22-dmitry.baryshkov@linaro.org>
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
- msm-3.18's phy-qcom-ufs-qmp-14nm.h
- msm-3.18's mdss-hdmi-pll-8996.c
- msm-5.4's ep_pcie_phy.h

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |   2 +-
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   |  57 ++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  | 163 +++++++++++++++++-
 3 files changed, 220 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 0f3ca0d93f34..5afa9132804d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -423,7 +423,7 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x6),
 	QMP_PHY_INIT_CFG(QSERDES_TX_RES_CODE_LANE_OFFSET, 0x2),
 	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_TX_EMP_POST1_LVL, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_TX_TX_EMP_POST1_LVL, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_TX_SLEW_CNTL, 0x0a),
 };
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
index 9dfa80263707..fbaf6ef467f8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
@@ -7,6 +7,9 @@
 #define QCOM_PHY_QMP_QSERDES_COM_H_
 
 /* Only for QMP V2 PHY - QSERDES COM registers */
+#define QSERDES_COM_ATB_SEL1				0x000
+#define QSERDES_COM_ATB_SEL2				0x004
+#define QSERDES_COM_FREQ_UPDATE				0x008
 #define QSERDES_COM_BG_TIMER				0x00c
 #define QSERDES_COM_SSC_EN_CENTER			0x010
 #define QSERDES_COM_SSC_ADJ_PER1			0x014
@@ -15,10 +18,13 @@
 #define QSERDES_COM_SSC_PER2				0x020
 #define QSERDES_COM_SSC_STEP_SIZE1			0x024
 #define QSERDES_COM_SSC_STEP_SIZE2			0x028
+#define QSERDES_COM_POST_DIV				0x02c
+#define QSERDES_COM_POST_DIV_MUX			0x030
 #define QSERDES_COM_BIAS_EN_CLKBUFLR_EN			0x034
 #define QSERDES_COM_CLK_ENABLE1				0x038
 #define QSERDES_COM_SYS_CLK_CTRL			0x03c
 #define QSERDES_COM_SYSCLK_BUF_ENABLE			0x040
+#define QSERDES_COM_PLL_EN				0x044
 #define QSERDES_COM_PLL_IVCO				0x048
 #define QSERDES_COM_LOCK_CMP1_MODE0			0x04c
 #define QSERDES_COM_LOCK_CMP2_MODE0			0x050
@@ -26,58 +32,109 @@
 #define QSERDES_COM_LOCK_CMP1_MODE1			0x058
 #define QSERDES_COM_LOCK_CMP2_MODE1			0x05c
 #define QSERDES_COM_LOCK_CMP3_MODE1			0x060
+#define QSERDES_COM_LOCK_CMP1_MODE2			0x064
+#define QSERDES_COM_CMN_RSVD0				0x064
+#define QSERDES_COM_LOCK_CMP2_MODE2			0x068
+#define QSERDES_COM_EP_CLOCK_DETECT_CTRL		0x068
+#define QSERDES_COM_LOCK_CMP3_MODE2			0x06c
+#define QSERDES_COM_SYSCLK_DET_COMP_STATUS		0x06c
 #define QSERDES_COM_BG_TRIM				0x070
 #define QSERDES_COM_CLK_EP_DIV				0x074
 #define QSERDES_COM_CP_CTRL_MODE0			0x078
 #define QSERDES_COM_CP_CTRL_MODE1			0x07c
+#define QSERDES_COM_CP_CTRL_MODE2			0x080
+#define QSERDES_COM_CMN_RSVD1				0x080
 #define QSERDES_COM_PLL_RCTRL_MODE0			0x084
 #define QSERDES_COM_PLL_RCTRL_MODE1			0x088
+#define QSERDES_COM_PLL_RCTRL_MODE2			0x08c
+#define QSERDES_COM_CMN_RSVD2				0x08c
 #define QSERDES_COM_PLL_CCTRL_MODE0			0x090
 #define QSERDES_COM_PLL_CCTRL_MODE1			0x094
+#define QSERDES_COM_PLL_CCTRL_MODE2			0x098
+#define QSERDES_COM_CMN_RSVD3				0x098
+#define QSERDES_COM_PLL_CNTRL				0x09c
+#define QSERDES_COM_PHASE_SEL_CTRL			0x0a0
+#define QSERDES_COM_PHASE_SEL_DC			0x0a4
+#define QSERDES_COM_CORE_CLK_IN_SYNC_SEL		0x0a8
 #define QSERDES_COM_BIAS_EN_CTRL_BY_PSM			0x0a8
 #define QSERDES_COM_SYSCLK_EN_SEL			0x0ac
+#define QSERDES_COM_CML_SYSCLK_SEL			0x0b0
 #define QSERDES_COM_RESETSM_CNTRL			0x0b4
 #define QSERDES_COM_RESETSM_CNTRL2			0x0b8
 #define QSERDES_COM_RESTRIM_CTRL			0x0bc
+#define QSERDES_COM_RESTRIM_CTRL2			0x0c0
 #define QSERDES_COM_RESCODE_DIV_NUM			0x0c4
 #define QSERDES_COM_LOCK_CMP_EN				0x0c8
 #define QSERDES_COM_LOCK_CMP_CFG			0x0cc
 #define QSERDES_COM_DEC_START_MODE0			0x0d0
 #define QSERDES_COM_DEC_START_MODE1			0x0d4
+#define QSERDES_COM_DEC_START_MODE2			0x0d8
+#define QSERDES_COM_VCOCAL_DEADMAN_CTRL			0x0d8
 #define QSERDES_COM_DIV_FRAC_START1_MODE0		0x0dc
 #define QSERDES_COM_DIV_FRAC_START2_MODE0		0x0e0
 #define QSERDES_COM_DIV_FRAC_START3_MODE0		0x0e4
 #define QSERDES_COM_DIV_FRAC_START1_MODE1		0x0e8
 #define QSERDES_COM_DIV_FRAC_START2_MODE1		0x0ec
 #define QSERDES_COM_DIV_FRAC_START3_MODE1		0x0f0
+#define QSERDES_COM_DIV_FRAC_START1_MODE2		0x0f4
+#define QSERDES_COM_VCO_TUNE_MINVAL1			0x0f4
+#define QSERDES_COM_DIV_FRAC_START2_MODE2		0x0f8
+#define QSERDES_COM_VCO_TUNE_MINVAL2			0x0f8
+#define QSERDES_COM_DIV_FRAC_START3_MODE2		0x0fc
+#define QSERDES_COM_CMN_RSVD4				0x0fc
 #define QSERDES_COM_INTEGLOOP_INITVAL			0x100
+#define QSERDES_COM_INTEGLOOP_EN			0x104
 #define QSERDES_COM_INTEGLOOP_GAIN0_MODE0		0x108
 #define QSERDES_COM_INTEGLOOP_GAIN1_MODE0		0x10c
 #define QSERDES_COM_INTEGLOOP_GAIN0_MODE1		0x110
 #define QSERDES_COM_INTEGLOOP_GAIN1_MODE1		0x114
+#define QSERDES_COM_INTEGLOOP_GAIN0_MODE2		0x118
+#define QSERDES_COM_VCO_TUNE_MAXVAL1			0x118
+#define QSERDES_COM_INTEGLOOP_GAIN1_MODE2		0x11c
+#define QSERDES_COM_VCO_TUNE_MAXVAL2			0x11c
+#define QSERDES_COM_RES_TRIM_CONTROL2			0x120
 #define QSERDES_COM_VCO_TUNE_CTRL			0x124
 #define QSERDES_COM_VCO_TUNE_MAP			0x128
 #define QSERDES_COM_VCO_TUNE1_MODE0			0x12c
 #define QSERDES_COM_VCO_TUNE2_MODE0			0x130
 #define QSERDES_COM_VCO_TUNE1_MODE1			0x134
 #define QSERDES_COM_VCO_TUNE2_MODE1			0x138
+#define QSERDES_COM_VCO_TUNE1_MODE2			0x13c
 #define QSERDES_COM_VCO_TUNE_INITVAL1			0x13c
+#define QSERDES_COM_VCO_TUNE2_MODE2			0x140
 #define QSERDES_COM_VCO_TUNE_INITVAL2			0x140
 #define QSERDES_COM_VCO_TUNE_TIMER1			0x144
 #define QSERDES_COM_VCO_TUNE_TIMER2			0x148
+#define QSERDES_COM_SAR					0x14c
+#define QSERDES_COM_SAR_CLK				0x150
+#define QSERDES_COM_SAR_CODE_OUT_STATUS			0x154
+#define QSERDES_COM_SAR_CODE_READY_STATUS		0x158
+#define QSERDES_COM_CMN_STATUS				0x15c
+#define QSERDES_COM_RESET_SM_STATUS			0x160
+#define QSERDES_COM_RESTRIM_CODE_STATUS			0x164
+#define QSERDES_COM_PLLCAL_CODE1_STATUS			0x168
+#define QSERDES_COM_PLLCAL_CODE2_STATUS			0x16c
 #define QSERDES_COM_BG_CTRL				0x170
 #define QSERDES_COM_CLK_SELECT				0x174
 #define QSERDES_COM_HSCLK_SEL				0x178
+#define QSERDES_COM_INTEGLOOP_BINCODE_STATUS		0x17c
+#define QSERDES_COM_PLL_ANALOG				0x180
 #define QSERDES_COM_CORECLK_DIV				0x184
+#define QSERDES_COM_SW_RESET				0x188
 #define QSERDES_COM_CORE_CLK_EN				0x18c
 #define QSERDES_COM_C_READY_STATUS			0x190
 #define QSERDES_COM_CMN_CONFIG				0x194
+#define QSERDES_COM_CMN_RATE_OVERRIDE			0x198
 #define QSERDES_COM_SVS_MODE_CLK_SEL			0x19c
 #define QSERDES_COM_DEBUG_BUS0				0x1a0
 #define QSERDES_COM_DEBUG_BUS1				0x1a4
 #define QSERDES_COM_DEBUG_BUS2				0x1a8
 #define QSERDES_COM_DEBUG_BUS3				0x1ac
 #define QSERDES_COM_DEBUG_BUS_SEL			0x1b0
+#define QSERDES_COM_CMN_MISC1				0x1b4
+#define QSERDES_COM_CMN_MISC2				0x1b8
 #define QSERDES_COM_CORECLK_DIV_MODE1			0x1bc
+#define QSERDES_COM_CORECLK_DIV_MODE2			0x1c0
+#define QSERDES_COM_CMN_RSVD5				0x1c0
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
index 583098a88b65..d20694513eb4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
@@ -7,31 +7,143 @@
 #define QCOM_PHY_QMP_QSERDES_TXRX_H_
 
 /* Only for QMP V2 PHY - TX registers */
-#define QSERDES_TX_EMP_POST1_LVL			0x018
+#define QSERDES_TX_BIST_MODE_LANENO			0x000
+#define QSERDES_TX_BIST_INVERT				0x004
+#define QSERDES_TX_CLKBUF_ENABLE			0x008
+#define QSERDES_TX_CMN_CONTROL_ONE			0x00c
+#define QSERDES_TX_CMN_CONTROL_TWO			0x010
+#define QSERDES_TX_CMN_CONTROL_THREE			0x014
+#define QSERDES_TX_TX_EMP_POST1_LVL			0x018
+#define QSERDES_TX_TX_POST2_EMPH			0x01c
+#define QSERDES_TX_TX_BOOST_LVL_UP_DN			0x020
+#define QSERDES_TX_HP_PD_ENABLES			0x024
+#define QSERDES_TX_TX_IDLE_LVL_LARGE_AMP		0x028
+#define QSERDES_TX_TX_DRV_LVL				0x02c
+#define QSERDES_TX_TX_DRV_LVL_OFFSET			0x030
+#define QSERDES_TX_RESET_TSYNC_EN			0x034
+#define QSERDES_TX_PRE_STALL_LDO_BOOST_EN		0x038
+#define QSERDES_TX_TX_BAND				0x03c
 #define QSERDES_TX_SLEW_CNTL				0x040
+#define QSERDES_TX_INTERFACE_SELECT			0x044
+#define QSERDES_TX_LPB_EN				0x048
+#define QSERDES_TX_RES_CODE_LANE_TX			0x04c
+#define QSERDES_TX_RES_CODE_LANE_RX			0x050
 #define QSERDES_TX_RES_CODE_LANE_OFFSET			0x054
+#define QSERDES_TX_PERL_LENGTH1				0x058
+#define QSERDES_TX_PERL_LENGTH2				0x05c
+#define QSERDES_TX_SERDES_BYP_EN_OUT			0x060
 #define QSERDES_TX_DEBUG_BUS_SEL			0x064
 #define QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN	0x068
+#define QSERDES_TX_TX_POL_INV				0x06c
+#define QSERDES_TX_PARRATE_REC_DETECT_IDLE_EN		0x070
+#define QSERDES_TX_BIST_PATTERN1			0x074
+#define QSERDES_TX_BIST_PATTERN2			0x078
+#define QSERDES_TX_BIST_PATTERN3			0x07c
+#define QSERDES_TX_BIST_PATTERN4			0x080
+#define QSERDES_TX_BIST_PATTERN5			0x084
+#define QSERDES_TX_BIST_PATTERN6			0x088
+#define QSERDES_TX_BIST_PATTERN7			0x08c
+#define QSERDES_TX_BIST_PATTERN8			0x090
 #define QSERDES_TX_LANE_MODE				0x094
+#define QSERDES_TX_IDAC_CAL_LANE_MODE			0x098
+#define QSERDES_TX_IDAC_CAL_LANE_MODE_CONFIGURATION	0x09c
+#define QSERDES_TX_ATB_SEL1				0x0a0
+#define QSERDES_TX_ATB_SEL2				0x0a4
+#define QSERDES_TX_RCV_DETECT_LVL			0x0a8
 #define QSERDES_TX_RCV_DETECT_LVL_2			0x0ac
+#define QSERDES_TX_PRBS_SEED1				0x0b0
+#define QSERDES_TX_PRBS_SEED2				0x0b4
+#define QSERDES_TX_PRBS_SEED3				0x0b8
+#define QSERDES_TX_PRBS_SEED4				0x0bc
+#define QSERDES_TX_RESET_GEN				0x0c0
+#define QSERDES_TX_RESET_GEN_MUXES			0x0c4
+#define QSERDES_TX_TRAN_DRVR_EMP_EN			0x0c8
+#define QSERDES_TX_TX_INTERFACE_MODE			0x0cc
+#define QSERDES_TX_PWM_CTRL				0x0d0
+#define QSERDES_TX_PWM_ENCODED_OR_DATA			0x0d4
+#define QSERDES_TX_PWM_GEAR_1_DIVIDER_BAND2		0x0d8
+#define QSERDES_TX_PWM_GEAR_2_DIVIDER_BAND2		0x0dc
+#define QSERDES_TX_PWM_GEAR_3_DIVIDER_BAND2		0x0e0
+#define QSERDES_TX_PWM_GEAR_4_DIVIDER_BAND2		0x0e4
+#define QSERDES_TX_PWM_GEAR_1_DIVIDER_BAND0_1		0x0e8
+#define QSERDES_TX_PWM_GEAR_2_DIVIDER_BAND0_1		0x0ec
+#define QSERDES_TX_PWM_GEAR_3_DIVIDER_BAND0_1		0x0f0
+#define QSERDES_TX_PWM_GEAR_4_DIVIDER_BAND0_1		0x0f4
+#define QSERDES_TX_VMODE_CTRL1				0x0f8
+#define QSERDES_TX_VMODE_CTRL2				0x0fc
+#define QSERDES_TX_TX_ALOG_INTF_OBSV_CNTL		0x100
+#define QSERDES_TX_BIST_STATUS				0x104
+#define QSERDES_TX_BIST_ERROR_COUNT1			0x108
+#define QSERDES_TX_BIST_ERROR_COUNT2			0x10c
+#define QSERDES_TX_TX_ALOG_INTF_OBSV			0x110
 
 /* Only for QMP V2 PHY - RX registers */
+#define QSERDES_RX_UCDR_FO_GAIN_HALF			0x000
+#define QSERDES_RX_UCDR_FO_GAIN_QUARTER			0x004
+#define QSERDES_RX_UCDR_FO_GAIN_EIGHTH			0x008
+#define QSERDES_RX_UCDR_FO_GAIN				0x00c
 #define QSERDES_RX_UCDR_SO_GAIN_HALF			0x010
+#define QSERDES_RX_UCDR_SO_GAIN_QUARTER			0x014
+#define QSERDES_RX_UCDR_SO_GAIN_EIGHTH			0x018
 #define QSERDES_RX_UCDR_SO_GAIN				0x01c
+#define QSERDES_RX_UCDR_SVS_FO_GAIN_HALF		0x020
+#define QSERDES_RX_UCDR_SVS_FO_GAIN_QUARTER		0x024
+#define QSERDES_RX_UCDR_SVS_FO_GAIN_EIGHTH		0x028
+#define QSERDES_RX_UCDR_SVS_FO_GAIN			0x02c
 #define QSERDES_RX_UCDR_SVS_SO_GAIN_HALF		0x030
 #define QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER		0x034
 #define QSERDES_RX_UCDR_SVS_SO_GAIN_EIGHTH		0x038
 #define QSERDES_RX_UCDR_SVS_SO_GAIN			0x03c
 #define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		0x040
+#define QSERDES_RX_UCDR_FD_GAIN				0x044
 #define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	0x048
+#define QSERDES_RX_UCDR_FO_TO_SO_DELAY			0x04c
+#define QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW		0x050
+#define QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH		0x054
+#define QSERDES_RX_UCDR_MODULATE			0x058
+#define QSERDES_RX_UCDR_PI_CONTROLS			0x05c
+#define QSERDES_RX_RBIST_CONTROL			0x060
+#define QSERDES_RX_AUX_CONTROL				0x064
+#define QSERDES_RX_AUX_DATA_TCOARSE			0x068
+#define QSERDES_RX_AUX_DATA_TFINE_LSB			0x06c
+#define QSERDES_RX_AUX_DATA_TFINE_MSB			0x070
+#define QSERDES_RX_RCLK_AUXDATA_SEL			0x074
+#define QSERDES_RX_AC_JTAG_ENABLE			0x078
+#define QSERDES_RX_AC_JTAG_INITP			0x07c
+#define QSERDES_RX_AC_JTAG_INITN			0x080
+#define QSERDES_RX_AC_JTAG_LVL				0x084
+#define QSERDES_RX_AC_JTAG_MODE				0x088
+#define QSERDES_RX_AC_JTAG_RESET			0x08c
 #define QSERDES_RX_RX_TERM_BW				0x090
+#define QSERDES_RX_RX_RCVR_IQ_EN			0x094
+#define QSERDES_RX_RX_IDAC_I_DC_OFFSETS			0x098
+#define QSERDES_RX_RX_IDAC_IBAR_DC_OFFSETS		0x09c
+#define QSERDES_RX_RX_IDAC_Q_DC_OFFSETS			0x0a0
+#define QSERDES_RX_RX_IDAC_QBAR_DC_OFFSETS		0x0a4
+#define QSERDES_RX_RX_IDAC_A_DC_OFFSETS			0x0a8
+#define QSERDES_RX_RX_IDAC_ABAR_DC_OFFSETS		0x0ac
+#define QSERDES_RX_RX_IDAC_EN				0x0b0
+#define QSERDES_RX_RX_IDAC_ENABLES			0x0b4
+#define QSERDES_RX_RX_IDAC_SIGN				0x0b8
+#define QSERDES_RX_RX_HIGHZ_HIGHRATE			0x0bc
+#define QSERDES_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET	0x0c0
 #define QSERDES_RX_RX_EQ_GAIN1_LSB			0x0c4
 #define QSERDES_RX_RX_EQ_GAIN1_MSB			0x0c8
 #define QSERDES_RX_RX_EQ_GAIN2_LSB			0x0cc
 #define QSERDES_RX_RX_EQ_GAIN2_MSB			0x0d0
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1		0x0d4
 #define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d8
 #define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		0x0dc
 #define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		0x0e0
+#define QSERDES_RX_RX_IDAC_CAL_CONFIGURATION		0x0e4
+#define QSERDES_RX_RX_IDAC_TSETTLE_LOW			0x0e8
+#define QSERDES_RX_RX_IDAC_TSETTLE_HIGH			0x0ec
+#define QSERDES_RX_RX_IDAC_ENDSAMP_LOW			0x0f0
+#define QSERDES_RX_RX_IDAC_ENDSAMP_HIGH			0x0f4
+#define QSERDES_RX_RX_IDAC_MIDPOINT_LOW			0x0f8
+#define QSERDES_RX_RX_IDAC_MIDPOINT_HIGH		0x0fc
+#define QSERDES_RX_RX_EQ_OFFSET_LSB			0x100
+#define QSERDES_RX_RX_EQ_OFFSET_MSB			0x104
 #define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x108
 #define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x10c
 #define QSERDES_RX_SIGDET_ENABLES			0x110
@@ -39,6 +151,55 @@
 #define QSERDES_RX_SIGDET_LVL				0x118
 #define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		0x11c
 #define QSERDES_RX_RX_BAND				0x120
+#define QSERDES_RX_CDR_FREEZE_UP_DN			0x124
+#define QSERDES_RX_CDR_RESET_OVERRIDE			0x128
 #define QSERDES_RX_RX_INTERFACE_MODE			0x12c
+#define QSERDES_RX_JITTER_GEN_MODE			0x130
+#define QSERDES_RX_BUJ_AMP				0x134
+#define QSERDES_RX_SJ_AMP1				0x138
+#define QSERDES_RX_SJ_AMP2				0x13c
+#define QSERDES_RX_SJ_PER1				0x140
+#define QSERDES_RX_SJ_PER2				0x144
+#define QSERDES_RX_BUJ_STEP_FREQ1			0x148
+#define QSERDES_RX_BUJ_STEP_FREQ2			0x14c
+#define QSERDES_RX_PPM_OFFSET1				0x150
+#define QSERDES_RX_PPM_OFFSET2				0x154
+#define QSERDES_RX_SIGN_PPM_PERIOD1			0x158
+#define QSERDES_RX_SIGN_PPM_PERIOD2			0x15c
+#define QSERDES_RX_SSC_CTRL				0x160
+#define QSERDES_RX_SSC_COUNT1				0x164
+#define QSERDES_RX_SSC_COUNT2				0x168
+#define QSERDES_RX_RX_ALOG_INTF_OBSV_CNTL		0x16c
+#define QSERDES_RX_RX_PWM_ENABLE_AND_DATA		0x170
+#define QSERDES_RX_RX_PWM_GEAR1_TIMEOUT_COUNT		0x174
+#define QSERDES_RX_RX_PWM_GEAR2_TIMEOUT_COUNT		0x178
+#define QSERDES_RX_RX_PWM_GEAR3_TIMEOUT_COUNT		0x17c
+#define QSERDES_RX_RX_PWM_GEAR4_TIMEOUT_COUNT		0x180
+#define QSERDES_RX_PI_CTRL1				0x184
+#define QSERDES_RX_PI_CTRL2				0x188
+#define QSERDES_RX_PI_QUAD				0x18c
+#define QSERDES_RX_IDATA1				0x190
+#define QSERDES_RX_IDATA2				0x194
+#define QSERDES_RX_AUX_DATA1				0x198
+#define QSERDES_RX_AUX_DATA2				0x19c
+#define QSERDES_RX_AC_JTAG_OUTP				0x1a0
+#define QSERDES_RX_AC_JTAG_OUTN				0x1a4
+#define QSERDES_RX_RX_SIGDET				0x1a8
+#define QSERDES_RX_RX_VDCOFF				0x1ac
+#define QSERDES_RX_IDAC_CAL_ON				0x1b0
+#define QSERDES_RX_IDAC_STATUS_I			0x1b4
+#define QSERDES_RX_IDAC_STATUS_IBAR			0x1b8
+#define QSERDES_RX_IDAC_STATUS_Q			0x1bc
+#define QSERDES_RX_IDAC_STATUS_QBAR			0x1c0
+#define QSERDES_RX_IDAC_STATUS_A			0x1c4
+#define QSERDES_RX_IDAC_STATUS_ABAR			0x1c8
+#define QSERDES_RX_CALST_STATUS_I			0x1cc
+#define QSERDES_RX_CALST_STATUS_Q			0x1d0
+#define QSERDES_RX_CALST_STATUS_A			0x1d4
+#define QSERDES_RX_RX_ALOG_INTF_OBSV			0x1d8
+#define QSERDES_RX_READ_EQCODE				0x1dc
+#define QSERDES_RX_READ_OFFSETCODE			0x1e0
+#define QSERDES_RX_IA_ERROR_COUNTER_LOW			0x1e4
+#define QSERDES_RX_IA_ERROR_COUNTER_HIGH		0x1e8
 
 #endif
-- 
2.35.1

