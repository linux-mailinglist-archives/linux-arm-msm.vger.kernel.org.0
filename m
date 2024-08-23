Return-Path: <linux-arm-msm+bounces-29329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31195C60C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32ED11C21D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 07:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1DD137932;
	Fri, 23 Aug 2024 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+ncnovi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A113AA3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 07:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396673; cv=none; b=OBFG2QiqLD6oGcgOQGrM2d5ypqMSOJSXkebQHJhu1jCOnLxzeCE06Yc9+iUa/vOj2TqrfmYAjHmJIXj2dk1Kn0LKG4Yaqu9bMGVTQtHvCy9AeF85vF0E2BfyVRecdrxDbEwW+hKGhazJ32s04HPLT9d4qzA429+PM8Ml6QlXMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396673; c=relaxed/simple;
	bh=b5lp9G5kmgGElPkC1EMZU1PTPbFZTnN0DYN7a06Uff8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dp9+JIPr2jCyFD2LyDUA/u1TOgak7PQ0SoQNjY4qjQE0fjAatA1MB3py6Z9EJ8DoQY+b3Y+xm20s/0XlZC6cjdQbMm2/vNx7sd+VpYI44hig3R0S7SCd6xHnbNSJTNz/106cWiz2yO3ZjB79j45XurAFyyAPbzTkwwx13jd9XnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+ncnovi; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so1979895a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 00:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724396669; x=1725001469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9EVzof5rnrF7mBTDm9cmpbs8lruT3c0ahwVf6GsTNQ=;
        b=V+ncnoviX4lLCl15ftJ84isJc3HzghtM6+b4ULjdfuplmHoyHzABJ0e9BSHkc5xfyq
         lbMrWsdrWdLim1k7+/zRabor+o5XWhTRpZp01hrPcTEi6j3w7W3fF8L7orscjqJtKxqE
         Rslmdc0zLCU+O1aSWW1S3P3hyVTRmis5515Cces9RNOcuUcvy/LbYg8Bm+87K42M0HQk
         +V+yFtHPndxdUz8ak4XEzFLbN7zUlVmP60LgSIJMfGaaUUbV2fs/Jv0hzlNMdeRcKwaX
         UHE4wicoXKh9dkG9NxCmZxf1BbMoE7mheBhnXenWX8ZVKO5M6U43dDa36eWe+TG89YIV
         gdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396669; x=1725001469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9EVzof5rnrF7mBTDm9cmpbs8lruT3c0ahwVf6GsTNQ=;
        b=GfarA+JPhxvbb4QVfj01IV2xo5cnL53g/t7iq4YPo0ZY+Hl+zYVTrR253qut7W3smz
         V/G8l86q/J7zXFFgeGjApAA7A01gZqOfDAYV2EVhIXxXrZa7Bj/91K+ZsxwkgCx9aVoK
         x8EH+ifjR2SoGxvgvYdtnM8CBVwKHIsNegvnGzqZLCBFPViraY3HneCv6wr6qXZI5tMY
         XElJqgzVCegMErK7x2XYAb1Kz58keZbX2AvEWIzU1nJ42F3kEMRnVSy14DO0u8UJFeRw
         ryIQicxBRbe1I24+gMUm+sv7dLngGhFTMdFLHu1ZTg5MMejVJWUF8bI/0kvg38/iBoVR
         Jnow==
X-Forwarded-Encrypted: i=1; AJvYcCUPPYdqmG+waqSjl/UZJy+8A9UChhTVu5fA2Ry1SdyDqMFJeqbRELp1Qck+H+EU8dEfgbOBVBhANTWcbcCE@vger.kernel.org
X-Gm-Message-State: AOJu0YzbpYBT6EnDCzBB7h0OreFJaQrwUyFEohUcmETxFfHVNT1DG5BC
	wragrbq+r+Z7k1zJNv+iISFoLtKWRNT1B19ov9oRwUGbxeU5zKDvVn7FpspvXtA=
X-Google-Smtp-Source: AGHT+IHjg4XmnO2sOWE82GNncjVHJpDpCtPri9+DoItYKOfnkhp4FmhI1YIfIFnKycH3bCttR0tviA==
X-Received: by 2002:a17:907:9604:b0:a7a:b561:3564 with SMTP id a640c23a62f3a-a86a54be101mr86976466b.61.1724396668635;
        Fri, 23 Aug 2024 00:04:28 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f48ae0dsm214820766b.184.2024.08.23.00.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:04:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 23 Aug 2024 10:04:16 +0300
Subject: [PATCH v3 2/2] phy: qcom: qmp-pcie: Add Gen4 4-lanes mode for
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-x1e80100-phy-add-gen4x4-v3-2-b7765631ca01@linaro.org>
References: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
In-Reply-To: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=b5lp9G5kmgGElPkC1EMZU1PTPbFZTnN0DYN7a06Uff8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmyDR3wFDJ2SAY4MkWDE3DejDh7JtRUTNDkC8+C
 cysi5JuaJKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZsg0dwAKCRAbX0TJAJUV
 VtAKD/9ALd2gF6a+o75iynnVAYMk+/sCqHJj/Lm/vd8KJA6Rv50EAV+Ucc+pnncbyxUR2jyLsdz
 NIzmWgJgNpSHR7tY52Rz/BvSlX5ES1ZhWpwny8x+4QbJ0MQ0hKk00/i7Mw0iVQ2wFiVE3hxCPWu
 cwMBKR5urOs8/pgRikupMduEMxkJigCvZZFCCb11l/2Tr5Iq3qVyaMEJU2npG+fpFF7DBmrAHUK
 ArD3BYWWRYb3OZ7UJzV4wpsST7X/fGnjoySuYsEEnStg2/QP+8FzfAK2pR0kTADK/Vz8meVozkn
 l5dzJU7iLkPSgaNA+7gGRWv+vS06pxP+9lrxzcurBxzlTstlIsF4Qcb3Eq3S4YwOCpr3djX0PqT
 wO/egk4w3OWaM2z8EoKOijbQWFoILcGcANtcxDy/v+Tcfx69q/p1tmKe4lClxOSsRLDu81f1m1P
 StCrHmNtoLVssS+j+0W0cB8Q6sW784OzxfNMr71WPxhMBiogEKDAi5V8dLTRvlUZLIkHJFxFYaf
 BKSIUBWUW5bNJ14lTnKdHt4Qsxx+cubXamOhQ0PMSnN+alZcwkQswIVh57jfMsLF7kSi558rqwQ
 xbPwFyb1e+wq5CV44sH1BV2LZeZgW9crVdXes2uR2ardI3gWp76L1NeZHoGRZMl+NQ0kumOF4n5
 Is4Fv3x0l51MqJg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The sixth PCIe controller on X1E80100 can be used in either
4-lanes mode or 2-lanes mode. Add the configuration and compatible
for the 4-lane mode.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index a7e2ce0c500d..f71787fb4d7e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1242,6 +1242,10 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_VCO_DC_LEVEL_CTRL, 0x0f),
 };
 
+static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x4_pcie_serdes_4ln_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN, 0x1c),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RXCLK_DIV2_CTRL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_DFE_DAC_ENABLE1, 0x88),
@@ -3654,6 +3658,41 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 		.ln_shrd		= x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl,
 		.ln_shrd_num		= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl),
 	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= sm8550_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
+	.regs			= pciephy_v6_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+	.has_nocsr_reset	= true,
+};
+
+static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
+	.lanes = 4,
+
+	.offsets		= &qmp_pcie_offsets_v6_20,
+
+	.tbls = {
+		.serdes			= x1e80100_qmp_gen4x2_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_serdes_tbl),
+		.tx			= x1e80100_qmp_gen4x2_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_tx_tbl),
+		.rx			= x1e80100_qmp_gen4x2_pcie_rx_tbl,
+		.rx_num			= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_rx_tbl),
+		.pcs			= x1e80100_qmp_gen4x2_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_pcs_tbl),
+		.pcs_misc		= x1e80100_qmp_gen4x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_pcs_misc_tbl),
+		.ln_shrd		= x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl,
+		.ln_shrd_num		= ARRAY_SIZE(x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl),
+	},
+
+	.serdes_4ln_tbl		= x1e80100_qmp_gen4x4_pcie_serdes_4ln_tbl,
+	.serdes_4ln_num		= ARRAY_SIZE(x1e80100_qmp_gen4x4_pcie_serdes_4ln_tbl),
+
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= sm8550_qmp_phy_vreg_l,
@@ -4436,6 +4475,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy",
 		.data = &x1e80100_qmp_gen4x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy",
+		.data = &x1e80100_qmp_gen4x4_pciephy_cfg,
 	},
 	{ },
 };

-- 
2.34.1


