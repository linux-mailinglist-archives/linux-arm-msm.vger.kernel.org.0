Return-Path: <linux-arm-msm+bounces-5219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 395EC816D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 13:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F20A28166E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 12:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8F54CB26;
	Mon, 18 Dec 2023 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wa7g6UoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49B4CB30
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3ce28ac3cso1377775ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 04:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901269; x=1703506069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DxFXPJYgIG7bY+rEjLLq6eWKt7yGgrHuHLxSAUgD04=;
        b=wa7g6UoM4wbtaeBA39IPuyEx74DiXYc7UKKLrxC0mOxbc0PJ/QT6Rc6Wmz6vdmqBz/
         yVy9MP9qcaiMenn8S9OvuRfKP9fiyXhAfOt9L3HFnYwaMq98XK2seHGrQQWZteuoekGB
         bT7qfZeWTaZ9bslOFZvGBAXPKrDM7QsAaBbeAS14h+baHvpdCOnNVL36VBkyIr7NcEfJ
         6ufAuJ/Zr10qf1EVdGGXql3DVRgJE6iV2Cx8f6B1Meo7O/fJocSZYw/TxWI/qRrFJKFq
         9yg5OJew0FjK5L3EfE8rK9LQ5o5q1dtL2KFC1gDouNIBjXC0lf2oPtUNe8gAWbVbjIgo
         Smqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901269; x=1703506069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DxFXPJYgIG7bY+rEjLLq6eWKt7yGgrHuHLxSAUgD04=;
        b=nNsmQ3Om1AB4FCCTuvLpV2gwmqdUgeXqTvom4TqxIt+FnawYohELiMtUbFRY5hIRUc
         LErvPbEQ1P67aTik8kVr/nPNQSQMpF4g6+TKG21gsClz64bo5u4vnSSPWlUMT4etvZ6q
         A79va+dT4ssnysyFRaFc7iZWPgUA8sx72n0HQ7y+upj5bI7gtUjaLAfPFTOYW5f022Lq
         0HrkgKRPharoJd5K6Ai+z1hKrP5vwnAFvRhoeAKY/gpBouXmuIXYT9VY/5PDbWL8BfeO
         4yXRtxz3FPSRjntAceUk7bMDRcws8ebnN8PJo0m92g37U1nJpo+bHudw1i7GJPdnJaqB
         EieA==
X-Gm-Message-State: AOJu0Yz3MvWu/THUCH/pRZs8/+6BI+4zSYN9yniHdoak57RVFbtwRy7t
	Xg/d3pehJm6aguIZGO16Y2kPdLQOrZ0p1VvjAQ==
X-Google-Smtp-Source: AGHT+IEK1evDaORIVdgFmQY6oqeCQ/c/a7zO1rPGBojethcXGGLrT6jJIMMz7NCm2ipjlMCXMK2xiA==
X-Received: by 2002:a17:903:110e:b0:1d3:1773:8555 with SMTP id n14-20020a170903110e00b001d317738555mr5851554plh.115.1702901269314;
        Mon, 18 Dec 2023 04:07:49 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:07:48 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 04/16] clk: qcom: gcc-sc8180x: Add missing UFS QREF clocks
Date: Mon, 18 Dec 2023 17:37:00 +0530
Message-Id: <20231218120712.16438-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing QREF clocks for UFS MEM and UFS CARD controllers.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
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


