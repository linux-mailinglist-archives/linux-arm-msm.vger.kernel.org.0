Return-Path: <linux-arm-msm+bounces-105699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLmTFtd4+GlavgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:45:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54E4BBE60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB92430173AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBE73A6B93;
	Mon,  4 May 2026 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J1bP7p5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BC3A6B74
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891526; cv=none; b=SVBSa/9QRTRoaaQQ58AHFRnXm8VqUDImbMTBHugICqqF2VEePWnelBcb8nll/WOZ2885mYVS8Xd8lNfEMZ5mlSwKz+tCUxee881DpuC9D0Kztd9qwWtF5vzIFWp20lnJJZqRriEcZn2sd4z0ev8W+4v68Kfj8H0lywuqObCswXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891526; c=relaxed/simple;
	bh=sG63iQPGh7FPBQG0M1bmkknaJxpiP+qL7Vz2cEx1SII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QSQW65GYr+S/b3gtBZY/jw+5u4vtKj61H1fgZiATaNn3jlDPNxzgv1rohHPne/Li6ZwJfTfBcLH1qz5JBoWZobnqydSJ8cq5DzXoNWTWnEz1zCtAUf5t2gERZkVGP/5RGjxFMt7QYIFQxOeOIhQ/STgQHmLnTqxJmjRbFIfP+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J1bP7p5j; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0312E4E42BBD;
	Mon,  4 May 2026 10:45:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7CA75FD5F;
	Mon,  4 May 2026 10:45:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 302A211AD268B;
	Mon,  4 May 2026 12:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777891522; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=klEnOYxwmyhP43dH3LhaM6WGup/8KCXunSlgbkKjiG0=;
	b=J1bP7p5jLRAg4yL8WnncjKCDTZOj3ZAmRZEkdaNKTsHWgSFlmnGYxSRH6NnxbcF3+mjzwB
	zTOaH9kSr/PP6nhe86m8Epojv57ra2ZTCBZVSldj38oAYD5+frkyg3NkGc5usfJBqZBMaD
	90oULpBA4oX8S68g8mOgEXoJMf45WM9AUMFFdKconV/NE2c8D4RvI0eY4xEp4FWJl7dzx3
	7sQmaW8+VZRLUf16TgKsoU83BaJf46ctk123nu78CwoUzTIwP1GxWMTWPADT2y85ramMjx
	LetAO3dfS8Ycrmi8Bj2QA2G5kyTA0QEtoPVIL7dTDmebjm/aEg285JChhzLaAw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 04 May 2026 12:45:04 +0200
Subject: [PATCH v4 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: DF54E4BBE60
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
	TAGGED_FROM(0.00)[bounces-105699-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

Most functions returning a struct drm_bridge pointer currently return a
valid pointer or NULL, but this restricts their ability to return an error
code describing the error kind.

In preparation to have new APIs that can return a struct drm_bridge pointer
holding an ERR_PTR (and for those which already do) make drm_bridge_get()
and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
pointers.

This will avoid annoying error checking in many places and the risk of
missing error checks.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/all/20260318152533.GA633439@killaraus.ideasonboard.com/
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/all/omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq/
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v4:
- removed incorrect change to drm_bridge_clear_and_put() kdoc

Patch added in v2
---
 drivers/gpu/drm/drm_bridge.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d4b3478258ec..6fb71de6d22a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -282,7 +282,7 @@ static void __drm_bridge_free(struct kref *kref)
 
 /**
  * drm_bridge_get - Acquire a bridge reference
- * @bridge: DRM bridge; if NULL this function does nothing
+ * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
  *
  * This function increments the bridge's refcount.
  *
@@ -291,7 +291,7 @@ static void __drm_bridge_free(struct kref *kref)
  */
 struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
 {
-	if (bridge)
+	if (!IS_ERR_OR_NULL(bridge))
 		kref_get(&bridge->refcount);
 
 	return bridge;
@@ -300,7 +300,7 @@ EXPORT_SYMBOL(drm_bridge_get);
 
 /**
  * drm_bridge_put - Release a bridge reference
- * @bridge: DRM bridge; if NULL this function does nothing
+ * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
  *
  * This function decrements the bridge's reference count and frees the
  * object if the reference count drops to zero.
@@ -310,7 +310,7 @@ EXPORT_SYMBOL(drm_bridge_get);
  */
 void drm_bridge_put(struct drm_bridge *bridge)
 {
-	if (bridge)
+	if (!IS_ERR_OR_NULL(bridge))
 		kref_put(&bridge->refcount, __drm_bridge_free);
 }
 EXPORT_SYMBOL(drm_bridge_put);

-- 
2.53.0


