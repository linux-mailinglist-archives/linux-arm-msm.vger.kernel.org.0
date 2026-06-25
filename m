Return-Path: <linux-arm-msm+bounces-114489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7bGGJxr2PGoxvAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AE6C444A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Xz4c2sW8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114489-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114489-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3364E302FA2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06B739184B;
	Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A22C1595
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:33:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380036; cv=none; b=SnygPzB6xTt4qg4my0r5ZbH+FDq0fN5FIW0z1zOKYDkUKl6odzF8KhVsPlMgC9UlNOilpreMyRC2WkI3jFElb2LKDtQMRcbkAbO6arWihYqNhT56Lu5RVslCmr8z9CjodaZ2cJNUlnBagK7Kgu4A3nsV/1acYEftT7o5ZhHQ+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380036; c=relaxed/simple;
	bh=f5/dVqkaXjhX6dtp61tSmUjJiQd2J/ejrflXA7Mzdjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrAPgT4faVNj479M7jDSxLK60cdFn+W3bJwfLbls1DgRIj4aR0IDok8XW+0T/L2/J30SLPIWgb7TAEQlc+K/fKGGZLhVuIa38oqY6o+7vhakv/CwsbuYYJ8qhsJFlD/opawvU8NFFruSI6phWmULmtwyXwp7ebAbvCo/sMLDs4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xz4c2sW8; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso12909875e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782380034; x=1782984834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oX956Ovy0cEzFC2KbieHkOQE6+VfzcgweLx9ANa2s88=;
        b=Xz4c2sW8kwITg3xlOCpjPnI3onxL0t5GuEd7gsnMHmZJy9sumInNh4J/TWUxyRz0IH
         SN/Yno/Yat1TIzevsthk/BXUMRnVEATYvR0PSQHxsoMSOG+wk485aNIgL8APv4ByYgpt
         e5JkTBc0jVXvUem8HFDLzfwg9DXHyneY5twIX+KU6ZrZLc5SVckXEdQ+VghICXmGQECY
         UvbecFCaB7Qn2MkwGDq8Ff6mED+H19bmHVpL8+Y0XU79gHHtqhx7Pgow7uRbgDZFhUih
         mWtfWDh8vUvZB2TGhAc6jMJxZrJ5WNRNwtO7nONqKZTEFArsiz0igfazXN8AigEDC//b
         623w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380034; x=1782984834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oX956Ovy0cEzFC2KbieHkOQE6+VfzcgweLx9ANa2s88=;
        b=YlnbpwlUrRj2H4pccdfgM3PHHcfINl7yyjso8R6zKyNTFkEEq8gSAa+P6HbusQmQoN
         R/PE3uh/c+wxxZunVuo7Jn5tZaLVd+i73lxZdBe5rVdHAoNloqynW+HicgtbfUShSUVp
         14LOVR8DHCW5cGSukR669HuSqnJlG+gRgPgODOy/tvdu7c+BWpwlLgLoS+U2wL2qorBH
         jN3tE+bENofUSV4A2k7Vw8gy6nN9/zHAzlP/YYaIwH1kTVTJBjQhtjJA/sn5xSE3k/zh
         RT+EF6b7qEbIf1kDE8tXOFZnXifS+aG+cXKrD168HPbEc0Ruh4YaYGY1wvbEubbTamXo
         Cbig==
X-Gm-Message-State: AOJu0Yw0m66Ok0tv5reStejhIr2Bel7awCKG8JrYjXE3oeaPQoNLgLxz
	EQJIC+yBZXJugEJtbhTGp+0OjnIINCZk9R/BthqwUCx5oS0vCO6eKHLF24PS91OsMQ8=
X-Gm-Gg: AfdE7ckfMolz/974jxkp5qLFnLJePD8iYNW5A6qLiKBBx90n3iKHkfZ5xdveNV6BsKR
	+dQ2J92TNifkME68oVkk7kSkcFbRE/kMo2cNMFPE5VeXHhreKb7EWQXZpJLXW/Lt7GZ4Pa8DJQF
	oDhKdmoe7HZm8F8PVDo3pZ3CYO+pCfucKeAa9/tYD1ym0JBqJ4oFcCHNb15rYanf2lrGtC1SIm0
	XEiStYdtx4GvNPIfS2bBfmdjDHakZmpcZFuUsca4RLvNcLzlaROEUyLmEJIXR7y+v8uUKEDlCHj
	VrDxzUggwsdL0kmY3UdXCrNBJCNgh9GsVURvQSKtoJX+3SZd2kPcWzh5S+lh9Tp+8jw5ioy70C3
	usysMh5ITBPynvSdh+w82bCKMr9gknyISAb6vXxi+v/yn1BmcnyBXs6Jzp6dPwxU+/oNfeXE+EU
	UOsWTjFKHnl7Sz7uUf2GcQfjCY+yn7btmVW/Pg1zINatV9
X-Received: by 2002:a05:600c:3b24:b0:492:3fcb:22fe with SMTP id 5b1f17b1804b1-492668551dbmr24085265e9.1.1782380033508;
        Thu, 25 Jun 2026 02:33:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660a32ddsm40154745e9.1.2026.06.25.02.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:33:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jun 2026 11:33:49 +0200
Subject: [PATCH v2 2/2] drm/panel: visionox-vtdr6130: switch to devm panel
 calls and drop remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-sm8x50-vtdr6130-dsc-v2-2-cd375ef0e0ce@linaro.org>
References: <20260625-topic-sm8x50-vtdr6130-dsc-v2-0-cd375ef0e0ce@linaro.org>
In-Reply-To: <20260625-topic-sm8x50-vtdr6130-dsc-v2-0-cd375ef0e0ce@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=f5/dVqkaXjhX6dtp61tSmUjJiQd2J/ejrflXA7Mzdjg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPX+4aHjc5CmtFTizCjgBxTKEob1ERvbC85IMHIR
 Ho9pT1GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz1/gAKCRB33NvayMhJ0WWIEA
 C2I/K4cJOYNlTJAoydIMSupmXrYbACAnfJSnPE+mAZTP6xwzzZjhEckIrF0Ng9aFo5Lz3S5ZXsRwYp
 wLunhJs/yDYOIgRtS3I6uTtNKMKb1X2DrQPOq8SwAUYXS5jNzfMV6Aukcxe714oOkXsWbHYM4Lh8tY
 Uv18is9Lnm2ycCicd47KMKwQZHlQ5UtkTJ3pyDBB4MIPJN0eBnQFyB3SdoAhGuQ7MDEpdH7tDkBVbP
 5RXxU97wRI5kfH/BcWpS7BR/If+oNuD1+9wbz6Ge+SD94mJql+2y7rvE2m8+RoAkZne8HYVQ5lrZut
 dVq3Nefi0RACJMZ+7n2w94B1jn8lCNtGgmqW5TigUW9ovVv7wnwdzECAlUX4O9DKEpli+ggkCg3zJq
 sVw9/UEhn7B68y2G3o2N7VD3Q0o7DgJKnZ7SI+KeJ42RmXa4g8y5faMHZELEANBW+cmMMKIa82+HJH
 lbq8hrcM1UxrR9aIeAqJKxPj6zTMQ8mxuPRAK5+JK4kg7JGX2oZ0o3sOgpKxU4UObTxZh0odfJWdAk
 0E+/OvG53z1NEGFwlCickOiZ4ocEm+tLidYw1HzLv8biBTzVY4JX6gKpXPWhgvi7m269hA6lB5M6l8
 8es6hztZv92h0Vl8aXpaczH8UB/S/iQekCu7+tpkOMN60gx3EmneIUgjz6Ng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114489-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C49AE6C444A

Switch to devm_drm_panel_add() and devm_mipi_dsi_attach() and drop
the remove() callback.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 0cdcdbbc766d..6733e0e1d061 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -298,28 +298,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
 				     "Failed to create backlight\n");
 
-	drm_panel_add(&ctx->panel);
-
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
-		drm_panel_remove(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
 		return ret;
-	}
-
-	return 0;
-}
-
-static void visionox_vtdr6130_remove(struct mipi_dsi_device *dsi)
-{
-	struct visionox_vtdr6130 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
 
-	drm_panel_remove(&ctx->panel);
+	return devm_mipi_dsi_attach(dev, dsi);
 }
 
 static const struct of_device_id visionox_vtdr6130_of_match[] = {
@@ -330,7 +313,6 @@ MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
 
 static struct mipi_dsi_driver visionox_vtdr6130_driver = {
 	.probe = visionox_vtdr6130_probe,
-	.remove = visionox_vtdr6130_remove,
 	.driver = {
 		.name = "panel-visionox-vtdr6130",
 		.of_match_table = visionox_vtdr6130_of_match,

-- 
2.34.1


