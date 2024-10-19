Return-Path: <linux-arm-msm+bounces-35122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A139A4F71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EEB81F2230F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D2F1922D6;
	Sat, 19 Oct 2024 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmOFRAnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BC190688
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352712; cv=none; b=NsGV8MXE81zm5QuukJgNckFPIDh+E7PKKjyBi91piHVd5BXdyayWuEIhg6do4rWk+a18CbJc347o6TDeW9ZOr1/dNm6vsCXPKfguwbsjR838Su4WOGXaJuDwIkKo3AtnevMoJdAOyLr9bvuHfSDH6Lhy3BmOjJeLa9U2SOx+YEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352712; c=relaxed/simple;
	bh=C8i0BK5hjIYTgbsrEcYZTdHLVO8L8ePy9YX6HVa1xfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seGtlQKNQ9youxZB1ARWoyiMWw9Pob7lRyKN1uDbIQnBrVmIPpgwXYPzPypdCUMmTs7qtXT04lcR6ZP8IXMQtH539jCgzyvvwHiwcgddatTWCfYBlXZKQqLt3/NPgNK6S3VocFD2/MKqCII6ACp2YFWE204QtMu7SKl8ePYPrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xmOFRAnQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e63c8678so3865908e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729352708; x=1729957508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8gd1TRUah4UlBv9ZsEU3Mqp5q0KNFXM5pn6NKjKpmw=;
        b=xmOFRAnQn24aFClrESI6ud2bAbN8CQnRgXzjrV/1sX68AKQnnOlSJVTEewAj0/FGja
         i1k6iq49KiO/J+cfYnFbj9tRXOiyAasAkTqE5mdtAP2u+HHE/Amlb6FgaruvRq50TfGp
         yZWRmqBQQbSJddHddCIHhQsEhjHx5j7AVI5P0IcZkG0ASPwF6fy5hRTWoyedT7y+74EU
         oJq9Chr57Bt6m/hvuLRtu5gv/9Zrh69mmTqwp2SR/7rrT1zSN8xy9Si0pUEYXdp8mu4G
         8aBBSWgwECFD5x8bZQYWKIw0q1q1EwLEawep0z5jV8vlkhQ1aMXJANQA1pODDifr5HEl
         +6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729352708; x=1729957508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8gd1TRUah4UlBv9ZsEU3Mqp5q0KNFXM5pn6NKjKpmw=;
        b=F7MCz/RtqYkJZUBwcKzFqmKmYX3hJ5OaJ6x7dUFt56YCe/1xEXYEMOXzKBHd32FQ3S
         ikMDfyVe17mLzH9q3TxDflDKhNBIf4Ax4ITIKSTsvhozGjqQdwdEJrGh5/IsmmnmAZUs
         sCrwRvHMJzHGMPVuK9SQh8kwee1/UQ/cl7wDx1HrUZa/ZPWaiA98PIfK1F339uWXBRAZ
         DJXjG+e+Ea81c2UJNe4Ec2RC6e3z6KLJlES9NJdmszmaFDBiwgYoTbZEviUW8BurW4bO
         6TYM9f5EyYhoeCQkh4omxbKrNYCdz2js4Smbl7LudaX9R3zpFEGicoiLWvC3iHj+VLF8
         ciyQ==
X-Gm-Message-State: AOJu0YxGL3xwAHHeoTNzRqtI9hrjQ4ZwZGOr81mRRbr401qrn3SOzFAu
	Dzs9cXo2ODo2xQbd1lJR2yUZGR0ZuJ1z37EBR1zHQDvghR22dRnqresN7dW3ZrDxJN30nhakmbE
	o/q8=
X-Google-Smtp-Source: AGHT+IEdk9gKDp9V6UJq6A3qcqXOFI4RANBmYP0+zd9w8CmABSUWEM2JaScDPFI3iWoIRU/Ovn7gRw==
X-Received: by 2002:ac2:4e0b:0:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-53a151dfe9emr3223671e87.0.1729352708339;
        Sat, 19 Oct 2024 08:45:08 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211401sm562854e87.249.2024.10.19.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 08:45:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 18:44:55 +0300
Subject: [PATCH 6/6] phy: qualcomm: qmp-pcie: add support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-phys-v1-6-bf06fcea2421@linaro.org>
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
In-Reply-To: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8219;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=C8i0BK5hjIYTgbsrEcYZTdHLVO8L8ePy9YX6HVa1xfY=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE9P2jko6w3kde7neGna5/ktrSulyIWKbhpVaq
 Gw/j0M3XYmJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPT9gAKCRAU23LtvoBl
 uNpxD/sH67BmvGIsCeTk2/f2+RjXjSizWLw255nagDz+VvPSXDK2NKczpGmGvAEpk3WZ1q8mkr9
 n12VBvcnSplCaqpQsK6Z2gNbrGC50/+bOuyhOqCqNAy8W9sn9TOHj0TAloC0JAkWDAXbBQRjMqm
 KLLM35Wmn9WbyfY23FUgYslHsT5zgDqZS+5cUhxzPHvQXNnX7Eqg0mNKjTHsT69CFO62E3xjs5t
 WGYrPxYuih4dneR5do3i2hLILqtavUW1sANLSH2LwpMenf9JYvRA/h5AdMGiAlwPb9CtgsCA4Le
 0Wph+kiFgpxpvh/xohlz7n2qagXv9WC77a4Fhz6SblHTO5zPkO5Ep7NDtsHtO5Y8K7hHzFyRz/f
 Zz4SB5zmorU9wQDRSpsbk1hBOL6cXT4B4v7D8BXd/PoZH+bFvSlatWvmSPFbh6FYPtu6VL6W02g
 hgRQ3OZmHh7Mqhj/8eUL5Mosp+tS8PE3TxkesXE3ec9CG4rrzxX9RJhgojJfwPtbSAbNiZ0GuxO
 souURaX92m/v3MZbVgWD4y/ssqqs173fFmuXFSDIeReHc7jYjBoXIOuTEt1W9X/8DE/eAC9Hgl6
 +6POGIaXqK36vRBEi2ZsnCz5nd4zwtb5SWlY5/7E2AWN0+M7dVKssZyfMeOSMpiBmiaAAtsmMnv
 u4v/c011+4PsJ0Q==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add PCIe QMP PHY configuration for the Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 141 +++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 1ca1f21b1cc225f435da9c775c97dfa142117f95..c2ba411c6c90fbbc1b3e96b02e8e63c565f254f9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2725,6 +2725,101 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl[] =
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_INSIG_SW_CTRL7, 0x00),
 };
 
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_rc_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC_3, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xa0),
+};
+
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_pcs_lane1_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_LANE1_INSIG_SW_CTRL2, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_LANE1_INSIG_MX_CTRL2, 0x01),
+};
+
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_rc_tx_tbl[] = {
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_BIST_MODE_LANENO, 0x00, 2),
+};
+
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_rc_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_G3S2_PRE_GAIN, 0x2e),
+};
+
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_ep_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE0, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN1_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE1, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN1_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xa0),
+};
+
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_ep_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+};
+
+static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_ep_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_EQ_CONFIG1, 0x1e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG2, 0x14),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+};
+
 struct qmp_pcie_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -3290,6 +3385,49 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.skip_start_delay	= true,
 };
 
+static const struct qmp_phy_cfg sar2130p_qmp_gen3x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tbls = {
+		.tx		= sm8550_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_tx_tbl),
+		.rx		= sm8550_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_rx_tbl),
+		.pcs		= sm8550_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_lane1	= sar2130p_qmp_gen3x2_pcie_pcs_lane1_tbl,
+		.pcs_lane1_num	= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_pcs_lane1_tbl),
+	},
+	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sar2130p_qmp_gen3x2_pcie_rc_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_rc_serdes_tbl),
+		.tx		= sar2130p_qmp_gen3x2_pcie_rc_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_rc_tx_tbl),
+		.pcs		= sar2130p_qmp_gen3x2_pcie_rc_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_rc_pcs_tbl),
+		.pcs_misc	= sm8550_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sar2130p_qmp_gen3x2_pcie_ep_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_ep_serdes_tbl),
+		.pcs		= sar2130p_qmp_gen3x2_pcie_ep_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_ep_pcs_tbl),
+		.pcs_misc	= sar2130p_qmp_gen3x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sar2130p_qmp_gen3x2_pcie_ep_pcs_misc_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
 static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 	.lanes			= 2,
 
@@ -4639,6 +4777,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy",
 		.data = &sa8775p_qmp_gen4x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sar2130p-qmp-gen3x2-pcie-phy",
+		.data = &sar2130p_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sc8180x-qmp-pcie-phy",
 		.data = &sc8180x_pciephy_cfg,

-- 
2.39.5


