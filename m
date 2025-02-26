Return-Path: <linux-arm-msm+bounces-49454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AACA4593E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16E557A6043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47108226CFD;
	Wed, 26 Feb 2025 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zO3hiiWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39D224246
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560377; cv=none; b=OWWkDZcJvpREGHc5F05XzdHuESzgm7ZlCl6Q/uARH2cV/htBVUx15alr4U7HmoWO+zkgFOe3Rwl1yln3keyQU4L9k25u1cwX/mrLVytSBwuzbumsIZTRPMiQUiDeKUcSBpklSwyK9qrKuk7d7X7iiQ7L+5cMWxxG77JxdSPusJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560377; c=relaxed/simple;
	bh=m2TAoFMN3euF4DkEUBd426Xr5dS2tnI3Q7ZEQxtygnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PvG0KX2vDOtQ3ATBxcv5Xw5j1l6/1IhKocwKM51QztD+47YHrhHafKPbr3czwH89Gsww3QdmdLtt2AHI9FvWgveXb/aA5GGEp1xKkOFjBKEE61c3XUW9HO1oUqd4kOj53nm8/85pe+x03LGTr2WHrAd8pbTkSoDg0dlPqHvVnss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zO3hiiWq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30a303a656aso68558491fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560373; x=1741165173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0zF5icXRhGBS22oaTFCfeFkUWLVA/EPLQBHYWMqBLg=;
        b=zO3hiiWqUTD7uD0jiBOzzzS/J1dq1ujkwuylbWtmRa6CRFORDO36W2Q28p3ll17VnU
         gIwePAGgnA+EiA4UxQdv9MaDHWAmwC0BRKrNW423R8CBdlqPCDShZiTxTILzmwae2eVV
         KVsUexzCZv7RpVAZX2RtQKb5yh3bKpQA5SDC6lCdKMsTNJ9z9ZMkwzKbcBgzMZjwmwu1
         LCgtuskGMZmfziiBVUO+Vx0o7i6Azh48jPfUiiiKbhilDtOjP51ZwjyntKfwdnfcEwWG
         ENVEHU1JwtIbNMYpQxfXpLCum5VscrPL9TPHt8sQYCWdM6YcARWH5HYrJufYdah14u7+
         oDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560373; x=1741165173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0zF5icXRhGBS22oaTFCfeFkUWLVA/EPLQBHYWMqBLg=;
        b=CTDzmvarbxOSc5gvKQV0lJ6M6BDc/VUhvNRgJr0oLmAURRYRHPo/dAh4PXAPMeUxKU
         DK95q0KlXti8ttZn3W9XXcDipEGifX7Ba4zyGUZw8SAmIYA7icrNQXYLmXok8H7gGlLw
         TaLPdC27Jalg9CCHMXLDhpRJ/RC9Nsp1ggTgJFNBtSwqH19blxOEyy8z6NJYzs2PCrvt
         FbG+sn5ncKKZw3hPUIfrUIqrzo8pJh42d6V1uvVYbrPBSTxmBH0FXV5wsNCLb6/bd1Vr
         w58Qkv9Ee2WxkCHVkyWvtKxMTspbySUHdJwXZ5g1ERaduhnQSDASoxp9LXTu/7Timlku
         1m8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp7ZWmTfQGgUddCZDBAgiI5cXOrF2URItXMlceeOwPEPa/Xo/dlDEUoBvPVaNmI1odWYerikGbKUy4/6A0@vger.kernel.org
X-Gm-Message-State: AOJu0YyGHioS1ue3AD+So6IfEnpEQSxcbtDfD0TDHERu1zbieuxdrqBy
	XUpBlGIrp/Vl/nFsGZpMT+dsE/ZBLiktaJcQP56EjH08hWsupDZjgjHCXNWs/9c=
X-Gm-Gg: ASbGncsZiIcsRGJgIdZNwlUdrypoZ5comgMrVSX7zsZkPPT8AFAxWWG/q4o6uWIGdmo
	iDs5f1BBVjTpKt23BC/CFM56iUeK0WmZlbm/w5gy5tqQEm2w9/gCkoL/ILOgBd5GZCxPwMGjPBw
	7p1RYAZOwOf6KcMXUoNBC36a5qi4zGnRcXG2ITLB5JCA6y1+f7QUC/6Dl/aTG2tKnJnylVUqMHn
	4ErY6WyJ2/3RfM5d7TG5MfSv1aMylIG3R6WwkoSQJjEVl60Md8lrPYrpi6MDMCYSwsnohcmHh3t
	wggN0msoLKHiu0iBeoSJp+SlD38kP77GiA==
X-Google-Smtp-Source: AGHT+IHD8l95g4vI1vyQEz00LSL+SoA+aEIpEPr9+UtIPsacpfC1JVUKJm5+nMQSBt4UshFzPla3jA==
X-Received: by 2002:a2e:96d0:0:b0:309:22ae:a6b3 with SMTP id 38308e7fff4ca-30a5b1a091amr89275911fa.18.1740560373370;
        Wed, 26 Feb 2025 00:59:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:59:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:25 +0200
Subject: [PATCH v8 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-2-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m2TAoFMN3euF4DkEUBd426Xr5dS2tnI3Q7ZEQxtygnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtfsOMZUZw+aUfLC3KFwKH0V9adcdPsnFq/AF
 fHNBmGlMgKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7AAKCRCLPIo+Aiko
 1QaeCACEYYfh387FH+3M3cQHalQXk1AtFjbNI6xiNZkRNKKopeEywYblNV5zpUeCbgo0mARh2Mf
 hI68MqC8xQYbyIbvHvDpdUG3IQUxTgsdFOsUuYTxyw//MR3HqEvHlAe3RrOaIWboglM1kI2xemN
 akRMDiF+u4GzVp8FuwJcrZxPREePgMkEBOUCF9vjzqlqoi1svME1LLCUOQkq2XSnYXskH/eAzSD
 K+1MBc65J+fYPhW8cRWvNOhsty9KRBCngYpXpaHwggnC0XRbtUV2Nlix/IKOrnp/m7ywA3gf4Rm
 Kg58VWf8Vl0rggm5UUNuQ2kAGLUWXUT5OAKtZ3NYlMO5pfsA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed before setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the start of
atomic_pre_enable().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
+static void msm_hdmi_set_timings(struct hdmi *hdmi,
+				 const struct drm_display_mode *mode);
+
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
+	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_set_timings(struct hdmi *hdmi,
+				 const struct drm_display_mode *mode)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
 	hdmi->pixclock = mode->clock * 1000;
 
 	hstart = mode->htotal - mode->hsync_start;
@@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.5


