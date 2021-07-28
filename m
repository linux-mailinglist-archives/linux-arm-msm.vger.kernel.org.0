Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383473D8526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhG1BDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234095AbhG1BDC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:03:02 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF0EC061757;
        Tue, 27 Jul 2021 18:03:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ca5so2590050pjb.5;
        Tue, 27 Jul 2021 18:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
        b=TOa8xdycxSbKrcHIPpwJmM/VJue65YpLU5HWDDroiFExlf7qWD/B+ryetsiUC4lw0/
         +xZWB0rPI/Rm1JukLT4nwIlS/NiEPNOS2SNfKql8kz/YmVQmPgN81ollvWstHA0wvB+n
         DGOJfm34611Vs53G4TcZSazo4LUZoqkNdM1p8v4Z7Qzt8UkWFHco7WaIU+LeeGz/ArDF
         lBAvmGyLBvbUvtY5U+LJRPIt1YMKw6AsY3pmhdFahN9maerXx8JhTUUQFHim5kxwvGAC
         /9TGrVoYzicjetMgsf5xziVWYwTvMAgQx45PmggEadz7wD/5FU7vsoq26Wjfqf2/fKwu
         WOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
        b=JVwQTe3ee4MCCFeGld9527T52Q3AhvwGvRa32+lwqJXQqmKRbUbsVqiJww3Rr6irUw
         N/9ePiL0lURoeUquTnnq+XJbIspt1D1khhhuwjJF/iS7QC11dDP1vE1q0/LYCKK1ZTnu
         aZK6qQy7jfWnuKR4zZZQZnhsnqByUraEo5LBa1/eHvTnmczRvCkOYTvEQxYPgJGPrJWX
         Ke6T5fwlDqIwtY2sioQ2GW+17LvZQ7Th0hFSW+7eIXhbMQV5lFX025wjoLGsxVNxiIeX
         7PPeQiwvTBEgb2ITE48Fc+tePa2oSsyzvW/OFKtd2JH7KbKDkYGiAJdY0f/HEd/Cce0Q
         HBYA==
X-Gm-Message-State: AOAM533MX2ThbW1Z9fx8YHdaGPqt8a8FpjbDcNyUsZjCoX2XJSXMaTE/
        BTwufhUW8GkoEbvqv6xNyfg=
X-Google-Smtp-Source: ABdhPJwF3hR3QKAwcmVMbo036jhQ8GG7qs1y5GTVbs8PSTb98u4agfBa4d4PGT2WC8k6iHKMWMsKJQ==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id s8-20020a170902b188b029011b1549da31mr20649863plr.7.1627434180712;
        Tue, 27 Jul 2021 18:03:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id me1sm3749879pjb.38.2021.07.27.18.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:02:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/13] drm/msm: Drop struct_mutex in submit path
Date:   Tue, 27 Jul 2021 18:06:16 -0700
Message-Id: <20210728010632.2633470-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is sufficient to serialize on the submit queue now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e11e4bb63695..450efe59abb5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -709,7 +709,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit;
+	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -753,7 +753,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
+	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
@@ -874,10 +874,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
 	 */
-	mutex_lock(&queue->lock);
 	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
 			submit->user_fence, 0, INT_MAX, GFP_KERNEL);
-	mutex_unlock(&queue->lock);
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
@@ -912,12 +910,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
-	mutex_unlock(&dev->struct_mutex);
-
+	mutex_unlock(&queue->lock);
+	if (submit)
+		msm_gem_submit_put(submit);
 out_post_unlock:
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
-- 
2.31.1

