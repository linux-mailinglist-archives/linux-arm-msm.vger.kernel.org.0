Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C064FEB45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 01:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiDLXbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 19:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiDLXbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 19:31:19 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8342290271
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:28:31 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id s2so300632pfh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqPjwNSGzY9+HzHZDgw3eVUdEY3fO13OJf0xVug0ueo=;
        b=Rx8iu67QAQwZex6fWL1sgh8cglXQ0Z3CWcYve31a4UC5d8j2CV7Vw2Ehyn7Jl5D/dy
         KRLOS9ND5rXOD6H9AKNJP8qIbbx4HicQAJh2mV4/MW/DUyyYnZ0IRnaYZjsE4+n01Dtx
         7TvlEsBNYYjr9c2l6zl2ZhXQ+hoWGpWsz1HvM/Ie71Fzu7AvydchWb1482ARULazfIDD
         83mA7Z4abQjO0XQukQQFXvbIJ/WAX4QMxJtTPwRMqpMfxZzD+VvidqqBTw5krHUpsJHc
         jSQ24icK4yMtWbRzlJDnw0ZBKh0TFJMWjtm5yl8UuBCC80ftU/EbNnxI8V9wS0HQYeK/
         5vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqPjwNSGzY9+HzHZDgw3eVUdEY3fO13OJf0xVug0ueo=;
        b=3ndJO+vBDE7Xam5TyANBj0K/epcUV6BuJDxuXeVicH2KNW+MjlIIRSK1j9/pszYs8d
         Z5EGm1p+9p9wZQ/olIRFfX+MWN9T6+q2hpvAiVgww5kPRLcUeUa+EuC23xaaTzqu98ny
         9Ol44GtfxAi6VCFfgw1By8KrPTIwiBpyvxLqz4kwIvFCom3PAGg7U9TDRpD/xGdn/tIA
         z64rEaZwr1ZUAJhAadfVaHG7sRe9vieWN0sdniFClHsWRypqMVUiaQALnyqM8YhWGXtZ
         eNUEQiNXbVMeToSoVSSrNECbIaxxcbIhfHkSwuRlyIVu8KUDf+7kp2Fiy3lm7EmmUGWG
         5ZhQ==
X-Gm-Message-State: AOAM533u978FK2GLJ7KfOh3VcN+iUwMYnzV845hIZpdq3NMPkNggvkrW
        CjSf4kngUm4mZ3kEnIavtw71J3hlaHk=
X-Google-Smtp-Source: ABdhPJxUi7dNDCCedyqkYea6nCWY5Rkxx0r9qRfxILcmYFc0nHZ83e8fDCSJYzQ0dALjg8dz9y2zAQ==
X-Received: by 2002:a17:902:7fc5:b0:158:1de9:4646 with SMTP id t5-20020a1709027fc500b001581de94646mr23027600plb.91.1649798775636;
        Tue, 12 Apr 2022 14:26:15 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:1661:f107:58eb:51b7])
        by smtp.gmail.com with ESMTPSA id 196-20020a6300cd000000b0039940fd184dsm3784363pga.9.2022.04.12.14.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:26:15 -0700 (PDT)
From:   Chia-I Wu <olvaffe@gmail.com>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Date:   Tue, 12 Apr 2022 14:25:58 -0700
Message-Id: <20220412212558.827289-1-olvaffe@gmail.com>
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

In practice, trace_dma_fence_init called from dma_fence_init is good
enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
and virtio both have cases where trace_dma_fence_init and
trace_dma_fence_emit can be apart.  It is easier for visualization tools
to always use the more correct trace_dma_fence_emit when visualizing
fence timelines.

v2: improve commit message (Dmitry)

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

