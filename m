Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B7D4C38B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 23:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbiBXWXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 17:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbiBXWXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 17:23:20 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E872177CA;
        Thu, 24 Feb 2022 14:22:50 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id b22so3106699pls.7;
        Thu, 24 Feb 2022 14:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KC38Q9auprSBL2KXS5vTL8BZyOlr0l+99ezAwIh0Alk=;
        b=Fl47mfGKhSwRhjWAN2q9gQAHA0ODonroy6a5ZTZuMuaIbiVEFaorM/YC1NB1o70+3F
         Nmfkh6rpxVY3nJmSSuGu3QTtuOfdxjizbCfXh60POt+T8vuZMfVojdoC6yYJnG6Ziwby
         WZmED/nJSmEEeHY5EU9iUcP8xw5qoqR5fLhPuL/Z6ceS39ui35QcI79ee1VRuw3cxy9I
         HatF/gUOA9mPpnJjlvGy5mit4GCMY07rBwrfrIDWNHB29eTYaD29IFqNvErH4Vc3SuVZ
         rOhnPoREDEt0hmj5JoX+9/G3o3ZG5kj67W4GooYQhZSie0glAHTRnm3D7+ifOETj+wuJ
         //6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KC38Q9auprSBL2KXS5vTL8BZyOlr0l+99ezAwIh0Alk=;
        b=B/AVlbmYfBpnJ2NSndN5q5BaGr7b3FSbMi+k9ReT1LVIPN34tv31nyla5gaVS+tjaT
         E/uwK3106PwoXOXbtGPelAfBX06vDzHVPKBjGwdxH4GZEPiGndClsiQ8j9W1IKNlCLug
         jpKT+7uRm8KVxHwtNI0WnfWjCQagpE7tKM6cHVal1Ul2o9ym0njnW2Fdz0TFPIzlnOYK
         ZcYhH6zUojbIKOxTvMFFALcvLNr2riaWW0cp+cqLNulXGYbQ4gTNigjRp9r9F2+MeK/W
         +2s6mQPe2NFZ34Za0cp89w9VQyKRStmhlXigRBd6mmkI6BjMQgD4rnO+VG/sGeSR3ezi
         80FA==
X-Gm-Message-State: AOAM5310xneCN07o0ZKe8a1XtSMwdlnDywNDGhUNEof2uNEO/KIykEzc
        NbVpj94R5t0IZ3yFaj/n6F0=
X-Google-Smtp-Source: ABdhPJzallEYPS+l4SgLT9ah/U3MzuX2cTvZpiM9CTLd8ytUd2EJAFjf/cxgotvtqPmkd2n+G8lKSg==
X-Received: by 2002:a17:90b:4ac4:b0:1ba:3b4:d3c with SMTP id mh4-20020a17090b4ac400b001ba03b40d3cmr202228pjb.201.1645741369032;
        Thu, 24 Feb 2022 14:22:49 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id m6-20020a056a00080600b004e1bb196743sm561169pfk.5.2022.02.24.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 14:22:48 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Add MSM_SUBMIT_FENCE_SN_IN
Date:   Thu, 24 Feb 2022 14:23:21 -0800
Message-Id: <20220224222321.60653-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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

From: Rob Clark <robdclark@chromium.org>

Add a way for userspace to specify the sequence number fence used to
track completion of the submit.  As the seqno fence is simply an
incrementing counter which is local to the submitqueue, it is easy for
userspace to know the next value.

This is useful for native userspace drivers in a vm guest, as the guest
to host roundtrip can have high latency.  Assigning the fence seqno in
the guest userspace allows the guest to continue without waiting for
response from the host.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        |  3 +-
 drivers/gpu/drm/msm/msm_gem_submit.c | 42 ++++++++++++++++++++++++----
 include/uapi/drm/msm_drm.h           |  4 ++-
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 30fd18ca88c4..16f37f3d9061 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.6.0 - Syncobj support
  * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
  * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
+ * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	8
+#define MSM_VERSION_MINOR	9
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6cfa984dee6a..c6d60c8d286d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -872,16 +872,46 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
+	/*
+	 * If using userspace provided seqno fence, validate that the id
+	 * is available before arming sched job.  Since access to fence_idr
+	 * is serialized on the queue lock, the slot should be still avail
+	 * after the job is armed
+	 */
+	if ((args->flags & MSM_SUBMIT_FENCE_SN_IN) &&
+			idr_find(&queue->fence_idr, args->fence)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	drm_sched_job_arm(&submit->base);
 
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
-	/*
-	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
-	 * to the underlying fence.
-	 */
-	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
-			submit->user_fence, 1, INT_MAX, GFP_KERNEL);
+	if (args->flags & MSM_SUBMIT_FENCE_SN_IN) {
+		/*
+		 * Userspace has assigned the seqno fence that it wants
+		 * us to use.  It is an error to pick a fence sequence
+		 * number that is not available.
+		 */
+		submit->fence_id = args->fence;
+		ret = idr_alloc_u32(&queue->fence_idr, submit->user_fence,
+				    &submit->fence_id, submit->fence_id,
+				    GFP_KERNEL);
+		/*
+		 * We've already validated that the fence_id slot is valid,
+		 * so if idr_alloc_u32 failed, it is a kernel bug
+		 */
+		WARN_ON(ret);
+	} else {
+		/*
+		 * Allocate an id which can be used by WAIT_FENCE ioctl to map
+		 * back to the underlying fence.
+		 */
+		submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
+						    submit->user_fence, 1,
+						    INT_MAX, GFP_KERNEL);
+	}
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 6b8fffc28a50..6cd45a7f6947 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -227,6 +227,7 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
 #define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
 #define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
+#define MSM_SUBMIT_FENCE_SN_IN   0x02000000 /* userspace passes in seqno fence */
 #define MSM_SUBMIT_FLAGS                ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
@@ -234,6 +235,7 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_SUDO          | \
 		MSM_SUBMIT_SYNCOBJ_IN    | \
 		MSM_SUBMIT_SYNCOBJ_OUT   | \
+		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
 #define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
@@ -253,7 +255,7 @@ struct drm_msm_gem_submit_syncobj {
  */
 struct drm_msm_gem_submit {
 	__u32 flags;          /* MSM_PIPE_x | MSM_SUBMIT_x */
-	__u32 fence;          /* out */
+	__u32 fence;          /* out (or in with MSM_SUBMIT_FENCE_SN_IN flag) */
 	__u32 nr_bos;         /* in, number of submit_bo's */
 	__u32 nr_cmds;        /* in, number of submit_cmd's */
 	__u64 bos;            /* in, ptr to array of submit_bo's */
-- 
2.35.1

