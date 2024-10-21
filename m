Return-Path: <linux-arm-msm+bounces-35216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A23119A6392
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7CC91C21590
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6421F1304;
	Mon, 21 Oct 2024 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fdq9Jugh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649A1EF94E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506803; cv=none; b=rz9AvEQRneXf7QLC48/5uU87OJUPFqPr6E/BeRMhQ13j9hZR+sNZuURr58yNDC7CjCKFKGfKwthbP6mcWSKvt0G65322gd+sO45UpKwiYLSZHgoz9A6dA+qKCO7LHgUUP+p7g+aafnLuUBBYjL4JIcmPsoB0F/HAf+YqEd3skdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506803; c=relaxed/simple;
	bh=UXDmPJ/23z2ls62ryM86x4tjZRAeCfpbFyCc69y6OPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoqfoQnrCA7huGc0omG+JQ6TasSdzMBkQ7uDEbmthyP4YoD9sbjcdpOY7Bt98X1A12hOm0lp2b+qQht1Z897eWpCJsH81TIJcpCOTYdcCTAfa3xpcyhLH6NGSedG1IYSTVHGAdlcL08ER4JOdcrD+1a2333WuO247/dqCRkvMig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fdq9Jugh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e63c8678so5086310e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506797; x=1730111597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdncSAoP0KhDyf2xplN8lueVHyRZUHitLAgflAowdNI=;
        b=Fdq9Jugh5VgOCOLI6z6xDsKlRrzK7F+0gT7tycFqom4fh4oyT9nxs1y7TzVRECsJvL
         3ISdFy2kx13gwACt3RZnMeaw4im1kvQZQQrJCgpLsY4/iXZcp7PtDtsGnsYiv/xEIEUl
         Ipxd5DPWDR74JEHn6L+6uxapu01QxjeVqM0U7sC4TpadTGvacGvbR53sCwbh+W5pRSIa
         TT8a3K9+EL/Ain737h+5ptkxrnQvpZlKWpCJWbq3gwHMbDUqK4Py9E+MvQ01xna3lNwt
         GrlyR5BZoL0YROwGJRWKQPJUYcBfccER/JtOyUaJivVApXxWDEY8FuW9K0F9bNWKAUIr
         m3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506797; x=1730111597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdncSAoP0KhDyf2xplN8lueVHyRZUHitLAgflAowdNI=;
        b=c5MOXMJ75fXvdwKc0u5pM/pScX7kWO+NC9WlLzDrlM+dEnumaudAeoS1rOK8RJss/I
         kPJgwYOa0SMFNBx3zVAYbbhPPo6Wdz23LBvxWFV5En11gRqNtzfz6RUPRDkCgs7oYn5i
         9tYa1yP1MDvgBvOhXItPodkxePcJRn6ylVP2zoGv46VUpQ1M21OWYjT+WobP7Sul244R
         8Kd4Nk8deslIWzRnG/jYN7LVqg6Y1495GhiBDjJfG5b3N3+Vc+GUKno3ZZbKfrZ1JD6e
         YgHxY6YuQxdw9kNL839+J00Nw2ghlydfovIUW0GjvpHP4fQjzoH+17WzI9X1VCyIUP+k
         2OZw==
X-Forwarded-Encrypted: i=1; AJvYcCVKXZZ1B2KStVk9Gxk9x4uGFq8zR/hGLq98h3pubwyczKYztHKn+xDHCbtbd66wOqeV/gPzVLNYJSTLmQwf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3N3vUM9bF95jbQG0bBXVCHSUCSSU5WOv9Hko6EGV2a996tI4
	1d0zRq3WuqWUy3gVQFqS4zadvCcpXw/FopVGEh+z2DXWpIukuJnL9odnkUBoHt2RL3GV1hADDlJ
	BuSs=
X-Google-Smtp-Source: AGHT+IEgTPbomFd3kO9GHICosRN/Yx8eZwp6HYOXT9lgepGaY23MR9/ZMzyGsQpSPnpqzZTAFmKDTQ==
X-Received: by 2002:a05:6512:31c3:b0:539:e1c6:2128 with SMTP id 2adb3069b0e04-53a154f901amr5172688e87.39.1729506797443;
        Mon, 21 Oct 2024 03:33:17 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22420015sm454132e87.123.2024.10.21.03.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:33:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:33:10 +0300
Subject: [PATCH v2 4/6] phy: qualcomm: qmp-pcie: split PCS_LANE1 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-phys-v2-4-d883acf170f7@linaro.org>
References: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
In-Reply-To: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7955;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UXDmPJ/23z2ls62ryM86x4tjZRAeCfpbFyCc69y6OPU=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi3l+CdWZbHkwyIW5A7LUrs3BwjflFZIUiQVh
 eq53nVGLZmJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYt5QAKCRAU23LtvoBl
 uDTbD/4ydF3XTmXHXflRaxXCI6+ciQOzj2RBmrdndl8b3L8uZ1qeh4vTCMPxLZ0LNxqBIL1aU1S
 /c2cGzUiuBCeOYn3sU9FhbZYJxQblb8wXL/qld0mvINo9/CPv/qIrzQTkQNUNzmXKIJVv/Kw6no
 EyId6VriIsduhucUtw0vzmMmdY/LSztwHxCQIw+xALZ/sr6MTA+/qEv+x37BW5XcU2QxdetIiz1
 h6KgiVv/zXg1Ft1hUdygBnQR0XgGLypF6LY9cs0Q9vheEhEnIQA4kBPAUokYIndwwfDkYmP7oC8
 Yp6gOPvBaQmj45ga1PWG8NAcU8eB6I4W2Fd2OWwE8bu2fImgIPY9zIjbKga+4N7Vu4rQKswbYpB
 qbUpWGmhsYkvbxUCL7x2Kv/G6uaxddJzZDKNkaaG23NxMrUkpQx/YCJosj/qu6O5vWh2FBqZDpD
 1ubc1TAH+Bc3+I5PW3osJlnqxciLb8mnAcZNylpKokE0dIYtYJ+dl02PKyWB4sj6AI63lCiTmV/
 r0UikhNUpJLt7+sdm+GMGggXTgzUu3MO3R4PxqWAMJzUI3ljq5PsocAdhpPkP/R4Yn+BFqD4hF0
 AxZ4wuifh1CiXjXFZw5m3inoZB2nVN2v82yxe+F+o37ZrOrv0NKGp25jR3eQu648nQPDBQpAjxD
 DvRzOALuk353m1A==
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


