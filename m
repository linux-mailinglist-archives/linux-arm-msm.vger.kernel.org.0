Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F04B297533
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752770AbgJWQul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752765AbgJWQuj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:39 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71D1C0613CE;
        Fri, 23 Oct 2020 09:50:38 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l18so1712161pgg.0;
        Fri, 23 Oct 2020 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26I0GFWyZ7wPcxO9wRYJvvFDOJC5QoDxFvw7rsNkagw=;
        b=bAvYCHQLAXBH4Li2fjviZnFfuyh5QV7rOWjlt+FKOk182BLH0t59Zr2k+Tg1oxuGI3
         nPdPUyo3a/KquQZMNgQIAXNqoQfkObx9Po1EG7mJmmcQnUpW8pb2P1Gzg9HeLCxAaTQI
         SlMDG33ybbg7PXlFOGEy8uagRfvLI0G6hOEnlhfTmxm19QCeoX7fpNFcZxYL7BPCnzxN
         HTH7sSP1RjJt1TLUzyJJW/ELFdjmebIachviQcOQMhkF8SfSLT/pFlpU0YlmLRfyb4Yc
         ovyJK8CMvV3qAvKdpAWXr3p8oy/bV/1mwE/IFZEuWu3JkzFI2rJyle9ijYLre8OqPNoP
         1dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26I0GFWyZ7wPcxO9wRYJvvFDOJC5QoDxFvw7rsNkagw=;
        b=hJNvHgQ5mmZglWMrL67Mu+Iodq5AWmoir4ILvh0+BZ4KXdu8uD0ZZDrnnltwc2afep
         a4PW5WXhf1Ik+RlIwcyf/MotGTl7228TareNz+2arjzNDBp1ZHf9KyOYo/uajj9pnfoR
         0u1dxlqJbS3E9Mg+txl3sNQq8EEBoIZ4JXmhIt46MIK7voJjVKfshqp8FRm4QjUuLSu2
         nWAW8xviFRzd4B/w58SflOeZ8vm8LRWdw6/Qx6s2nfs88x7GqEXbGQdwuDxE9ey57Y43
         6bjOUAoAwZFTrtLVlVqZn533J17ynwZf3Fm+TIj8qJN6R1EM30vXTfWtF8ms02xwnJXS
         vn7g==
X-Gm-Message-State: AOAM533JpSSFAV6AY9WWYfXlCUmaF+XnfJbXv5JqgyMRhggA+j6vGzlc
        HyfSsRkPv8KIDN9QqJOxgk8=
X-Google-Smtp-Source: ABdhPJyUsaNtPjHATTB+2ZOVY+Nao/Y0EnlKYPkwKZu8lpK+OLGXDTE4cf1Q60otcuaivQXBSoyZ0g==
X-Received: by 2002:a63:4765:: with SMTP id w37mr2721657pgk.332.1603471838125;
        Fri, 23 Oct 2020 09:50:38 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id v199sm2671446pfc.149.2020.10.23.09.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:37 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/23] drm/msm: Move update_fences()
Date:   Fri, 23 Oct 2020 09:51:13 -0700
Message-Id: <20201023165136.561680-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
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

