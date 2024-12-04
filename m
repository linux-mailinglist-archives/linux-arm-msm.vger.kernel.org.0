Return-Path: <linux-arm-msm+bounces-40321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE39E4415
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1258B67E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AE92049F3;
	Wed,  4 Dec 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URnYcJ4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639F2066FB;
	Wed,  4 Dec 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331625; cv=none; b=nnD1gPDG/Y+nzThAaaFvFzfqWuQ2r8xrkJ5BwkXf5LHi94OiIp2p/S8e7TtLd5+/8chqc3DYvLnEKxd4r+rU5u6t3N5tnd/gPzUyjC7HXABASKxm/qt6SOBgnAs35XP3Ayzzfpo+oLQdxwQclqq6q+egddt1tm4tLBjZ8O66G+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331625; c=relaxed/simple;
	bh=4wZ7mgbg3QsWwyRiCe6fx32xJMPPe2OYSz0Oxrbzf14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIbb0blirHmLpSFB2uy4iEvn5ymTizwCcHFhsm+8x7MrEHRVATK5EnLy4leYRqYVuMzpor2KraekTve36UsoK8SoquVW4S3qmYgUXPAtoq4brad28HMwBTfZj3XgkNfETnvZXMPeTqKHT4nFxBhGhr6bg4GE3J7d1S8zNkqQYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URnYcJ4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261D8C4CECD;
	Wed,  4 Dec 2024 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331625;
	bh=4wZ7mgbg3QsWwyRiCe6fx32xJMPPe2OYSz0Oxrbzf14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=URnYcJ4eGF20bRoIcTwNjaBb2U8i5w1lXtChHXTsfEJ2ItQ56O1qpIM7Mqp9DE3+7
	 Hdzd4QXYPakiu68oh3YTWSyD0rSCh+SejMSVV5CU5YznIEmkgmZD0KAUbo0XBjddnq
	 s3FZwJCV66G7X/sk35uEoETLrgFKhHLr4LJQFGUdOFweENx/QlHEonWwnp2Uqky8rg
	 MYOxozHESx/BfVu1qhFy+VXC5IYMq66vwFUBJedwLNvtzubiNQ/Ns0Ur2FX0m1qEwf
	 JFOLIittHr4E7GoYth8b/0GB5YZEqkms5xt+VpAkCnOIHjuAgPq2ze44BkgQ7iAX1E
	 VqNvVrKxqLAxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 19/33] clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
Date: Wed,  4 Dec 2024 10:47:32 -0500
Message-ID: <20241204154817.2212455-19-sashal@kernel.org>
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

[ Upstream commit aec8c0e28ce4a1f89fd82fcc06a5cc73147e9817 ]

Generally SDCC clocks use clk_rcg2_floor_ops, however on SAR2130P
platform it's recommended to use rcg2_shared_ops for all Root Clock
Generators to park them instead of disabling. Implement a mix of those,
clk_rcg2_shared_floor_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241027-sar2130p-clocks-v5-6-ecad2a1432ba@linaro.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 48 +++++++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a8..80f1f4fcd52a6 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_floor_ops;
 extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f006..bf6406f5279a4 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1186,15 +1186,23 @@ clk_rcg2_shared_force_enable_clear(struct clk_hw *hw, const struct freq_tbl *f)
 	return clk_rcg2_clear_force_enable(hw);
 }
 
-static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate)
+static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate,
+				      enum freq_policy policy)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(rcg->freq_tbl, rate);
-	if (!f)
+	switch (policy) {
+	case FLOOR:
+		f = qcom_find_freq_floor(rcg->freq_tbl, rate);
+		break;
+	case CEIL:
+		f = qcom_find_freq(rcg->freq_tbl, rate);
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
@@ -1207,10 +1215,28 @@ static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 	return clk_rcg2_shared_force_enable_clear(hw, f);
 }
 
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
 static int clk_rcg2_shared_set_rate_and_parent(struct clk_hw *hw,
 		unsigned long rate, unsigned long parent_rate, u8 index)
 {
-	return clk_rcg2_shared_set_rate(hw, rate, parent_rate);
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
+static int clk_rcg2_shared_set_floor_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
+}
+
+static int clk_rcg2_shared_set_floor_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
 }
 
 static int clk_rcg2_shared_enable(struct clk_hw *hw)
@@ -1348,6 +1374,18 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+const struct clk_ops clk_rcg2_shared_floor_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_floor_rate,
+	.set_rate = clk_rcg2_shared_set_floor_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_floor_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_floor_ops);
+
 static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-- 
2.43.0


