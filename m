Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746B6292FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgJSUp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgJSUp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:56 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85745C0613D0;
        Mon, 19 Oct 2020 13:45:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 1so433192ple.2;
        Mon, 19 Oct 2020 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fvZYFhP3VqPsfoYbfdMUsTMvP/ufY5s7G5S6HW9OQ+A=;
        b=gCoamua6+Y/FNX0HBUgPdlBCFfSl5fHsyZQW6PFZqdfRp4eixW5Dc52Gc4Ymp7vaUB
         xV0ShIROogslBIMuat2v0hbWitoh1v/jzylJaPDTq7DYHMJqDWysd1g8P57dT6hIeVgt
         zioo870zgFiryNm6ZeDk9F3XHcyO4Mt3g/+pdDMXzwLrFOoRZuLQhODf+8I3q7p8jDma
         YSZGezYABEssxfV1ose1kt0H10ZzmYzAkugtsw/8n9NWOJQqIJlMBJhvNy4yXoMcShrS
         /4YqN8LlSrV4+NsIS5fr7QgLF9D6xzM781HPdZdC/uc23pjOTSP6Il2PNAFagojGuFFi
         skLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fvZYFhP3VqPsfoYbfdMUsTMvP/ufY5s7G5S6HW9OQ+A=;
        b=N9H/iXhCpkHDzQTpNB96Z3cRfQjOn8IMHrAcO8TB3NsxuNvJP6mk4shWkG1e1u7PiG
         NZHdA8UGWdkUlEP/M6f5nKUJ+fLhOfytEM4aEGYnFUx3zOl7VEoxBRr51V3S9F12xsCy
         W0fjgH4oOFs9V64eFd2Gc1SZC3gRpomLGf7qAWpsXZPCqkqdWWRtOEp4pFeC7qlUKzfR
         vcSx1IO14xZkHwsWUK4J/7/MI6KU+gALQg4y/v9b+U/51PQloavNNXHRxSfkGfW58PlO
         C/JCVLzzeHLmvdndFPtjSMzgQ+B31xkG8ZhMCknlixQtyWsbN9GjSHtAVkU6tV9Ck9Si
         BcMA==
X-Gm-Message-State: AOAM530Wkghx0CIiwbdLteIKUxgU5rOWwnavmQeyhYMxio2GsvC67ERc
        6aSDRytVLm6uPsPF7cmIi5qvk85y3QIvZA==
X-Google-Smtp-Source: ABdhPJx4uP7FkLFS7jSBBS2QDkYGnePLAdS4husaJzLRznxFtjXZrwD3iT4uiSG03gb95j5KJcVuug==
X-Received: by 2002:a17:902:8d8a:b029:d5:ef48:90de with SMTP id v10-20020a1709028d8ab02900d5ef4890demr971523plo.12.1603140356077;
        Mon, 19 Oct 2020 13:45:56 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id r6sm661328pfg.85.2020.10.19.13.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 12/23] drm/msm: Move update_fences()
Date:   Mon, 19 Oct 2020 13:46:13 -0700
Message-Id: <20201019204636.139997-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Small cleanup, update_fences() is used in the hangcheck path, but also
in the normal retire path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ed6645aa0ae5..1667d8066897 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -265,6 +265,20 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
+static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+		uint32_t fence)
+{
+	struct msm_gem_submit *submit;
+
+	list_for_each_entry(submit, &ring->submits, node) {
+		if (submit->seqno > fence)
+			break;
+
+		msm_update_fence(submit->ring->fctx,
+			submit->fence->seqno);
+	}
+}
+
 #ifdef CONFIG_DEV_COREDUMP
 static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
@@ -413,20 +427,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
  * Hangcheck detection for locked gpu:
  */
 
-static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
-		uint32_t fence)
-{
-	struct msm_gem_submit *submit;
-
-	list_for_each_entry(submit, &ring->submits, node) {
-		if (submit->seqno > fence)
-			break;
-
-		msm_update_fence(submit->ring->fctx,
-			submit->fence->seqno);
-	}
-}
-
 static struct msm_gem_submit *
 find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 {
-- 
2.26.2

