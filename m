Return-Path: <linux-arm-msm+bounces-47212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA580A2D1FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB0373ADCF5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024524B5AE;
	Sat,  8 Feb 2025 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJgv9GxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF3B224F0
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 00:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974433; cv=none; b=tY/hq+5RUPp25zvN241hBrR8SrDlZ27B1Nxi63KjgcxiYWnD6wTBo9083PDw6Eyn1AE4S9MXkX9vtbkLzuA3RyQF/NhP2W6lGcGS98FhoYFliY/bfBss7SZe+ioI5U7MLKiLJtkDpZYG0m/zHH9/Shtz49FwLdeQ843ObYRGglQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974433; c=relaxed/simple;
	bh=uXKldyyUShxj4mE/w041cBnXe/6hXGA3PeMnMd+IOm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2yOCmJXwji1aaUeV0ECHz58hiXrTg0dPbPALAHoB4UFzH3C3xEuAKGiWDjLHjLufzsZbUzbRFCAm2BXxaG9oDOmlKBcZHJeI2/1LYbnJxAn/QeWAJj52N3/u82o1FvBeBz9Og6gDLyvzx1EQhJfOt0Ri16hpNEdsRbsQGGPTYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJgv9GxO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401e6efffcso2690960e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 16:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974430; x=1739579230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJv47DTctbXXdHSD+jRLQExhlN8LdBAo21I9zEUehiI=;
        b=JJgv9GxOaquSaTU1F4vj5pNNqiVi5AXtA81szrxchCk6plKnoIQGjuvPvylN4o0z/r
         uMzhlzyBnk16hKHNXxHuidJge8QrjLSBWfTx7O33LMnSOXN+WHQ8f8011skLVGh0/Tn0
         z5CMsonHaFlD9fPIoQ5tJYX2ihNyEmBS4sLAzmsomKqod/c29TLjIHs4Jqdxiz8PPI5G
         2PZSu8gTKf14K+Xj3exvXoB2fJOupdYKg0fHJGR/htCynvFGM7obwup/6QRq+5S4njSp
         CgD0wUKvWU9DMyyxmVEqtnJ6qPqoNQ3wNGOUNsgxtpY90+mFJ2Ymuj9m5T59pKplXfMA
         aweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974430; x=1739579230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJv47DTctbXXdHSD+jRLQExhlN8LdBAo21I9zEUehiI=;
        b=AofNwRR1o+pPCNYtA0nzM0GrUCxT6x/DXReFnpgvT2JDAHJuDTK5K015XVKLEQBnOe
         +3GeO+RoEy3JfLWUERhrM3biYMBTA5vCB0ch0qvucRNXrbRzCPEfKJnJ5/dtw0CegfXq
         OvJuJAdmeytsIH/CbojMWIrHZDHxZIyJP2kv2the4yez+jevY8IzhbQFBVXfrMH7j6DZ
         S7yWPMFsBAgpJ4d5kC/AlgQ1e5aGlLH4+fFkA3gSKddf9mKxMdPu/uWOFm++WY10YPNt
         WAK0gTjQqyLMxTNocq+t5w/gHF7wAZTr9hTmfwl+BOGcvYnio/qTZBVmONAzTKDbO8lk
         ofuw==
X-Forwarded-Encrypted: i=1; AJvYcCUZeySbydp599+pHeHxaY1X1jpGOjCFjjUvHEpjGX+4yp5jNguJDbTtC5FVMCMHw7tgXKSp6ECi7p3Sagte@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKZzoTtB5KijBbfK8+rKr6XgKhWYsbmmd6lpI1x2EBXMq8XTC
	pAJYPICl4B238NYmuQ0oOAXRa5Fej54Wtc2owC0UCrCVVo5q3kJ8aqzQ0mUfDJ4=
X-Gm-Gg: ASbGnct8PLuwvyVTyMW3OG0DShxLA8XosFgZIbjFT1rIB+9GV8QW9SSDYa7aNR/BOHU
	oqIPud+kS+Tc4VosXgNBG9YIs7rEAHVu4E6FJE4e//X7CjHs5QEispxY0ZOEXsR83Xbkm83x0DM
	ud4V4VWH6aBa73CE4WYVihodRwDzpenKaF+9fsWcx9TJnS5RxyuzkQYn1lNHgHfqf5bXB6DF52V
	xULMPOVi9qLrdKUNrbV/VKl7WfzJUF9+scjcAqNo9nosZ3o8BhEwY5xR6of4lm/O5yJdIrAI5/y
	p7Mo5IBBRcasIn7nHnwVbH8=
X-Google-Smtp-Source: AGHT+IEv2KWiExZyTc5a9/5Vv3GXcJOM2vKT9sfUvK+wfRQHsUp2vZ50Doyn8pe87sWe1wbZx0diNQ==
X-Received: by 2002:ac2:4ec9:0:b0:543:baa3:87ab with SMTP id 2adb3069b0e04-54414b0637fmr1626318e87.47.1738974430078;
        Fri, 07 Feb 2025 16:27:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:01 +0200
Subject: [PATCH v7 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uXKldyyUShxj4mE/w041cBnXe/6hXGA3PeMnMd+IOm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTVlnCUwmyS4BLskQiI3ujrk6aTTc1xPgxB8
 0lAqt09hFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1ZPqB/9UXLPdqs36l78Rn/gBwSRg+eQDbC3+ok/lZf6TRsodmlfH0bXiG1vEU05/tNSELtUSN69
 ppXuioe3dimrADpDMnkEONgBIlV8qNm6JgVshm+J97UgAxflc4QQFSep692Sn2SWzHrY9p5eua6
 vdKyeRjSdnnOAcsYCs4ZHDS8rufeFzOUEYQHEKGYbF+/CGgHZeqS65OtJpDBPmm2STZ8LnTaJ7J
 y59FuKiWooiNGeBrDuLwVwctVj/0eZVC2lISLJCzo/PbmLqwWJG2L8Rm855sCt/7aGR/P+vJFcp
 7/WhQ/DWCcYE/CrGYNcf8tE/4O59UHaZhSIoe27xhdBxJ16m
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed after setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the end of
atomic_pre_enable().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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


