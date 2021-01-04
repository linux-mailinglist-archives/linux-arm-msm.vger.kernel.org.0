Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949142E90E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 08:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbhADHYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 02:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbhADHYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 02:24:01 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20236C06179E
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 23:22:52 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id n25so18543827pgb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 23:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BefZOjOjUvUJJ/zRqRM/0iBjrv3xJ+KOmu5Ty3XqHVM=;
        b=ZjH+gqTXFW1aYVi408naQt104phK4XqYynuM/Gv6m92BIGYtOyfCmsM4bzqFY4ipyT
         jxp4HetRafQLK1bEOUkXg+KQ7YfsDm7TdymGQJ/3NJhTI7/ol7o87LgJtvV1gKIDwucH
         fpH+LtVR6StE4zxJACiejQhCw+saRAkCxEaqykBd7dU9vgPXtzVyLPfNmp582sfVe8SH
         nMc1DNMNZvFXm5SP9vToaP5A27kPj6ZJ+vx2Apoz3QsmFBif6USwWTp2DDS0vYa2NLAI
         L8T+nk38TVy5VRrKGucb/liBZR2efesK+BWvyQfPs5gzCPXSikjMjUONWEjSVKNBEics
         FGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BefZOjOjUvUJJ/zRqRM/0iBjrv3xJ+KOmu5Ty3XqHVM=;
        b=T9GnmyNV2vrTffMkvWbPTFkUgQ4nu4A2V3x+hfaGn7F7tIJFSmn5gpFR3MNkm/b/Pj
         HpXl4VlOBIE1TO9708sh7gb0slbFmJZQHp7Q4yene/ondXytxnQpSFf7wpHbCRLMB23K
         x35qO0d5ArNSwx95rs52onw/Z2mW/zgeh7bXeH0K3bj6E1mNsMhOSMTBvXWekzm7OTxb
         e+ZiaxfrEHqexWAAe8VOc92mGwgcUZXWQYu7wEpicmIa2JA0a8DPFBvT79FZ6nP83PxX
         3hG66fF6RCcjnpDEmxqJKih7N3Ibo/V/Bi4yC442K9Th90cqIeGALwpWnD5nvmCrnmc6
         pYhA==
X-Gm-Message-State: AOAM530KhJfRw3h5m9VVEJVEejiwq90SlOEGgKf1Qb0KODmIYBvyK0xb
        jbJR/Yy2PxynQZOp3LWTj/OF
X-Google-Smtp-Source: ABdhPJy2vR+qmgHBkHS6gT0I76CKbTnqMQ5wXSYTCuqSBP3kY1FizoKDbBec3Q7OhDhSjmv8O5ZHvQ==
X-Received: by 2002:a63:ce42:: with SMTP id r2mr17981792pgi.8.1609744971571;
        Sun, 03 Jan 2021 23:22:51 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id h7sm56676668pfr.210.2021.01.03.23.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 23:22:51 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] phy: qcom-qmp: Add support for SDX55 QMP PHY
Date:   Mon,  4 Jan 2021 12:52:12 +0530
Message-Id: <20210104072212.144960-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104072212.144960-1-manivannan.sadhasivam@linaro.org>
References: <20210104072212.144960-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for USB3 QMP PHY found in SDX55 platform. SDX55 uses
version 4.0.0 of the QMP PHY IP and doesn't make use of "com_aux" clock.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 0939a9e9d448..bdcb8bf6225d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1974,6 +1974,53 @@ static const struct qmp_phy_init_tbl sm8250_qmp_gen3x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
 };
 
+static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x08),
+};
+
+static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x048),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
+};
+
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	/* phy-type - PCIE/UFS/USB */
@@ -2183,6 +2230,11 @@ static const char * const sdm845_ufs_phy_clk_l[] = {
 	"ref", "ref_aux",
 };
 
+/* usb3 phy on sdx55 doesn't have com_aux clock */
+static const char * const qmp_v4_sdx55_usbphy_clk_l[] = {
+	"aux", "cfg_ahb", "ref"
+};
+
 /* list of resets */
 static const char * const msm8996_pciephy_reset_l[] = {
 	"phy", "common", "cfg",
@@ -2824,6 +2876,34 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
+	.type			= PHY_TYPE_USB3,
+	.nlanes			= 1,
+
+	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
+	.tx_tbl			= sdx55_usb3_uniphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sdx55_usb3_uniphy_tx_tbl),
+	.rx_tbl			= sdx55_usb3_uniphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sdx55_usb3_uniphy_rx_tbl),
+	.pcs_tbl		= sm8250_usb3_uniphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_tbl),
+	.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3_uniphy_regs_layout,
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
@@ -4173,6 +4253,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-modem-pcie-phy",
 		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
+		.data = &sdx55_usb3_uniphy_cfg,
 	},
 	{ },
 };
-- 
2.25.1

