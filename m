Return-Path: <linux-arm-msm+bounces-106986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDM/OJcPAmplngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:19:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273351346E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88425321379E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E802472771;
	Mon, 11 May 2026 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gOiN3aSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F09D47798B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517676; cv=none; b=YQ51sOpAJ+4gmxTUDSIAzRM/faFIP5bXvTsa+lWNbxEtwQlsft5DK/OZyhTUBMItSjezaAZnTBWhSwrKDDbMNqfNKXBNPCUEwO+6vGfCnl+TXI16NZHueVe/Zdq/Dk9alKF/XivcUS/4AXPZsawvza02C/kEhEUKe/nmTD3d/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517676; c=relaxed/simple;
	bh=GjaGlWYw5vi3RHQoYU2e2g/mtlTAGA3+eYoNefZUjpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NC6zUdem3yGGhVYC8n+Exx0SBrX+o9qX2ANMXwjBNcnqB7rL46t+uBaz7FQ2tcw7tGmmBpKB+rNrxLCWfz7nF31SS5111mwOZ+A0rTnKhQMtzGrNJxdnAP0D/LgUPdHuEMcLuQu231oTJKStfr2urI0os1RP0+3xdIKwCK/iKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gOiN3aSj; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB419C5E154;
	Mon, 11 May 2026 16:42:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A19660646;
	Mon, 11 May 2026 16:41:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 027AD11AF9F75;
	Mon, 11 May 2026 18:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uL1aJPopaCnPJg4xAy7YfNqjGDLGk+EbewEWLZewSaY=;
	b=gOiN3aSjhfH1yPbLvUML80A9+drIOn7gLEwgNryNYOO0TqERHvw5jcbzAeimfWNEbSaHZB
	/ffzmDPItoBuZ/GhQ+45iRqFD619dCZbFuwP9BGsmOEIMH/YnSlfCD5nn1uZl+IqB4v0DW
	WIxBmdrDoBEE9s6Q3VU/0/wAvb5ifdycDWspERq23hpVOE3snWWe0+GGbGdlZbevr1mS/A
	E4YFub+tCSLFqW1s/sjL8efLYUabrjNK+hZtsovDbr3DTMi8wVxMJ5RCFJNieHBkmxCMZp
	ooHT+OILaLWrWo60yhB9XVVEYhuZ4RjZHtpK51u29VZ7P3L3uJj5gdTD+J3EFw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 May 2026 18:40:14 +0200
Subject: [PATCH v6 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-10-f61c9e498b3f@bootlin.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 4273351346E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-106986-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- fix missing assignment
- simplify error management code flow

Changes in v3:
- fix ERR_PTR deref when -ENODEV is returned
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 05bd31fe675b..7fb11b0a44f0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -353,7 +353,6 @@ struct zynqmp_dp_train_set_priv {
  * @lock: Mutex protecting this struct and register access (but not AUX)
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
- * @next_bridge: The downstream bridge
  * @test: Configuration for test mode
  * @config: IP core configuration from DTS
  * @aux: aux channel
@@ -385,7 +384,6 @@ struct zynqmp_dp {
 	struct completion aux_done;
 	struct mutex lock;
 
-	struct drm_bridge *next_bridge;
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
 	void __iomem *iomem;
@@ -1494,8 +1492,8 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	if (dp->next_bridge) {
-		ret = drm_bridge_attach(encoder, dp->next_bridge,
+	if (dp->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, dp->bridge.next_bridge,
 					bridge, flags);
 		if (ret < 0)
 			goto error;
@@ -2461,10 +2459,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	 * Acquire the next bridge in the chain. Ignore errors caused by port@5
 	 * not being connected for backward-compatibility with older DTs.
 	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
-					  &dp->next_bridge);
-	if (ret < 0 && ret != -ENODEV)
-		goto err_reset;
+	dp->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dp->dev->of_node, 5, 0);
+	if (IS_ERR(dp->bridge.next_bridge)) {
+		if (PTR_ERR(dp->bridge.next_bridge) != -ENODEV) {
+			ret = PTR_ERR(dp->bridge.next_bridge);
+			goto err_reset;
+		}
+
+		dp->bridge.next_bridge = NULL;
+	}
 
 	/* Initialize the hardware. */
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;

-- 
2.54.0


