Return-Path: <linux-arm-msm+bounces-69395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B151AB28494
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 19:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEB43A68DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C641F3093D0;
	Fri, 15 Aug 2025 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqhR9X2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519B2E5D2F;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277015; cv=none; b=qoNSyfcEyqopImnHwRkaW1V1FQ5AYcjFPojtWhBzyzZv8sLxXHq+3MvXPx48CrkvT5SH/5v5JSIfMHzlOqnz4YEW9vn2MuGcnKKD1yc+rHXL7cwQwtS8eDjlY3St22ODfiQLPa9LleteRVXS7jawLyKEQPzzF114O2CVz5SGhSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277015; c=relaxed/simple;
	bh=qkFRHrnku+8IhPnvvclol2lWXtFk7tOS52R0VQGPaSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPSufM7jAOSyfH88i3ngsQ1g6PGYR0cVXRUfbkkE3e0fRc4IqiA/tvHg3ntCJSHk+ZLS+02asOvyPH9v/ROSYXZWCKQvElfovm+s4y86ZPF7HYgbgk4aN4CWmLs12eChCbA/XKqnMHuICvDVlYl2Az9yNkEuQ6/LdcHTcjU7paY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqhR9X2F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D68DC4CEF6;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755277014;
	bh=qkFRHrnku+8IhPnvvclol2lWXtFk7tOS52R0VQGPaSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SqhR9X2FX17kOMV2bHUujwqMohN3xJ2d+RdlabUdb9Ku2I6VrWr/Mi9YByP821pzg
	 t7BUXgbr4J/aHHqcV34YlMQx34U34/IiOr2gT1mJnUHRNBKB3A54+bJcRiZ9SgUtgm
	 jsheCuEPTaJ9uWpNyKWRP8tbHrftk27FHT7nhMHznVGekLe+Pdz5mAOMMsdcoZ98h5
	 S9quiQ72xn204IDvYeMUNyafVAUkbxITfztf3g8zW7ryXeQPzekK+hGAvAa73h+nfx
	 zl33mg1YXtXX8v37/9dyYSzmZVvdogQNMqdafIi8FyhCrdsLavX4NN062hpenetL+f
	 cX2E/xngXPzbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD66CA0EE4;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Fri, 15 Aug 2025 19:56:52 +0300
Subject: [PATCH 2/2] clk: qcom: gcc-sdm660: Add missing LPASS/CDSP vote
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-2-c5a8af040093@yandex.ru>
References: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
In-Reply-To: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nickolay Goppen <setotau@yandex.ru>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755277013; l=3670;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=X6/ri844i2ly7ZOG0yiJaP7SUffxbwteMISWIbXh6r0=;
 b=HuolyR9GWC21w2uCY+YDwdApm9VK5PTQTV9zv+Iyv+j47UnMQ0TChMXhDiz1mi/kNU9pS0Cxk
 zccW+gYqsH8Cgdmf0cWJnjd3tkEahbU7MOkwgIfABI2afTNaz1wxDrM
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

For the proper functioning of SMMUs related to the audio/compute DSPs,
it makes sense that the clocks and power domains they rely on for
communication should be online.

Add the vote clocks & GDSCs that, when enabled, ensure all such
requirements are met, through various internal mechanisms.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 drivers/clk/qcom/gcc-sdm660.c | 72 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 01a76f1b5b4c146937a4f5fa0011309fd6ed6be8..20253a06a5839b7265548b4f9fdc1ffc9cf6f9f5 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2247,6 +2247,45 @@ static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
 	},
 };
 
+static struct clk_branch hlos1_vote_lpass_adsp_smmu_clk = {
+	.halt_reg = 0x7d014,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "hlos1_vote_lpass_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch hlos1_vote_turing_adsp_smmu_clk = {
+	.halt_reg = 0x7d048,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "hlos1_vote_turing_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch hlos2_vote_turing_adsp_smmu_clk = {
+	.halt_reg = 0x7e048,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7e048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "hlos2_vote_turing_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc ufs_gdsc = {
 	.gdscr = 0x75004,
 	.gds_hw_ctrl = 0x0,
@@ -2277,6 +2316,33 @@ static struct gdsc pcie_0_gdsc = {
 	.flags = VOTABLE,
 };
 
+static struct gdsc hlos1_vote_turing_adsp_gdsc = {
+	.gdscr = 0x7d04c,
+	.pd = {
+		.name = "hlos1_vote_turing_adsp_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos2_vote_turing_adsp_gdsc = {
+	.gdscr = 0x7e04c,
+	.pd = {
+		.name = "hlos2_vote_turing_adsp_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_lpass_adsp_gdsc = {
+	.gdscr = 0x7d034,
+	.pd = {
+		.name = "hlos1_vote_lpass_adsp_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
 static struct clk_hw *gcc_sdm660_hws[] = {
 	&xo.hw,
 	&gpll0_early_div.hw,
@@ -2409,12 +2475,18 @@ static struct clk_regmap *gcc_sdm660_clocks[] = {
 	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
 	[USB30_MOCK_UTMI_CLK_SRC] = &usb30_mock_utmi_clk_src.clkr,
 	[USB3_PHY_AUX_CLK_SRC] = &usb3_phy_aux_clk_src.clkr,
+	[GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK] = &hlos1_vote_lpass_adsp_smmu_clk.clkr,
+	[GCC_HLOS1_VOTE_TURING_ADSP_SMMU_CLK] = &hlos1_vote_turing_adsp_smmu_clk.clkr,
+	[GCC_HLOS2_VOTE_TURING_ADSP_SMMU_CLK] = &hlos2_vote_turing_adsp_smmu_clk.clkr,
 };
 
 static struct gdsc *gcc_sdm660_gdscs[] = {
 	[UFS_GDSC] = &ufs_gdsc,
 	[USB_30_GDSC] = &usb_30_gdsc,
 	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[HLOS1_VOTE_TURING_ADSP_GDSC] = &hlos1_vote_turing_adsp_gdsc,
+	[HLOS2_VOTE_TURING_ADSP_GDSC] = &hlos2_vote_turing_adsp_gdsc,
+	[HLOS1_VOTE_LPASS_ADSP_GDSC] = &hlos1_vote_lpass_adsp_gdsc,
 };
 
 static const struct qcom_reset_map gcc_sdm660_resets[] = {

-- 
2.50.1



