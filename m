Return-Path: <linux-arm-msm+bounces-81698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0603C596D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EFFA4F5CDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CF135A938;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD4gdqjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B1935A125;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056664; cv=none; b=pL6+gAYm6WqsygJojOqXE4oFPSCA3g2LNwvR6yDUvQcDEg0mrcO+BH8wte6Y68leklo5kEzGkfu1gjnMt5e92zP3mzd+4PVStrbdvFCW8JDfeiX/F7TaTb2oMPPy2pSE3HAFFhQ6BkG5zkgO6LgWcfgCj3bXCW8xTbk+EUf6244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056664; c=relaxed/simple;
	bh=10XNWDQ1dULf+P9kZ2dHmDwf8V4xwRtNb2eTtETPwsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wa8gA0tcoIHcbEMYlYTTCfVbLxGcgz0hlFWz6MeX/x7oi7BUxXhJBKdLFi27v0HPVeVNldQO5gibBMo61GYNnP82T2IeqiRo99HbyykmxBku8t5KA4DmwA5pCawnaY5ZY1C33JpRcZRoHJahvm9wNXOMWiywx84B9hYIj7ZSFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD4gdqjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE4E8C2BCB5;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=10XNWDQ1dULf+P9kZ2dHmDwf8V4xwRtNb2eTtETPwsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lD4gdqjNewhyihAZYlTrRCj35GOYfToGv+06B1OPySAFTM0Jx82a4M++RGURm45bF
	 05f75x69UnJzHdYlu8SpX113s/bwSViAaivmdBkNaVrenJslPY6XOcJDZ2iu4eaiOw
	 HVUw0OKIOiCAoJH7xhRdpUg8l89/dtDzBELvERmaHkiA+ME3GwXAJF26qXhjboYCPB
	 nf2HD5QPbx8hxjWrSzbKVdWuh90IeE6zDvc5oWvpBe/R22Ryyw4ExfinoCgcBBo30P
	 9Oq5PPZa/aDW/m13M0DC+M5OZe1d0RdViFuBiFHa6WDW7Rfy2wdDi5OltDDFqxpMqV
	 bl5KHNZEiqiAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DE1CD8CBD;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:45 +0100
Subject: [PATCH v2 11/12] drm/panel: sofef00: Mark the LPM mode always-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-11-e175053061ec@ixit.cz>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
In-Reply-To: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dv4mgLKU6V9KA5Q8a78znnVTuWL2bX0IVKAwUPXHk8E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwVWR0DhH3x/QekF3rJ8kiBp445Bbqdsqmu0
 DdyTzmWe7yJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFQAKCRBgAj/E00kg
 cpEdD/9kDTBHwwsLMzCluvZCQG+MVWx7VHsDr/2TaORCXi68pKGY8svhOAB48NGv5nUCWkQbEHc
 Kep8Qx+rf3Ht1JHdpUoDJ5FwNbeYlPaXJhsQv967lwvTt5sAloZk8j4FYxxCP+HqbZ0oXVDmqNp
 ErPs5Y8tbiFkgUVjFiQ41LrPc8Shl7R9aIw0DKrmTQFSkfpRurb36KC4I8cE3bVD38+k/cEhuy7
 JHq0mH/1PKntoxIm+T7XPQ1tQSwlRCSuXlrnIRcwjvs3/T052qaJXNC1RkM8a51WIGLiHZR7cvK
 de0wjvU35VOGe97oA0JoqYgpQhLRkDjvbO5Wgah2pijoPq1l5pWezoxDTOU91TpC6bdQFRyCLtP
 rLISelPF7lCoUmiJeImxd5y9eEXMDMYLQcJ4Uz1aBuJbha+ki4bW0hR2jwcEdJ8BPTCobiHt24I
 PYR3XAF+4oKRyNz5ciwXz1RVH5drEQpzwOqFuFOENyc9HQ/9GtYriexYuNhrNfnhbxwCyigaIfs
 d+gbrJslaKwhbOEEp6dFOuN1oEkM1FJGBygGVTdI1GBUH+5UFae1d1Tk5R3g2HwWvJ3XIZnQO1P
 /IqDJz9Hq5/fYK5kqOz33UkK9zUidF1ewOpnoJTRfiKcAinFz3bN21ZbcqYmaN72MDgPHZMsJ9M
 /BTsijqnJE+U7QA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The panel operated in low-power mode, with exception of changing the
brightness levels.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index e69a28628b656..8286cad385738 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -92,8 +92,6 @@ static int sofef00_panel_off(struct sofef00_panel *ctx)
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	mipi_dsi_msleep(&dsi_ctx, 40);
 
@@ -180,10 +178,14 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
 	int err;
 	u16 brightness = (u16)backlight_get_brightness(bl);
 
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
 	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 	if (err < 0)
 		return err;
 
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
 	return 0;
 }
 
@@ -234,6 +236,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_LPM;
 
 	ctx->panel.prepare_prev_first = true;
 

-- 
2.51.0



