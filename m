Return-Path: <linux-arm-msm+bounces-46110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD0A1BE0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9DDD188E2A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25481E98F6;
	Fri, 24 Jan 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXx/QFd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96C1E1C1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755274; cv=none; b=GivKPt2O/bruJW1rk+dI+0UNNco8gprzNtB13f7Yz/qROAh0pb/uXuJY7EypzEyqI0EQJF06oL21VqICwoEQ07gboNH8w6UVXmWODH+DFlblUL1XG67Fn+5txk/eI/8Oc9KCsvey0jl0S8edt/w2catAY4SMCg40djhnfrApZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755274; c=relaxed/simple;
	bh=kSze1JGUTOGCYF8m3i4MYZAmp4xJmoIk6UQOajOdpeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOC1XqMZbPSn9clCktvwQY5oG2Un7KoV520yrvJDAOPoxqYny9rpt42BMGTutHAhsDNuImibqeu4342bqHaFArBjvvZGfq3fzBboR3AgsbNqO1+ASUIOOMOi0V3DsriF77Qp/bSyf8Hh4wOJHW7shW0V5DKZeqncVX/egzVhFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXx/QFd4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-540218726d5so2765668e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755271; x=1738360071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhgOYJOSO/9HW8pwqjPKCM7ncfLkuDOo3BKPxNB2SGk=;
        b=KXx/QFd4kbH76u+zJQMLGYyhxjjlabTw1rSIwJgkj+9qUbVlTPGMGVv7ERuC1ww+js
         dvHAhXQCqvjls5qd15/R6fp/xq15IOtqNl47M6drUa3qYJDPnWU6L/TfmRu8eVBUSc21
         Y6+ujIpxzYNY+Vh18LolkLCeMzgLiTpRSuQXEdhz99YGVzmiN7d7ylahQWk9gantRQjC
         F6IoyTChmCHQNAK969Akz3/Np5bWNs8wbmfxBPbx3xW8qMcnUNVcvEcDhpoD/6eGldaL
         VUKWUF3ByfAesU2k+tG9/NeFaxKT5t/JXuRWDN8SA5aJDyC3pHDxgjvUoSCjQdAq0cKg
         ugfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755271; x=1738360071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhgOYJOSO/9HW8pwqjPKCM7ncfLkuDOo3BKPxNB2SGk=;
        b=Uf7qwMJsWTcbPx/ovUUtRQt0UBCukFUzBAxcw6ZrogUALQji8D9+4DT/HGOmN2XKZk
         BtoHLjnu944Yaujt/ldkWjJ/WUyhcB2+NoZ8934fiRWtEs5ftEjDqVL32B9skB1LjxD2
         0BkAxpz4u1Bof3EJj8mlPtx9jytKkFIJy4EDvRHQpa3GRkSxY8zSY6Z4FX0c1Oo97e61
         Io/UkDI7Yw0w3KZTAxHh5M/TJiwvdPkfTnMo2Yk4pee8xxeFni7Ei/5gXxxO1klXOqkO
         Jvy/p0pEQjDnEw57Wnrbey3YA72WQwlc3hJ9GSwk64+lTXBoiNjw+YPOaHDj22IeIlJ9
         4Ydg==
X-Forwarded-Encrypted: i=1; AJvYcCUm6h2EgXJycy2mvrXn7bpvkd4OM3dnoMPPu8cXVjwIFuQg9Mhb75gEr5nFCu/KalLiVQ/nggW/bEfyfn5I@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8vY8mrrSg12UozWZD4iZiSgbBzwzwhEB9GurolIwrW4FwTdz
	GQwz7BXat+lhbcbi4L0qw7l/BWFX6T5YBXOq7OTwX/1klmCkM7HXJHpQdKAqqwM=
X-Gm-Gg: ASbGncu/w2hHg893UfepDp7Us8kvhsVGjOXb8LXOPf/bJidpoIrIC2XqarbL05Q1v+g
	VhlzMscdglvYpOaYZrDKoJ6WCFBFd/RSudxj2tBczW124s1jVguerCcGKIzBbXZfoAuLUM3CXiQ
	IsYTY/V/6OtArddBK/f0caGPEa8kAFEBUdjh2I04nQa/6G+l505igs6WTgcWfQ/MPPErd6mQO1D
	2caYwSaGPYWGvutRjTIBfesgsGB4c1afKogFwNOkQu1ht/WogOpflNTNS+jtzsxuHyCBDIFdStY
	m5A+w1nKE3Iu
X-Google-Smtp-Source: AGHT+IG3aO38brRrPH4wfS/ESF1jDMyHBbkUhw38gLmmUNsh6Y0+nVc1isQgg/XzuGkki5VpcQLIEA==
X-Received: by 2002:a05:6512:33cf:b0:540:202f:4955 with SMTP id 2adb3069b0e04-5439c287371mr10458923e87.46.1737755270703;
        Fri, 24 Jan 2025 13:47:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:42 +0200
Subject: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kSze1JGUTOGCYF8m3i4MYZAmp4xJmoIk6UQOajOdpeU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAp/oXLWfpEl1f2La3MXrLoICQDHEdQlVqJGS
 Hgv35KeEmuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKfwAKCRCLPIo+Aiko
 1ZuSB/9DaAKzIUw5clYrcanQGnGX9s9BZCzORMBcPpZTGFMZKIJKxqmI9pCa2ex2sDnjak/OPfg
 NCfGVtGE5BYeOSgfgwCO82Pk09Ied3no7INTtYIVVnLooa7Z2DTUhOJc26H1V3qwhHz1/4K3LVM
 WoHbtgpGyBUseefhJoX8mJy1nHHAdH1mfyzRT1DoPwuwDHDg5y+rAbpS1zegi9slnm0kO5yCjaJ
 gaYi6y0C5K6UQY8SFawJRHAJz6d9GDSHvAoycThmdjKhV7v1BPW3gqGiZoYet6InKQmngG3cT2C
 vKaFFC87Be6XJgM71aJisvBbNbz4hdqIANRYkHj8bnceCFIz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed after setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the end of
atomic_pre_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
+static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
+					       const struct drm_display_mode *mode);
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
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	if (hdmi->hdcp_ctrl)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
+
+	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
 }
 
 static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
+					       const struct drm_display_mode *mode)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
 	hdmi->pixclock = mode->clock * 1000;
 
 	hstart = mode->htotal - mode->hsync_start;
@@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.5


