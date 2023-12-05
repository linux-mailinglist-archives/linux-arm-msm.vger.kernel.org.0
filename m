Return-Path: <linux-arm-msm+bounces-3383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062148044F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8248CB20C2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5435DCA53;
	Tue,  5 Dec 2023 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCRnPbXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E65138
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 18:31:55 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bf4f97752so2287088e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 18:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701743513; x=1702348313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBAqK5na52vzzJw+TiPu+r/BK0W0RfVpJwm0wSsQoZ8=;
        b=ZCRnPbXx2PqIqUy3IkS0u748t9j39PG8Goh0foahvvhRTrG9Lkb6Q77t79LagIRIun
         VOcxLsTyOft3vk/iYAFPLdxfHCT+EdYgdn7Nz6U1Q9bIYNdjhWsR2nNX4w7Lk6R6AbUj
         0/nYU8+/UZzHsNnuH6H0E8BSr5Ru4f4HFnc9CY+OuGWIjgO1IBOYM8VmU/LCumWevMR9
         ebENx2Udtf4X0mpHtaqW7+XzmZLgbLVcP52ZXwHt320VA2ekn1SMe4n3qlWiKvfQ4VHG
         dzRTnVIDhOfT63mAWPraGtPJXrBmcorxbVhCzIf4hHAVpnpAvPVCzSrDow0oNqN4b3Xp
         dEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701743513; x=1702348313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBAqK5na52vzzJw+TiPu+r/BK0W0RfVpJwm0wSsQoZ8=;
        b=oX9B56zKKgeA49S0Kcp2Tgynb+7WOKoHxgaJnbDqHtwd2kVoOMCTykGwhUqZUzMaMw
         Bd+kZSB6j0eocWCQnvMl2haINtigXSrHk2gb7KVFQAUm/8Gv2wPZ6CTWYhwXRgrTUGPm
         RZF6GQDwRlGOTv2vNZmW1oXU8V96M/uhk5TmqltnasIF+75nP7UOAAjdS13RxAstyem5
         7lzIHHGT8I+fOvyKiviWDOp2uwtzvqe/YjNKiHoPrNBixQnMxZFnz3rEruOk1xcFjwJ/
         /d6FUzE1mkb46cVjRTmgDGYrPVnRrxh0YA2HB28Pc4N4htv9j5a84Fv/a6ASBCe002kb
         /TYg==
X-Gm-Message-State: AOJu0YwAdwRAIdcZug0Wapoo37ZYnkTjIfVV72+uiatslINghOFIlY5P
	gTTuFFkJkYhnHJy72cJQ2lE96g==
X-Google-Smtp-Source: AGHT+IH9UwgeVuMspv8xoiJVwYH/BlCXJM8XenBUUZc2vkOvNjr6cbHX1Q2lc9ZOjhV/+YkEGhyYkA==
X-Received: by 2002:ac2:4a81:0:b0:50b:e6e4:c6c9 with SMTP id l1-20020ac24a81000000b0050be6e4c6c9mr2128004lfp.85.1701743513266;
        Mon, 04 Dec 2023 18:31:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t10-20020ac24c0a000000b0050bc57ec288sm1414726lfq.44.2023.12.04.18.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:31:52 -0800 (PST)
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
Subject: [PATCH v2 2/2] drm/vkms: move wb's atomic_check from encoder to connector
Date: Tue,  5 Dec 2023 05:31:50 +0300
Message-Id: <20231205023150.1581875-3-dmitry.baryshkov@linaro.org>
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
index 23c4f7b61cb6..ebb5183794db 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,20 +30,27 @@ static const struct drm_connector_funcs vkms_wb_connector_funcs = {
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
 	struct drm_writeback_connector *wb_conn =
 		drm_connector_to_writeback(connector);
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
@@ -51,17 +58,13 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
+	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, state);
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
@@ -164,6 +167,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.prepare_writeback_job = vkms_wb_prepare_job,
 	.cleanup_writeback_job = vkms_wb_cleanup_job,
 	.atomic_commit = vkms_wb_atomic_commit,
+	.atomic_check = vkms_wb_atomic_check,
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
@@ -174,7 +178,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-					    &vkms_wb_encoder_helper_funcs,
+					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
 					    1);
-- 
2.39.2


