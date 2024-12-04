Return-Path: <linux-arm-msm+bounces-40329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC79E4122
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A958E282A65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DFF219A79;
	Wed,  4 Dec 2024 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q56IozT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40218219A76;
	Wed,  4 Dec 2024 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331716; cv=none; b=Da9o54XW1sl+sBAyUii3MkEmTsvWsq215ViTxG0eZLwFIk6X9VoDqLtbcHbg8drWkGYPR2+/wLWjVoGocoDDiQKjwR7YGm0VWjv73e+3aonlqpMtt3/7NQx5FI2/87Fax4Le/sTCW2doxjCfS2ewgFQZ9eC3u0EnNqXwij9u0AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331716; c=relaxed/simple;
	bh=u9fXU0t73aoNWQEF4zhGCmPtwYBj6q2v5NSIOFDKt5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qANi1diHLboUpVl890NiSSI11J18UvqYR1L7b4NT2n1JMNDT33lDRe6tnTp8o0vReq/nAECE217fFWIWlPMXSj3Hygj0bug0F5P844MBmj6zsGvLsU0TDrwM30HWyqnDxQEpFfTAUP5IM3j7jE1cwQxgZf8tBSkZWfXODj1oXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q56IozT6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7570C4CECD;
	Wed,  4 Dec 2024 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331715;
	bh=u9fXU0t73aoNWQEF4zhGCmPtwYBj6q2v5NSIOFDKt5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q56IozT69xAsPdLAe3d07gtNrC45VZPznyMdHMu6VziQ/dQkLPfcjTOUld4D+sV2p
	 ASwQS2RMkgLBZ2pS696qXvZCI7mNAsfjcED2pmOzjM4/801gh3a9bsJB20CUI+bZlv
	 MdGqNGoFJ34wSliCF01afvuR3r/ow73zCXrrekcFjs3KCfPbYHM4qQLOtGKxfR35VX
	 whbZMoCrAaWCo7VLGA6bok1C3xm3tMH8TEVLCntnJ/ja4IVT/9/IP60BmrgdvKDbpY
	 YLbxOC0dYliCdtYgcE5OKcliit8uURdtnp1LzH3wAz6hzHbSefWELa2zXsjnneC7lc
	 8kodQmDnedc+Q==
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
Subject: [PATCH AUTOSEL 6.6 14/24] clk: qcom: rpmh: add support for SAR2130P
Date: Wed,  4 Dec 2024 10:49:34 -0500
Message-ID: <20241204155003.2213733-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155003.2213733-1-sashal@kernel.org>
References: <20241204155003.2213733-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
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
index a556c9e77d192..a8b5f4d8a7b9e 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -385,6 +385,18 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
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
@@ -804,6 +816,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
+	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
-- 
2.43.0


