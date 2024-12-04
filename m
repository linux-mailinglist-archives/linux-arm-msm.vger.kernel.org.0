Return-Path: <linux-arm-msm+bounces-40317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E29E4075
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1343C167907
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32F821C19D;
	Wed,  4 Dec 2024 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngZKVQxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482321C198;
	Wed,  4 Dec 2024 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331519; cv=none; b=NmxE89G0To2qURF6sNNrUjWKP19UTTEz4/OK9X86/daSUSSwdEbvf1IbH5W9ib86wQ8c1UZafzywqYGfCGCE4ufSRvIJAwubo0H0Uf7PKKeQ36h9oVMdh3UWvpz1aEpihRCzf19JzTl2MlAZ0c8S5DBm78wfWbMxQmMnCcdyrZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331519; c=relaxed/simple;
	bh=wN8wO8W0gVEkSJGK4xGzUnurDDPyKsvPEccqxqeSioc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoJUgmtDJGDcxWJ0ZsGgBfNdCwNaoyYgNAMh0LhO1eYqsKBXFQ4QPfHwh1M/Feuats5IhvKBRJ/UMC3Fn5tfgYsJ7bdIgCSFhtXt81KylNufKkokVRvP8SqjR9togqhqc8MxDK+kA0NQ/6jI+lPoBQWszWq+4PfjNa+0Ax+r3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngZKVQxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290F8C4CECD;
	Wed,  4 Dec 2024 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331519;
	bh=wN8wO8W0gVEkSJGK4xGzUnurDDPyKsvPEccqxqeSioc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ngZKVQxJ98EDTA10iaQmUL9IYP6yYDwFYpO87mSKGsByTfKNBvmYiqhTN516+UEcA
	 q4gEW76gD5Ggb+WmopbnbOzVibFoW2pfeCWKPGB0IiYqySXSwqMQF209VrAdd6FICE
	 PlvUzaX4I+bfmQjZsSOwT990rUTuZAFPGOujuOCIF7Jl5Ib7JG1NTtQRJGw9ucegSM
	 uT0xV/fGduicgDhXqmue5r3o5l96tdHYPFbIblKlcNXMqhEwVulYOEcW8KrR+32DEw
	 zRl/75QghYbjYO0kqMdu/hwxm9tNrjpyGp48dMCyxOKzG6accjmZLTCyilabb0AXny
	 /5e0YqwJp8SrQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Devi Priya <quic_devipriy@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 24/36] clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
Date: Wed,  4 Dec 2024 10:45:40 -0500
Message-ID: <20241204154626.2211476-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154626.2211476-1-sashal@kernel.org>
References: <20241204154626.2211476-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit

From: Devi Priya <quic_devipriy@quicinc.com>

[ Upstream commit 79dfed29aa3f714e0a94a39b2bfe9ac14ce19a6a ]

Add support for NSS Huayra alpha pll found on ipq9574 SoCs.
Programming sequence is the same as that of Huayra type Alpha PLL,
so we can re-use the same.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Link: https://lore.kernel.org/r/20241028060506.246606-2-quic_srichara@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 11 +++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index be9bee6ab65f6..49687512184b9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -267,6 +267,17 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x30,
 		[PLL_OFF_STATUS] = 0x3c,
 	},
+	[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_TEST_CTL] = 0x0c,
+		[PLL_OFF_TEST_CTL_U] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
+		[PLL_OFF_STATUS] = 0x20,
+	},
+
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 55eca04b23a1f..c6d1b8429f951 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -32,6 +32,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
 	CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
+	CLK_ALPHA_PLL_TYPE_NSS_HUAYRA,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
-- 
2.43.0


