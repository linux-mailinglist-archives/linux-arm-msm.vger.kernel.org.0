Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F433E1113
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239655AbhHEJR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239854AbhHEJRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:17:52 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4857DC0613C1;
        Thu,  5 Aug 2021 02:17:38 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z4so5565126wrv.11;
        Thu, 05 Aug 2021 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0mtoad8YoEmpFvolB4QV45Plyh6RUCY1IpkLb9drQKo=;
        b=TbaOfInwqV9n40YqxqdpUiPI/24Cf9Rnf3u+UYr0W0hUWexlszJohzzqX5Yd+Js6Ae
         q4x52hMX83iNxuLb6Bybzj1RsARvdZyTbHmDLr+uV1zx7CEt2pcGy8pHCPZ+rW5Z25gO
         DneIqZ+DeUsdWwIrh9EwP/OTe9bCI0ILsWsVBWKT8Yi0oz9aLNYmLW39S0e/lYsJRXO6
         7wBtBOu+m8uk75I8m2dsqizWlPizFdmxHJoAR0tUneoWTcjRJ8IADYjyqplU6kqB9fgV
         baMEFer8Zum9GBP7ncsi5wbdEoWApRqAeJbcnkfOVT6pvWzxhOvJO/RhI4GU9WoFJydp
         8YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0mtoad8YoEmpFvolB4QV45Plyh6RUCY1IpkLb9drQKo=;
        b=o9boAR2VxQtR6L5Iwb5KS88a0QOiDawkQsyHjUmI/KeUykpuZdKxsL7fgb0HxTNlN4
         lzEr/GoJ/uJVD2e/fnqA6uzAtFZyZo6GL2HIufjXEKtjh66fon0RHszmmC7cUQxYbdS3
         a4txVGQcZ8oWcBaHWePSHAiPgbxWPdnle5macttCSl4x01JsL2kpMnElR3guT6PfvOAL
         aG0naEp5zTkJJs+gczfXupfHKZTek63onL5gHY7YimOqB2h5oitpjIr03PXagloYztzz
         t8qSbgwsrdekezIlwi6IQyfEwtODvdfC1kNcFL9blCiQq5MfkxxQcE1z0nmsl7pwQJVE
         aj8Q==
X-Gm-Message-State: AOAM533FCYTLtxaH/AvXrvTM+8DueJK6a5+DNrZFS7oRjPjfYcoVsQsE
        Qk7eJRt2H+beR9vSj3FHBKaitLpaTfc=
X-Google-Smtp-Source: ABdhPJxiZa5QnsPAE+FMjVqFyhHi0ODjnkKByil4sa63dBo1nBP9wkVoqgM8mtt2TfGd2dM0lOD0Xw==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr3993601wrw.354.1628155056853;
        Thu, 05 Aug 2021 02:17:36 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id h16sm5427472wre.52.2021.08.05.02.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:17:36 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 2/2] phy: qcom-qmp: Add support for SM6115 UFS phy
Date:   Thu,  5 Aug 2021 12:17:27 +0300
Message-Id: <20210805091727.942471-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805091727.942471-1-iskren.chernev@gmail.com>
References: <20210805091727.942471-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the tables and constants for init sequences for UFS QMP phy found in
SM4250/6115 SoC. The phy is a variation of the v3 phy found on sdm845
called v3-660 (possibly first occurrence in the sdm660).

There are a few similar registers with the v3 phy, but overall they are
different, so I haven't tried reusing the same constants where possible,
as it would make the tables harder to read and maintain.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 124 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h | 153 ++++++++++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 2195f8ac393b..2b012bcff622 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -234,6 +234,11 @@ static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_READY_STATUS]		= 0x160,
 };
 
+static const unsigned int sm6115_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= 0x00,
+	[QPHY_PCS_READY_STATUS]		= 0x168,
+};
+
 static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x44,
@@ -1329,6 +1334,97 @@ static const struct qmp_phy_init_tbl qmp_v3_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_REFGEN_REQ_CONFIG2, 0x60),
 };
 
+static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CMN_CONFIG, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_SYSCLK_EN_SEL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CORECLK_DIV_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP_CFG, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DIV_FRAC_START3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE1_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DIV_FRAC_START1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DIV_FRAC_START2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_DIV_FRAC_START3_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_CP_CTRL_MODE1, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE1_MODE1, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_LOCK_CMP3_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_INITVAL1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_INITVAL2, 0x00),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_COM_VCO_TUNE_MAP, 0x44),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_TX_HIGHZ_TRANSCEIVER_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_TX_LANE_MODE, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_SIGDET_CNTRL, 0x0F),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_INTERFACE_MODE, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_SIGDET_DEGLITCH_CNTRL, 0x1E),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_TERM_BW, 0x5B),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_EQ_GAIN1_LSB, 0xFF),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_EQ_GAIN1_MSB, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_EQ_GAIN2_LSB, 0xFF),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_EQ_GAIN2_MSB, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0D),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_660_RX_UCDR_SO_SATURATION_ENABLE, 0x5B),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_RX_PWM_GEAR_BAND, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_RX_SYM_RESYNC_CTRL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V3_660_PCS_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
+};
+
 static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x04),
@@ -3396,6 +3492,31 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.no_pcs_sw_reset	= true,
 };
 
+static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 1,
+
+	.serdes_tbl		= sm6115_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
+	.tx_tbl			= sm6115_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_tx_tbl),
+	.rx_tbl			= sm6115_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_rx_tbl),
+	.pcs_tbl		= sm6115_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_pcs_tbl),
+	.clk_list		= sdm845_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm6115_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.is_dual_lane_phy	= false,
+	.no_pcs_sw_reset	= true,
+};
+
 static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.type			= PHY_TYPE_PCIE,
 	.nlanes			= 1,
@@ -5395,6 +5516,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8998-qmp-usb3-phy",
 		.data = &msm8998_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm6115-qmp-ufs-phy",
+		.data = &sm6115_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 6592b58b13f6..fffdd532bac4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -280,6 +280,8 @@
 #define QSERDES_V3_COM_SSC_PER2				0x020
 #define QSERDES_V3_COM_SSC_STEP_SIZE1			0x024
 #define QSERDES_V3_COM_SSC_STEP_SIZE2			0x028
+#define QSERDES_V3_COM_POST_DIV				0x02c
+#define QSERDES_V3_COM_POST_DIV_MUX			0x030
 #define QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN		0x034
 # define QSERDES_V3_COM_BIAS_EN				0x0001
 # define QSERDES_V3_COM_BIAS_EN_MUX			0x0002
@@ -291,6 +293,7 @@
 #define QSERDES_V3_COM_CLK_ENABLE1			0x038
 #define QSERDES_V3_COM_SYS_CLK_CTRL			0x03c
 #define QSERDES_V3_COM_SYSCLK_BUF_ENABLE		0x040
+#define QSERDES_V3_COM_PLL_EN				0x044
 #define QSERDES_V3_COM_PLL_IVCO				0x048
 #define QSERDES_V3_COM_LOCK_CMP1_MODE0			0x098
 #define QSERDES_V3_COM_LOCK_CMP2_MODE0			0x09c
@@ -348,6 +351,119 @@
 #define QSERDES_V3_COM_DEBUG_BUS_SEL			0x178
 #define QSERDES_V3_COM_CMN_MODE				0x184
 
+/* Only for QMP V3 660 PHY - QSERDES COM registers*/
+#define QSERDES_V3_660_COM_ATB_SEL1			0x000
+#define QSERDES_V3_660_COM_ATB_SEL2			0x004
+#define QSERDES_V3_660_COM_FREQ_UPDATE			0x008
+#define QSERDES_V3_660_COM_BG_TIMER			0x00c
+#define QSERDES_V3_660_COM_SSC_EN_CENTER		0x010
+#define QSERDES_V3_660_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_V3_660_COM_SSC_ADJ_PER2			0x018
+#define QSERDES_V3_660_COM_SSC_PER1			0x01c
+#define QSERDES_V3_660_COM_SSC_PER2			0x020
+#define QSERDES_V3_660_COM_SSC_STEP_SIZE1		0x024
+#define QSERDES_V3_660_COM_SSC_STEP_SIZE2		0x028
+#define QSERDES_V3_660_COM_POST_DIV			0x02c
+#define QSERDES_V3_660_COM_POST_DIV_MUX			0x030
+#define QSERDES_V3_660_COM_BIAS_EN_CLKBUFLR_EN		0x034
+#define QSERDES_V3_660_COM_CLK_ENABLE1			0x038
+#define QSERDES_V3_660_COM_SYS_CLK_CTRL			0x03c
+#define QSERDES_V3_660_COM_SYSCLK_BUF_ENABLE		0x040
+#define QSERDES_V3_660_COM_PLL_EN			0x044
+#define QSERDES_V3_660_COM_PLL_IVCO			0x048
+#define QSERDES_V3_660_COM_LOCK_CMP1_MODE0		0x04c
+#define QSERDES_V3_660_COM_LOCK_CMP2_MODE0		0x050
+#define QSERDES_V3_660_COM_LOCK_CMP3_MODE0		0x054
+#define QSERDES_V3_660_COM_LOCK_CMP1_MODE1		0x058
+#define QSERDES_V3_660_COM_LOCK_CMP2_MODE1		0x05c
+#define QSERDES_V3_660_COM_LOCK_CMP3_MODE1		0x060
+#define QSERDES_V3_660_COM_CMD_RSVD0			0x064
+#define QSERDES_V3_660_COM_EP_CLOCK_DETECT_CTRL		0x068
+#define QSERDES_V3_660_COM_SYSCLK_DET_COMP_STATUS	0x06c
+#define QSERDES_V3_660_COM_BG_TRIM			0x070
+#define QSERDES_V3_660_COM_CLK_EP_DIV			0x074
+#define QSERDES_V3_660_COM_CP_CTRL_MODE0		0x078
+#define QSERDES_V3_660_COM_CP_CTRL_MODE1		0x07c
+#define QSERDES_V3_660_COM_CMN_RSVD1			0x080
+#define QSERDES_V3_660_COM_PLL_RCTRL_MODE0		0x084
+#define QSERDES_V3_660_COM_PLL_RCTRL_MODE1		0x088
+#define QSERDES_V3_660_COM_CMN_RSVD2			0x08c
+#define QSERDES_V3_660_COM_PLL_CCTRL_MODE0		0x090
+#define QSERDES_V3_660_COM_PLL_CCTRL_MODE1		0x094
+#define QSERDES_V3_660_COM_CMN_RSVD3			0x098
+#define QSERDES_V3_660_COM_PLL_CNTRL			0x09c
+#define QSERDES_V3_660_COM_PHASE_SEL_CTRL		0x0a0
+#define QSERDES_V3_660_COM_PHASE_SEL_DC			0x0a4
+#define QSERDES_V3_660_COM_BIAS_EN_CTRL_BY_PSM		0x0a8
+#define QSERDES_V3_660_COM_SYSCLK_EN_SEL		0x0ac
+#define QSERDES_V3_660_COM_CML_SYSCLK_SEL		0x0b0
+#define QSERDES_V3_660_COM_RESETSM_CNTRL		0x0b4
+#define QSERDES_V3_660_COM_RESETSM_CNTRL2		0x0b8
+#define QSERDES_V3_660_COM_RESTRIM_CTRL			0x0bc
+#define QSERDES_V3_660_COM_RESTRIM_CTRL2		0x0c0
+#define QSERDES_V3_660_COM_LOCK_CMP_EN			0x0c8
+#define QSERDES_V3_660_COM_LOCK_CMP_CFG			0x0cc
+#define QSERDES_V3_660_COM_DEC_START_MODE0		0x0d0
+#define QSERDES_V3_660_COM_DEC_START_MODE1		0x0d4
+#define QSERDES_V3_660_COM_VCOCAL_DEADMAN_CTRL		0x0d8
+#define QSERDES_V3_660_COM_DIV_FRAC_START1_MODE0	0x0dc
+#define QSERDES_V3_660_COM_DIV_FRAC_START2_MODE0	0x0e0
+#define QSERDES_V3_660_COM_DIV_FRAC_START3_MODE0	0x0e4
+#define QSERDES_V3_660_COM_DIV_FRAC_START1_MODE1	0x0e8
+#define QSERDES_V3_660_COM_DIV_FRAC_START2_MODE1	0x0ec
+#define QSERDES_V3_660_COM_DIV_FRAC_START3_MODE1	0x0f0
+#define QSERDES_V3_660_COM_VCO_TUNE_MINVAL1		0x0f4
+#define QSERDES_V3_660_COM_VCO_TUNE_MINVAL2		0x0f8
+#define QSERDES_V3_660_COM_CMN_RSVD4			0x0fc
+#define QSERDES_V3_660_COM_INTEGLOOP_INITVAL		0x100
+#define QSERDES_V3_660_COM_INTEGLOOP_EN			0x104
+#define QSERDES_V3_660_COM_INTEGLOOP_GAIN0_MODE0	0x108
+#define QSERDES_V3_660_COM_INTEGLOOP_GAIN1_MODE0	0x10c
+#define QSERDES_V3_660_COM_INTEGLOOP_GAIN0_MODE1	0x110
+#define QSERDES_V3_660_COM_INTEGLOOP_GAIN1_MODE1	0x114
+#define QSERDES_V3_660_COM_VCO_TUNE_MAXVAL1		0x118
+#define QSERDES_V3_660_COM_VCO_TUNE_MAXVAL2		0x11c
+#define QSERDES_V3_660_COM_RES_TRIM_CONTROL2		0x120
+#define QSERDES_V3_660_COM_VCO_TUNE_CTRL		0x124
+#define QSERDES_V3_660_COM_VCO_TUNE_MAP			0x128
+#define QSERDES_V3_660_COM_VCO_TUNE1_MODE0		0x12c
+#define QSERDES_V3_660_COM_VCO_TUNE2_MODE0		0x130
+#define QSERDES_V3_660_COM_VCO_TUNE1_MODE1		0x134
+#define QSERDES_V3_660_COM_VCO_TUNE2_MODE1		0x138
+#define QSERDES_V3_660_COM_VCO_TUNE_INITVAL1		0x13c
+#define QSERDES_V3_660_COM_VCO_TUNE_INITVAL2		0x140
+#define QSERDES_V3_660_COM_VCO_TUNE_TIMER1		0x144
+#define QSERDES_V3_660_COM_VCO_TUNE_TIMER2		0x148
+#define QSERDES_V3_660_COM_SAR				0x14c
+#define QSERDES_V3_660_COM_SAR_CLK			0x150
+#define QSERDES_V3_660_COM_SAR_CODE_OUT_STATUS		0x154
+#define QSERDES_V3_660_COM_SAR_CODE_READY_STATUS	0x158
+#define QSERDES_V3_660_COM_CMN_STATUS			0x15c
+#define QSERDES_V3_660_COM_RESET_SM_STATUS		0x160
+#define QSERDES_V3_660_COM_RESTRIM_CODE_STATUS		0x164
+#define QSERDES_V3_660_COM_PLLCAL_CODE1_STATUS		0x168
+#define QSERDES_V3_660_COM_PLLCAL_CODE2_STATUS		0x16c
+#define QSERDES_V3_660_COM_BG_CTRL			0x170
+#define QSERDES_V3_660_COM_CLK_SELECT			0x174
+#define QSERDES_V3_660_COM_HSCLK_SEL			0x178
+#define QSERDES_V3_660_COM_INTEGLOOP_BINCODE_STATUS	0x17c
+#define QSERDES_V3_660_COM_PLL_ANALOG			0x180
+#define QSERDES_V3_660_COM_CORECLK_DIV			0x184
+#define QSERDES_V3_660_COM_SW_RESET			0x188
+#define QSERDES_V3_660_COM_CORE_CLK_EN			0x18c
+#define QSERDES_V3_660_COM_C_READY_STATUS		0x190
+#define QSERDES_V3_660_COM_CMN_CONFIG			0x194
+#define QSERDES_V3_660_COM_CMN_RATE_OVERRIDE		0x198
+#define QSERDES_V3_660_COM_SVS_MODE_CLK_SEL		0x19c
+#define QSERDES_V3_660_COM_DEBUG_BUS0			0x1a0
+#define QSERDES_V3_660_COM_DEBUG_BUS1			0x1a4
+#define QSERDES_V3_660_COM_DEBUG_BUS2			0x1a8
+#define QSERDES_V3_660_COM_DEBUG_BUS3			0x1ac
+#define QSERDES_V3_660_COM_DEBUG_BUS_SEL		0x1b0
+#define QSERDES_V3_660_COM_CMN_MISC1			0x1b4
+#define QSERDES_V3_660_COM_CORECLK_DIV_MODE1		0x1bc
+#define QSERDES_V3_660_COM_CMN_RSVD5			0x1c0
+
 /* Only for QMP V3 PHY - TX registers */
 #define QSERDES_V3_TX_BIST_MODE_LANENO			0x000
 #define QSERDES_V3_TX_CLKBUF_ENABLE			0x008
@@ -380,6 +496,10 @@
 #define QSERDES_V3_TX_TX_INTERFACE_MODE			0x0c4
 #define QSERDES_V3_TX_VMODE_CTRL1			0x0f0
 
+/* Only for QMP V3 660 PHY - TX registers */
+#define QSERDES_V3_660_TX_HIGHZ_TRANSCEIVER_BIAS_DRVR_EN	0x068
+#define QSERDES_V3_660_TX_LANE_MODE				0x094
+
 /* Only for QMP V3 PHY - RX registers */
 #define QSERDES_V3_RX_UCDR_FO_GAIN			0x008
 #define QSERDES_V3_RX_UCDR_SO_GAIN_HALF			0x00c
@@ -411,6 +531,24 @@
 #define QSERDES_V3_RX_RX_MODE_00			0x164
 #define QSERDES_V3_RX_RX_MODE_01			0x168
 
+/* Only for QMP V3 660 PHY - RX registers */
+#define QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN_HALF		0x030
+#define QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN_QUARTER	0x034
+#define QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN_EIGHTH	0x038
+#define QSERDES_V3_660_RX_UCDR_SVS_SO_GAIN		0x03c
+#define QSERDES_V3_660_RX_UCDR_FASTLOCK_FO_GAIN		0x040
+#define QSERDES_V3_660_RX_UCDR_SO_SATURATION_ENABLE	0x048
+#define QSERDES_V3_660_RX_RX_TERM_BW			0x090
+#define QSERDES_V3_660_RX_RX_EQ_GAIN1_LSB		0x0c4
+#define QSERDES_V3_660_RX_RX_EQ_GAIN1_MSB		0x0c8
+#define QSERDES_V3_660_RX_RX_EQ_GAIN2_LSB		0x0cc
+#define QSERDES_V3_660_RX_RX_EQ_GAIN2_MSB		0x0d0
+#define QSERDES_V3_660_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d8
+#define QSERDES_V3_660_RX_SIGDET_CNTRL			0x114
+#define QSERDES_V3_660_RX_SIGDET_LVL			0x118
+#define QSERDES_V3_660_RX_SIGDET_DEGLITCH_CNTRL		0x11c
+#define QSERDES_V3_660_RX_RX_INTERFACE_MODE		0x12c
+
 /* Only for QMP V3 PHY - PCS registers */
 #define QPHY_V3_PCS_POWER_DOWN_CONTROL			0x004
 #define QPHY_V3_PCS_TXMGN_V0				0x00c
@@ -473,6 +611,21 @@
 #define QPHY_V3_PCS_REFGEN_REQ_CONFIG1			0x20c
 #define QPHY_V3_PCS_REFGEN_REQ_CONFIG2			0x210
 
+/* Only for QMP V3 660 PHY - PCS registers */
+#define QPHY_V3_660_PCS_PHY_START			0x000
+#define QPHY_V3_660_PCS_POWER_DOWN_CONTROL		0x004
+#define QPHY_V3_660_PCS_TX_LARGE_AMP_DRV_LVL		0x034
+#define QPHY_V3_660_PCS_TX_LARGE_AMP_POST_EMP_LVL	0x038
+#define QPHY_V3_660_PCS_TX_SMALL_AMP_DRV_LVL		0x03c
+#define QPHY_V3_660_PCS_TX_SMALL_AMP_POST_EMP_LVL	0x040
+#define QPHY_V3_660_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP	0x0cc
+#define QPHY_V3_660_PCS_LINECFG_DISABLE			0x138
+#define QPHY_V3_660_PCS_RX_SYM_RESYNC_CTRL		0x13c
+#define QPHY_V3_660_PCS_RX_MIN_HIBERN8_TIME		0x140
+#define QPHY_V3_660_PCS_RX_SIGDET_CTRL2			0x148
+#define QPHY_V3_660_PCS_RX_PWM_GEAR_BAND		0x154
+#define QPHY_V3_660_PCS_PCS_READY_STATUS		0x168
+
 /* Only for QMP V3 PHY - PCS_MISC registers */
 #define QPHY_V3_PCS_MISC_CLAMP_ENABLE			0x0c
 #define QPHY_V3_PCS_MISC_OSC_DTCT_CONFIG2		0x2c
-- 
2.32.0

