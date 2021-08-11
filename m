Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1643C3E9752
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 20:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhHKSJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 14:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhHKSJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 14:09:13 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B88AC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 11:08:49 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id bl13so1628519qvb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KUmaj0oLKuY130SlLDYefiaXifVeGanjmdsaWhhHKKY=;
        b=Beh9TR6CELn8NnHX+X+wahTDJ4dcaQrqTgnGH81+poSernpnEoMw7XWfAvEneSKEU2
         8rVsQ0Zj6UZ8fYxrO9HfzOo+tSqutiHZjT2diIlTQO4d5LskUwrdYpNrf+AWU3ldC9Ct
         QEe3sLbUT3JXRrvNUNIzH4R1VI4ziwojUH1t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KUmaj0oLKuY130SlLDYefiaXifVeGanjmdsaWhhHKKY=;
        b=FSyacC5mMtFPXHGAxsdDbKPLa0CH1i7+51jSn3uEiMnKyr/y23TMQ83Og02qmaadAM
         zWLPUJuZvBi0aZGpJsUMhoJEPnUeI67qANSnKAUmfOaKTWqM1SsDVkCmzRKoIxgn6WvQ
         0PaDQY3uaJ7tKc3vbojSgMUIuxIYigGaGm6rVI/bQwDXNFI8iTHJtlYzxWbDs+C+WO8B
         NvZdXWGOxT31UV41sXs2rrJ+OoOj8hJufymiVeEV+E3EENkHHvHvbicVqeoiYnPvH4bg
         prUtLbZ9fHYxc5R+zMdDql9lvfWRwGwv1mdYvnEHruS5OuDy/aa9vnx2rPGLnC+wESgC
         Msmw==
X-Gm-Message-State: AOAM5311KbpXcewjSUX5eabhA6bshULHu4HE8Iwz/CdBzHWx4j74Jg3a
        Y0pke87E/DlkG2yoEnGgHBXhoA==
X-Google-Smtp-Source: ABdhPJxDbJzvaQuS9+X4f6NxP+u7oAL5b1ECsOHaEcWyZfvAFyAKx04CXTPwTWSld0AT15Hzy1PDqw==
X-Received: by 2002:a0c:fad2:: with SMTP id p18mr1254855qvo.3.1628705328261;
        Wed, 11 Aug 2021 11:08:48 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com ([2620:0:1003:416:dbca:c030:2b4a:66b4])
        by smtp.gmail.com with ESMTPSA id y12sm9666397qti.92.2021.08.11.11.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:08:47 -0700 (PDT)
From:   Mark Yacoub <markyacoub@chromium.org>
To:     seanpaul@chromium.org, abhinavk@codeaurora.org,
        robdclark@chromium.org, linux-arm-msm@vger.kernel.org
Cc:     Mark Yacoub <markyacoub@google.com>,
        Mark Yacoub <markyacoub@chromium.org>
Subject: [PATCH] drm/msm: Read frame_count and line_count even when disabled.
Date:   Wed, 11 Aug 2021 14:08:44 -0400
Message-Id: <20210811180844.2130484-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mark Yacoub <markyacoub@google.com>

[why]
Reading frame count register used to get the vblank counter, which calls
dpu_encoder_phys to get the frame count. Even when it's disabled, the
vblank counter (through frame count) should return a valid value for the
count. An invalid value of 0, when compared to vblank->last (in
drm_vblank.c::drm_update_vblank_count()) returns an invalid number that
throws off the vblank counter for the lifetime of the process.

Rationale:
In drm_vblank.c::drm_update_vblank_count(), the new diff is calculated
through:
diff = (cur_vblank - vblank->last) & max_vblank_count;
cur_vblank comes from: cur_vblank = __get_vblank_counter(dev, pipe);
When the value is 0, diff results in a negative number (a very large
number as it's unsigned), which inflates the vblank count when the diff
is added to the current vblank->count.

[How]
Read frame_count register whether interface timing engine is enabled or
not.

Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
Tested on ChromeOS Trogdor(msm)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 116e2b5b1a90f..c436d901629f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -266,13 +266,8 @@ static void dpu_hw_intf_get_status(
 
 	s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
 	s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
-	if (s->is_en) {
-		s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
-		s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
-	} else {
-		s->line_count = 0;
-		s->frame_count = 0;
-	}
+	s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
+	s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
 static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 3568be80dab51..877ff48bfef04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -41,7 +41,7 @@ struct intf_prog_fetch {
 struct intf_status {
 	u8 is_en;		/* interface timing engine is enabled or not */
 	u8 is_prog_fetch_en;	/* interface prog fetch counter is enabled or not */
-	u32 frame_count;	/* frame count since timing engine enabled */
+	u32 frame_count; /* frame count since timing engine first enabled */
 	u32 line_count;		/* current line count including blanking */
 };
 
-- 
2.33.0.rc1.237.g0d66db33f3-goog

