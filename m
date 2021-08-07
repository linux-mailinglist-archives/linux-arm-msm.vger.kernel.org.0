Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15E63E36B1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 20:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhHGSeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 14:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhHGSeR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 14:34:17 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B65BC0613CF;
        Sat,  7 Aug 2021 11:33:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u2so11687377plg.10;
        Sat, 07 Aug 2021 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LbCW32LfSHCHAkiAwgfCI+KXCphqw3RtU6lMEfGs4FM=;
        b=HdmYOmjQidRcS6WoO3Htsl298KAtYq8+Eaq5/XEf3Z7n37J6mH2ARmttf3RQHmvqCf
         6q/f8QrpJLIaf1IOtYqH9+F3A4pQ/7UkL06foOUMelUX7oqPNNa+JXhswC6PY9XYUXlZ
         JA+TrtaRwbVjvmj7snzdDgBanh/EJUWjU4kxTt0B4dS3x8m+532AclfCkZqkPBmrXxdc
         lSFoCn5/SNppfNGCKmgIQql8D2Mc0ehYrsIYK7Eev9QeDJifAYFirbhKB2AuIxglp9Dk
         IXXpBsk7xuXfLM+6PZaIkIevkTKWMBdjCOyu1F3Zk8c2ei2lA6J9S6m82NzgKM4gFbHH
         rDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LbCW32LfSHCHAkiAwgfCI+KXCphqw3RtU6lMEfGs4FM=;
        b=b+b675RCuA9C3oz5oQ+u8cY7gMyAZcbFKqdCGcT+bodI1I5gIBlW1w6NGBDw3LQZxV
         NBzvZolRj36zrxKstdvaqheRSuHlA5+E95ixfGlSdA/BQc2yNox+fFLbmCinVQR3oCPH
         lDMx7az+rZ2bMkU7LPM+NSohq/liCtpPxeZVWFymbI8LDVXhnWOg+hkhfpiZSypJ+deo
         FfbpcE3GRLpEjiBfkDSz36fl3zIztsogr0EvU6RHrszsEplwnk8vwRHc8QxSMLPbDmlH
         /LrxWuG28Mj0yjhJ7oXjude5CdX/186iBnymcMtvPhr+rCy7E4vZf8rTbfkvqVD2Gz7L
         yetw==
X-Gm-Message-State: AOAM5325sjZ9h2/EPRmo6l8N7SJG5+vGmJxJpHJMdEtKY3y9dgPiWXbw
        Bbv8tZTOUuajPJLpJLdOIXY=
X-Google-Smtp-Source: ABdhPJyn8HHAGY4umCFcIm2FXINAlBNusy9WNu0LyLxSA7bVwAy1g17S3+kyeLOb/2xnu5OxfBOdyQ==
X-Received: by 2002:a63:1e5c:: with SMTP id p28mr107931pgm.3.1628361238079;
        Sat, 07 Aug 2021 11:33:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id o20sm16865561pgv.80.2021.08.07.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 11:33:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/5] drm/vblank: Add helper to get next vblank time
Date:   Sat,  7 Aug 2021 11:37:56 -0700
Message-Id: <20210807183804.459850-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 3417e1ac7918..88c824c294dc 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -980,6 +980,37 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
+/**
+ * drm_crtc_next_vblank_time - calculate the time of the next vblank
+ * @crtc: the crtc for which to calculate next vblank time
+ * @vblanktime: pointer to time to receive the next vblank timestamp.
+ *
+ * Calculate the expected time of the next vblank based on time of previous
+ * vblank and frame duration
+ */
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
+{
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
+	u64 count;
+
+	if (!vblank->framedur_ns)
+		return -EINVAL;
+
+	count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
+
+	/*
+	 * If we don't get a valid count, then we probably also don't
+	 * have a valid time:
+	 */
+	if (!count)
+		return -EINVAL;
+
+	*vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
+
+	return 0;
+}
+
 static void send_vblank_event(struct drm_device *dev,
 		struct drm_pending_vblank_event *e,
 		u64 seq, ktime_t now)
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 733a3e2d1d10..a63bc2c92f3c 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-- 
2.31.1

