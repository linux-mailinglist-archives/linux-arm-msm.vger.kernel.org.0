Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ECA28ABDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbgJLCJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgJLCJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D12C0613CE;
        Sun, 11 Oct 2020 19:09:12 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id v12so1102370ply.12;
        Sun, 11 Oct 2020 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wkKO6gE/6KJG3tJnrM8NMN9Fo3JxBHm6Yh5bWEF2DRw=;
        b=MYI0Ly5EzyTuj4BMLUbYhrlVJJqPXLF/i9xH5If4hAi0yXUSNMD+OTvpRjNCoRQHii
         VBg4F9mxPyqkWf6/oDvdA473nQFhgd8nnNoMjs2roHv0tfkEATgMrAMqQ2vDEabMbWrd
         h5bK15LAp8a/HKaWMHt+KNyXFofASY5i+BqSl6SiSz9xY4KFSA8UW1pKSx2d/i5w3UMk
         TvWEnW3YFzGpDbaIXJT2yy9/UchcGdMIIkWSOGFQj/VrUfg5SnWuWXgIFBCD3iU21egT
         x7jb8ZSiyhlBG6JGnEsMVzKITzKWHLgUGATjwFs+wbzNPlDVD15gmpF+wDC194TK3XiF
         IwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wkKO6gE/6KJG3tJnrM8NMN9Fo3JxBHm6Yh5bWEF2DRw=;
        b=hfMkCR+t4V2ZYOHJoZ7JjYeylppE0nkzqz0smodMju6xwGhgA0pDqToIxQK4b/YrKB
         soEgfL8w55B+rkutraA6hq7VkZLmIajN3QWKsGRjm7dTa/zV5dX+ACR9c0cs63xE88PL
         mB6kC5TYapRxZU2omkVhM60FnEvYlnKrC9G4Iu2Ux35WK3bAhTfFH0uZR/ImLYWFDG3o
         f7thikdrddIB3T86MKAn82XO8g4c7WUFfIcrxGdkwj6hopUEr+tmRh41u3JL5/8nMtWg
         UYcsszDSZqGzrBEhLYPNBnB8ciD4wsDYdwgwL1dfOkXvSVRdTLmVGMkSy0j7FdS3d3qK
         lxxw==
X-Gm-Message-State: AOAM533+MM0BDE47gZg9edc14DGyyYmY+CswhbQiC/YNbbQz4H1Fr/T0
        IlirKkb3VQs1RSbzWWp1sSE=
X-Google-Smtp-Source: ABdhPJz8PFPRUJXoh1vK+0F0u53LCMifZs8ilkAAIk7Rc54/1QJo+KiCddguw4OAOhsB7F9ZxB9ypg==
X-Received: by 2002:a17:902:9349:b029:d4:df10:353c with SMTP id g9-20020a1709029349b02900d4df10353cmr2467354plp.20.1602468551695;
        Sun, 11 Oct 2020 19:09:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id na9sm12662085pjb.45.2020.10.11.19.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:10 -0700 (PDT)
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
Subject: [PATCH v2 11/22] drm/msm: Move update_fences()
Date:   Sun, 11 Oct 2020 19:09:38 -0700
Message-Id: <20201012020958.229288-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index 677b11c5a151..e5b7c8a77c99 100644
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
@@ -411,20 +425,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
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

