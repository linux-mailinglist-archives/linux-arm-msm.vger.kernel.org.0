Return-Path: <linux-arm-msm+bounces-106984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDAlKYAPAmplngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:18:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CD513439
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920E733B053A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7C843CEE3;
	Mon, 11 May 2026 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pqBC7fY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4A43CEEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517667; cv=none; b=EJez6mYlvNT4DKWqMo4WnF50I3X1hwCvQUNdfYRJc89DiKiA5zADEwagGkmz3NGxOqlhBbFUrKFZoEEnX23MyEeUsKphk5+oOxyS8n3lobczuG55chQJM2TsbfvvDRgbmWwvC9igeyGCcWJMeb3LbW3QpKjgsjxwCzpZGmvdtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517667; c=relaxed/simple;
	bh=PImxneyEgIrHYm+psJ56Xa0zdiYCyR1kOl96yChwY/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/k49MqXNSFrKmQQEteXjuKe9/JuZsalIuNjbTpIwkN42RAsEismtUVf5GfcJLjHBfBO4nxXa9g1mpeiy5Sal3FgGMgcmZJzqCjcaSvB1G8NEKiAjePFqu0xUo+ki0YCn+hHyOO3iA99wzgNEPp1mj54l+nYFFy0p9Xm07NSnTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pqBC7fY8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71398C5E156;
	Mon, 11 May 2026 16:41:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D33C560646;
	Mon, 11 May 2026 16:41:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96CA311AF9F72;
	Mon, 11 May 2026 18:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yiYVtzUlza0Qve4SSQyP8HkTKS3obvlG0k3Op32J9Q0=;
	b=pqBC7fY8RJy5WjC7w+vFEWyLDVMS/NJ+2jTnly/odIJqxFCfdO58ynT8kOfYhSqqZ4lmwP
	wVF753QdWrWi+v4CgnJWPb82Yq7KVLUsoz5hze8GKlB2ywhVhwgQ/0lGvHJFV4trxAFRFw
	P6lgCBhdnhRVIFOsEd6WI5YFjeT5uo4d1t/KDT2Vl7ufZTAhWMUEdKCUmXoWFVWllwp3P1
	SoKCU9SuF6TY5UbcxsSxs7OCvYVrIrYDpcxkVBp4WzoOIMdiw/oJ4BMj9RefGZ7/stP6dT
	rXOL3W9Lm7+n3k8LTDRIalec82LHVVbURhGnSRxQGx/gEfFag/VfQYQPDm9z/w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 May 2026 18:40:12 +0200
Subject: [PATCH v6 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-8-f61c9e498b3f@bootlin.com>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 225CD513439
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
	TAGGED_FROM(0.00)[bounces-106984-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,ideasonboard.com:email,renesas.com:email]
X-Rspamd-Action: no action

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- fix ERR_PTR deref when -ENODEV is returned
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 +++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 8be7266fd4f4..12c95198d9a4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -354,7 +354,6 @@ struct adv7511 {
 	enum drm_connector_status status;
 	bool powered;
 
-	struct drm_bridge *next_bridge;
 	struct drm_display_mode curr_mode;
 
 	unsigned int f_tmds;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 821a3008a1e7..02f8f7e78a16 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -849,8 +849,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
-	if (adv->next_bridge) {
-		ret = drm_bridge_attach(encoder, adv->next_bridge, bridge,
+	if (adv->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, adv->bridge.next_bridge, bridge,
 					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
@@ -1249,10 +1249,13 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
-					  &adv7511->next_bridge);
-	if (ret && ret != -ENODEV)
-		return ret;
+	adv7511->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
+	if (IS_ERR(adv7511->bridge.next_bridge)) {
+		if (PTR_ERR(adv7511->bridge.next_bridge) == -ENODEV)
+			adv7511->bridge.next_bridge = NULL;
+		else
+			return PTR_ERR(adv7511->bridge.next_bridge);
+	}
 
 	if (adv7511->info->link_config)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);

-- 
2.54.0


