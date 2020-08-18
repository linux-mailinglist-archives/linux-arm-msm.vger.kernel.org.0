Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF036248BA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgHRQah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgHRQac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:30:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD02C061389;
        Tue, 18 Aug 2020 09:30:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so9439541plk.13;
        Tue, 18 Aug 2020 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uYxuSXULk2GwrV5tHUS7tlUyDew6i48Gt8hPnnZN84g=;
        b=jlUvltomcG5Fs1zTsYqZ4MPlEO7mi885cnLyByLOf/phVAxDxC/U7iZvM77jJsGEon
         BSB92p/40B+ItljjVLLfyC22l7nQGtkrG1fY4SSNZ6/h6lXzRO0A55vLcLqJAschsIAk
         rWMmS6jskMc8PRfm2Fdc3eM+SAw68d28J38L9Mq22289DScuXoqjQEY2HPybucWrJNpb
         eo95W8tP05JxIplOkGywaw3NvV5jayRJtLaVFtxS+Vj2rgkMvIUxwvCO4VGph/FYgCS1
         U7tsrS0QrTXU0VV2fTmqNDJD97o2IIVqob3Mg9fq1BycbARA8d5fMoUbixGGQ5Wi/5WP
         L7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uYxuSXULk2GwrV5tHUS7tlUyDew6i48Gt8hPnnZN84g=;
        b=Rd7CmLlekFCbPaIAHpIbinvxg9+w39odLLtLCOaI54EnzaXpY22JuNNyDZWfD0IYU6
         BWl4e9bl2W+VbYbFtVtZAtOVUxsTgEGzT6kcQukfAQ6WIYjDgvjETdg2V9zqQiNhpuZD
         e+pga/gMhuGRD9QmYNF27nO4zqZyclTcLNINlTGeSpaUxO6mszGvDiGiUHrHunQRT0gC
         +w+uRaUD24Ow4MJpKeQadXP7KtGZsiijcmfqZoyXIv7VAWgCw/W4DyEEpT1W0u9iW+cn
         f0qIcixEwYJR6AVGgxVzWMCH12YzwA9AOPe4fgTWz9UYzrUFdndC2sD07aj6chtu4VuD
         zUYw==
X-Gm-Message-State: AOAM53174wKaYCGQm0wVWefPXXJu9YZg5tE/ZIR+h0JI1WUZAYSgGgqI
        7+GTwc4sJC2p/ALC/IEMH1o=
X-Google-Smtp-Source: ABdhPJwGwtmXC5WmDnnwZPtj1PesksPhW1Ru5oVRk3RWoVgwq9xKWge/sunWKKolPUaWZ9nAMKTCQg==
X-Received: by 2002:a17:90a:d70c:: with SMTP id y12mr621940pju.31.1597768231683;
        Tue, 18 Aug 2020 09:30:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id g2sm374594pju.23.2020.08.18.09.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:30:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: enable vblank during atomic commits
Date:   Tue, 18 Aug 2020 09:31:19 -0700
Message-Id: <20200818163119.715410-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This has roughly the same effect as drm_atomic_helper_wait_for_vblanks(),
basically just ensuring that vblank accounting is enabled so that we get
valid timestamp/seqn on pageflip events.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 5ccfad794c6a..561bfa48841c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -27,6 +27,34 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
 
+/*
+ * Helpers to control vblanks while we flush.. basically just to ensure
+ * that vblank accounting is switched on, so we get valid seqn/timestamp
+ * on pageflip events (if requested)
+ */
+
+static void vblank_get(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+		drm_crtc_vblank_get(crtc);
+	}
+}
+
+static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+		drm_crtc_vblank_put(crtc);
+	}
+}
+
 static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
@@ -44,6 +72,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 
 	kms->funcs->enable_commit(kms);
 
+	vblank_get(kms, crtc_mask);
+
 	/*
 	 * Flush hardware updates:
 	 */
@@ -58,6 +88,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	vblank_put(kms, crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
@@ -221,6 +253,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	kms->pending_crtc_mask &= ~crtc_mask;
 
+	vblank_get(kms, crtc_mask);
+
 	/*
 	 * Flush hardware updates:
 	 */
@@ -235,6 +269,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	vblank_put(kms, crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
-- 
2.26.2

