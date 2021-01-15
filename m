Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0042F82DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 18:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbhAORsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 12:48:43 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:26126 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733114AbhAORsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 12:48:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610732898; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=uEnsfmLtfReUBuJKGOb9H9BY4Zp2QDdfO22K+GTXqAI=; b=Prd0NcK1pNVJgNtOnsXDlgWEMV21FQmgX4JXN8VMN9lKKxCaSf6vi7jnYYtgvtQMIIsebI5J
 9cCLxivOz1Cwhc9pzvXMxSXHD25e7Uu/FHZO3iHbLJSKNaRfwi2C9jIQWQcCu2EQOi0lrGpG
 eDTjZTZE4nXr6YoCZtRf5OmmsTA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6001d54275e5c01cba490013 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 17:47:46
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 202A9C43461; Fri, 15 Jan 2021 17:47:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        UPPERCASE_50_75,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00623C433CA;
        Fri, 15 Jan 2021 17:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00623C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v2 2/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
Date:   Fri, 15 Jan 2021 09:47:21 -0800
Message-Id: <20210115174723.7424-3-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210115174723.7424-1-jackp@codeaurora.org>
References: <20210115174723.7424-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the USB DP & UNI PHYs found on SM8350. These use
version 5.0.0 of the QMP PHY IP and thus require new "V5"
definitions of the register offset macros for the QSERDES RX
and TX blocks. The QSERDES common and QPHY PCS blocks' register
offsets are largely unchanged from V4 so some of the existing
macros can be reused.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v2: Added missing to sm8350_usb3_uniphy entry to qcom_qmp_phy_of_match_table

 drivers/phy/qualcomm/phy-qcom-qmp.c | 212 ++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h | 100 +++++++++++++
 2 files changed, 312 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index f103b14f983e..d7f0d47f774f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -216,6 +216,15 @@ static const unsigned int qmp_v4_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x614,
 };
 
+static const unsigned int sm8350_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x44,
+	[QPHY_PCS_STATUS]		= 0x14,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x1008,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x1014,
+};
+
 static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x160,
@@ -2025,6 +2034,144 @@ static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_5, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xbb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xbb),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3d, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3c, 2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VTH_CODE, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0xbd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+};
+
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	/* phy-type - PCIE/UFS/USB */
@@ -2917,6 +3064,65 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
+	.type			= PHY_TYPE_USB3,
+	.nlanes			= 1,
+
+	.serdes_tbl		= sm8150_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
+	.tx_tbl			= sm8350_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_usb3_tx_tbl),
+	.rx_tbl			= sm8350_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_usb3_rx_tbl),
+	.pcs_tbl		= sm8350_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_pcs_tbl),
+	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.start_ctrl		= SERDES_START | PCS_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
+	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
+
+	.has_phy_dp_com_ctrl	= true,
+	.is_dual_lane_phy	= true,
+};
+
+static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
+	.type			= PHY_TYPE_USB3,
+	.nlanes			= 1,
+
+	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
+	.tx_tbl			= sm8350_usb3_uniphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_tx_tbl),
+	.rx_tbl			= sm8350_usb3_uniphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_rx_tbl),
+	.pcs_tbl		= sm8350_usb3_uniphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_tbl),
+	.clk_list		= qmp_v4_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8350_usb3_uniphy_regs_layout,
+
+	.start_ctrl		= SERDES_START | PCS_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
+	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
+};
+
 static void qcom_qmp_phy_configure_lane(void __iomem *base,
 					const unsigned int *regs,
 					const struct qmp_phy_init_tbl tbl[],
@@ -4267,6 +4473,12 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
 		.data = &sdx55_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-usb3-phy",
+		.data = &sm8350_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-usb3-uni-phy",
+		.data = &sm8350_usb3_uniphy_cfg,
 	},
 	{ },
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index db92a461dd2e..dff7be5a1cc1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -824,4 +824,104 @@
 #define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
 #define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
 
+/* Only for QMP V5 PHY - TX registers */
+#define QSERDES_V5_TX_RES_CODE_LANE_TX			0x34
+#define QSERDES_V5_TX_RES_CODE_LANE_RX			0x38
+#define QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX 		0x3c
+#define QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX 		0x40
+#define QSERDES_V5_TX_LANE_MODE_1			0x84
+#define QSERDES_V5_TX_LANE_MODE_2			0x88
+#define QSERDES_V5_TX_LANE_MODE_3			0x8c
+#define QSERDES_V5_TX_LANE_MODE_4			0x90
+#define QSERDES_V5_TX_LANE_MODE_5			0x94
+#define QSERDES_V5_TX_RCV_DETECT_LVL_2			0xa4
+#define QSERDES_V5_TX_TRAN_DRVR_EMP_EN			0xc0
+#define QSERDES_V5_TX_PI_QEC_CTRL			0xe4
+
+/* Only for QMP V5 PHY - RX registers */
+#define QSERDES_V5_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V5_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN		0x030
+#define QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
+#define QSERDES_V5_RX_UCDR_PI_CONTROLS			0x044
+#define QSERDES_V5_RX_UCDR_PI_CTRL2			0x048
+#define QSERDES_V5_RX_UCDR_SB2_THRESH1			0x04c
+#define QSERDES_V5_RX_UCDR_SB2_THRESH2			0x050
+#define QSERDES_V5_RX_UCDR_SB2_GAIN1			0x054
+#define QSERDES_V5_RX_UCDR_SB2_GAIN2			0x058
+#define QSERDES_V5_RX_AUX_DATA_TCOARSE_TFINE		0x060
+#define QSERDES_V5_RX_RCLK_AUXDATA_SEL			0x064
+#define QSERDES_V5_RX_AC_JTAG_ENABLE			0x068
+#define QSERDES_V5_RX_AC_JTAG_MODE			0x078
+#define QSERDES_V5_RX_RX_TERM_BW			0x080
+#define QSERDES_V5_RX_VGA_CAL_CNTRL1			0x0d4
+#define QSERDES_V5_RX_VGA_CAL_CNTRL2			0x0d8
+#define QSERDES_V5_RX_GM_CAL				0x0dc
+#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1		0x0e8
+#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
+#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
+#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4		0x0f4
+#define QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW		0x0f8
+#define QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
+#define QSERDES_V5_RX_RX_IDAC_MEASURE_TIME		0x100
+#define QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
+#define QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x114
+#define QSERDES_V5_RX_SIGDET_ENABLES			0x118
+#define QSERDES_V5_RX_SIGDET_CNTRL			0x11c
+#define QSERDES_V5_RX_SIGDET_LVL			0x120
+#define QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL		0x124
+#define QSERDES_V5_RX_RX_BAND				0x128
+#define QSERDES_V5_RX_RX_MODE_00_LOW			0x15c
+#define QSERDES_V5_RX_RX_MODE_00_HIGH			0x160
+#define QSERDES_V5_RX_RX_MODE_00_HIGH2			0x164
+#define QSERDES_V5_RX_RX_MODE_00_HIGH3			0x168
+#define QSERDES_V5_RX_RX_MODE_00_HIGH4			0x16c
+#define QSERDES_V5_RX_RX_MODE_01_LOW			0x170
+#define QSERDES_V5_RX_RX_MODE_01_HIGH			0x174
+#define QSERDES_V5_RX_RX_MODE_01_HIGH2			0x178
+#define QSERDES_V5_RX_RX_MODE_01_HIGH3			0x17c
+#define QSERDES_V5_RX_RX_MODE_01_HIGH4			0x180
+#define QSERDES_V5_RX_RX_MODE_10_LOW			0x184
+#define QSERDES_V5_RX_RX_MODE_10_HIGH			0x188
+#define QSERDES_V5_RX_RX_MODE_10_HIGH2			0x18c
+#define QSERDES_V5_RX_RX_MODE_10_HIGH3			0x190
+#define QSERDES_V5_RX_RX_MODE_10_HIGH4			0x194
+#define QSERDES_V5_RX_DFE_EN_TIMER			0x1a0
+#define QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET		0x1a4
+#define QSERDES_V5_RX_DCC_CTRL1				0x1a8
+#define QSERDES_V5_RX_VTH_CODE				0x1b0
+
+/* Only for QMP V5 PHY - USB3 have different offsets than V4 */
+#define QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1		0x300
+#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x304
+#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x308
+#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x30c
+#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x310
+#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x314
+#define QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x318
+#define QPHY_V5_PCS_USB3_LFPS_TX_ECSTART		0x31c
+#define QPHY_V5_PCS_USB3_LFPS_PER_TIMER_VAL		0x320
+#define QPHY_V5_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x324
+#define QPHY_V5_PCS_USB3_LFPS_CONFIG1			0x328
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x32c
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x330
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x334
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x338
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x33c
+#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x340
+#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x344
+#define QPHY_V5_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x348
+#define QPHY_V5_PCS_USB3_ARCVR_DTCT_CM_DLY		0x34c
+#define QPHY_V5_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x350
+#define QPHY_V5_PCS_USB3_ALFPS_DEGLITCH_VAL		0x354
+#define QPHY_V5_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x358
+#define QPHY_V5_PCS_USB3_TEST_CONTROL			0x35c
+#define QPHY_V5_PCS_USB3_RXTERMINATION_DLY_SEL		0x360
+
+/* Only for QMP V5 PHY - UNI has 0x1000 offset for PCS_USB3 regs */
+#define QPHY_V5_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL	0x1018
+#define QPHY_V5_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2	0x103c
+
 #endif
-- 
2.24.0

