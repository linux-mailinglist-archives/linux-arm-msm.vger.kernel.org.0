Return-Path: <linux-arm-msm+bounces-21364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7D8D6A6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B091C1F28FC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9724417F4FA;
	Fri, 31 May 2024 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="it+qPrXF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0417F4FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717186058; cv=none; b=iz/hCs+wq36zXLt4uhwLOO/Jq1/7z95Pd9r3P1G//puzJLUbakKYbQdfYMtysPcmXvBrlrrXA7Au57G0r98wfLKrB2+mOIJ1UXekL33wZ5hdQVWpOCthH7nqhRWpQXHKJ6oMpmRJn4YQ1WiKs9PFNAPlbqWxKlj8d4pGhxmMwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717186058; c=relaxed/simple;
	bh=UWUILZSKKGNyx193zjImsEEpRTHfS6fkYYigZ43zbQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvljf3jcn/OwJPzrG2XIMU2kv1R85z2wTLFGkmkf+orczZUV3sxMS/WDkK3L/IrGDAPamQHpD11Qe7tIcWvNHiy0aFUxe9vZxDBkN6DOC65PzbGdeSPPFU8yqSawGvcVlzz+ttFy6Df71rmHewfmpRK5odNAkdKM2NALH93vv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=it+qPrXF; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so32217831fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717186055; x=1717790855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiLWZR73FzG1cBUuGAjbn5LfyouiORitTo/38HE0+Xs=;
        b=it+qPrXFtIC1z2FD4D+sO+YkW5HpRl+kGY6XtMEsjmM7u2ZZDNs+ZxsJ1UsDtRx812
         KB+zhrgeUgxARWK2ayA2aoWqkaWO0lcGTTxl+RtMhwlosufOeFWoMR+CyCj5auM+a6Bn
         hnfjMMnJi+Tvfs/S1pLe+pVBNbLQo/dkQfNY3nsfvAm53qA169pAsT0XH0bIL6YjYYO0
         HXekAQTzad4IjBh/miTZr18XruULvZDIOFpIwCwawkofyOsnFi6g3EoJUsDVFn5KfBM9
         sbTy1gqfnM7gzC6jF73gGW8TWxXHpabSvtq4bHgS5ONNpquOWkVnCuN1RPWrf7CXrckd
         5PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186055; x=1717790855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiLWZR73FzG1cBUuGAjbn5LfyouiORitTo/38HE0+Xs=;
        b=o4/43zqpdZl53/bmJLeAZbxISg24vp3hKd1OF9CVA03sdeYYLHUsBbX15ezgO+w6Va
         TNj21LLZmK/Q6QBrWme4CB757zSjlUsEZszmlaoKQt7R17pgcsxrUoPnklEX+fZfLiyj
         Hl0gKSns2L9P+nkWYV2PpCyqa1+x4/QKqdbDFZUDaBqIAuKqMWIeb6rav7J/qKFFIHa+
         rNOvlQUchJhNiimhkewVhUKuhqaTXoKxeSaZcYKk7nVcubA6WgrzetPQ5qUziSKwwc1E
         3gfWYpWahNjp5pMsH5jzAHIUdQmtRcFgPlqhJ6n0Rs+psY0/2jWixlq5VjNGSUI4v3gR
         K6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUU/G8lzOp+ZEY8fo52oLjd8fxzL1HyhNwoF3NZDykVxM0OaMGUC2x6xK533ILBfDWyEL4jhZXrdPZWyS7a2yrEjopQaEX26RlQOAUkZQ==
X-Gm-Message-State: AOJu0Yy21w23eJVRbCvciwiIwXKrQ6R2g8zEHwlwgfQXQBioTE47pVMa
	tcmaYk0tZspFEgOqOYu4dpyNg80A7bWEl7svMilC1hapgdi2UpIPyqEDgwzMRPcL5AQa2QPD8jV
	V
X-Google-Smtp-Source: AGHT+IGV3cCszJL2Evl8iyDXheyiC6hOTx+o95E4nNadmsnYln85PmjclchsS6VnyRMmAvINPl2LPw==
X-Received: by 2002:a2e:b693:0:b0:2e9:8852:3d20 with SMTP id 38308e7fff4ca-2ea951e4c52mr23923571fa.41.1717186054220;
        Fri, 31 May 2024 13:07:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:07:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:28 +0300
Subject: [PATCH v4 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-5-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UWUILZSKKGNyx193zjImsEEpRTHfS6fkYYigZ43zbQc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4A5VAxSNzIvkri0KCvCvKC+3PtYIkHbBwQf
 Y+oSMDUI96JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1W3/B/9hxuzoStd2MFOr27dsWDaQLvdDfDKq6OitbAFUenCZ+yoDz5INHgYLgNAFKeLcQY97zk7
 oi/xQrziuDyC8cYUzfBovdERtp6AbdklpswZ+qzOXYDBDmE62EDkfOTTf4JLYKS/Gmkny+96+6J
 uWPoLmdWkj7jT1ndF3RNxt4hE+HU/PkBp8A8s67dkotwqviDsyUpG7UqzVZflZ2cvMNMXkdTgsN
 SVneGeLuMUXeDLryp0nZwyspdFGdySGkKqSAlQisz1ZQf6X2NBbgeDg4Nob6bvmCn8s0w2bV2zE
 AKSxqnDsWh1Dk0Bzlfe9s+lWijwVpfzA0OPpeBulpM9dheKA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Turn it into the
atomic_enable callback as suggested by the documentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dc..f259d6268c0f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -129,12 +129,25 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	hdmi->pixclock = mode->clock * 1000;
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -177,18 +190,24 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
-	hdmi->pixclock = mode->clock * 1000;
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
 
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
@@ -305,8 +324,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_enable = msm_hdmi_bridge_atomic_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.2


