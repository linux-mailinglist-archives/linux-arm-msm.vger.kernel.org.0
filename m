Return-Path: <linux-arm-msm+bounces-3524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE6806BA6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DA97281E51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFC01A29C;
	Wed,  6 Dec 2023 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y25vgORQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41F8D44
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 02:14:58 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ca208940b3so7230491fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701857697; x=1702462497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70HOTD/cQ7LFZtK322MA1C1lmqh4uEFtx7g2XW2sKm8=;
        b=y25vgORQI2br72FAF2ij0xzl6bYiFQV7vnunKD+S2PbGs/6Wdmx9fC0kdBe79S87NU
         6c21nhDFjTeaMippU7TW2th0Xe9Qt+eFCKNgCLmWhNTjKSXNnj+eWDp9XbX+vSl8W3+s
         ZAEVm8hr/a8vtmG1YsmYzOA0alwK0eSqZD31qG2CQ+FRnaKCr5z2eZi3ublAWJczkiT2
         gB451PZef+MyK7dcZj69LGMIeavnshaGp+Hd4G5pTzhzc3youU0M7j8QoDV9YTfQ1Odl
         hWi9C8zRxq/T5Izb4SLP2wARoZgftgJm4zG9KM/m1iby9HjCUgDCfRUKFjWbzUMDMu6p
         G6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857697; x=1702462497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70HOTD/cQ7LFZtK322MA1C1lmqh4uEFtx7g2XW2sKm8=;
        b=mzRqZ7XbEIFv+pd/PuySFb72mTATrxQJ0a0FnbXTbgS7ieqqx9JjsdrdYxJiDU1Utq
         smBFAU3wPoMS9pRiiMerRsdIu7RweZyAyAI9TaAeXr6jivRXU9I515niqvUl+r/y23WT
         z7RGO0H9cw8bpuQVEVzdGlwz+6+OXJ/UuGeJ5yrtJZiea9i2yGx4iU7+qQsmkmUcbbq7
         X5X3Fjdle02tP77tuezy07nebwlH4AVT+eDcNCWuonCtL8igfOH39GKlvSjCkQSLXhgo
         EE+NGUmJ0m9BoJniEn1SK9Th5xoM39U2MyZ6a3/u8GIeLRMqPswcLfGjJSCGtVBAjeiY
         gBMA==
X-Gm-Message-State: AOJu0YwvcKO/zcKrAsZARfpK5K24mF+i1aGpg5+/J96TkBYycGM0ZaCQ
	0+K52TeFLfMp4de/FCWwBccs4Q==
X-Google-Smtp-Source: AGHT+IG5lnaNCOrVzAPY7gQ6lp3lGWfEendm5wcELXyB0ij2XYr5rj9vMGUe4uWkEY58YD3XbDmdiw==
X-Received: by 2002:a2e:87d4:0:b0:2c9:f46d:dbbb with SMTP id v20-20020a2e87d4000000b002c9f46ddbbbmr457953ljj.23.1701857697093;
        Wed, 06 Dec 2023 02:14:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c03c100b002c9e6cbf78esm1519012ljp.19.2023.12.06.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 02:14:56 -0800 (PST)
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
Subject: [PATCH v3 1/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date: Wed,  6 Dec 2023 13:14:54 +0300
Message-Id: <20231206101455.1664463-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
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
index c3f677130def..c98a766ca3bd 100644
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
+drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
 	struct drm_framebuffer *fb;
@@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
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
index 536a0b0091c3..fea528aacfe2 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -49,9 +49,8 @@ struct drm_private_state;
 
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
-int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+int drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
+					       struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2


