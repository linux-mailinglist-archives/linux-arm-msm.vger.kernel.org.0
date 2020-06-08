Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7391F2130
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 23:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgFHVFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 17:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgFHVFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 17:05:45 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F9BC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 14:05:45 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id g18so15892676qtu.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 14:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=l260Oczt5NYvBAM8JWGWfwlC6xbJl17o2VEf10AzS44=;
        b=CseeuErBEfArFH/qvOm2e4aOzEu/535Sq9CuJsWO1Q85F5s0ZS6M7UdDa5H4jhBgGa
         mYOopnpofEfIk8y1bVHZIwXOVLbImEkLkXO3i6I8C9ZoZgeRZKZxaigphcgOXPBTEm6e
         GTMuVEQV35zYYmlj2g+7ofAGHlHaNf7z9t4NgGFjBtQmJW1LPjapU5eyBeyw1NX4SoJ6
         7oCK5TGSqKR3jgn6fDhvNkX+YFV9xSIRKs1rpLc6/DvOV3A4ebbC3ZpAYqvuw3wFZcB2
         S0XR8qMXnZ6WDHwEw9SUOxjQq3IOaA90FyIleE5dHV5Sp/aSVA445nB2Cw+X2J2Akfs+
         VozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=l260Oczt5NYvBAM8JWGWfwlC6xbJl17o2VEf10AzS44=;
        b=CC+MZWEa+HOXFEOAnA9bemZPcFmWOoSCFDa/qMVYRsD8yabH9IpJRpdkUWCN8Zos4l
         1av2gMz9hIdAmhK6x9I+AdGFiT5mlJ0YHIaJSkeEYaTtEg3Vt3ZjzrIW+sh0kyE+lHqL
         QfrTlp5IDaaocRXlko9sfjXLV8TOfJ6Jodr7VxEjxxtvPXh8ThZDzLuvrFDY40VVyhs0
         xpBBi40NlcSrpFjEcalKbCm86hyTlvzOvRWiWc78mGlPTfhtykwdoMC3vUeotJmzABMV
         VGGNP4fldakO96qrKpI/1A+268YYXRHUwnFEtmUNdP5nMcu+hrC6u7RVZQQ1261CN64s
         d0lQ==
X-Gm-Message-State: AOAM533TZzqZGzloQZoiSc8SkhfBwctxMuct3c0Pu9hXE4/MWd2z7mvT
        OfLbpgZ3Y6lBOgaKBG1JTy5lrA==
X-Google-Smtp-Source: ABdhPJz+V6uEQOV6V65xXTa5fOfwbjDQhqzzFkU5HU0ppoPhtj/oZgEmG1jcwSwRc3m01YVKe+vcTA==
X-Received: by 2002:ac8:342b:: with SMTP id u40mr24513501qtb.59.1591650344787;
        Mon, 08 Jun 2020 14:05:44 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net. [166.173.249.24])
        by smtp.gmail.com with ESMTPSA id z19sm9028902qtz.81.2020.06.08.14.05.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 14:05:44 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel.vetter@ffwll.ch, airlied@gmail.com, ppaalanen@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 04/13] drm/msm/dpu: Replace definitions for dpu debug macros
Date:   Mon,  8 Jun 2020 17:04:54 -0400
Message-Id: <20200608210505.48519-5-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The debug messages shouldn't be logged as errors when debug categories
are enabled. Use the drm logging helpers to do the right thing

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4e32d040f1e6..89c444ec3bb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -29,27 +29,15 @@
  * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
  * @fmt: Pointer to format string
  */
-#define DPU_DEBUG(fmt, ...)                                                \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_KMS))                         \
-			DRM_DEBUG(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
 
 /**
  * DPU_DEBUG_DRIVER - macro for hardware driver logging
  * @fmt: Pointer to format string
  */
-#define DPU_DEBUG_DRIVER(fmt, ...)                                         \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
-			DRM_ERROR(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
-
-#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
+#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
+
+#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
 
 /**
  * ktime_compare_safe - compare two ktime structures
-- 
Sean Paul, Software Engineer, Google / Chromium OS

