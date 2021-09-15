Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C32040CE3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 22:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhIOUkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 16:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhIOUku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 16:40:50 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D66C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:31 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id w78so5012258qkb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jP/zySodbcv7yPctTJZjyGQ1R5NRzlzi9iZQSfQjqLc=;
        b=dKVUq/K+eRbhDdApTejUg5xhihb8nc/VTuk6G2VaGGqo4KNWgX9VNR8GGBVi4QdS2+
         2hndkyzjFi6GQj4LlxwndHGySz7/LP23NOiXIOXLsrVUYR7OtAMLIUNHlKx/RZ6gLl9D
         Ry2SukwZf73OmbeTm735c0FupNTTpSwnAIyIafui/+UU162wxb+3thwbW1qsDLgrCDrc
         nn8ejwIcITfVyOE58Zf2JIxZ1EwDOkW3i13VWaBfSsLx3kNhbdXoI0dwaYUquLtQhtzK
         9gXqXF9pFTbqPyun8ZoeMiRLNUYs49LGsp9VDchYMEBfqrw2+r3INicUPS72mzcBo+KL
         wFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jP/zySodbcv7yPctTJZjyGQ1R5NRzlzi9iZQSfQjqLc=;
        b=QtEQbIQalNryfuxVS8br8/VgPkTT49KMkkp0z+SDJP+x+VtOvfpnqGsGYilsU7tiOA
         Jv0bg1jY8478sSDX6c5Wh2WG798Uc7ytB2aqOs3/s54xZ8ZAytoAQJ3Vj95sql8ZvYHE
         a65mmsnfRj5tuI5P1j5I6xl4EGg/ScMnAjrU/5dH33oLcbB17tsnpjA+xFpn18JKzT+p
         yBNcGxPJi6+Yk9++cR/NxC0osxkb/Xe0OKxkL4RYA1tTu0pJgZoosYqwwW5q7UVufV01
         pwwKAna71q2fLWhtlNnJx0SFKNhT9s4Lxg/6akSqgFgh7HNXQYKOdEleHsAPpDqEgRgJ
         y3Ug==
X-Gm-Message-State: AOAM532k76d47rLXMx/N2O+MvDumUQ9glOwstjPxzLLmmZsjwnt4z8Yh
        K4h++bCpIKWxWQPkbw63KzWjrA==
X-Google-Smtp-Source: ABdhPJx8mFG8U9qOe4Q0vASKW4MrDsYB7IsdPDTlkpPkl4ltZ49SQMb9WcOGgs6y7ooscX09tVrIdg==
X-Received: by 2002:a05:620a:220b:: with SMTP id m11mr1939829qkh.320.1631738370585;
        Wed, 15 Sep 2021 13:39:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id d129sm821081qkf.136.2021.09.15.13.39.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 13:39:30 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 10/13] drm/msm/dpu: Remove encoder->enable() hack
Date:   Wed, 15 Sep 2021 16:38:29 -0400
Message-Id: <20210915203834.1439-11-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

encoder->commit() was being misused because there were some global
resources which needed to be tweaked in encoder->enable() which were not
accessible in dpu_encoder.c. That is no longer true and the redirect
serves no purpose any longer. So remove the indirection.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1

Changes in v2:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ----
 4 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 984f8a59cb73..ddc542a0d41f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2122,11 +2122,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.mode_set = dpu_encoder_virt_mode_set,
 	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_kms_encoder_enable,
+	.enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
-
-	/* This is called by dpu_kms_encoder_enable */
-	.commit = dpu_encoder_virt_enable,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fb0d9f781c66..4a0b55d145ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -381,28 +381,6 @@ static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 	}
 }
 
-/*
- * Override the encoder enable since we need to setup the inline rotator and do
- * some crtc magic before enabling any bridge that might be present.
- */
-void dpu_kms_encoder_enable(struct drm_encoder *encoder)
-{
-	const struct drm_encoder_helper_funcs *funcs = encoder->helper_private;
-	struct drm_device *dev = encoder->dev;
-	struct drm_crtc *crtc;
-
-	/* Forward this enable call to the commit hook */
-	if (funcs && funcs->commit)
-		funcs->commit(encoder);
-
-	drm_for_each_crtc(crtc, dev) {
-		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
-			continue;
-
-		trace_dpu_kms_enc_enable(DRMID(crtc));
-	}
-}
-
 static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..f1ebb60dacab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -248,8 +248,6 @@ void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
 int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 
-void dpu_kms_encoder_enable(struct drm_encoder *encoder);
-
 /**
  * dpu_kms_get_clk_rate() - get the clock rate
  * @dpu_kms:  pointer to dpu_kms structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 37bba57675a8..54d74341e690 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -266,10 +266,6 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_complete_commit,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
 );
-DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_enc_enable,
-	TP_PROTO(uint32_t drm_id),
-	TP_ARGS(drm_id)
-);
 DEFINE_EVENT(dpu_drm_obj_template, dpu_kms_commit,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

