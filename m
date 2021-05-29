Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B19394987
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhE2A07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhE2A07 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:26:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AE6C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:23 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id v5so7319614ljg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ykno5ScqHISl5MvpMMbNruwqmEFF7aFVt3CW4PsTnD0=;
        b=QLjrGFMtKLfQ7blal/P4aEXB9sZBj0Q1nPFAMnGTYPRPIjqTaL64EJ07xkwIHtnFGT
         CxCldIIBoBiK5R9Ime+szoKeM1QmFcUxf4/rqkDABkqSBlRHW1beCwjnyeI+DLQR224n
         6tlZmnEvdb6V+k6MeqaEVK6VJD03yNCGOM9+AgKzvrGhH8kpzoLFlOJiTo1zt7CqIs8L
         yRjpY+DExop/G4UsBctnTTv3slEK+Fgkm6PxN2FDulHNWcVDu9Y9eabEkEUWCuvsBMKV
         OvnJAvdmVGBLEM8dsZLlGnkzNfDJl6LCWtj+4cJC6TyVJGt40peq//cQZx4qsoiVGgBm
         hhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ykno5ScqHISl5MvpMMbNruwqmEFF7aFVt3CW4PsTnD0=;
        b=H78nX4ZJ62B8S3NOdQQQrABK7xw/vGU5TZuGjc7kSeTjhPYaFhTLQuUjCwnXHFjGoQ
         AFg3+y0CiozWyvdgrFfkWe43V9Xuai5s2zi0cUI3mypcNFGcPANHvtRH3A4I0pLQqjMa
         1hfNmGpvgw+f+1g6FR6f5Uvo0hRKXDup9W2JlvOEvdXf4OVzg768+nv+TgOuC2s8ObFu
         mE+WKkG8BswKOdbnpFoLB/3W6u/4Xe22ThNKTi89GnHEq4sXvtQ1eSMDVot0pCBHZcYs
         VtHkzQXq8Xkko6Y2PT7fD7CP6sHSoKmAkEMPUtBBmp7P88LSXmXleSwFo5WXDqhwshR0
         H5DQ==
X-Gm-Message-State: AOAM532PMdTax2Ps8+EShyubpP857RxI3755dwTj3ch89GYQwFl/9JSN
        CKwn6F75cabloICJza8pK0WVqA==
X-Google-Smtp-Source: ABdhPJyzPZTQeNBeNMprhLvNq5mnP5aEiblRwvbvAdvjHR4A3MC9MpNeyNItO6/UOSlkhMm9TyIMbw==
X-Received: by 2002:a2e:90d6:: with SMTP id o22mr8369126ljg.473.1622247921499;
        Fri, 28 May 2021 17:25:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:25:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 7/8] drm/msm: do include unused headers in msm_disp_snapshot.h
Date:   Sat, 29 May 2021 03:25:07 +0300
Message-Id: <20210529002508.3839467-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  |  3 +++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 19 -------------------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++++++++
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index c1f725c0cf60..802e860cd045 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -5,6 +5,9 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
+#include <linux/devcoredump.h>
+
+#include "msm_kms.h"
 #include "msm_disp_snapshot.h"
 
 static ssize_t __maybe_unused disp_devcoredump_read(char *buffer, loff_t offset,
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 327df4892a9c..402bde48a2a7 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -6,28 +6,9 @@
 #ifndef MSM_DISP_SNAPSHOT_H_
 #define MSM_DISP_SNAPSHOT_H_
 
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include "../../../drm_crtc_internal.h"
 #include <drm/drm_print.h>
-#include <drm/drm_atomic.h>
-#include <linux/debugfs.h>
-#include <linux/list.h>
-#include <linux/delay.h>
-#include <linux/spinlock.h>
-#include <linux/ktime.h>
-#include <linux/debugfs.h>
-#include <linux/uaccess.h>
-#include <linux/dma-buf.h>
-#include <linux/slab.h>
-#include <linux/list_sort.h>
-#include <linux/pm.h>
-#include <linux/pm_runtime.h>
-#include <linux/kthread.h>
-#include <linux/devcoredump.h>
 #include <linux/dump_state.h>
-#include <stdarg.h>
-#include "msm_kms.h"
 
 #define MSM_DISP_SNAPSHOT_MAX_BLKS		10
 
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 9f61e376bec2..5b278329a9ee 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -5,6 +5,14 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
+#include <linux/io.h>
+
+#include "../../../drm_crtc_internal.h"
+
+#include "msm_kms.h"
+#include "dsi.h"
 #include "msm_disp_snapshot.h"
 
 static void msm_disp_state_dump_regs(u32 *dump_addr, size_t aligned_len, void __iomem *base_addr)
-- 
2.30.2

