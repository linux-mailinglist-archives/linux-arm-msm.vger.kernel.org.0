Return-Path: <linux-arm-msm+bounces-102961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFjTGOf33GlaYgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:04:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4F3ECED3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E53BF305BFC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64522A1AA;
	Mon, 13 Apr 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z/IAyX3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB243CCFAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088735; cv=none; b=Ckeb/BCiaK0y6EVKO64gHwcD3Cfeh8DjHWI8LqoitR07bTjbR4bglrMjGFkZEt5k61bwj/j9Q163AQDuaFnE2CQvW7w8IxREHo9pcwNI9sicxytD2oGlQdPhKHugIRfOwePjTHyAGO2H/0eTPPxNnglizvV5JvCkSxnC2PK0ANo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088735; c=relaxed/simple;
	bh=IzAiRtkh4t4ltosBZsCDPr1JizG7oMevwo3oXr34XiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHp23g/OHghsMNwcN0+hUc4jG3Si6He5gcO+CZ+LOKL9yzLj4m8z5uh5niOEQfP0qvJkFQkJeKvZj/E+xqy0mU9px/LJ/Yt8Ut/rSoe7lOuUQG9k2FxoletO34BkZqBgclKG6TJlfbDDgzDWB/ibwCc5zjr7giEnbRdvB+VMyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z/IAyX3c; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66EF4C5B1B7;
	Mon, 13 Apr 2026 13:59:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4FA75FFB9;
	Mon, 13 Apr 2026 13:58:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8366410450084;
	Mon, 13 Apr 2026 15:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6uVyC++V1UmVV258SySNjnH/QWEzHB3vGKW3rS3VhpE=;
	b=z/IAyX3cr6ydhmF+62EMz8NfkSsjebBn7/omwngWBm8Nn4uyX7nYklonTQ5fXdLL5QiOYy
	+1THmm5QjgiJqYt3Gx6EHZqO1sYrGB5+soslEjRulOl7J0x7FLcZRIV7rOcXvFvfvjQPS3
	WpTDOcLtHwMq4fovz2LnVZRTWM3zCfi+WcZwtPZkqWq6hglUMRpXS6gA+3cjLhRjk/EjWx
	+ENFvJi4VWk66EXtK3T72MsaL/pERdNNZTfe8S9pK84OG09lOVXS/NVr5a8rhwY120mzk2
	gWIkuNkFFsjLlXjxZerjx1HbvuXqJ8hxOjxcp8YXLCaId3XpvSlQWExCz5zH5A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:33 +0200
Subject: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102961-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: A0E4F3ECED3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
into the @panel or the @bridge arguments, thus making a very partial usage
of this rather complex function.

Besides, the bridge returned in @bridge is not refcounted, thus making this
API unsafe when DRM bridge hotplug will be introduced.

Solve both issues for the cases of calls to drm_of_find_panel_or_bridge()
with a NULL @panel pointer by adding a new function that only looks for
bridges (and is thus much simpler) and increments the refcount of the
returned bridge.

The new function is identical to drm_of_find_panel_or_bridge() except it:

 - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead of
   of_drm_find_bridge() internally to return a refcounted bridge
 - is slightly simpler to use: just takes no @panel parameter
 - has a simpler implementation: it is equal to
   drm_of_find_panel_or_bridge() after removing the code that becomes dead
   when @panel == NULL

Also add this function to drm_bridge.c and not drm_of.c because it returns
bridges only.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  9 +++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ba80bebb5685..e51990b74417 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return bridge;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
+/**
+ * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
+ * @np: device tree node containing output ports
+ * @port: port in the device tree node, or -1 for the first port found
+ * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
+ * @bridge: pointer to hold returned drm_bridge, must not be NULL
+ *
+ * Given a DT node's port and endpoint number, find the connected node and
+ * return the associated drm_bridge device.
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * Returns zero (and sets *bridge to a valid bridge pointer) if successful,
+ * or one of the standard error codes (and the value in *bridge is
+ * unspecified) if it fails.
+ */
+int of_drm_get_bridge_by_endpoint(const struct device_node *np,
+				  int port, int endpoint,
+				  struct drm_bridge **bridge)
+{
+	if (!bridge)
+		return -EINVAL;
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	struct device_node *remote __free(device_node) =
+		of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return -ENODEV;
+
+	*bridge = of_drm_find_and_get_bridge(remote);
+	if (*bridge)
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+EXPORT_SYMBOL_GPL(of_drm_get_bridge_by_endpoint);
 #endif
 
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a8d67bd9ee50..ad93597cd622 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1327,6 +1327,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+int of_drm_get_bridge_by_endpoint(const struct device_node *np,
+				  int port, int endpoint,
+				  struct drm_bridge **bridge);
 #else
 static inline struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
 {
@@ -1336,6 +1339,12 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline int of_drm_get_bridge_by_endpoint(const struct device_node *np,
+						int port, int endpoint,
+						struct drm_bridge **bridge)
+{
+	return -ENODEV;
+}
 #endif
 
 static inline bool drm_bridge_is_last(struct drm_bridge *bridge)

-- 
2.53.0


