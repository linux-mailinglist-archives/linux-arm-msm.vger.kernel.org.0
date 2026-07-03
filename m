Return-Path: <linux-arm-msm+bounces-116218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TS3/G09yR2pqYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:26:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0B7000A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:26:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=QSmuKG0e;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116218-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116218-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69E0B30E0AC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF096371D15;
	Fri,  3 Jul 2026 08:10:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391073603D5
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:10:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066227; cv=none; b=LxEH0gtv+iZpNtYDtlPbekQGIvHzIpy7aGmN7aCN6q9VzhDtN7YR/I3HH1exlq/k3EsIUknZY6Ii8u8Z99QA7Vu9WqAhZ3H2+WtBQms0wfm18876PFnTKz4xD5Qk8jVnPlJBA2SIotoWJH0xDvj9XkJIZqIL1A1S5GaLE8XbHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066227; c=relaxed/simple;
	bh=Yyz8hVRuE/i71NBx8+ByVi/xmrQ6crnI+5L7v14sBCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyYKY+5YhiO3Bg5IITptMpu3CcY8tkGKu5G5WgIZVLoCkTXjIvrbtoziBhIySR3D3OeYHTHtld2k9d9I0i2E+gkCqIeYt4tztO3cfAjGMYPTVv54EYwIFczjBfvTUJfv7D1ylvzEwCril2Zktb/J+e6Ur26dIckGOpgNTwdaaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSmuKG0e; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-476a130c138so301226f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783066225; x=1783671025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgEZk0tfqjsFMjOWFQjsdTyTXUp3gCU0p3CTG/HdZ5o=;
        b=QSmuKG0ehDuF6ziivZRkhgYbknjVYiJlCnFaLfkFKuum7RQ6Rn3Tikr+Ena9NODwxe
         5GZlrY83LOGyH1Bm9EOYDn3Gy34kMo7wxDVkziSxy7hY2nE1Zunq1kUy5l3wqIMd02CN
         dQFizsFmp8Xb4oUjgem7cvaBlbsDv1Gw8Av4CJGVHG0KddjKv1PUOpEklutSA5Aqrohh
         CtJsMhFQozvrH0ONZ3vQt0oNdVZore9PWS3MfP0WXlRpmmUf3wYbeckbK7OJNOjYErgD
         xiYRWVtjhNidMPVSje4bID16NMdVq6FQr+FHP8TWZ7w7fp6jMUovxpaLFHR2TzPQxlUi
         /pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066225; x=1783671025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgEZk0tfqjsFMjOWFQjsdTyTXUp3gCU0p3CTG/HdZ5o=;
        b=S6EPAtHsemYv8o5g3bpcNxAKgRPx6/M7KH1mQ+qjS4yk5KHwtEBzHzvRpyc4j+jZsC
         MSuIuhy4YFv9rVFm+xR6IhE6Q4msi610hAQv7+QP/tOX2BNFnZ8R4IZQD7WyKiCp8hVG
         SI1vIAj63t6byAWZQVBTNlXQzgPLPl8xnKnVDZdxEMjsHPwOdLSN2TzUQ9osBEONnwXo
         cHS65Pn4BZ9/6UjkiXpYcNMs+GDAqdEO3L3vNFSNH0ZEz1ymdfv8S5kj11bXp1B2NU7C
         bG5+7djPq5R12ta9X5YoaKl+VJ0m5y0hJ5slg0Q9NZrHsz73KkwiIcjOXaIr5TB9tmPe
         eMaQ==
X-Gm-Message-State: AOJu0YxTVfs1Gbn5+7YJXyyYn1DybxfZbG7Ll6lQxNfBM030z1Fac13F
	c4TaI0kBF/h6b2pQaKLezWRr9tE7QBA7wR/TQRjVsgvc875+zIvv3t5E/6ChCnT18jo=
X-Gm-Gg: AfdE7clAAZC5j9Jde1a7VJ/or/u89gm5/RN/vItOX5wBy4faWXSAJ0l9tdrBCBf+8Ec
	UO1hdOIW/l2H6hnwlWVJwdlCMKeQFqEUx5MmigH/ZXRdXCLUJOOFY8NwlwGJc34DhEmE0TvZw4j
	/YC1GiBtzY+CcijVL24c0AUKhIooCgXgAtEJnS/n/GBHL6CHYuqSFNz8K5eXog4wpnXw+P97lpH
	ql8a31bAyHBeZyxf8bqQkdQoMTqZ1NYpt5B/550vznE0m3dprbdqsKQaByoYvmNZmex97i60N0V
	rxCsWAuAq9QR658oLrWrRzLAy9tSOIoq1PrSn07iH771IyjQHLYzHH8NuMkP3O+qDa5JlZStViD
	L8G/UWJff/jeDvEib1Ncc8246shRc6MnFuftc35rWZ3a9O2LhqMznTauTeiflkXznrwukGFwKK6
	62q1XEgRZAnnFkWOTMfgxcJCKhJCs=
X-Received: by 2002:adf:ea87:0:b0:472:8c12:b93a with SMTP id ffacd0b85a97d-477b5296cf6mr8758338f8f.28.1783066224462;
        Fri, 03 Jul 2026 01:10:24 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm14920012f8f.9.2026.07.03.01.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:10:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 03 Jul 2026 10:10:20 +0200
Subject: [PATCH v4 2/2] drm/panel: visionox-vtdr6130: switch to devm panel
 calls and drop remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-topic-sm8x50-vtdr6130-dsc-v4-2-9eff51ec717a@linaro.org>
References: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
In-Reply-To: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yyz8hVRuE/i71NBx8+ByVi/xmrQ6crnI+5L7v14sBCQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqR25t+puVMYVgPh8aSCdBB6rtM+sw3nkkuNmv/kpu
 kbcI/nGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakdubQAKCRB33NvayMhJ0WGxEA
 C2xG1iP6R2BDtrSwkYdjw1KkyFk2c3P7seAfoSeV3+huXSJUWyeTKbdbZ8k7XpZ6IyXrn6bWKWthmS
 GqA4fKQM0hufvCQJeFSqTZEjkYx5daqgLYbavvUYUmEsCDDgymFEVFdvW/kptmIiew/3r1w3tqYIP9
 SugPmDdtd+6GWKlL3NmNGJ6waGkTRl4eBGkRe9vB4ECHJpGR1CX7AeJ0zVe8a1GG/Akh8PQHWK8LBO
 ZrBmOmau4q0ptItQnvTFaIv9wDom5btSCvTFuJmdniNItbKAoXR6IPkWk6Ycj5770St4crUdCZ6eiO
 ed7h/flVOKrIt+vkuDnGxOvZAy5+7qMRBsVjYihCgdK32ACpcb5ItppjJEpWI7jWdelRk3ItQGnFum
 +FHx9CZVUFXhqOZaPghKXB+LLgsmIcBSTTUWzFx4+wTa4MOeDRqDVafA7U3Hpg9xkeBvZCfNGcN3El
 QPZa2vBSqpfiauaywcR8rAZH8iVPaAE/5BF7J8p5VFSQcX3Y8Ng3OvR8bhuqVLZ1WVM1jjaMtMDSE6
 pJzxoVymPmCIr8Gihm09jAQkF3OA1Zzqqutj56a+JsBD5vqpYdQhneyQrsqssipRNj8OcQ0sp6G5Se
 LocVsmzefRc6LAJHLyn1dPriCpsoBco0S8v2MVDe4vyfvS/6HTgIm3RB4/2A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116218-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04F0B7000A1

Switch to devm_drm_panel_add() and devm_mipi_dsi_attach() and drop
the remove() callback.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


