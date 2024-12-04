Return-Path: <linux-arm-msm+bounces-40324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6B9E40D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F01287AB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7595B207DE4;
	Wed,  4 Dec 2024 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o40mNHXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718F2101A9;
	Wed,  4 Dec 2024 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331630; cv=none; b=d57iB6Loh7Ceu+kUAkUyuzmIxGKjSM/O1jX3w4xaApoL45DtKAlIFNmC5pfYFh8WQUiwyOG+MdPsbVgW2hweHSjif5xTxwi6oFtocygfu8AihxPzpRLpQYos0rzIsr20rDGFPs78fqdIerqJQtfQd1/g9haSbmnPryaqKb3bWOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331630; c=relaxed/simple;
	bh=CD1quPpTe8jGvaxWATc2WrgDKplYdBtj48M/o3ZB8PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAs91mMcHGgVu8FuKRcrdAr2xp4KP+W0ac3FteH3w1Svc9gwTs7yJThSXWJqJHUgMSiv8IJVmX3+5W4L9X8O2ir18kicBxMBEQZZ2E4bOISyCHfdsTh9Ha9csz95l9fq/4v4EzCo26nc+R32xDK1Ym8nu4sbnhhoeeAFNphg3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o40mNHXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A148C4CED1;
	Wed,  4 Dec 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331630;
	bh=CD1quPpTe8jGvaxWATc2WrgDKplYdBtj48M/o3ZB8PY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o40mNHXGHmKeEc/IQizM/QAaeGsvBQKILVgLEiv/yOsEd3tD64B4f00gsiAq/7tUz
	 WHwOPYx6uUzTadWciIbsO8Ks+HYerMzJmH3nIIXTf9CiJtuGedMmqtybTAXff7zUrU
	 dTbpzhDeW/6DltVn26eFt43kwakC539MBS0ERuopYArHsA8kZD1xqefULR4KWHZbad
	 szAFqXCmlKOKIxLe1rxAsL+lREpv9yES5PUwWRiJeJQau+BOMXs5nxIQkJ02/+Rb9/
	 2oNBdQXt86DYs6RcebNYglJPH8cqaRi9vOXy6V8FY+i/2OuWqsTHH1elXzrhlad4nQ
	 g/+o9CpvjkngQ==
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
Subject: [PATCH AUTOSEL 6.11 22/33] clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
Date: Wed,  4 Dec 2024 10:47:35 -0500
Message-ID: <20241204154817.2212455-22-sashal@kernel.org>
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
index 8478bccd2533e..c91661921833c 100644
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
index e2cf5c7e501d0..b3ef043fdef3d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
 	CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
+	CLK_ALPHA_PLL_TYPE_NSS_HUAYRA,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
-- 
2.43.0


