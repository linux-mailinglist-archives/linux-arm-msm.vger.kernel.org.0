Return-Path: <linux-arm-msm+bounces-104924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGSSABmE8GmqUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:55:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7C481F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AA2A32469B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3506D21FF30;
	Tue, 28 Apr 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MaVSKeYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609837AA64
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367800; cv=none; b=apFnp7WIBig5RAWn/zsL9EpvIotm83oBARYh/6ubG2J5HuFOLl4xKUn7U2rDB+Yl5akNaXHc+BLZDMWgE4HWxAWhU2asQZTe7Ohal60zMKEVo2i1p78mQ+zZjsbs1m9Uxx5LZ3KuM+T0ScHIdaMzd3D0II0r0/jQy86Jn/R0/Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367800; c=relaxed/simple;
	bh=YOqKGCGYp/FPjKihl+TaQcNK6xqqvXv42Qun9EK7N1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EckR1ni6ZCq3sIRMweAJCFy2tDiPgkdfofgkw3sy3HMs8cKzU+e8pFzQA+oAt2tj1+BBugjyf4S/lvdQqoSI4SaB0JA9yyMmFj8LC4J0luDKW7oaERH9E79Kb2emITT5SB9QjzTh3ynN1QgNpHjZ9hSwLCVrOCtGCNQ1t1qnhz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MaVSKeYa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8A5821A346D;
	Tue, 28 Apr 2026 09:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F203601D0;
	Tue, 28 Apr 2026 09:16:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7546B10728590;
	Tue, 28 Apr 2026 11:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777367795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IlJi1iPD8S3oBFXTvLf+zpfxjc4D0IFZgnv6l3mfmfw=;
	b=MaVSKeYajeSg0mjQmkK23UyHedLfCtcWDtHNulWWFnN/GaUA93w2EcBTepHCUIehlMlaSZ
	+pSV4VJjBwtyXg++gWiuRggf0cSn3XutaOG/UZC5EpaiGWkQOOEz0aOw0AZs+uJKq5bFI8
	A/CgaNVUQUhfJU+/YAO8X0hrbhbE2p1ygVci6NWQ7+pMF+qj2YtCkRRBmxqh2Ced9lQhgI
	6o9GqW+TOREV3f0TO5qfS97IuiHQuxsgLW3B+J8QCsuiWvf5h1YkGplyTM2NyjSvSIsaqe
	iEQxTvuttQ7gFZUPYDANE/Vs/N0ctx5L/50A5pYwFihjtMMxh7a1n1hCrlfx5A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Apr 2026 11:15:52 +0200
Subject: [PATCH v2 06/11] drm/bridge: lontium-lt9611uxc: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-6-4300744a1c47@bootlin.com>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8EE7C481F78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104924-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 11aab07d88df..9427cc2358ae 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -35,7 +35,6 @@
 struct lt9611uxc {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 	/* Protects all accesses to registers by stopping the on-chip MCU */
@@ -284,7 +283,7 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 
-	return drm_bridge_attach(encoder, lt9611uxc->next_bridge,
+	return drm_bridge_attach(encoder, lt9611uxc->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -487,7 +486,11 @@ static int lt9611uxc_parse_dt(struct device *dev,
 
 	lt9611uxc->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
 
-	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611uxc->next_bridge);
+	lt9611uxc->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
+	if (IS_ERR(lt9611uxc->bridge.next_bridge))
+		return PTR_ERR(lt9611uxc->bridge.next_bridge);
+
+	return 0;
 }
 
 static int lt9611uxc_gpio_init(struct lt9611uxc *lt9611uxc)

-- 
2.53.0


