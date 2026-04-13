Return-Path: <linux-arm-msm+bounces-102964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGa0MLL23GlaYgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:59:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F743ECD4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACD983006D7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B8D3CC9E6;
	Mon, 13 Apr 2026 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="chKnbigl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859C3B4E9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088749; cv=none; b=G/zV9lByYFNqkZwNrTLIqeH+OdGSGLuroS7NQ2hKc6y0C7sQ0Oh7HBw8uDYYlzHiSHWAsuczyUzUkACswqKF4ReNMiYRgUKajwDlW+3NJDXjXtdZ/rljgYtqtWqH2XKj7TqW3PmBzvpXCbmF4rahnkB47FOYEbuDKG7X9xBXE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088749; c=relaxed/simple;
	bh=q+3Wa/i0cLxhGt/ADqXeaSLCxjlSeUbTXTV4vJedgx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFgSgmbsSUDp011hmwfUyqk4AU5sXNoxCLq91fbnpsxmzURDAv6gZMhF/cxMw+mYN1PMhSDeox4bxp+6L/+ti9ylXTWbdZ8MmzSt/aAgQOY4kZqygEoA1ZpjxszcB5tBEvCZls7JzI8Fs9Xi0E3OSkNrLhi49poRuH3GoD2obaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=chKnbigl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58BE2C5B1AB;
	Mon, 13 Apr 2026 13:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAD315FFB9;
	Mon, 13 Apr 2026 13:59:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF0ED10450D6B;
	Mon, 13 Apr 2026 15:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sYhi3Nb+I7sWL5lVCohKgjxEDi848Gf7O7ivbKSqnRo=;
	b=chKnbigllBAa2Dqu1wF3V4UOQ496ivaMFaGYeNH2JmfACETDEKTtV1SZj2nexfoCcxi63S
	wfcPAgeOMXkXJPuHpfNEj8A52fKAX5+5jhjKi9lpR6xifQ5KJBBeRhmAtcc98COy/XiKYc
	gPKfNTjsmbDgij7/cNM4jEUUER3EoEI5DDdkuzKTR5In1AiPGQj5x9zVW1u9YvEUoqvPQ2
	EpjvbdujkshxOfa0Do+OqNDLLEkgsNcw8XeTW1YCPgY8Jf0khyY/z/gQyMG/ogrt5jmgU5
	mss+Zzp7nUmwjUjfUohGbmdza4owDzOWRoc4HENR5QjdKEnOeOB4yEYtX3IDPg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:36 +0200
Subject: [PATCH 04/10] drm/bridge: chrontel-ch7033: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-4-acd01cd79a1f@bootlin.com>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
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
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102964-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7F743ECD4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 54d49d4882c8..1d14f62d2d52 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -199,7 +199,6 @@ enum {
 
 struct ch7033_priv {
 	struct regmap *regmap;
-	struct drm_bridge *next_bridge;
 	struct drm_bridge bridge;
 	struct drm_connector connector;
 };
@@ -215,7 +214,7 @@ static enum drm_connector_status ch7033_connector_detect(
 {
 	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
 
-	return drm_bridge_detect(priv->next_bridge, connector);
+	return drm_bridge_detect(priv->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs ch7033_connector_funcs = {
@@ -233,7 +232,7 @@ static int ch7033_connector_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	drm_edid = drm_bridge_edid_read(priv->next_bridge, connector);
+	drm_edid = drm_bridge_edid_read(priv->bridge.next_bridge, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	if (drm_edid) {
 		ret = drm_edid_connector_add_modes(connector);
@@ -275,7 +274,7 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 	struct drm_connector *connector = &priv->connector;
 	int ret;
 
-	ret = drm_bridge_attach(encoder, priv->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, priv->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
@@ -283,15 +282,15 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	if (priv->next_bridge->ops & DRM_BRIDGE_OP_DETECT) {
+	if (priv->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT) {
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	} else {
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
 				    DRM_CONNECTOR_POLL_DISCONNECT;
 	}
 
-	if (priv->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_enable(priv->next_bridge, ch7033_hpd_event,
+	if (priv->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_enable(priv->bridge.next_bridge, ch7033_hpd_event,
 				      priv);
 	}
 
@@ -299,8 +298,8 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 				 &ch7033_connector_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &priv->connector,
 					  &ch7033_connector_funcs,
-					  priv->next_bridge->type,
-					  priv->next_bridge->ddc);
+					  priv->bridge.next_bridge->type,
+					  priv->bridge.next_bridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -313,8 +312,8 @@ static void ch7033_bridge_detach(struct drm_bridge *bridge)
 {
 	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
 
-	if (priv->next_bridge->ops & DRM_BRIDGE_OP_HPD)
-		drm_bridge_hpd_disable(priv->next_bridge);
+	if (priv->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_bridge_hpd_disable(priv->bridge.next_bridge);
 	drm_connector_cleanup(&priv->connector);
 }
 
@@ -543,8 +542,7 @@ static int ch7033_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, priv);
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
-					  &priv->next_bridge);
+	ret = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1, &priv->bridge.next_bridge);
 	if (ret)
 		return ret;
 

-- 
2.53.0


