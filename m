Return-Path: <linux-arm-msm+bounces-2975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C88015E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD711C209BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A22A5A0F7;
	Fri,  1 Dec 2023 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FhOYFFLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EF310F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 14:08:46 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9d4afb7dfso24960841fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 14:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701468525; x=1702073325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuP6QXU38xtT8HMlDWPSd16zhS+9uv4oxYxLpwR5gVc=;
        b=FhOYFFLJFGT7608GOgN/nOHP4o9DH/gVgVp0EcG1qc+Lf5kq+SgflS6StVYTFRxyvV
         SV53aOffuVLn4MZpf4of+As+yxmAEJJZ8WvzblW6ghQu1kb69QB0t3Njc/LmY2kLzPua
         nuLzxESCPyYx/tMwo424SXVJLnmv5q7fyYqXE+IDDZ6yBvU1e7xYFR+OJU3MqreN7THI
         IyFkhbzKtwWOCN+e1DdZkBQ+gMWmFsr5QUZJAS3WB14hwRrkT6VIqyM9qGYth5nFXdBs
         Q+Nq+dGoq5GM2vYhIawixIFiK7eTlw9Gk2NUOb874qFXj3BfyLdUF8fD6hziq7Umll1/
         s1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701468525; x=1702073325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuP6QXU38xtT8HMlDWPSd16zhS+9uv4oxYxLpwR5gVc=;
        b=vRXMwZX5JEpGml7AIFWVCSwE9cB4sgPz9R6tNQhjnbtx0nfbHnJKi65p5HNZ009wDv
         xAj7eMmZ+aWt3pHjr+sOub1UzJdoCZy9/Rb8LaZEA0vJ/W170d6JvQ3zGvIQzrcAYOaa
         I46SMuEFFKtaETLPjeknKrmSZj1h0QBBpp+Ac9VufWX+ANZbPeo5sK1nmy4tfKNLAV2l
         66h/M55GF6ByJ/fO/zrZwpZQCxoAs16Whs2ZrZj4ec+0pSxunjNnlcGDZ1TeAo2ROGp7
         Ms6WsXmpl6T6sbITo9vahk3p02byrI8MKRJEZ71npm26P7/e6ov2mj9YfMY98GEa7YIi
         xi+w==
X-Gm-Message-State: AOJu0YyPenJ+783oPNqa6syqCJ41SIh6X4oin0FtWxrGcG4TMosa4deN
	duPEdwztkJuJskryoDDS/5YOeQ==
X-Google-Smtp-Source: AGHT+IGxCvzOQkhfqNA+HGNqiqjD387u9GwATSSQVcVVMjTa/c7i/g5mW51GGkR0DGOlwkKJeH0EQA==
X-Received: by 2002:a2e:8547:0:b0:2c9:d872:abc8 with SMTP id u7-20020a2e8547000000b002c9d872abc8mr1280015ljj.70.1701468525118;
        Fri, 01 Dec 2023 14:08:45 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s3-20020a05651c048300b002c9b861cb1fsm513724ljc.91.2023.12.01.14.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 14:08:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date: Sat,  2 Dec 2023 00:07:49 +0200
Message-ID: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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

Drop the first argument and rename the function to
drm_atomic_helper_check_wb_connector_state().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Resending, no reaction for two months

---
 drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
 include/drm/drm_atomic_helper.h       |  3 +--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2444fc33dd7c..d69591381f00 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
  * @conn_state: connector state to check
  *
  * Checks if the writeback connector state is valid, and returns an error if it
@@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
 {
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
@@ -827,11 +825,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..56edec6f1634 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -48,7 +48,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(conn_state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..742ccbcd7809 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -50,8 +50,7 @@ struct drm_private_state;
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.42.0


