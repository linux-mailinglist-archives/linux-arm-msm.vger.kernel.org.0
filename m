Return-Path: <linux-arm-msm+bounces-35120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E049A4F62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20FA1283CD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79F31917C7;
	Sat, 19 Oct 2024 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMAvKJPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BF18D625
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352708; cv=none; b=s6bXEJu/V6GGP6lT0Iw3yPflo1fytERaGdxgCnU3GwBeZ/9nugHFAOqtf2Za+JVMgn6wtzLtvlGyXGKDwwjFlVxaY/0OWawxH1rNdGm6Jv3hIxyu2LglsfGi4Hi+V3xEU+bCpboQwrvUGziz0OZc8xI7809Lz0HS9GJuA+0Wpvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352708; c=relaxed/simple;
	bh=UXDmPJ/23z2ls62ryM86x4tjZRAeCfpbFyCc69y6OPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIEWuBSxPIaVSqEdOtz36zPpcQEX3Gb0gr2boQgfFARzbyxHgET0DRIA8dzoFerERgxGV8U1PCV+VH6t1Jxht7tOYZO6ErO6Qp7U5BxVJ87OSrRvpFuZHq858xkvyV7o21FFUHvAASNXkDVLJucC8w77fs+XAUgLEUwshhBrzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMAvKJPX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so3409887e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729352704; x=1729957504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdncSAoP0KhDyf2xplN8lueVHyRZUHitLAgflAowdNI=;
        b=HMAvKJPXnjOqzw2fYEJ5MYqJxA/ZNTp2QmV4aNXRaK0GBiIjNFz3yISzQaIaXNFSds
         k0Vyw26YMg9cOeJVhBORMm+/Oto8hjD2mwiIeTSAFvuFjKf6C+joC+J1KvdHNCRyKrCk
         tP/g6hJUXUZgQ8iDjRAzKYES0v1kcjfgYb5JdbZM7dAhQC4o5IINku71OTy5YCdjCBm1
         H2YtNVnpIqZA6UniSHctRBcfLy3i+5kRvI/inKwPZm553HM5i1BxNRk/EYM/7UWliYkt
         meyh95KVLJQzZG9SOhneDkZ64xZApxd8TReurW8+U3XJayyTHR/Bu3qeTmd5MUhhYn+F
         uMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729352704; x=1729957504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdncSAoP0KhDyf2xplN8lueVHyRZUHitLAgflAowdNI=;
        b=guHqofsADgbS52xnSpQgjwRsyy93twBdDvcSg3+oYUp5jsFOy7ovAK1/k9cmYZEhoB
         hu1TGxQLa1mdHf6Tmyfhjr3jq16+SSlH9QNNpKwPUjoj9co6Qr4k2eyxIwDhMfaTtX4g
         HPVrPaFPDS8QWRUejV4XWee9jUbVUBhp4CtyIIuiPRU2K7CVvNNES/SqFqPhjuQvxoOy
         /2/d0XwqqNLwr9hNtwrfRVW04wrZFQak7N7GPlkzD61GJaSDPCcv0l1ROtXJVVK+AbaI
         W/kylhN+I99DW734UAT67JTIR/E125IVRv/C3b/nE0mPX+CNn2vxlYwMQzxHP9ObAEUv
         xxlA==
X-Gm-Message-State: AOJu0Yxr0ii3LP3xQbvpEy+F8ZmV80TB886Zeo9dqIjOjAvfNHp88wt2
	aoUlgoD7N2eqqerPa0P+RI95IKnth92kLyZLzxLxI9fzvB7q9mNxaUQVAHMr6qcdrLMalFPTY76
	zxr8=
X-Google-Smtp-Source: AGHT+IFDuzM/ITc9x3ovHNfzWJuYKY8GTb8AGalLQx5ZBp9XUv98xwhqTD/8UUandbEIa8oszVrgKQ==
X-Received: by 2002:a05:6512:3ca4:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-53a154b2c8amr3526130e87.42.1729352704272;
        Sat, 19 Oct 2024 08:45:04 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211401sm562854e87.249.2024.10.19.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 08:45:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 18:44:53 +0300
Subject: [PATCH 4/6] phy: qualcomm: qmp-pcie: split PCS_LANE1 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-phys-v1-4-bf06fcea2421@linaro.org>
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
In-Reply-To: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7955;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UXDmPJ/23z2ls62ryM86x4tjZRAeCfpbFyCc69y6OPU=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE9P1qY1h1AOxKKBEm0O74ADM+dBq1qmX6rzRp
 np5nfdjlS2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPT9QAKCRAU23LtvoBl
 uNe7D/49mcsIppX3ofS6BCffYDKaPjm6GlPF+t3IzWGGSpsEugPUAkdRUySh7kOLSH/viWaCBuR
 wiiKg0EQc18fgXHj+ZiMQlBHq67wRvjbPiTK/KRdLJPjSmyRzdaO4D1+GThr8UcBDcmeB3e91hG
 MLLZ0EZ1+AJebvijywzvNYHBPbZ47qwa0ehVrvmBf+mRkOfzBQYa8ZsoViA/QLZoowy4g8W1RP1
 gTcpuxfcgyFLLVRRuGu53e52InObpAdipHxPdQ+n1CxhOgv5nPksMGms2gT31lLyEUHQqi3tK+w
 4GO2ZlGzagpdaMItnZsCm1kiaA+z+v3r83C4fV/XqSuj6NqKDOVBjpY7qUlTxepxQO/difIMv01
 0sbUKK1K1jAyPXT1t7QqWhxfS+MXy/ZTyGB4laRpEBMIwVOLtXV/FX0r+2l3uUN3/04z0FJmei8
 MztM1dSJVf5W1JAAeAHO3Zanvz5oMTU4AoPjtyrONucPz5XiO8FCOpqx3aeMvVwgJynBR6q+lTU
 +bGP3HZKPEbcgQPj70KtojbymF0KvqKjzhIUA5h+sE9hmi4E++OwiLs0sYm0CnpwU2GF6W7DuKW
 1l+JVbuTDIrFD9CqH1KWBxhyMRcfD7r2iFg25gYFaEcfxLrakuAfnqXUrCB0ctx8j4KhzNcONbu
 +ONEftQvj1Gklsw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PCS_LANE1 region isn't a part of the PCS_PCIE region. It was handled
this way as it simplified handled of devices with the old bindings.
Nowadays it can be handled as is, without hacks.

Split the PCS_LANE1 region from the PCS_PCIE / PCS_MISC region space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 32 ++++++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h |  5 ++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  5 ++--
 3 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 873f2f9844c66d7bd0b3bb3ab4bbd8be9a37cebd..1ca1f21b1cc225f435da9c775c97dfa142117f95 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1773,7 +1773,7 @@ static const struct qmp_phy_init_tbl sdx55_qmp_pcie_rc_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_20_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
 };
 
-static const struct qmp_phy_init_tbl sdx55_qmp_pcie_ep_pcs_misc_tbl[] = {
+static const struct qmp_phy_init_tbl sdx55_qmp_pcie_ep_pcs_lane1_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2, 0x00),
 	QMP_PHY_INIT_CFG(QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
 };
@@ -1907,6 +1907,9 @@ static const struct qmp_phy_init_tbl sdx65_qmp_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG2, 0x0d),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5, 0x02),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
+};
+
+static const struct qmp_phy_init_tbl sdx65_qmp_pcie_pcs_lane1_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2, 0x00),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
 };
@@ -2582,8 +2585,6 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl[] = {
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG4, 0x16),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG5, 0x22),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_G3S2_PRE_GAIN, 0x2e),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_RX_SIGDET_LVL, 0x66),
 };
@@ -2728,6 +2729,7 @@ struct qmp_pcie_offsets {
 	u16 serdes;
 	u16 pcs;
 	u16 pcs_misc;
+	u16 pcs_lane1;
 	u16 tx;
 	u16 rx;
 	u16 tx2;
@@ -2752,6 +2754,8 @@ struct qmp_phy_cfg_tbls {
 	int pcs_num;
 	const struct qmp_phy_init_tbl *pcs_misc;
 	int pcs_misc_num;
+	const struct qmp_phy_init_tbl *pcs_lane1;
+	int pcs_lane1_num;
 	const struct qmp_phy_init_tbl *ln_shrd;
 	int ln_shrd_num;
 };
@@ -2811,6 +2815,7 @@ struct qmp_pcie {
 	void __iomem *serdes;
 	void __iomem *pcs;
 	void __iomem *pcs_misc;
+	void __iomem *pcs_lane1;
 	void __iomem *tx;
 	void __iomem *rx;
 	void __iomem *tx2;
@@ -2927,6 +2932,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v4_20 = {
 	.serdes		= 0x1000,
 	.pcs		= 0x1200,
 	.pcs_misc	= 0x1600,
+	.pcs_lane1	= 0x1e00,
 	.tx		= 0x0000,
 	.rx		= 0x0200,
 	.tx2		= 0x0800,
@@ -2957,6 +2963,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
 	.serdes		= 0x1000,
 	.pcs		= 0x1200,
 	.pcs_misc	= 0x1400,
+	.pcs_lane1	= 0x1e00,
 	.tx		= 0x0000,
 	.rx		= 0x0200,
 	.tx2		= 0x0800,
@@ -3440,8 +3447,8 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
 		.serdes		= sdx55_qmp_pcie_ep_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_serdes_tbl),
-		.pcs_misc	= sdx55_qmp_pcie_ep_pcs_misc_tbl,
-		.pcs_misc_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_pcs_misc_tbl),
+		.pcs_lane1	= sdx55_qmp_pcie_ep_pcs_lane1_tbl,
+		.pcs_lane1_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_pcs_lane1_tbl),
 	},
 
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -3540,6 +3547,8 @@ static const struct qmp_phy_cfg sdx65_qmp_pciephy_cfg = {
 			.pcs_num        = ARRAY_SIZE(sdx65_qmp_pcie_pcs_tbl),
 			.pcs_misc       = sdx65_qmp_pcie_pcs_misc_tbl,
 			.pcs_misc_num   = ARRAY_SIZE(sdx65_qmp_pcie_pcs_misc_tbl),
+			.pcs_lane1       = sdx65_qmp_pcie_pcs_lane1_tbl,
+			.pcs_lane1_num   = ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
 		},
 	.reset_list             = sdm845_pciephy_reset_l,
 	.num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
@@ -3739,6 +3748,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
 		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
+		.pcs_lane1	= sdx65_qmp_pcie_pcs_lane1_tbl,
+		.pcs_lane1_num	= ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
 	},
 
 	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
@@ -3945,6 +3956,7 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	void __iomem *rx2 = qmp->rx2;
 	void __iomem *pcs = qmp->pcs;
 	void __iomem *pcs_misc = qmp->pcs_misc;
+	void __iomem *pcs_lane1 = qmp->pcs_lane1;
 	void __iomem *ln_shrd = qmp->ln_shrd;
 
 	if (!tbls)
@@ -3969,6 +3981,7 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 
 	qmp_configure(qmp->dev, pcs, tbls->pcs, tbls->pcs_num);
 	qmp_configure(qmp->dev, pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
+	qmp_configure(qmp->dev, pcs_lane1, tbls->pcs_lane1, tbls->pcs_lane1_num);
 
 	if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
 		qmp_configure(qmp->dev, serdes, cfg->serdes_4ln_tbl,
@@ -4420,6 +4433,14 @@ static int qmp_pcie_parse_dt_legacy(struct qmp_pcie *qmp, struct device_node *np
 		}
 	}
 
+	/*
+	 * For all platforms where legacy bindings existed, PCS_LANE1 was
+	 * mapped as a part of the PCS_MISC region.
+	 */
+	if (!IS_ERR(qmp->pcs_misc) && cfg->offsets->pcs_lane1 != 0)
+		qmp->pcs_lane1 = qmp->pcs_misc +
+			(cfg->offsets->pcs_lane1 - cfg->offsets->pcs_misc);
+
 	clk = devm_get_clk_from_child(dev, np, NULL);
 	if (IS_ERR(clk)) {
 		return dev_err_probe(dev, PTR_ERR(clk),
@@ -4487,6 +4508,7 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 	qmp->serdes = base + offs->serdes;
 	qmp->pcs = base + offs->pcs;
 	qmp->pcs_misc = base + offs->pcs_misc;
+	qmp->pcs_lane1 = base + offs->pcs_lane1;
 	qmp->tx = base + offs->tx;
 	qmp->rx = base + offs->rx;
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
index ac872a9eff9a8fe7fc3307759288aee15d17bd24..ab892d1067c219e8db0ba0591921b38a9cebebe7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
@@ -13,7 +13,8 @@
 #define QPHY_V4_20_PCS_PCIE_G4_RXEQEVAL_TIME		0x0f4
 #define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG2		0x0fc
 #define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
-#define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x824
-#define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x828
+
+#define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x024
+#define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x028
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
index cdf8c04ea078a985be82d561ad0918dfdece9987..283d63c8159338b57a5026b6c2a86e3cce21097c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
@@ -17,7 +17,8 @@
 #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
 #define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
 #define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
-#define QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2		0xa24
-#define QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2		0xa28
+
+#define QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2		0x024
+#define QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2		0x028
 
 #endif

-- 
2.39.5


