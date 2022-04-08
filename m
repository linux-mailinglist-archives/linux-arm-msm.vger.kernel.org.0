Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34ED84F9EFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 23:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbiDHVOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 17:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiDHVOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 17:14:44 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7CB22536
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 14:12:40 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s137so6068127pgs.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nk1qUFXg3SiseuNYjEIl+VPm4EeXFht7d29XrU4KaA4=;
        b=hHTYVCbzDxg/E6f2Y5m+SrW5q0WvHz2DjhOqkt9ageKVHSkzhR36bFmCGsjUHf6l46
         g8lbXxqsW6ogDLPjvXs161Wnur99anKCZOV1yg7BjtKY2pHGJmAFmkqlWrmEehmNOf2U
         1GgiQCxoOJRaOLN/FYVn9voavYu9gGLQehaSe0lg4eINObxUDrkjRN809DqSqJ0nEqPm
         m6fVJvimqwyI7aafsQeLPxLUjmY7gTpQZXsNkynW1z1enXVR/h4clXHFNFegenDJasV6
         DNSMQ7Sw84CLuUxbYRwTcWB6mYCTELyC6JVhbsRRb4I7g/wsr5q+a9BmKzco85tUIg+M
         vK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nk1qUFXg3SiseuNYjEIl+VPm4EeXFht7d29XrU4KaA4=;
        b=gnQQWaiNWqm5D03ysQacnso/WZd4AwFgqR5KVTNVfHo8Gkr3KBqjAsm4XRmnGGDxkL
         5gFFrogRdoH+lKwtBlVlFdqX/rjjusgsuGUfwf8XMapwzFgHKonTx79bHGzG/m2yW5+r
         ySA48pl6wECyZy6coB0OWjSgx8xlK+zpLaLyxXMnX4mwiN3snB5Fe7mGf0SC+7q4+Fw5
         ihNmQzYd0yGMPsKYMDafBQJWsXYP0Yz9mb/nIUMn4FI9xIj9gvOIWGGJ9y9xh45nptAy
         7gQrwmEmSuZbuh3SCZ5oDml0ZtLCFb3fdo3SEjgUSB//4OpZZK+30COP4XC0LOQmclF0
         4Bmg==
X-Gm-Message-State: AOAM532T0qWj8SpHNl4ofVRpu3gIR6Rt6HsV1m5/94I2Zvpx672ggSgs
        2X8zgdLg4DyZd/sr3qLvLJ4=
X-Google-Smtp-Source: ABdhPJwttnVHc5lT1HgmINnh+1IbLwkQVQL2uri4evMfw1Up+524IZGFS0MQjKMwPf5h0DYx5sW0hQ==
X-Received: by 2002:a63:e24b:0:b0:399:1d7e:1503 with SMTP id y11-20020a63e24b000000b003991d7e1503mr16974463pgj.335.1649452359613;
        Fri, 08 Apr 2022 14:12:39 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:c6d0:c747:3e11:b8e3])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090ae38700b001ca8947e73csm12277207pjz.0.2022.04.08.14.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 14:12:38 -0700 (PDT)
From:   Chia-I Wu <olvaffe@gmail.com>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Date:   Fri,  8 Apr 2022 14:12:30 -0700
Message-Id: <20220408211230.601475-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In practice, trace_dma_fence_init is good enough and almost no driver
calls trace_dma_fence_emit.  But this is still more correct in theory.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index faf0c242874e..a82193f41ea2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -15,6 +15,7 @@
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
+#include <trace/events/dma_fence.h>
 
 /*
  * Power Management:
@@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	gpu->active_submits++;
 	mutex_unlock(&gpu->active_lock);
 
+	trace_dma_fence_emit(submit->hw_fence);
 	gpu->funcs->submit(gpu, submit);
 	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
 
-- 
2.35.1.1178.g4f1659d476-goog

