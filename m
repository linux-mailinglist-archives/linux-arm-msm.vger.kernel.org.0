Return-Path: <linux-arm-msm+bounces-81699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B22C59674
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4DDD4F5F64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F19135A941;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqEKKmzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7535A127;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056664; cv=none; b=gTO2tZyGgK2+/5ImpmZ925aTDQQl+v8bVsRq6f1xNnThEPyUB3OQF9+kt6Hnhpenf8IDeGyHqN7/mhzjBGB3p8zUjxtxOfU+pmAuQh5EGla/W1spXTNvUydSjgPRCDYlCA53D5LQv3sL7izkHPraPZ3+ZAe0rQofIv0pSx7yH7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056664; c=relaxed/simple;
	bh=xUj1dYlPEPYwm2kV3Z6N6ZbHCHuvd0TDb6H/1rnGsts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KjwZjjTAHCFnldTJjuu8y12hlVDv1532O8mTbAqchsw1w8ETWzhfBIDqxMbGW09lUzfkjHGGKqzTYHZRhmwJqPjUfdZQrDbrkrs9zIB5My1j9dpNtpq1hfNfmPaWZMDxBVa8LkWpyA2tMdPQ2Tdh3JIPWhwcdeMNpYSmjNLekyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqEKKmzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5D0BC4AF0B;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=xUj1dYlPEPYwm2kV3Z6N6ZbHCHuvd0TDb6H/1rnGsts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QqEKKmzf8l8no1n+OwzDo2VCY+m/2y3beLwyGdsvutzRrRtLj79Hp+yAKIG+lC71T
	 Bidy2+cl9ZKc10L6q+nT6zSLHLm4ioiK4OCGReOybfINpFaDEKFujPe2rpoOeF107M
	 wWp5Fr4Tdh9z05dIU2RsVOFYRfZ4qF8n5Kq7fe1EJrsIUMdLoBz984INRXnW1SUOqe
	 3iGlFRpFT3/t6r0TcM3d3k9AsnBVwOWzhomN6EkChXnpxNDz5UWbGN9/B6ia0LqFbk
	 7FE6HJSAhneKYzyY8Wyk2BW/7Jd6GuGiDmQ01D1Wqjy+5q1HXxJUIlMrQeiYzSPMk3
	 MLYvXVR8Ng/JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B60CD8CB9;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:43 +0100
Subject: [PATCH v2 09/12] drm/panel: sofef00: Introduce compatible which
 includes the panel name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-9-e175053061ec@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=M9STxFOLgg4Zium2zG4uC3SLMrSpuJlpn7X6CzXpmTc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwVQ/8nXWi6K7GnvwZyzFNJteNMpJQtpCVU2
 4O8dGk/9yKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFQAKCRBgAj/E00kg
 ctibEACJRajzKlRPa0TDMeJPxo3qOg7JXlDXrnKIE6HPhSkTpARjokYkkgkM1X45ZNx1LCgWsoy
 fecDxr73NUD3BhRQfQ24aWmDO+F97mBgoMAARIDHHzGDezmX8eBnlZNPs7Rwbrxzv2m+AFnoOSp
 X9qgXLk14Prvw96FBvUQoJC0D/YnjSR2eRzarCqP5cgKrBDmw30hC1yKSiDRf1LfEEAZsxq3/X2
 WgZaNBIyk3FyYtlb0f+Q8CUGd68sTYlOmfsBf0wKyCBcM836A2tRLizvZhLZECqEDCKCatdCc44
 I3EOGHWgG8k8lE58nWgXUTKqJntwaLMWesx7S/8eEBlLT9F0J3tOsZFnxFgwK2xLk0u0s6e9E/H
 8kmiJU9t8orrRE6u9zFp/jp2OJ/H5TilbssmBF68csa2wRgjzmcB3PFxZWGCgrbNT6JxAUk+/TQ
 AfMUewJFrhCvpAq+jgKifyt8MiJBdn9nUDRFYfwmV666qxhrvk16Cgeo/+Fd4J4xpRYz683sigj
 p0JbKRqYucomwDnMyeyRiYeGQnZQI5D8aaWU6aKvM2EB6H8CUCR38DUDWFSIRU6ZlIZnCL0M/uK
 SpfMYdG9Qut4jHSF5Rcqz21Ycfdq8DhLWBvErInYSztWel3YfocCZmxPrXvbLU72Syes3+J8UeA
 62fXbBeOFYubHdw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Compatible should correspond to the panel used and the driver currently
supports only AMS628NW01 panel. Adapt the internal driver structures to
reflect the name.
Original, not very descriptive, compatible is kept to ensure compatibility
with older device-trees.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index d1e5340d7e337..7947adf908772 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -141,7 +141,7 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static const struct drm_display_mode enchilada_panel_mode = {
+static const struct drm_display_mode ams628nw01_panel_mode = {
 	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 112,
@@ -159,7 +159,7 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &enchilada_panel_mode);
+	mode = drm_mode_duplicate(connector->dev, &ams628nw01_panel_mode);
 	if (!mode)
 		return -ENOMEM;
 
@@ -274,7 +274,9 @@ static void sofef00_panel_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id sofef00_panel_of_match[] = {
+	/* legacy compatible */
 	{ .compatible = "samsung,sofef00" },
+	{ .compatible = "samsung,sofef00-ams628nw01" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);

-- 
2.51.0



