Return-Path: <linux-arm-msm+bounces-81692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB3C595B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CFA23AB2AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355C8359FAA;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n747TH58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE718359719;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056664; cv=none; b=EEjQkSOp73mjHzoWbEiUsoJglBivg8un/WcGQ9VkZORShHy7hMFIckyIGRnSzgqkd9KhAsNEafZbCJ/OHXEzy9sFJR6cSrSGKVs6tU1GP4k0ckQhJlOH/VNs7IyVo6mTTXaRobWH3JpTck3j0y10EzEGMlTLm0PIokzfA4DjiuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056664; c=relaxed/simple;
	bh=W8AFvq4nPlynSNPii3uZ58RgvdVO7lLIvRxVluTsVZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qe1U+UMYmKjaD/m8d++96u4q0r0/2ak8ryyrWNgNAbfal+nlfD7G1JyM5Zz83iSfVSkPbgaYkbgswSYEUfJmYExWJoANFsrcASsOCuTc5j547I/Ie4jBp9wf8y48VUqIo4nR9T0YSu7ECf/PYIBiktaL6hrZWmSzalxF/e4T0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n747TH58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67F97C4CEFB;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=W8AFvq4nPlynSNPii3uZ58RgvdVO7lLIvRxVluTsVZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n747TH585rRf+bD7610Oub4FWouf2az5JmCv/aDz1pt/oYhlM0r9ehplTp4KVsqJM
	 5+eWJTVgBUb/+mWr4ObPHyA/Ew1Ldhv1wbmVTFmINDliORbAWl/31OmEms9VEwUEqP
	 I57bIWSo0dU4HJuDPLr+hntQru2O8VqaI1gITIxOwtVVN63MN7jV7Ysbk+t1kuT1VE
	 GPILX2std6nqUqHMESCCzAoz9+iH17tU3lR+auBCgckwOXcubZjol4dwzvbtJPhKVY
	 moaClI+B42ZC5KwkyfQAvdFe6AwkcVndoW5nHCTRgoO4tn2jnQREX7eutovKF/CuEd
	 WRxUnJpVpHkjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB9ECD8CB2;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:38 +0100
Subject: [PATCH v2 04/12] drm/panel: sofef00: Handle all regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-4-e175053061ec@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mwo54CYnw7MO3Xycn85wubPyOShFMxI9iCM2JhaFHcY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwU/i5TRLIYYU3ANHTvpFIdyLpFU8Xx19TIX
 nVDhA2jWqaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 cgZ0D/0V1/PLjvSKzMRgKLRV28Ya1Uxmo4zbM/mZVaw6WJmrRpAZECmRyDaiYatgkWlGZW0IkOq
 kNAnvUHcHzNoAK7qyWfscQMIdNl3Ki+VEIWattnMQ9tuzqWPWMgggLGJ+VsYX8GOh0uF0nP9p7e
 LqSGxVXC/JdcpUZdZpttF0dsoaK9A8uQbrhCi9bcr8KDjAY9jcsvvghLjo6wRn5I/oz1RlDLMJM
 eZDNVBiJkSA0C/dqnLtrthEwGHsEvbiZSVeUgX4h3vC48R2fVFAQeOf2Tyq1EwntVTqnWIoNDLk
 CqdEOq7ciSRBO/1WMUnOZUsaJlWjhJ5dzdyknTrY9Rc7jJ2DoWbdxxZubPlD1oaS/Mremq01R4x
 DyOSa+RdzgpuFCglItzlK1wY/Qz22rjsuCJT9D+/cJ23bIUCftY/8tBHx/uqXXDWmhBW8f5niJk
 PFPSnPQP1xWbnuQOLo3bK9ERpiOQKlfZC79enX9RYfUsPpEPR84OzQ458DaZibHcVL0gQX3nxdU
 v1p8P0AwheScKgjU/sn66m7lnzCV3dYXIBizLKl0/HvcqQN7/aNZzA82dszU5focAIl6EiUHCnK
 MZQ7NRtk4yON+W0lyABx6Ncfv4B97tkBqutdBUaF60WHs1t7g5LmkYyqhMSeOYFXsU5/eghBDN/
 Uo5ZUxRTHcX3y/Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Recently we documented, there is more than vddio regulator, adapt the
driver to work with VCI and POC regulator.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index c88574ea66e1c..3097040e6bfa0 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -20,10 +20,16 @@
 struct sofef00_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
-	struct regulator *supply;
+	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
 };
 
+static const struct regulator_bulk_data sofef00_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vci" },
+	{ .supply = "poc" },
+};
+
 static inline
 struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 {
@@ -86,20 +92,18 @@ static int sofef00_panel_off(struct sofef00_panel *ctx)
 static int sofef00_panel_prepare(struct drm_panel *panel)
 {
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ret = regulator_enable(ctx->supply);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+	ret = regulator_bulk_enable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
+	if (ret < 0)
 		return ret;
-	}
 
 	sofef00_panel_reset(ctx);
 
 	ret = sofef00_panel_on(ctx);
 	if (ret < 0) {
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
 		return ret;
 	}
 
@@ -111,7 +115,7 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
 
 	sofef00_panel_off(ctx);
-	regulator_disable(ctx->supply);
+	regulator_bulk_disable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
 
 	return 0;
 }
@@ -197,10 +201,12 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
-	ctx->supply = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(ctx->supply))
-		return dev_err_probe(dev, PTR_ERR(ctx->supply),
-				     "Failed to get vddio regulator\n");
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(sofef00_supplies),
+					    sofef00_supplies,
+					    &ctx->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))

-- 
2.51.0



