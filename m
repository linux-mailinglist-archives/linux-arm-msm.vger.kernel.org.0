Return-Path: <linux-arm-msm+bounces-3141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F7802386
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 803F91C2026E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743BFD26D;
	Sun,  3 Dec 2023 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTQGiUTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC003E3
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:53:20 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bccc2e3efso4642929e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701604399; x=1702209199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJl8C6IXpPDsexf1/6XSUISrlVEE9TRaYydcmDxqvy4=;
        b=oTQGiUTciYF+/LeJoaRf97jc6RmKkn3Z7Vvx7uwJfnOoBLX11zQx3KWcayjhutMsX9
         M+FWgkfRApBZ09qGanhwHi23+p0/HAmr1xagmmYKixfEhmGYQNjHpzTnf/OCFp84TMoB
         kpmD21cJw4V39fAuI8+OPzYubDA9eyyBHbgvVUefJF66lLqPIyGOaLqohd/+mOo5W/5R
         4hiL9L2Q1MhOjiai0cFxDE0ZVRPg1MRnsUKd/MeOntP/GlOL1r+GW0t8Ks2JEAQ2D6VO
         oq8xHn8fOaRTCCZZ6gkfHy1KuURljU791d8PWQqfXarvfh1oYFJeMsVHU1O5ful4ybBP
         wSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701604399; x=1702209199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJl8C6IXpPDsexf1/6XSUISrlVEE9TRaYydcmDxqvy4=;
        b=F7RGLxPa4AtkZo3gG6367mZA0hS7GuZEhZmp0osF1X3nTl9IokPfhLAOG6ZXUIyv1M
         LFl+wuVD2JASA/PG4GJg0S9QCKi0ZvG/yI6NjFP4UY+ivqYfC4o6XTamROILMpaVscMv
         BbHg4Q5imQTeSTMrDu1CzRxKc1VsDFatBjBnqwmHnmKagZaDigVqyKOt2sazt/6Z5HuK
         L+gGqXHlCAL7y+lPcg/SQBQdaPquTTW7/QkbHk1kNqPXPv4Smrfza8vH01vE93CCpKJE
         y5Piu76tDoaG7xscRVrJCA26DyLEdqkQR4IArJDoysVBTodSvugj+6HVXygn1d5ZMeps
         4YvQ==
X-Gm-Message-State: AOJu0YwOX8iQT51MkI94RfSsJH4lVM/1ZEtoKQ2NGDptHRSmMrE19dVh
	rllnpdOd23Tt8I4QGLACri+qKw==
X-Google-Smtp-Source: AGHT+IF+LG0xwiVX6CIWcxy2ns/JFQZ9blJ5qTzmvIPP1Rd63+wG+eo84/XVVeseig0keYXI0/mnrw==
X-Received: by 2002:a05:6512:2152:b0:50b:ef96:bed7 with SMTP id s18-20020a056512215200b0050bef96bed7mr376449lfr.50.1701604399064;
        Sun, 03 Dec 2023 03:53:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:53:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND v2 3/3] drm/msm/dpu: move encoder status to standard encoder debugfs dir
Date: Sun,  3 Dec 2023 14:53:15 +0300
Message-Id: <20231203115315.1306124-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now as we have standard per-encoder debugfs directory, move DPU encoder
status file to that directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..498983e62f7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -184,7 +184,6 @@ struct dpu_encoder_virt {
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
-	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
 	void (*crtc_frame_event_cb)(void *, u32 event);
@@ -2108,7 +2107,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
-	struct dpu_encoder_virt *dpu_enc = s->private;
+	struct drm_encoder *drm_enc = s->private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i;
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -2130,48 +2130,16 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
+static void dpu_encoder_debugfs_init(struct drm_encoder *drm_enc, struct dentry *root)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	char name[12];
-
-	if (!drm_enc->dev) {
-		DPU_ERROR("invalid encoder or kms\n");
-		return -EINVAL;
-	}
-
-	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
-
-	/* create overall sub-directory for the encoder */
-	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
-
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
-
-	return 0;
+			    root, drm_enc, &_dpu_encoder_status_fops);
 }
 #else
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
-{
-	return 0;
-}
+#define dpu_encoder_debugfs_init NULL
 #endif
 
-static int dpu_encoder_late_register(struct drm_encoder *encoder)
-{
-	return _dpu_encoder_init_debugfs(encoder);
-}
-
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
-
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
-}
-
 static int dpu_encoder_virt_add_phys_encs(
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
@@ -2355,8 +2323,7 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
-		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
+		.debugfs_init = dpu_encoder_debugfs_init,
 };
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.39.2


