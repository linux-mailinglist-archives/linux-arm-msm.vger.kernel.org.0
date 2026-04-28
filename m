Return-Path: <linux-arm-msm+bounces-104927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AghM5R98GlSUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:27:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D59481644
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A1323065A62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C7F344D9B;
	Tue, 28 Apr 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mgacal5Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771C341AB8;
	Tue, 28 Apr 2026 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367813; cv=none; b=jETd3DUS8+fOORVoTv8aOGlb7gkhZWUr1wN5+P1RincAJ//d/rGX5t2SPYa7Cwp6bAqmB6+kPRh2ke5hflOMqyw/dFOw8j08wS2V5s+uvkMjmsD0N2Yg+L+aAm2YCdYCRA+9/7DxJn/JPB2rKuK8VH0yaLoM3queJgFZ41ZbSts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367813; c=relaxed/simple;
	bh=JHW8LpWPhsT5GMoRfqiuOga5zuHR+fUpHLrUF2bRxz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czn4WffyEoALVRpDTVV/iKpjZS70eSjFbd2JscCO42MYW+FUlCPgDTdT1doEiT2cOXumEBRGaq+QCqhF/XFSen6nH3+hpAIUZgKSckiQ7ZPnCypRJzdvXSNqjNAouOFtrUm+q6j7rmsiHqeVKANHEnRuBsEt2RCoNYwgSbJdzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mgacal5Y; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52BB51A346A;
	Tue, 28 Apr 2026 09:16:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20804601D0;
	Tue, 28 Apr 2026 09:16:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D3FD10728590;
	Tue, 28 Apr 2026 11:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777367809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xj+7EyWtqLA0saxXZPBQMk+VDQw/UBk6Y4BSe8yjAq4=;
	b=mgacal5Yb6iqLeaES/8xPqsrdMbHUc060TKg4ybxIIyUf3IJ9wo2BKYImPvKE5m5n6IgY5
	OMXe4euPUcPIrEMklFmse7UFTd9DxpQBXwkxQykuqnPn+JUV1WMWgVKnQPA+XxoH0bvabw
	ba4QnxjPtXy8yMtt7j02johqpYjUdFokzD+G1mxSep2apMgQ1zOUHd3J2ZOV5eJhYaJumt
	lsHk2zsxsKuQGZ7xvGYRYiV/3YfH8Wddn0VefXkmiS0FBKiczGhr+KD87qnO8LGHGo8mi0
	AdR9FdheKBstlMb2jQQx5PcbCBlcQTfIrlGcyxh2Yne3IDmhjf7cJRqCLK95tQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Apr 2026 11:15:55 +0200
Subject: [PATCH v2 09/11] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-9-4300744a1c47@bootlin.com>
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
X-Rspamd-Queue-Id: 43D59481644
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104927-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8713sx.c b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
index 18fac6a46db4..cee485adf5e5 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8713sx.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
@@ -32,7 +32,6 @@ DECLARE_CRC8_TABLE(lt8713sx_crc_table);
 struct lt8713sx {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 	/* Protects all accesses to registers by stopping the on-chip MCU */
@@ -458,7 +457,7 @@ static int lt8713sx_bridge_attach(struct drm_bridge *bridge,
 	struct lt8713sx *lt8713sx = container_of(bridge, struct lt8713sx, bridge);
 
 	return drm_bridge_attach(encoder,
-				lt8713sx->next_bridge,
+				lt8713sx->bridge.next_bridge,
 				bridge, flags);
 }
 
@@ -537,10 +536,9 @@ static int lt8713sx_probe(struct i2c_client *client)
 	if (IS_ERR(lt8713sx->regmap))
 		return dev_err_probe(dev, PTR_ERR(lt8713sx->regmap), "regmap i2c init failed\n");
 
-	ret = drm_of_find_panel_or_bridge(lt8713sx->dev->of_node, 1, -1, NULL,
-					  &lt8713sx->next_bridge);
-	if (ret < 0)
-		return ret;
+	lt8713sx->bridge.next_bridge = of_drm_get_bridge_by_endpoint(lt8713sx->dev->of_node, 1, -1);
+	if (IS_ERR(lt8713sx->bridge.next_bridge))
+		return PTR_ERR(lt8713sx->bridge.next_bridge);
 
 	ret = lt8713sx_gpio_init(lt8713sx);
 	if (ret < 0)

-- 
2.53.0


