Return-Path: <linux-arm-msm+bounces-106402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PCKImWY/Gn4RgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:49:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F84E9973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF8E23093C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E283FA5C8;
	Thu,  7 May 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I70fN5yp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60389388398;
	Thu,  7 May 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161561; cv=none; b=jMBWUo5/R9PmnnpK9OGyG8Lw59yp3MnCb5SbV98v5fqYe8Emhh/5Sb/BKWS3BZgMfWDghvFWmosROy4CZYO38Sa+Ru/GoeqQ/7mRhs3FWobFwJ4sMxMaQ2kmuAllNCUV/eLwy0ZY7hO+lCvNADSWCxD+BjNmRr1ribhOqFMS0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161561; c=relaxed/simple;
	bh=YU4W10QZOyvlqiJ44v/3rj0oAfMtEBv8LCCv8Og1kCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfCS4OQ/VJ5/i6pQAgUWB7Xi+m11D/waMeXC0wQTOm8f5tB2Ya6L3774nfdsfe3fGnvgb2jNA9H1perL34Rb9qaTIz4eBwYYMuBV+NzMdTDbTB8i4K2ctIWC2xp+rbXm/xupvl5FqKOU+ce87mfy+1BJLaoVd6EHomGkzXGqxBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I70fN5yp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 171571A355C;
	Thu,  7 May 2026 13:45:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE06E60495;
	Thu,  7 May 2026 13:45:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2ACD108194AE;
	Thu,  7 May 2026 15:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778161556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtzP57UXUm85OPkvizoSGXF1wAN47TiL0RnGW2p7TxY=;
	b=I70fN5ypih0XjYhzsQvcof/74Ijv7zwpyhaaEfqKbQ/tBh9dsGEz1lmBOsajlDpOmPsQiu
	n4taQqavyWRH/IaRZm+efBklRheKiFAUP1vNI5NKRf5CxbQMA0Yn/0kMPIsUqplLE6dSTM
	frR4kS1nnVaEs3AuJL8gIv+grBuJBo2i8MxZPQD3VkXhu8c+1TgU1ihVP6M6bx7bUt9Mvt
	fs8GNKzmKCCgSzubZy8FO0TzNLBJuQMV0khAGrePDehQoXHWQIKTkifuUtGe+VcBvZATwO
	rUp2BtGiy6QPbl8ZTDKd65qiX/aa4QSClx1drEaOXcFu02fCweCjmDR8MMZqbQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 07 May 2026 15:45:21 +0200
Subject: [PATCH v5 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-3-472b913b5cb7@bootlin.com>
References: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-0-472b913b5cb7@bootlin.com>
In-Reply-To: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-0-472b913b5cb7@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: EB0F84E9973
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
	TAGGED_FROM(0.00)[bounces-106402-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v5:
- simplify error management code flow

Changes in v4:
- ensure next_bridge is put on later probe failures

Changes in v3:
- fix ERR_PTR deref when -ENODEV is returned
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index d9491aac1a89..3640be8c1bf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -285,9 +285,14 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	spin_lock_init(&hdmi->reg_lock);
 	mutex_init(&hdmi->state_mutex);
 
-	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
-	if (ret && ret != -ENODEV)
-		return ret;
+	struct drm_bridge *next_bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(dev_of_node(dev), 1, 0);
+	if (IS_ERR(next_bridge)) {
+		if (PTR_ERR(next_bridge) != -ENODEV)
+			return PTR_ERR(next_bridge);
+
+		next_bridge = NULL;
+	}
 
 	hdmi->mmio = msm_ioremap(pdev, "core_physical");
 	if (IS_ERR(hdmi->mmio))
@@ -367,6 +372,8 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_phy;
 
+	hdmi->next_bridge = no_free_ptr(next_bridge);
+
 	return 0;
 
 err_put_phy:
@@ -381,6 +388,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &msm_hdmi_ops);
 
 	msm_hdmi_put_phy(hdmi);
+	drm_bridge_put(hdmi->next_bridge);
 }
 
 static int msm_hdmi_runtime_suspend(struct device *dev)

-- 
2.53.0


