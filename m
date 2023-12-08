Return-Path: <linux-arm-msm+bounces-3800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03C809855
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B4F61C20C1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05773EDB;
	Fri,  8 Dec 2023 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvzECAe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32D0D59
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 17:03:21 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9fe0ef02aso14191141fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 17:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701997400; x=1702602200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH74X69CknSJEAqKADUYJy0tIjkWf/mm9wfbBS4QRQA=;
        b=kvzECAe+BjW2AVb2g9KaZrbvKqORN/R8Ha9WL5mOLpW0u/Hr4JxuMa/KiSZjtPsdPe
         WlUFNXTzRTuP9owMe5uE/bax1Dhj1AAUmNN2L9WbLL5i6JgKM7p3OhKFgs2gxUAOLuD6
         GXEz33zPfAdqIedCG0hMm94TLuK2Bh085V6nrcO/9FVfpL3V/1qknwUNRimb9gJyG2pV
         cS2l/V8fZwOMaWIExFWyDIZjFV0JJUyDogQABiIokjmamemxOtY6U/d7uZ8zle5yvmyY
         zsQeVDp0pqxThaKraQRKZEnSlMRRNxUZcqHo2G8bBRSfzutLxkpEakHtAoChWKvac/9L
         FH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997400; x=1702602200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH74X69CknSJEAqKADUYJy0tIjkWf/mm9wfbBS4QRQA=;
        b=kuFptzLWqJQzHQRBjS1acWbDRP+Jsdk8C4gjzdQXAEIlY3No2vQ1cP+2c8wIwZYVyC
         5OyVFR9vTPKwL5rNeYz7ZIKQKV/gm+SXP6ZSrMZjdndM7DkcDERjTzq3Ld6pacYYVc7o
         Wr/xosrXlYzHqA3HVobqfyan7ko7K1uMfGOcoPwZivU1RdyuFgViuaNSaDhmdyvtOH2U
         KyJuLgPsgmOnqtakXOQ2bBphTz0Vi0FqcSULpR49WkkTPwWOhSbC6idXSuKt+Pd7e+hM
         75wviAom5EJP7wra/XIPBBMVK2RkG9oVewmhI9NhaDoz9V8gHVX7YWTSzE55NWOp6iRz
         bLQA==
X-Gm-Message-State: AOJu0Ywz7adQ0GYur+RAH9+K0Bk5bNJQtmdSQu2yWrbWyJceg32wTpnU
	JLtauMymZ8+Zk5/GONX3p30rTw==
X-Google-Smtp-Source: AGHT+IGp18wUjpiOvhYgSK2UicMqSaBn8WCyD/Y+QwBeT3gAg85czosN3/RcOwKmUieKQg9qE+WKWA==
X-Received: by 2002:a05:6512:10d2:b0:50b:efbc:185d with SMTP id k18-20020a05651210d200b0050befbc185dmr50714lfg.18.1701997400242;
        Thu, 07 Dec 2023 17:03:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t28-20020ac2549c000000b0050bcb5b443dsm68415lfk.171.2023.12.07.17.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:03:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/2] drm/vkms: move wb's atomic_check from encoder to connector
Date: Fri,  8 Dec 2023 04:03:14 +0300
Message-Id: <20231208010314.3395904-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the renamed drm_atomic_helper_check_wb_connector_state() now accepts
drm_writeback_connector as the first argument (instead of drm_encoder),
move the VKMS writeback atomic_check from drm_encoder_helper_funcs to
drm_connector_helper_funcs. Also drop the vkms_wb_encoder_helper_funcs,
which have become empty now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index fef7f3daf2c9..bc724cbd5e3a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,18 +30,25 @@ static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static int vkms_wb_atomic_check(struct drm_connector *connector,
+				struct drm_atomic_state *state)
 {
-	struct drm_connector *connector = conn_state->connector;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
 	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
+	const struct drm_display_mode *mode;
 	int ret;
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
 
+	if (!conn_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->mode;
+
 	fb = conn_state->writeback_job->fb;
 	if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
 		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
@@ -49,17 +56,13 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_connector_state(connector, conn_state->state);
+	ret = drm_atomic_helper_check_wb_connector_state(connector, state);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
-	.atomic_check = vkms_wb_encoder_atomic_check,
-};
-
 static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -162,6 +165,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.prepare_writeback_job = vkms_wb_prepare_job,
 	.cleanup_writeback_job = vkms_wb_cleanup_job,
 	.atomic_commit = vkms_wb_atomic_commit,
+	.atomic_check = vkms_wb_atomic_check,
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
@@ -172,7 +176,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-					    &vkms_wb_encoder_helper_funcs,
+					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
 					    1);
-- 
2.39.2


