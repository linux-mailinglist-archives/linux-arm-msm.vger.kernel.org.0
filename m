Return-Path: <linux-arm-msm+bounces-87807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B0CCFC855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C916730AE2F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2817427B35B;
	Wed,  7 Jan 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cuK5J/65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465BA2773E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773184; cv=none; b=phyIAhMeymi5rl9aV2AtrE3C71DDdWrozqv38kFnyHHRo0wnSFqNDyv1v1fxIBD8IW9oToDTzSz9ll0AaGjDjiNmtHaRmCYN+r//8q+Ql3nvKpMgtTzEoqYa1v4e0xJ6J2BcrdLwZziZY0TLYPDL0LQQ8wKPYUaY3KNIzSx1Gd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773184; c=relaxed/simple;
	bh=bHh04W/0vELAuCHcjtX3ifGUTw+2i261MFTX84iycNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bG61ihLctqQD9RUDQFCtRd8mJYlGi9ic5wYqoSmN1xC8aemYuXEmbQsnNAawxcQPJZzFHCVrNAe7ZusRdw2p6gpbIJf7xxLSyfpRgM0tt1HjbdglPw3K1RnBm67/YU/9zUzncYFrA1n69+s33T0wH8p5vUiHUcqB/CoSbRQvxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cuK5J/65; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso2622186a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773177; x=1768377977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJ5EWUUmLzRb+utl6t1NKCUS1M8QU0YnYVmCjHIU+Nw=;
        b=cuK5J/65sCX++2ifundsyZvsYwqjuX7cbdB3X30ziOXAeo8OHBIfzpv94aVewmZqg8
         2tyRd5fxIdlwWZSyPbSf/1/7vwLYcOrUtLLAAYJVWeUyE0CwBDTVLYNrq9QP/RSVcJM3
         V6P0LDWDZ5QqiYhMYTt8LeR7oDaDvmVvIkHU9iZalrkhIP7GT2wkC1rx2u+oBAfnLwJb
         NMDlSiMGw11CbeezCj52AfkM97At14nf7euS2wdKOjnEPWh57i8hyOFNABT9WXMX23Rk
         TlbpCQVFjYVPPCTeOErlI9ILe0QKFGcLykYG5NFPrnf6p7O21T60zJmonBpIoOuVFr0K
         UrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773177; x=1768377977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJ5EWUUmLzRb+utl6t1NKCUS1M8QU0YnYVmCjHIU+Nw=;
        b=Zq2KCvVQF8V7cOHPk1fmjREETdMfcQAUfbWJg+rI0u9mk06KXovG3VbeQ4MgcI7OP4
         20NW9RRTro5hReEDevN4ZHY8jjzTcFgxtp7h4Pu4V6e/okTV0J8k8KI/83AFdrMsm5fG
         pteED6sOKJFvsm6aRRT2GaPHsefvTA/VH9w6uljKUR0H07kMhqGIVnCmEWnJnsfMFNSK
         9y3j2zLt3P+1RPF+KxOsSdmaCSAq1AlHIuhGrvitohIKYsBq57M6ncJGEXHiURLeMmOk
         vOuy+11I2aUkUosro3bbrJGDeCXIhGxe+yvLS/pJfkOI8HxpG0heXFIt0U7MWOmS0aEu
         C29g==
X-Forwarded-Encrypted: i=1; AJvYcCUXolqSo/MWw9ExCxjr1uIxh1bqpVIRWnL9bwLgQ+f5XtUbKiDxHXVzkF/MzU1xQr+yDVmRsXXW8Z2Km1Kk@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAuQbxx2d2GxdWuJgLc3URgAYOIdLCvOVPAAFbXk27t/w/OjJ
	sAalqS6JEqw4kUwieYxfaygxbrEzLXz26bwLePK0guZd/GAyzgdrMn3FSCpSCWBGw6A=
X-Gm-Gg: AY/fxX5BbDxAfNHnaiqyTRTUN4UGhCkKDjL9mfIfPltb9s/TLH6Ym8aEbl/i8TCMUcg
	ghL+lJ7at8EwC0CCHxrjpe2PLfI6I3gqewhROyzBGRBiqS/YD1LiEidprN41lfdvceFYSXFq3NM
	TLXj4dfEF3HoMK9mD+O4jlzzJ/6IY1BhX26BhkZzN3J+/EnBV/uqTmAijpX/pTZlapT8YHijQbK
	/elmk/ao/cvDpaolKo0NkdMIHuwUX7Bh3wJYfYwUCqkdYqRY3NDnvpU8b04mihLlo6ui3lV50fW
	O+00PtouJWyyy4JQlxFOgjj28PhkUnOdEV2XdqRMX5bd9kO3WJzsIJA9m0rW2WRHihcBpaupHuW
	zDj8m8IGJAviFmg39T5pcaD9XDW5UCYisL3q52lEFxIa05yWtttrJssLuGikET5S2piHm1P8zVP
	88t5t6+bpeQUkDu5PbsrqQ/J+1CQ==
X-Google-Smtp-Source: AGHT+IHCtl/neZN8RJgQrIftPxJFsI49J2n/CJkcTAVr+l3llGLI2c7o6Za7k6yWduE/t6naRaqX0g==
X-Received: by 2002:a05:6402:2108:b0:650:8c82:ad4c with SMTP id 4fb4d7f45d1cf-65097e46ad7mr1477210a12.20.1767773176991;
        Wed, 07 Jan 2026 00:06:16 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:16 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:54 +0100
Subject: [PATCH 4/6] phy: qcom-qmp-ufs: Add Milos support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
In-Reply-To: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=5906;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bHh04W/0vELAuCHcjtX3ifGUTw+2i261MFTX84iycNY=;
 b=C67TOyQ1kjDTY9+r1vT0OZ4OWnds46xbZtbMaQ9IHVEFvsS85tmYxJ/ngRU3+HrWHKBJeSxG/
 v8IAWwy765UCTfJwjB21tIr5/HDU96e5uqr/ui6WgCT0HCG4RMQDWjX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the init sequence tables and config for the UFS QMP phy found in the
Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 96 +++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 8a280433a42b..df138a5442eb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -84,6 +84,68 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
+static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IETRIM, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x0f),
+};
+
+static const struct qmp_phy_init_tbl milos_ufsphy_tx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_LANE_MODE_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_FR_DCC_CTRL, 0xcc),
+};
+
+static const struct qmp_phy_init_tbl milos_ufsphy_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL, 0x3e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B0, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B1, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B6, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE2_B3, 0x9e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE2_B6, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE3_B3, 0x9e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE3_B4, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE3_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE3_B8, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_PI_CTRL1, 0x94),
+};
+
+static const struct qmp_phy_init_tbl milos_ufsphy_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
+};
+
 static const struct qmp_phy_init_tbl msm8996_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
@@ -1165,6 +1227,11 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 }
 
 /* Regulator bulk data with load values for specific configurations */
+static const struct regulator_bulk_data milos_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 140120 },
+	{ .supply = "vdda-pll", .init_load_uA = 18340 },
+};
+
 static const struct regulator_bulk_data msm8996_ufsphy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 51400 },
 	{ .supply = "vdda-pll", .init_load_uA = 14600 },
@@ -1258,6 +1325,32 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
 	.rx2		= 0x1a00,
 };
 
+static const struct qmp_phy_cfg milos_ufsphy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_ufs_offsets_v6,
+	.max_supported_gear	= UFS_HS_G4,
+
+	.tbls = {
+		.serdes		= milos_ufsphy_serdes,
+		.serdes_num	= ARRAY_SIZE(milos_ufsphy_serdes),
+		.tx		= milos_ufsphy_tx,
+		.tx_num		= ARRAY_SIZE(milos_ufsphy_tx),
+		.rx		= milos_ufsphy_rx,
+		.rx_num		= ARRAY_SIZE(milos_ufsphy_rx),
+		.pcs		= milos_ufsphy_pcs,
+		.pcs_num	= ARRAY_SIZE(milos_ufsphy_pcs),
+	},
+	.tbls_hs_b = {
+		.serdes		= sm8550_ufsphy_hs_b_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8550_ufsphy_hs_b_serdes),
+	},
+
+	.vreg_list		= milos_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(milos_ufsphy_vreg_l),
+	.regs			= ufsphy_v6_regs_layout,
+};
+
 static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
 	.lanes			= 1,
 
@@ -2166,6 +2259,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_ufs_of_match_table[] = {
 	{
+		.compatible = "qcom,milos-qmp-ufs-phy",
+		.data = &milos_ufsphy_cfg,
+	}, {
 		.compatible = "qcom,msm8996-qmp-ufs-phy",
 		.data = &msm8996_ufsphy_cfg,
 	}, {

-- 
2.52.0


