Return-Path: <linux-arm-msm+bounces-62862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDFAEBE55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 940A57B5210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBF71DE89B;
	Fri, 27 Jun 2025 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LA+83kj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF91DA61B;
	Fri, 27 Jun 2025 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044709; cv=none; b=azsbb1mOVDAV9fMhaMZhpkSX+Y9U8CIW2bJW+k7tCeVXoP7ehx++3hCr2ORbscC9G2DvnCVMxLaFk1REHX05K3+P9NarGF2AEnX6vx93leNiUh4UWBbznxVPqwIYjrXaeyzOO4y4DuttsrkGJPxTBwCpiui6mKP0kKmmeg0yncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044709; c=relaxed/simple;
	bh=qekrEVqL5xGZYqbqiBYa/pSYw69lavty2tkv5dhvUFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZ2ZeeKwIXzCGfrxy4BRV8TLPfE+5fC5i+vVo6dzwH20ipYs/8gdgT8Z6+ZNyECdRM7fCgZhchQIpW5AQb7GDMk/Jms51chzXW/tHZBSSGy8t00yttQgntlQcCEM2tLa6zus09jGJ3CjJduamGMIPz7qHPAM/+G5nA8nAy7mmH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LA+83kj0; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id VCiOuiqRroUtIVCiOujFMI; Fri, 27 Jun 2025 19:18:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751044698;
	bh=vZ0gXsMEUL07BRPgj8DtIwElSztAZLrFwXzdLM5hlqM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LA+83kj0CfW1YPfcqXYO4cgzjLTsPpFen5MEjY/lDm1UN0o4nomUj/DhNkAcW2yyj
	 zi8WiU146Sqk21qOUpTYC58RtWB+ViVQTBFJLF992oO4bMaC6DFIW+p7tTAKGB3rH/
	 Wj0ZXTsJ26OWrIJjElAm806Sf0BbD1A0DsyFI+5zizNV7rZY7EzD6akezIiGoijp0W
	 Dr+C0q/iKnlZUtu7itgXJOqNT7LFBtGsdK5zimb3SW7y4K2pMifiin1hgIaBhX4wAo
	 xsMIfMyw466LRoYpSGoY0Zh/HkzL2h9NonFsMzj2RTV3qXioGikGUVopOVjFDDTudQ
	 gJO25WEyQFHJA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Jun 2025 19:18:18 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
Date: Fri, 27 Jun 2025 19:18:03 +0200
Message-ID: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions and other stuff all start with "mdp4_", except a few ones that
start with "mpd4_" (d and p switched)

Make things consistent and use "mdp4_" everywhere.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The change has been done with:
   sed -i s/mpd4/mdp4/g *
and the modified files have been compile tested.

Maybe the comment "/* TODO: do we need different pll in other cases? */" in
mpd4_lvds_pll_init() can be removed as well.
A similar comment was removed in mdp4_lcdc_encoder_init() in commit
9c2f63da6a70 ("drm/msm/mdp4: register the LVDS PLL as a clock provider")

This has been waiting in my own tree for years, and popped-up recently
because of other changes in the same area.
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  2 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 38 +++++++++----------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index f9d988076337..9a1e4daa8e8d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -202,6 +202,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-struct clk *mpd4_get_lcdc_clock(struct drm_device *dev);
+struct clk *mdp4_get_lcdc_clock(struct drm_device *dev);
 
 #endif /* __MDP4_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 06a307c1272d..1051873057f6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -375,7 +375,7 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev)
 
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
-	mdp4_lcdc_encoder->lcdc_clk = mpd4_get_lcdc_clock(dev);
+	mdp4_lcdc_encoder->lcdc_clk = mdp4_get_lcdc_clock(dev);
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
 		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c29470510..4612886f0e49 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -54,7 +54,7 @@ static const struct pll_rate *find_rate(unsigned long rate)
 	return &freqtbl[i-1];
 }
 
-static int mpd4_lvds_pll_enable(struct clk_hw *hw)
+static int mdp4_lvds_pll_enable(struct clk_hw *hw)
 {
 	struct mdp4_lvds_pll *lvds_pll = to_mdp4_lvds_pll(hw);
 	struct mdp4_kms *mdp4_kms = get_kms(lvds_pll);
@@ -80,7 +80,7 @@ static int mpd4_lvds_pll_enable(struct clk_hw *hw)
 	return 0;
 }
 
-static void mpd4_lvds_pll_disable(struct clk_hw *hw)
+static void mdp4_lvds_pll_disable(struct clk_hw *hw)
 {
 	struct mdp4_lvds_pll *lvds_pll = to_mdp4_lvds_pll(hw);
 	struct mdp4_kms *mdp4_kms = get_kms(lvds_pll);
@@ -91,21 +91,21 @@ static void mpd4_lvds_pll_disable(struct clk_hw *hw)
 	mdp4_write(mdp4_kms, REG_MDP4_LVDS_PHY_PLL_CTRL_0, 0x0);
 }
 
-static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
+static unsigned long mdp4_lvds_pll_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
 	struct mdp4_lvds_pll *lvds_pll = to_mdp4_lvds_pll(hw);
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+static long mdp4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long *parent_rate)
 {
 	const struct pll_rate *pll_rate = find_rate(rate);
 	return pll_rate->rate;
 }
 
-static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+static int mdp4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate)
 {
 	struct mdp4_lvds_pll *lvds_pll = to_mdp4_lvds_pll(hw);
@@ -114,26 +114,26 @@ static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 
-static const struct clk_ops mpd4_lvds_pll_ops = {
-	.enable = mpd4_lvds_pll_enable,
-	.disable = mpd4_lvds_pll_disable,
-	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
-	.set_rate = mpd4_lvds_pll_set_rate,
+static const struct clk_ops mdp4_lvds_pll_ops = {
+	.enable = mdp4_lvds_pll_enable,
+	.disable = mdp4_lvds_pll_disable,
+	.recalc_rate = mdp4_lvds_pll_recalc_rate,
+	.round_rate = mdp4_lvds_pll_round_rate,
+	.set_rate = mdp4_lvds_pll_set_rate,
 };
 
-static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+static const struct clk_parent_data mdp4_lvds_pll_parents[] = {
 	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
-	.name = "mpd4_lvds_pll",
-	.ops = &mpd4_lvds_pll_ops,
-	.parent_data = mpd4_lvds_pll_parents,
-	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
+	.name = "mdp4_lvds_pll",
+	.ops = &mdp4_lvds_pll_ops,
+	.parent_data = mdp4_lvds_pll_parents,
+	.num_parents = ARRAY_SIZE(mdp4_lvds_pll_parents),
 };
 
-static struct clk_hw *mpd4_lvds_pll_init(struct drm_device *dev)
+static struct clk_hw *mdp4_lvds_pll_init(struct drm_device *dev)
 {
 	struct mdp4_lvds_pll *lvds_pll;
 	int ret;
@@ -156,14 +156,14 @@ static struct clk_hw *mpd4_lvds_pll_init(struct drm_device *dev)
 	return &lvds_pll->pll_hw;
 }
 
-struct clk *mpd4_get_lcdc_clock(struct drm_device *dev)
+struct clk *mdp4_get_lcdc_clock(struct drm_device *dev)
 {
 	struct clk_hw *hw;
 	struct clk *clk;
 
 
 	/* TODO: do we need different pll in other cases? */
-	hw = mpd4_lvds_pll_init(dev);
+	hw = mdp4_lvds_pll_init(dev);
 	if (IS_ERR(hw)) {
 		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
 		return ERR_CAST(hw);
-- 
2.50.0


