Return-Path: <linux-arm-msm+bounces-9168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944084372B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E64C28A173
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E98D56751;
	Wed, 31 Jan 2024 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZGCP0nD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B7D5647C
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684904; cv=none; b=ZRTlZSc695wl9V0+mGNjAm+nEpC3e2TjyV8XSwDYNzXpIDglDKRrOBkJHUpl8MRgfHdu998QDP0MFyA9yIkg/jkzz6L2iJMJ4EvgOX+EK73+Ypm/kpQ9V0ZEVgxjAAK0rBX3IpHYSa8F4+paq/bvXB7R4XnCuwGhU5V3/kJi7TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684904; c=relaxed/simple;
	bh=SCBsO7RXjcmYj56UQGsgo+pKrcUyAXNxRNanEY60oIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNF9vWafTSpgOENSdr5xs+cITTpebPPa9qpmNzmsi7Rp4y6jW2VF+EOKRBn9iHDoGg/9vFN5jwINhXJJwbwRnns6l0ekch4SPydGfcPNAi4ygd0x7byTH2O7900mkj82tdR42LhQW2EeXiaM2zAhXW8C6nPAnV7aGIsNUf2Yxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZGCP0nD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ddce722576so2541470b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684901; x=1707289701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrBz94BuTNSt9P0cmQ/JtUYmmdiGOZDnkuKPdCIy/0E=;
        b=oZGCP0nDSuFucs4uYGMiPJv/b39k1GuOAE2G8tt3cNtC+zgIhWw8yLvoil7ezjKiou
         JcmhfVbmMFU2kvXo5Y+aNFWvaYsqRsfNFNe/cMBh9jMcoQynerixxwX6FxrgBto14FQN
         Ks1jSCwehYK/gOUotYSqsFAWxsltuOc8m09Kl91dgHADTUwAlsMAQm81qQzIEYa8RRDl
         1wwcPR14sJB8tLHiuL5VC5Dhti2eOY1XWEYIFkC/0RljBN2YtET1dxBUbYsLdbZqCvCN
         8SdG3ii+fFRoENq6cdLQd/0vHFEYx5uk56yLcmGMJs84tZGRgEcip4p5EtnpgqwPkprZ
         Q9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684901; x=1707289701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrBz94BuTNSt9P0cmQ/JtUYmmdiGOZDnkuKPdCIy/0E=;
        b=vsk8mQidV5W+k3Y8+NPriAzIv6B6gSVOu8KjEgVyUUAmY0K5z21ig/xmoZVTIzCbY+
         kfxTZeQCvsQP6gR6jW3WfnQboFt0KJRLSZd/qomLbNTpwc39w45hy8rIt8PUrZRlcd7X
         1AoXwjl3zTLIPXZBPWFjldSpf048eW4GpVTeCHCYMwavMyOSxJx3meR2Q+XvCLKYz1Ar
         U6gfaagmrnulp1Ndo1Wc50CEgn49/eEw2GoGBCew3UaHrxRD7Cps/vNk+RDr7z1SrQuH
         AOtDzXx8obNTh+XareOzZHxPeYC9iTh9f3fQPK8XwKcf4Af4wVcxig/kgKyDOBpxyg1d
         Igkg==
X-Gm-Message-State: AOJu0YwYWjudkyH3PaxAc50Dgalv9gj+nMaPS5DuJdqphdcXpItl8fyY
	au+s4zwjpDBwFGHE4870UlCMYVjdl43LQ/Sy24hI1QseIhC4ZFd4q/EpbmwErw==
X-Google-Smtp-Source: AGHT+IHG7CeD4yMbLmw5DP00Z2QDMS2iDb6DjukZj7eqvdYSSca+KNDl5G8GOiiM5rUOeKcIp3RneA==
X-Received: by 2002:a05:6a21:99a7:b0:19c:9e0c:1d2b with SMTP id ve39-20020a056a2199a700b0019c9e0c1d2bmr834833pzb.52.1706684901216;
        Tue, 30 Jan 2024 23:08:21 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:08:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:27 +0530
Subject: [PATCH v3 04/17] clk: qcom: gcc-sc8180x: Add missing UFS QREF
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-4-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=SCBsO7RXjcmYj56UQGsgo+pKrcUyAXNxRNanEY60oIA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG77R/Xh7qMt7D8A82y+Z7ovm1A/k0BpEfN7
 WMRXpednByJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxuwAKCRBVnxHm/pHO
 9Wp9B/4sITOPxh34rYcFxhTohk0p2usKarDdGVg8nQuZ9W3Ljqt+kv9LCpkbpgUcdMsot2rjdw9
 8PdFkJQL3sBCkWo6aOo7ZURtGRGDdUGbnmFF7i+VKbVoiswNNDvbNBSUedfudrebnw3Yhi4XSrx
 YKZIK1X6s/FxR7Aalf4NFDn3XZzp45UKyvly60YhZaZnGxxHRtk8Tnc22QfEFWYT0kkekXTJpz2
 87N3jquVNJT/mTc4vWvs/E+aqI7oROIEL1oUnXyOpjSaFLsd9AX071QWChbKmZoA1lGGHY2CC0r
 1v5+UhAyynSVtx0Bd9DsGEdrMsbb/l79qsJ5IFK5MDYNUoF2
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Add missing QREF clocks for UFS MEM and UFS CARD controllers.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sc8180x.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index ae2147381559..544567db45f1 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -3347,6 +3347,19 @@ static struct clk_branch gcc_ufs_card_2_unipro_core_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_card_clkref_en = {
+	.halt_reg = 0x8c004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_card_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_card_ahb_clk = {
 	.halt_reg = 0x75014,
 	.halt_check = BRANCH_HALT,
@@ -3561,6 +3574,19 @@ static struct clk_branch gcc_ufs_card_unipro_core_hw_ctl_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_mem_clkref_en = {
+	.halt_reg = 0x8c000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_mem_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_phy_ahb_clk = {
 	.halt_reg = 0x77014,
 	.halt_check = BRANCH_HALT,
@@ -4413,6 +4439,7 @@ static struct clk_regmap *gcc_sc8180x_clocks[] = {
 	[GCC_UFS_CARD_2_TX_SYMBOL_0_CLK] = &gcc_ufs_card_2_tx_symbol_0_clk.clkr,
 	[GCC_UFS_CARD_2_UNIPRO_CORE_CLK] = &gcc_ufs_card_2_unipro_core_clk.clkr,
 	[GCC_UFS_CARD_2_UNIPRO_CORE_CLK_SRC] = &gcc_ufs_card_2_unipro_core_clk_src.clkr,
+	[GCC_UFS_CARD_CLKREF_EN] = &gcc_ufs_card_clkref_en.clkr,
 	[GCC_UFS_CARD_AHB_CLK] = &gcc_ufs_card_ahb_clk.clkr,
 	[GCC_UFS_CARD_AXI_CLK] = &gcc_ufs_card_axi_clk.clkr,
 	[GCC_UFS_CARD_AXI_CLK_SRC] = &gcc_ufs_card_axi_clk_src.clkr,
@@ -4429,6 +4456,7 @@ static struct clk_regmap *gcc_sc8180x_clocks[] = {
 	[GCC_UFS_CARD_UNIPRO_CORE_CLK] = &gcc_ufs_card_unipro_core_clk.clkr,
 	[GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC] = &gcc_ufs_card_unipro_core_clk_src.clkr,
 	[GCC_UFS_CARD_UNIPRO_CORE_HW_CTL_CLK] = &gcc_ufs_card_unipro_core_hw_ctl_clk.clkr,
+	[GCC_UFS_MEM_CLKREF_EN] = &gcc_ufs_mem_clkref_en.clkr,
 	[GCC_UFS_PHY_AHB_CLK] = &gcc_ufs_phy_ahb_clk.clkr,
 	[GCC_UFS_PHY_AXI_CLK] = &gcc_ufs_phy_axi_clk.clkr,
 	[GCC_UFS_PHY_AXI_CLK_SRC] = &gcc_ufs_phy_axi_clk_src.clkr,

-- 
2.25.1


