Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967B641F0D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhJAPOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354865AbhJAPOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:14:20 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2881AC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 08:12:36 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id x12so9413731qkf.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5LpZ3ZguONY85Yj+8TDhGH1NxKPoTzUsoi+RxvBOByQ=;
        b=ICVq+kBfBsktcIoPMe5bN1akH/HhUY/dY4KTiS2xA+tWtjcb9M6EnJtWpaW54kLsZX
         EFHzltZ1yxIbsNJPLlC8xZy8Mx3zUoyR6kxN1MUUYVgLywLauF+onn//745QUTA8s+67
         o1W3iYTnh9aelh/Gu25JgFxoKH9wBAo3ILqzF9R4LaJ0qziUDuXCUTM/TVfd17d3PDRm
         lHoL5gPtRfKh1JAxIw0KI0Po2Xsbvnko/p9cgDvSNqH8Rf/FHAnyYfiCuPznQex9cjI0
         5BkgA+DMPJ5MdS5CXoCinj0yhhrbmMmxXO/u60zFDcLgLAssMjXISVouCU3Ro/Nmz4/W
         fuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5LpZ3ZguONY85Yj+8TDhGH1NxKPoTzUsoi+RxvBOByQ=;
        b=qeq9aCK+ea7LGK0cqcoETbxMLaxNxTdZMp/Xd6kbir/3yeZXhcSz5pNny+aVivaGwL
         nBXHXNusRDvKx8lrqwwxS2utTel3zRoivSqUjNrTsoXdDFWSGB7MSA4ycoYCtaATRQli
         yN/a1XtQHil343IKupK/9dtKKk9xal841TbiV6qKO3QOUoy+etmLmsXqyGiah8lHoQR2
         9CJOxhq1DhD86AFOYSG2ld2vVSh0H4JwD/zhNLpJ0PRF1JOwOwfFjh+Jf8tZnvQtYsNw
         j8Fqe9V9LIQzkrs037KnQ3Je3J3GNipgqftLq/Hz8KNiOYmaTrYA4ji2KSUAqZH64IEO
         F6Vg==
X-Gm-Message-State: AOAM5328HELQlapmQxX9VKTyAG/AT9rT50I3ifwNk7Ngz4nTBYGHUbV1
        RLRKdlwk6dnCExvO4Q8Ogef75Q==
X-Google-Smtp-Source: ABdhPJwcTQWAL/a2ZupOdOaLqLVZ4qGuOCxg3LqBSx9yit94LTBxPpiSx8WPYJojOzVGBuKUAcSoEQ==
X-Received: by 2002:a37:b0e:: with SMTP id 14mr10088659qkl.118.1633101155376;
        Fri, 01 Oct 2021 08:12:35 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id 31sm3388909qtb.85.2021.10.01.08.12.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:12:35 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 10/14] drm/msm/dpu: Remove encoder->enable() hack
Date:   Fri,  1 Oct 2021 11:11:39 -0400
Message-Id: <20211001151145.55916-11-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-11-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
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

