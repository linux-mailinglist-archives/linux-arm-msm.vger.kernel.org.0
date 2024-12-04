Return-Path: <linux-arm-msm+bounces-40322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D699E40CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42339161BE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD2A206F14;
	Wed,  4 Dec 2024 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4e9/xf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E6206F10;
	Wed,  4 Dec 2024 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331627; cv=none; b=ELwJ3wH9OpAHFigDlFToSl7H7zWn5ctfiUnqtK2tM7ME+sxVrkGn/iuMgQ6rHwKkHB5lPtb63nHTrUfFClREW0cP4Vn4CGmh/Yz/j0G1MChfCL5pGHSD+WR+HoN4/sdSfdwNOug+2OChRpbFHjrHx+xXqMp1gT0rh/R4Nv1J78Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331627; c=relaxed/simple;
	bh=axShVKXOsnz07874C/bFAsuhymkcO9z5xZA24IAp8mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myuUpYA1ELGMWCcxbKvyuuHSjqCNpmp9FlOkPdhv2EuXKziud5cSqjhiVDyVPb2RmFjrG5YgPO3UzMeW8FHcuItxinvrUVBP3ovzLCxseFqONau+wTQzsl2v717n61KyMDpMdBM6IAAfb654CS1w5Dk5RI3M8psZV2JoMRq1lDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4e9/xf6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC9CC4CEDF;
	Wed,  4 Dec 2024 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331626;
	bh=axShVKXOsnz07874C/bFAsuhymkcO9z5xZA24IAp8mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4e9/xf6W59F3wJYguXNbjiSpQmQjsugQmn5nL3Rs0PbMkyH5BFvsWtZk4rRwSF+K
	 zPL2mcNnfgSvpzAf0R9OKr16TOd6YLwZyeCyG0lMfYXmhneDwXErEdQ08MgLnpgAPM
	 chPpzc7bFGkc/8ChD7xIJv93gc6Cfo2JQKR7bpcxm1bLXWb+b56A5PBA6Y8dTmZf8S
	 k8Ue9cHr7/Gf21CU7d8acONrdRhpDywAaQiCgjfYh/1mTSGeLBgNWH76uIcOMrNUo1
	 MigrTdS9WPSWDq2zSqhHW9wlP2j3LEQ6cqOOgosdyzb+8knJn8a2ypJxbThyh1vP34
	 LbyQaI72KorGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 20/33] clk: qcom: rpmh: add support for SAR2130P
Date: Wed,  4 Dec 2024 10:47:33 -0500
Message-ID: <20241204154817.2212455-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154817.2212455-1-sashal@kernel.org>
References: <20241204154817.2212455-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 2cc88de6261f01ebd4e2a3b4e29681fe87d0c089 ]

Define clocks as supported by the RPMh on the SAR2130P platform. The
msm-5.10 kernel declares just the CXO clock, the RF_CLK1 clock was added
following recommendation from Taniya Das.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
Link: https://lore.kernel.org/r/20241027-sar2130p-clocks-v5-7-ecad2a1432ba@linaro.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/clk-rpmh.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 4acde937114af..eefc322ce3679 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -389,6 +389,18 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *sar2130p_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sar2130p = {
+	.clks = sar2130p_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sar2130p_rpmh_clocks),
+};
+
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -880,6 +892,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
+	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
-- 
2.43.0


