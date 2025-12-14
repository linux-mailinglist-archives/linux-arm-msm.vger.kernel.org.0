Return-Path: <linux-arm-msm+bounces-85176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC69CBBC0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 15:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2634330194F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4472874FA;
	Sun, 14 Dec 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2jzb3+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3127FB34;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765723885; cv=none; b=V/HB4SCTP9YxL+R9UAdduycdpx3sPKqcrToFZ9Qsz4C2IprkgC75JlTCYwWCwoi2d25vHtvXygcEKzhsLPpqDPXKIbRaQPgX4lqvuw330pCFmnAuyyOOCjZG7tunPsXBijlRAUCuYNH/fcuVs19U81iVKZL2nfPbl8XMKxOvqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765723885; c=relaxed/simple;
	bh=y6g28s3phfzONL8xypvhILPRsQq+kOTNUScBGxyoliA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8M9QI+iso7d0Z4zioYa7iP6ZZ8W+1st8Do6wMWmgiD6dD3Tz0830yWUKQEaejFesjg9N72gXH/+3SPdT9qzkLzUfCcZZWMqRR0XVRmW6GPh/jaY9uB2YeEY0vmAl8evPR3UNse05Zjixa1l/UwmGi2wXbtn7+8QyIH7FbZ1neM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2jzb3+T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A4FFC4CEF5;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765723885;
	bh=y6g28s3phfzONL8xypvhILPRsQq+kOTNUScBGxyoliA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X2jzb3+TYwf5fjkKcWQT7COWYLvPXd5QYahx++AoIQSiQuao4sI0FqJtpB3Roi337
	 XAJbdm+CNtWy/LdzQ+dsqxwlDeskdtfbtpOA9l1RWAwCbtNkgzxHOXBsKwgfsfH9/z
	 3WjNg+UT+ymyKMHHTuq2MT+rVcYuLCtVx2lBOgf+h0+asfrZFHRjVSKinkCL97uKd1
	 tSqYBXP9la7Q0yrc+WqHTC0ZtUdKV4xEOZtA9cXSO9zm9Nqv10O8pwjkJX5aPX8REl
	 klOnGfZQ7xEBf77i1UktEEI178Y2a4gtXgt5Qw68Dnby9UrICh1AR6S7skj945xjxR
	 cPh5JrGoKFRfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31947D5B16D;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:22 +0100
Subject: [PATCH v7 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-6-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YbTI5XGo+qxbSQavLlgp6RJoXiVCTloBAe66CkKZYwQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7qTC1H/OPi4BByKmzb/YGo7R7rApR6xKnC7
 YJp9FGXivWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6gAKCRBgAj/E00kg
 coeAEAC03r8OEEOW045uQdSp2uA8hHGcTxau6I+WgPfpq0y2kuKvJMUCk12J+qJT7ovONOzqlJ/
 EFQq0zNVoWKiCGWmtJZRJM348dIB9PDfiXTAaMUwLc5c5goVlSRuyWrOSGfb3dxwrLtJkOmbqYk
 99Y6qSxFFuV1HAOWw3sjehmivHBlkI9NcZUHbWl0/jwn3YvpukS44NGcR/AAg63mKR+cvfl1IwG
 Jxhh/3oNmLKKCSUB4FzOmf9Cm62xjC1KYpNkHVGwltj5qX8WW7HvqklGZHn3i8qMhXYy/Sbv7aD
 JDPeX8gGgSwaGaKGe9UchTei6qTynP0fQFwJA7a/NECtY854f2Ir571Bf/VI984sKh3wgcwD21B
 uVl25OfigYnFRj0/7d1ug5qFsdre1ACi6PLDmgGDaCdjJYNsSVpawfy/M80flg4BhITJTlpibeP
 z8Bxts0ICqGCp4dkSCFu5OFK6eiBUhRNiTbAc5xXuxkFFnkWf1eaLwlBNpvTStt/OYeGl3nQE2H
 dUdVSmg+shOE4laYnnx0Dqrtg/GwgMNr3NBsOzVwT9qpgszcpHD0jjGSV0yv8R4oA7cP88EB1wg
 O8TZxrRl3kX9nGsvPnnxw9xoDxWeyBuKGKu1Z6eOsBaGqn4gi5hz5UIgHlqLA4c0d6lwZWY0+uz
 OT40iB/VxqOR2OQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Cosmetic: adjust comment for regulator from 1.88V to 1.8 V.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index f9ec6e9b02c70..a5708c7d04192 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -20,13 +20,18 @@
 #include <drm/display/drm_dsc.h>
 #include <drm/display/drm_dsc_helper.h>
 
-#define NUM_SUPPLIES 2
+static const struct regulator_bulk_data sw43408_supplies[] = {
+	{ .supply = "vddi", /* 1.8 V */
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
 
@@ -52,7 +57,7 @@ static int sw43408_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value(sw43408->reset_gpio, 1);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
+	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), sw43408->supplies);
 
 	return ret ? : ctx.accum_err;
 }
@@ -134,7 +139,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	struct sw43408_panel *ctx = to_panel_info(panel);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(sw43408_supplies), ctx->supplies);
 	if (ret < 0)
 		return ret;
 
@@ -150,7 +155,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 
 poweroff:
 	gpiod_set_value(ctx->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), ctx->supplies);
 	return ret;
 }
 
@@ -230,13 +235,10 @@ static int sw43408_add(struct sw43408_panel *ctx)
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



