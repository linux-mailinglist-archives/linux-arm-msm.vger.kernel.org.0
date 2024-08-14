Return-Path: <linux-arm-msm+bounces-28527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5E951FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 18:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 117441C22267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4EE1C4603;
	Wed, 14 Aug 2024 16:20:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659491B8EB3;
	Wed, 14 Aug 2024 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652430; cv=none; b=YKXwueRXzgqxSDYktLtDNAmCbADmPruregZX3DhX+aO7GqQiuFhbzSkW73L+9VonxSyhzvNmuTtOGPxqdDDstOCEDNwCLRT6avAA1oyh13kkbUqz2hz8Xbk4LnfT39kcImSSln5Zakel/16A5Au9mYWDH2pQr9FLV3D2S+moBlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652430; c=relaxed/simple;
	bh=vsJLWn6Jp3U/X6ICSy6sVjINPzzdFnXAUmOch1UMpGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmMoJCKQkqRmyJY6YqglMLSxIk881rEG0dMwTbcDb+O8OSUTEklVTKIUWA/R9i1IkX/ePy/Wxq320leAxzk3tehsAhssdv6af20+zA2wXIfIkbR2Ou88ukcmQ1kav4NrnnyGwT53k+w9XlVKKmrqWrXtG6/Q1VpjCDpv4HcDue4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id E77C6209B1;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id D561C20990;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Wed, 14 Aug 2024 18:20:23 +0200
Subject: [PATCH 2/3] clk: qcom: gcc-msm8998: Add Q6 BIMC and LPASS core,
 ADSP SMMU clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-lpass-v1-2-a5bb8f9dfa8b@freebox.fr>
References: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
In-Reply-To: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add the Q6 BIMC, LPASS core/adsp SMMU clocks to support audio related
functionality on MSM8998 and APQ variants.

As a final step to entirely enable the required clock tree for the
lpass iommu and audio dsp, add the lpass core/adsp GDSCs.

As a side note, it was found out that disabling the lpass core GDSC
at any time would cause a system lockup (and reboot): disabling
this GDSC will leave the lpass iommu completely unclocked, losing
its state entirely - including the secure contexts that have been
previously set-up from the bootloader/TrustZone.
Losing this IOMMU configuration will trigger a hypervisor fault,
which will reboot the system; the only workaround for this issue
is to declare the lpass core gdsc as always-on.

It should also not be forgotten that this is all about firmware and
there may be a version of it that doesn't enable this GDSC at all
before booting Linux, which is the reason why this specific declaration
wasn't simply omitted.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/clk/qcom/gcc-msm8998.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 90b66caba2cdf..7fda2253a184b 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2922,6 +2922,43 @@ static struct clk_branch ssc_cnoc_ahbs_clk = {
 	},
 };
 
+static struct clk_branch hlos1_vote_lpass_core_smmu_clk = {
+	.halt_reg = 0x7D010,
+	.clkr = {
+		.enable_reg = 0x7D010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "hlos1_vote_lpass_core_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch hlos1_vote_lpass_adsp_smmu_clk = {
+	.halt_reg = 0x7D014,
+	.clkr = {
+		.enable_reg = 0x7D014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "hlos1_vote_lpass_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x8A040,
+	.clkr = {
+		.enable_reg = 0x8A040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0x6b004,
 	.gds_hw_ctrl = 0x0,
@@ -2953,6 +2990,26 @@ static struct gdsc usb_30_gdsc = {
 	.flags = VOTABLE,
 };
 
+static struct gdsc hlos1_vote_lpass_adsp = {
+	.gdscr = 0x7d034,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "lpass_adsp_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_lpass_core = {
+	.gdscr = 0x7d038,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "lpass_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = ALWAYS_ON,
+};
+
 static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
@@ -3133,12 +3190,17 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_MMSS_GPLL0_DIV_CLK] = &gcc_mmss_gpll0_div_clk.clkr,
 	[GCC_GPU_GPLL0_DIV_CLK] = &gcc_gpu_gpll0_div_clk.clkr,
 	[GCC_GPU_GPLL0_CLK] = &gcc_gpu_gpll0_clk.clkr,
+	[HLOS1_VOTE_LPASS_CORE_SMMU_CLK] = &hlos1_vote_lpass_core_smmu_clk.clkr,
+	[HLOS1_VOTE_LPASS_ADSP_SMMU_CLK] = &hlos1_vote_lpass_adsp_smmu_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
 	[PCIE_0_GDSC] = &pcie_0_gdsc,
 	[UFS_GDSC] = &ufs_gdsc,
 	[USB_30_GDSC] = &usb_30_gdsc,
+	[LPASS_ADSP_GDSC] = &hlos1_vote_lpass_adsp,
+	[LPASS_CORE_GDSC] = &hlos1_vote_lpass_core,
 };
 
 static const struct qcom_reset_map gcc_msm8998_resets[] = {

-- 
2.34.1


