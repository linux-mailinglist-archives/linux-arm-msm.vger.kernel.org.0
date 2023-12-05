Return-Path: <linux-arm-msm+bounces-3382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 319698044F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B371CB20B8C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE7BCA72;
	Tue,  5 Dec 2023 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbsQ/euN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B511113
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 18:31:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bf898c43cso1579395e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 18:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701743512; x=1702348312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKmAR1ZSmrFWzNntIYs9o86wF8PusWlLEZwSpUuaDNg=;
        b=pbsQ/euNceeTOsF4gE1iFY+/cbsGr3xJs0w0MKUxNyQ2gjX5BEaAB1zTmbVvyH2FJw
         bRQiv7COXZcCLyUDtqiT7YYzXSqrDn6Zbg7QuPhgfYgYpGj4cbO/DOVlecCi2FWtGnVd
         CRGnp5EKwPg1av6YeqZOfVEZ8uuoXSFgmsqeqcIdPSFPiJq/FgEw+uel/e08gdc/Vej0
         dIjz7reulqy5odD03ludKhu+imIjmkLIQ/s70P+p22/YUjQcNQrZ2aXTtsj2Sbi3CZWd
         kzYFlLg05OXSiT8SUHEXBjBHpm+GELJ/0ODCfrZyBqAbPutM/XZKLMhCK9ws3g9aMipY
         mpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701743512; x=1702348312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKmAR1ZSmrFWzNntIYs9o86wF8PusWlLEZwSpUuaDNg=;
        b=W4r/SKKKvCqYMZGdHHscdok59PqeMOqeVE6v9kC4pEvPL5Rc0XvBrQrNmtOjc/daby
         d5asd79GD1SdMMNRM3NGVtqRkJIrdz8a0fBbENBPJYPRrbbfQSlnKos4S9mVRY9mNcUJ
         kOETWqCsgMFAI2nxGISeYBJWR9HCkKGVAOT7PyHu0THoWkn5G6NLofUBfx/XHgHYw3GQ
         r3bMq7Z37X7O68C2cOw9j72R5AvIOTNwB4Jf72IwN+sUdqlJWrCiP0wL/Gsx4An0TyhU
         zto5msneSULiKuh8/MmhkSvwu77ybvkokmBp3v1dEBbKy2RJCjDHYD6s0WHmJVBOfrO8
         00fw==
X-Gm-Message-State: AOJu0YzKAFF1l9gob7xsX05PWC33S/Ih00iOHho8Tci083klD+YHZR72
	0aXdQ2P+lOTm5Z7CqBmXL0ZQNw==
X-Google-Smtp-Source: AGHT+IGQsXPjJtaRhJ9I4NkQQlNOo3ibdg5W003wqXFm46ovMCUpG70P7y3UsMXcmF7MG524E3PkfQ==
X-Received: by 2002:a05:6512:480b:b0:50b:d764:2938 with SMTP id eo11-20020a056512480b00b0050bd7642938mr1957294lfb.208.1701743512438;
        Mon, 04 Dec 2023 18:31:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t10-20020ac24c0a000000b0050bc57ec288sm1414726lfq.44.2023.12.04.18.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:31:51 -0800 (PST)
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
Subject: [PATCH v2 1/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date: Tue,  5 Dec 2023 05:31:49 +0300
Message-Id: <20231205023150.1581875-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
References: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_atomic_helper_check_wb_encoder_state() function doesn't use
encoder for anything other than getting the drm_device instance. The
function's description talks about checking the writeback connector
state, not the encoder state. Moreover, there is no such thing as an
encoder state, encoders generally do not have a state on their own.

Rename the function to drm_atomic_helper_check_wb_connector_state()
and change arguments to drm_writeback_connector and drm_atomic_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 ++++-
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c3f677130def..67489b3561ec 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -795,9 +795,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
- * @conn_state: connector state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
+ * @connector: corresponding connector
+ * @state: the driver state object
  *
  * Checks if the writeback connector state is valid, and returns an error if it
  * isn't.
@@ -806,9 +806,11 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_writeback_connector *wb_conn,
+					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, &wb_conn->base);
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
 	struct drm_framebuffer *fb;
@@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(wb_conn->base.dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..23c4f7b61cb6 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -34,6 +34,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_writeback_connector *wb_conn =
+		drm_connector_to_writeback(connector);
 	struct drm_framebuffer *fb;
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	int ret;
@@ -48,7 +51,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..1ab448217732 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -49,9 +49,8 @@ struct drm_private_state;
 
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
-int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+int drm_atomic_helper_check_wb_connector_state(struct drm_writeback_connector *wb_conn,
+					       struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2


