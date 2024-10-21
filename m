Return-Path: <linux-arm-msm+bounces-35214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179D9A638C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D251C21CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75431E32D7;
	Mon, 21 Oct 2024 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZnOhwQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598FC1EABC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506801; cv=none; b=X6OliXuX8sBaj2AftbSxCwUrx3+NcLuVubYIgsBfimu880d/X57wZZXN0Iq+dpCQWN5mZFFGCwq2kRP28jb2WkbQ/TEuOhJXBtA7+kEi2Oi4yHLhx2V8SPkJEz/v1shoRwSmmnlIwfYaeHuJ3UBHRxC6O5u69F0RY1tEAwams8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506801; c=relaxed/simple;
	bh=iUKFYBSvSzKsZfrgB2NkQjit+ZwSHQDRfNk1DSkQ9YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t//FQEl0SkXmkew6b647RHbEFflGw2nN6WPGHusrlqtoUThaFs3Y8OAKBAOGbQE0tOI971mLaXi8JxvUTFq2BKBiZ/BKGIwHbUIHplMT6VC2nZYKWUvC9TxBf5eAyXcFziLAWeXNLeQ4F5DnMSeufOnZ5DkwbMmeGNA3MFAL7ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZnOhwQN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a097aa3daso3983680e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506797; x=1730111597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cIwzL0K2kIq75CpSDdHiy1Pc4SlB91WF+5ajJYiJIs=;
        b=kZnOhwQN4OCdsQo3QMg4hHq01RZSbadFeFZsuYyx4jyGVBVjQ7DluN08r1goQlPKSz
         YsjJfFS5gGL910pycbbNhR7Xqw+5iTBowbugI+qtPGdvbIvwBfu4KBy6ixdgW3NduZuQ
         cDNYKQnu34xVMau9NG5z4CasjOjnPiZZCWFz2xmVnQxOAlRhHX7H+CA8BHRbTKoVuKmW
         1FvEoRUI57xs3RAraUdbRPAV6nusyN75XDXdy2OaNt7e8kjHQ8dnDgOh4zLzys6xvFRR
         OKOHou/cRJDaSqoMuuKjrONGM2wZqM70iActuF18BAX4FHbP26n3eYZSeN2Xy/NrnvuP
         hgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506797; x=1730111597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cIwzL0K2kIq75CpSDdHiy1Pc4SlB91WF+5ajJYiJIs=;
        b=xTeIlznGPCyXdytaB3HJ5YNGkeAI0hBychVDKuz/H7beUEWzdrzyjgb3DsgOyP2cFP
         tIHc+l6CispItEgeCajY7ylnVF5R3RybCEkKCzb28ybEQywdOR02ygdiXTtH01nrHTQO
         CAM1wNl93pdb8przaCWHBFZoU/TKqvKKcC5oWse9v+wAyCSp9kj5Ss+7PrQJkZytnK95
         6tO2FLc3Mz6JXDpcyHt0ups+x4YO0pVYFuV++cAPN/C5HZVQIsHh76kOG5FyFWDF66CD
         L4HgnJY43JGpYJUK9I2ThVBKFCzY7vJcAzglLWe8gsTyK2FBs4ysHiMfj3D6McKCO/vY
         Gv9A==
X-Forwarded-Encrypted: i=1; AJvYcCVAZzEtfx8COdxCpqKKs1/P7r70H9Syqg8ZaYAW1MjN4AkPXBld06ueeQWhzojcKa232HrHNFqGqqWfmzS1@vger.kernel.org
X-Gm-Message-State: AOJu0YzzTGMOQqJ7r+xkKeRSEqXo9eTquYWNVSQhug+rl+lLTOI3PhJr
	MQ1JiZ9j9pt14dwt2rzMoagZFm3oTNZtqa6qrfJ7Makd2cS92qA0TVwOZuNx2C10Df3+p/pIz12
	JuKY=
X-Google-Smtp-Source: AGHT+IGkLVwGKVNLsrU47vdHVci1UjDACSX4iBuSjnSGYZr5h4Rm5ZuOKUr2K1varUs7ScdscwBAxw==
X-Received: by 2002:a05:6512:1116:b0:539:9155:e8b8 with SMTP id 2adb3069b0e04-53a1520be63mr6123647e87.6.1729506796826;
        Mon, 21 Oct 2024 03:33:16 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22420015sm454132e87.123.2024.10.21.03.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:33:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:33:09 +0300
Subject: [PATCH v2 3/6] phy: qualcomm: qmp-combo: add support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-phys-v2-3-d883acf170f7@linaro.org>
References: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
In-Reply-To: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6677;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iUKFYBSvSzKsZfrgB2NkQjit+ZwSHQDRfNk1DSkQ9YQ=;
 b=owEBbAKT/ZANAwAKARTbcu2+gGW4AcsmYgBnFi3lJZKYCmm5MrtieRTz0Gy7uPekuKxmFUdAP
 IVmT4HKg6qJAjIEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYt5QAKCRAU23LtvoBl
 uEeQD/iUbOaPMhGaBCCLhM6Ds8gmL4/RpbBo6AW9fMt5OWST1sJqTtXyxnGtUiD0tl5NXFT0RJ9
 hpeAocn79AhU1g/ZbqdJ4mYIgWVE1ythYPC/PXHkcq3pWCGbLCvgJb0kclvSjvn9nS1zzyI7lIj
 +fBY9qmXDsjwfRzJpshXAVUwKqST0cZAHRwYCXYJ/nSsiE7LL81KhKC9Jhr3AchRSo4TdYogg4Z
 zp5sE0a9g36scsVEC72Po6UgqHkpG3d5YNNzavp8Vg0Z2tmA+/KcO9w/7wBJVe7ZgnIUsXbGuqg
 K1fjXIyVpm94yww0bOq+FSdgIq7L9+Kmem/lKbipSch33A8s+tYMqz+ut5YZwTD5cvwdxrpoCHQ
 ZFiwakF52cUhcN7DID/tQ+tgQXPysz9rwzsne+cop7DCnvmPExJxCX7PNcOMPB/MmgKj5CHlr7c
 OCk6Yb4UJZml6BwZe6jTQpWpKdC1kzDfYvl+WLqZ9OMKC1HQ0wRoiMBOXh68rm+0dSqo2eGgYGB
 HQiTHXlB40TaMNGxnoM4MpPe+1MWRboEvFH8byynmwhZ2aoOkV23DNDKqaLgMo2oHa5WicH3TjC
 jmpYJSe/0ZFlaaaF1B+wDftbATkpMm+LVJUNzMq5ZymXOdBmDQOI5Zs3fkPBLxvd1vBaym87SQR
 kvH2ANVZi3aJo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the USB+DP combo QMP PHY driver to support the SAR2130P platform.
It mosly follows the SM8550 QMP PHY, but the QSERDES programming
differs, most likely because of the parent clock rate differences.

NOTE: The DP part wasn't yet tested, but it is not possible to support
just the USB part of the PHY. DP part might require additional fixes
later.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 100 ++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 643045c9024eaa5de81f64ecfd10ff8845faf120..05ec1a0226460d23873db1dfe9dcbc6ce1953b2e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -400,6 +400,57 @@ static const struct qmp_phy_init_tbl qmp_v3_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
 };
 
+static const struct qmp_phy_init_tbl sar2130p_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x2e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
+};
+
 static const struct qmp_phy_init_tbl sm6350_usb3_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
@@ -1730,6 +1781,51 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
+	.serdes_tbl		= sar2130p_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sar2130p_usb3_serdes_tbl),
+	.tx_tbl			= sm8550_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8550_usb3_tx_tbl),
+	.rx_tbl			= sm8550_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8550_usb3_rx_tbl),
+	.pcs_tbl		= sm8550_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8550_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
+
+	.regs			= qmp_v6_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -3767,6 +3863,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qmp_combo_of_match_table[] = {
+	{
+		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
+		.data = &sar2130p_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		.data = &sc7180_usb3dpphy_cfg,

-- 
2.39.5


