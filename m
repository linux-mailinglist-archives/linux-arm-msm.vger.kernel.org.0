Return-Path: <linux-arm-msm+bounces-83321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0CC870E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A15364EB8A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 20:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BB433D6EB;
	Tue, 25 Nov 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSfn75sV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D054333D6C5;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102580; cv=none; b=YB4pD6Z0eZ+gmKMIxsCmYbJhyFdY50du1ft5IU4mQpl7AYjeWnMsWIIOAkbflzeVP1rlHg4JLnhngpVH/W3xkGe/EDROMbUs/Vl1bW+PtDvRhWq1XCqHx+BBkGCHy5M8OOtvW56PG6Ow2KqAwkgGV4Z6KzU0InzhU/42qyZWOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102580; c=relaxed/simple;
	bh=qNgWaqY4KhF7przmeZAYVs7NPYD2HsaRf0vgTyEOJj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dd8gSXOGkOdAR68gmDAqkJOAR9G7iZbICclaGYTSaX597usSeKXKOa6lQbso548X0ashNPxTzskh2Jdaq3U18xSL0l3Uqrvtf579etoyaGagS2ljhTShS2zwipVZabagEuYGR7+14Ye8yW08D9+i7M/QC/vki17esA8XmNmtdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSfn75sV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 879CBC2BCB3;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764102580;
	bh=qNgWaqY4KhF7przmeZAYVs7NPYD2HsaRf0vgTyEOJj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GSfn75sVjrQpkBGINNpkWXTRBADWc7TlxpNsk4NLPzalaSnP/O0ZGhJt6RrNYks5I
	 SyLXdXeRNn+bTynZPMUMO3duRGMolixVutVJF38nnTgla7DWfv94xk3Iqv/dUY2Q3W
	 hfLEBJZbD3auQLaTHF7M2w//wuRGQABi4uw8Mc36I3wwmNRTTsoETuGMD8xrJjP0Og
	 Kc3b6Im3BOs3y/SaulvaaOIyUzlPZqwf6KUeUrfZv7B3iIzwn2h1A/w7wv/NufxQ40
	 perjM41vm2cSkPJSV9K92yXP0qWssdKPOctEoPC4tZZLVkDMENdJwUGPG1ADvDUJIM
	 zbvpYP9uwUlfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF0DD0EE1C;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:41 +0100
Subject: [PATCH v4 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-6-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=z2BVlN5eLQ7nepliJH9alcT8XsQGC1VQMhLNl8EZrRc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGyBvqd8X5hGiNCHian3O8oDs1eGMAqgT0Mb
 YWIlwuYoCmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsgAKCRBgAj/E00kg
 ctwwD/oCjfjVb/cgz1+DjMv728TliEv7xqkvcASOJ9uUzeONLIaW/Q0YmDGspFlamWcRYIPxjcC
 kQoigAbLNKUhvnxGGNChEQhg4HhKPqkTngvOEqChkzsxFmBUiqL2FaFB4zqZuxGO3k2sN/twf+Y
 44B3G8xicJWnf/1hTdfKHBU0LRP0CpAmXmIHQ/0VdEGaRAhKnnZP/wTC3ifUIXOryBbjs0ncBPt
 pjhJYsDoD+pKZKIUYxeeevUZLldtxqU1KguPYozSbZ26JrRyLkNqZjC//UxqItmGiL18fsGr8jr
 CcQ2yWQElgzeX9P/zSJHqhPojdaRadXJunrUvmJYu6HZpdbO6C0wYMF0i92IXDC1XiWnfH4x9vS
 PIe5OS12ajrxfFi5biQAxhd+5Kh4Qh2djxr2MsDYw90f/bd6h+F233mV/1a7yFD/IQ/XNBVrvEG
 tsyBjTpTW5179iBFYodwjYHloC2Tqjb9Rc8P5EBoZMQSSm3EBtjjUdt7MhB7tn0lwu4kzBL9KvB
 2yUxF+Py/QdfAJa6ZGvr0SGNG+EHLbwMeqQ11UpQp53Tlo02b6vxbvgU1b4Q5q7z8i+LWD1ZkFP
 L0TPnZ90jpxaSPHZW6WDqwBbUmmKuPqm+VtGaL3Kr/HIbGeORtf/r4X1xlzu+XUYYB13KhjpCGU
 4UNy0NhEDC7bbDA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index b46599a0b957b..b147f337a7861 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -20,13 +20,18 @@
 #include <drm/display/drm_dsc.h>
 #include <drm/display/drm_dsc_helper.h>
 
-#define NUM_SUPPLIES 2
+static const struct regulator_bulk_data sw43408_supplies[] = {
+	{ .supply = "vddi", /* 1.88V */
+	  .init_load_uA = 62000 },
+	{ .supply = "vpnl", /* 3.0 V */
+	  .init_load_uA = 857000 },
+};
 
 struct sw43408_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *link;
 
-	struct regulator_bulk_data supplies[NUM_SUPPLIES];
+	struct regulator_bulk_data *supplies;
 
 	struct gpio_desc *reset_gpio;
 
@@ -59,7 +64,7 @@ static int sw43408_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value(sw43408->reset_gpio, 1);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
+	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), sw43408->supplies);
 
 	return ret;
 }
@@ -152,7 +157,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	struct sw43408_panel *ctx = to_panel_info(panel);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(sw43408_supplies), ctx->supplies);
 	if (ret < 0)
 		return ret;
 
@@ -166,7 +171,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 
 poweroff:
 	gpiod_set_value(ctx->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), ctx->supplies);
 	return ret;
 }
 
@@ -248,13 +253,10 @@ static int sw43408_add(struct sw43408_panel *ctx)
 	struct device *dev = &ctx->link->dev;
 	int ret;
 
-	ctx->supplies[0].supply = "vddi"; /* 1.88 V */
-	ctx->supplies[0].init_load_uA = 62000;
-	ctx->supplies[1].supply = "vpnl"; /* 3.0 V */
-	ctx->supplies[1].init_load_uA = 857000;
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(sw43408_supplies),
+					    sw43408_supplies,
+					    &ctx->supplies);
 	if (ret < 0)
 		return ret;
 

-- 
2.51.0



