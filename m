Return-Path: <linux-arm-msm+bounces-23716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D9913666
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA8C1F224E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBC177105;
	Sat, 22 Jun 2024 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8Q5CXaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C542629E4
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093743; cv=none; b=KJBqDxliN0qsgJJzLCh8fvpPh4RMFDlnPfWJDpUlkt1RKncFw9j0HxFgCLcFGfd67BQEWG4E6Wcbt0Rxs04Lv7R0ZzDXC0fxlYAi3xNg1gI+CWFJvY2Q7KZShkj4PRX/JWvj45xYLlzskkRqAPo8eb3Zf/3kBUa9q1kLZWrFQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093743; c=relaxed/simple;
	bh=QHJFLuLUkbw1F9+Kq0qmn518QlvE7rv63CWK8Jlxpns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBWpugOutf7L/DYEx/A0GtHU904WxeumAWEBAmQBYGOGXwZlidPaR+cLZ39Ycl5UJbM+vmp6RyzP1lMLeArlDEsbNGVtDCrml/PLfuX6opsDGskmMpbXAbEfBki3AdTue+KKbQo4RQ18LRPm4Y0BBYWsu9sbFVWvjQLbpoxq0rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8Q5CXaJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec59193468so3162391fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093739; x=1719698539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wEX4Yto30IpkmFMs/2PNdUGRMDgLHDuNenxP6Onffw=;
        b=E8Q5CXaJjS+hTFC6uhfz9WKW79I0UtqOh/7J9uI0BoC3nCZaWfdXi5l11k4iJ8vaXX
         C1UGIDDpyv1OwfndVGaZ8GTh9YtXrUvFc8IM2hXNbcSIx+N+40YCTeHyz9G/7DJILjZu
         jiEVXcCxGiJdvfdXr6CRD/62SL9CBEQ1diigDq79Ar+XE1TT+ag6/hA/g1918AnzpLvU
         C6ba1g3WOYgpwiEi/jJWgrm14OJsTAw0AeZxl6yx9BIv2x3A/G3wvmQ+G2V/ixIfNqSm
         eZc9sp+XhOQbWRJI4Zclfs0aVUVvufMMeOVTYcHisA3TLx0ud0w8kuBg5jtaANwcsTqv
         dauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093739; x=1719698539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wEX4Yto30IpkmFMs/2PNdUGRMDgLHDuNenxP6Onffw=;
        b=c8X8kSFsBudaFkJ7SstqK+3jMGBhS/vczhverljN1JOefTJkbDs9CjYcUeHeAIBHBd
         8LkLOIwSnuEWBd36ps2Wl4KG5j8qYUKTbbOIgsQaqtmA6h3J+GCCBK5Tbk84Sob9Ffpl
         Zw/IZ4VtF07UPaPM6PylKYg/oqBRuCr3OcjO4cB4YxCsk9Uqo7rWXKtic1fUQ+4WBfSy
         2F4AP2rjvz0/ASlpw03awjZR2K14yLfNhZGrwmeZUZPK25QQrJuMPXwgwmKPCo2Thbwo
         gteI1yTM527byNimjuH6ouYYXatdZaNV0JkQJhR6h0ozlw3jRaBBhuzAfn3bwmRbl5dQ
         VeEA==
X-Gm-Message-State: AOJu0YxFAvlwBoeyPezx92G7XPM4O9VqLzAeQVHuusiTzQIzv/YEBL6A
	2op6Is9Qn/376n5U38gXST/avURGqBjLGhyGrZQ3ZKvXTx9+T0wFpiCJO2la6yc=
X-Google-Smtp-Source: AGHT+IEdI74CL0f7ufTLv8SMKdBOVwYB/E2BMf/MfUp1uHBXxRD0EMKOJuGq7/P8DqPrTwph+p61uQ==
X-Received: by 2002:a2e:8789:0:b0:2eb:dc3d:cd00 with SMTP id 38308e7fff4ca-2ec56b8282emr5671941fa.14.1719093739578;
        Sat, 22 Jun 2024 15:02:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:14 +0300
Subject: [PATCH v3 01/13] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-1-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QHJFLuLUkbw1F9+Kq0qmn518QlvE7rv63CWK8Jlxpns=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q554v+Ssamd1VLAyMOMNhyrcySWPbvFIc5v4yRa4l48
 soYyUWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjIrxL2/7UVVbE7b/w81f3u
 77TNokce+/1+ofbSdjPf3W7/Odwe3DkRLF+bb4s4/H6trJO8fr5CbieH+JMZ36QkZwUvOZPGO7/
 kl2rAfz85sYNbopSSBRPD0ycLLJTS/dj/vjtC5FXQjOccrTLJmoIOC+ZHR9/pnh1WveaAu+m52X
 t+SfZX988v53DgnLzzz0S9aRXnRRIY9qdvVq2MjNp+2lhGp0OgVuDtg4T83tXf2PR1f6wsVnabp
 RWiZXXqT/C31y/e7Nt690OkrdXEs2ES37eWVp8q+vq83vSUyOal6W4P9R8EncxrX9ZfGjOXMX2Z
 58O+PQ15dqwrHPO229w7kpGQy+QVPKOnxaU8VkOohNMIAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed after setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the end of
atomic_pre_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 92c95b4bc1fa..438416eaf390 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -304,6 +304,8 @@ static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 	return drm_atomic_helper_connector_hdmi_check(conn_state->connector, conn_state->state);
 }
 
+static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
+					       const struct drm_display_mode *mode);
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
@@ -314,11 +316,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	DBG("power up");
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 
 	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
 
@@ -336,6 +340,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	if (hdmi->hdcp_ctrl)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
+
+	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
 }
 
 static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -360,17 +366,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
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
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
 
@@ -474,7 +475,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.2


