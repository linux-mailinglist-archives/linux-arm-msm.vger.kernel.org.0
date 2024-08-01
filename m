Return-Path: <linux-arm-msm+bounces-27716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC461944987
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 12:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C3081C24D2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 10:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3D1184530;
	Thu,  1 Aug 2024 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdZaU7gL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306E18453A
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508842; cv=none; b=eBmixI81dy7UvFa5eM0nmdKKn89nzOlDGTYwqHNV3FZ9tIrkdUHAjodUQo16Tf53qCjIjYODvo5aqqpm1t2fICfnKFmjuJhY4GmKNPFrDUG7g8/t8H+/xU+BR835L8De6o/XX0ffFo4reLVbyvSOVuYizDodZI+OcYPskpkJh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508842; c=relaxed/simple;
	bh=M1MwZJsJg3ocK9dUEdbDtelKoL+7vXnSEEpnHzOOIQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nIRluu9Gsutos45egaXQ0W2he1x0TzbJnm0cBvV1mEE2tXVzBxaFGubEIE3VfrtGAGp6OQM6VoILoiyNYfi3W2avizdUyQyTCePTQSjmAH22EbP3XcrGHpc7xYclcnC/S5UQmSrxlNoDBrynWFgS2kJS+nCOx6ZQoFVVycfcMaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdZaU7gL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f149845d81so32412631fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722508838; x=1723113638; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RA2LpbrywbzcIlCYLWG/W47sX3QN1wt4kooJap9IIU=;
        b=mdZaU7gLRQL/QgpGst+dLu3xOWPlPl8qtaVRrnkp1L1x79EiDn2K3poz+Rg5DPRNU/
         ovQbOwJC01PgV65fNzYZ9Y0HDZ/kXrDgQTgFJqMW9cArL3+Dz0fKDEeRAJw0l9WKe6Cx
         8vmclFHCPKa77Bqv+WBWxuHVep8LeeR0f/oJrxmT8Y/b7qzpURSn93LrcM1K/NNcN/P6
         PBlA83yTZxST431rCDJZ7Me3taFfepHyew4tqiG+BWVzJPNWwuEz5n7/OVQgAJZ5XQc+
         Uz7vYVnr7vwV5wPwAQvCpg/3Bgu0asgFqqMae6dvPVPkCHb3qfjZl/aq2HN59X27OQ3/
         XPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722508838; x=1723113638;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RA2LpbrywbzcIlCYLWG/W47sX3QN1wt4kooJap9IIU=;
        b=QLRCLLGCfOpbM3YnLnqmRM1Ex0VUKP7Cpu8C10HqN7P5GpJl/VtRDRZ4eTk6LCmVBa
         EOW/HKx7TQH7n1F53WIEiIQPs3bX3LI1xAElQvOyvhHrJwnr50oGPiZ8VW4nV+IyBUyA
         j5bHdFuW1986fFdNWLkU8hIwxQSlvjEAF3ThzTBd8GAY+LVCumgSfshyPQn0cSyqzpI+
         M1z7udmaLKjcBm9E20qLSseTXEVTmCYLxFpwfI/CjnL1M/WaZp4TGH7RDwNRzESG2+vA
         oU2g8OTluFWMKpojQejCO3chA/z5dNKSZRhY7dutWG0eSFVf/FU6bZINed8k5PhoCYqv
         gIYg==
X-Forwarded-Encrypted: i=1; AJvYcCWEUmyBomqB3eqv3ws+qEefkRu4Vt1iFqQ6uMjT5d0KTaiggro2soLQJiSpmbzj1nqz4Xf5sFPWrz+rgJ2Qrc4Bedzn3YOtRa8xx1s6Hw==
X-Gm-Message-State: AOJu0YwelpnaFLkGJ531rSa98biBd6nlrASW0RlW30zs5jw2LBMc7ZOZ
	3q7zyaPtGpSLQWqaVXNrEXCdBntBiPivB6/YOPO28wYXIqskcGy/TdmzD5l/LXY=
X-Google-Smtp-Source: AGHT+IECPH2rPNEngYaptz8az9RCf0DGVDSV9yQZXRuXqYNi7ULAbIWTZHPkY18jUas/hbL9JhkWQw==
X-Received: by 2002:a2e:9e54:0:b0:2f1:59ed:879d with SMTP id 38308e7fff4ca-2f159ed8c49mr1027341fa.1.1722508838095;
        Thu, 01 Aug 2024 03:40:38 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282baf2b3esm52523755e9.31.2024.08.01.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:40:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 01 Aug 2024 13:40:24 +0300
Subject: [PATCH v2] phy: qcom: qmp-pcie: Fix X1E80100 PCIe Gen4 PHY
 initialisation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-x1e80100-phy-qmp-pcie-fix-config-v2-1-cdc0f22b4169@linaro.org>
X-B4-Tracking: v=1; b=H4sIABdmq2YC/4WNyw6CMBBFf4XM2jFt5enK/zAsoExhEm1rawiE8
 O9WEtcuz73JORtECkwRrtkGgWaO7GwCdcpAT50dCXlIDEqoXFSqwEVSLaQQ6KcVX0+PXjOh4QW
 1s4ZH7Jp+0FVhhsYQJI0PlN4jcW8TTxzfLqxHcZbf9Scv/8tniRL7omyMuGih8/r2YNsFd3Zhh
 Hbf9w8JpvNs0QAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5404; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=M1MwZJsJg3ocK9dUEdbDtelKoL+7vXnSEEpnHzOOIQY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmq2Ye9jFsZ3tjGrw8npeIEgnf1Ad+JayNxEaGK
 oSMRXe8zYWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZqtmHgAKCRAbX0TJAJUV
 VgTwD/96r7eMEQFuD+IK1grYgAmlFFADBvbOTYVOmMnvo07NAhtdrh0jnNIFB7hVvzcnMVAHoCe
 /I2nyiKYTlbmb35nbUO0z/hY4QEpRM7DxfQiKjfFi1X+wUtcw5/m/ln7OM/jtKVypYWLxHpHmXe
 Cy2A1WIRY6uXZft8mvurbwetoIujzXGtJN9d+iGQ+MD3yLpG9/vW3iFu1yQP/GodbuMkd69DH7X
 EiwyJDcUXzSRyrqgKvOwUqdJSbGYVff2nTEG6s25Uyt/knLrM1arWFbSNNP0b4j0TRlx7d3vgBb
 hW7BtZYIZ36YfKpAC/xBxiRV0irR/v4rELWN0aY+1NX6WD6KfKEv88pC+yd5nIOhXzmTtZxnf9L
 44215ryw+Cn/S6vj1tFftz4Mbxx7g3mF5M/04oyAthp/H5Z67xFsaFJ5/7sfUuc4yZVU5PZj8Pj
 EaVnjpzO0amLo8xepBF435JSaN1+WKQCRSA9LW1rbGOdYOJdAiGHA+ynS62ZdJo5f5PQ461oZwm
 dOKXLdIL208s+8d111vJZe/HpK9XPIwSmGONTrgBNSnwp9c8G85EX5rlxynz8NoEVoQnGXMg0Zp
 peIQN06YqB+iBfb8Zny7gvfZnnQeB2sjx9nEQlW9YWBbLTvZKWPRiz4hj5iUM9m+W8l5E7n18oj
 JEHM1LoX9RAmcBg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Update the PCIe Gen4 PHY init sequence with the latest based on internal
Qualcomm documentation.

Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Changed subject line as requested by Vinod (on a ML, different patch).
- Changed to lower case hex all new values.
- Link to v1: https://lore.kernel.org/r/20240726-x1e80100-phy-qmp-pcie-fix-config-v1-1-b569f03c0c48@linaro.org
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5b36cc7ac78b..06cd9787e700 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1245,8 +1245,8 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_serdes_tbl[] = {
 static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RXCLK_DIV2_CTRL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_DFE_DAC_ENABLE1, 0x88),
-	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_TX_ADAPT_POST_THRESH1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_TX_ADAPT_POST_THRESH2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_TX_ADAPT_POST_THRESH1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_TX_ADAPT_POST_THRESH2, 0x0d),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B0, 0xd4),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B1, 0x12),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_MODE_RATE_0_1_B2, 0xdb),
@@ -1263,6 +1263,7 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH4_RATE3, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH5_RATE3, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_MARG_COARSE_THRESH6_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_SUMMER_CAL_SPD_MODE, 0x5b),
 };
 
 static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_tx_tbl[] = {
@@ -1286,12 +1287,15 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_1, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_2, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_3, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0b),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0a, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0b, 2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_20_VGA_CAL_CNTRL1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_GM_CAL, 0x0d),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_SIGDET_ENABLES, 0x1c),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_PHPRE_CTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x3a, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38, 2),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x39),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_MODE_RATE2_B0, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_MODE_RATE2_B1, 0xb3),
@@ -1307,6 +1311,7 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_MODE_RATE3_B4, 0x4b),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_MODE_RATE3_B5, 0x76),
 	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_MODE_RATE3_B6, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_TX_ADPT_CTRL, 0x10),
 };
 
 static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_pcs_tbl[] = {
@@ -1314,6 +1319,8 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_20_PCS_RX_SIGDET_LVL, 0xcc),
 	QMP_PHY_INIT_CFG(QPHY_V6_20_PCS_EQ_CONFIG4, 0x00),
 	QMP_PHY_INIT_CFG(QPHY_V6_20_PCS_EQ_CONFIG5, 0x22),
+	QMP_PHY_INIT_CFG(QPHY_V6_20_PCS_TX_RX_CONFIG1, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V6_20_PCS_TX_RX_CONFIG2, 0x02),
 };
 
 static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
@@ -1324,11 +1331,13 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G4_PRE_GAIN, 0x2e),
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_RX_MARGINING_CONFIG1, 0x03),
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_RX_MARGINING_CONFIG3, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G3_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G4_RXEQEVAL_TIME, 0x27),
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_TX_RX_CONFIG, 0xc0),
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_POWER_STATE_CONFIG2, 0x1d),
-	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_RX_MARGINING_CONFIG5, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G3_FOM_EQ_CONFIG5, 0xf2),
-	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G4_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_RX_MARGINING_CONFIG5, 0x18),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G3_FOM_EQ_CONFIG5, 0x7a),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_20_PCS_G4_FOM_EQ_CONFIG5, 0x8a),
 };
 
 static const struct qmp_phy_init_tbl sm8250_qmp_pcie_serdes_tbl[] = {

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240725-x1e80100-phy-qmp-pcie-fix-config-a9bdc75fd9fe

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


