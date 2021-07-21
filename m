Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18633D15B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 19:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236809AbhGURPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 13:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbhGURPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 13:15:14 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB86DC061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 10:55:50 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id h9so1375293qvs.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0pycXB2ultmLkKc35aeNj2U+LPhWXxWP52T2qDeRhjs=;
        b=VQnE8G+T99lqj+jpc8gjTrDIq60JvIspB210ozZeqOOMmMWKPswtglKyQ/zpgkH8xf
         nSzdznQC/pcNlTb+rokrH057TouO69ecT3IdtH4UMAttClC7sNr660xpBHvAE0AIXAjR
         xGj3wmsOPr3Iy23GWqOeN2yjeLnpugyXQDEs/TM10uBJUuXbqQQRB2MOQhR9gc2S0yZ6
         ieMFY38yfiEuI3efFX25D9oEN0kxhojGFGP6MQ7iLMoK2Lp5uxhiFV5GbBvf36oO3sbx
         e/WRldFNXL8dyuTodbz8ocXxzsjHcGIGW1ADfUiDnv5p6eTBMHtAkv5d8YSKh8Hk86H8
         v+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0pycXB2ultmLkKc35aeNj2U+LPhWXxWP52T2qDeRhjs=;
        b=TmNomV5bmncDnbbA+ChehvHyVEyGwN2Shk0aC+jSrp82QyuID9209eLhH+I6LpXhny
         RkfOfxbs9SKikAdtA2k0PeJ1Mgtod67P2TTBRHNqPEf3WujxWZHBlx5q/MLCdwL2s/Br
         UlYBL1X7vHskOup9IFIv0o8hlkTuE2yuieDOKX5yJLrGIpK5oVFlMaxtclqhnb+hz+rz
         rVBWFBsPQFXoMcIDPk8/xpz7nXP9e/07vCG2CBy+sKmQAlHNB7cCsvKvued2vP2eJb34
         lBe+yekWE12XhLqqHLkJWj67qNieazwgCCF0Bk67DK1g5SPGjllQmTzIH187r8RwroPQ
         TZgA==
X-Gm-Message-State: AOAM532OQssR4adiaexXd0/RzqeH1kmfhSfjQxxlPRqYMQKVQ3WApzmZ
        BT8ShdSF3JB5QTTBOxsKlxh20w==
X-Google-Smtp-Source: ABdhPJz/2XnWjDEIVkqQXiPb5u4xelAKiOrD8F4Pkyijtn6fTUroFWIgLbFDelftl6codkhebYsC4Q==
X-Received: by 2002:ad4:538c:: with SMTP id i12mr37924550qvv.51.1626890149955;
        Wed, 21 Jul 2021 10:55:49 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id j8sm9492446qti.20.2021.07.21.10.55.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 10:55:49 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        airlied@linux.ie, daniel.vetter@ffwll.ch
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [RESEND PATCH v6 04/14] drm/msm/dpu: Replace definitions for dpu debug macros
Date:   Wed, 21 Jul 2021 13:55:11 -0400
Message-Id: <20210721175526.22020-5-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The debug messages shouldn't be logged as errors when debug categories
are enabled. Use the drm logging helpers to do the right thing

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..c33164d3944a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,27 +31,15 @@
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

