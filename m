Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BB969B774
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 02:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjBRBZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 20:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjBRBZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 20:25:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CC55F24B
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 17:25:50 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id v11so21771lft.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 17:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBTbzbVOUqYQofnWyPH8cCYJy+e3PlNvbe64Pd9nXxM=;
        b=XixVrrqnxl4aBbKUU527cQfk+YZHN27UkIXQdorFvfOMX+sc8j2xK051sAJmnngCmO
         5sxWEeZkwu7mD2s4eWhT57GxxvVpf8ESWCWHkM6aJZ7L8RAQHcjIhkhDYIwcCJZqWfN9
         NqdNaLuC/Q6cT0YSLZI+kNTadDl1uMIoibgegK+0VQBo0tYbqiMnfUsJzq0x35wXt+rE
         6sGS9z36oZ2esfHZzzH16TLWua9tYTmuknOrqgNaUPHqN+mBnOIvXph7AUrFN3D5wbx9
         EU5gdFf7yzXm5/0VbSjvraiwQDYJEIGBmB0sxeKU3JGdqvypFk8DLtlAdx62QPVlVwqP
         6a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBTbzbVOUqYQofnWyPH8cCYJy+e3PlNvbe64Pd9nXxM=;
        b=MFBkV2jbrXgoQk/U5IXNGPD6XZgjrAinsxQqUhDito2Mrr8TKwZponv/nC01pquXK6
         U4DoMfd7VEXqByNaFP29nj0xRhPKjTY36wl7NzZ4yu8CiliKMeWMZcJnbHZ5fEMZ5cGc
         p9cOH6UYOYsY+6Lyt/0eRkJ0Gg7o/17f6oLSaNcNhb/Xsa5zbdFcRc/hGuHeCgpYJ8JX
         vOIIMx9TDTCG6wRMj5cTOeKyXBsw86bDOZR+gB1zWihxhvo4xjSG6eSz5u1gSKsLtxIP
         xUIdkMPxb9jwQ6DDs/Vxflv7QU62o4dW9TbqtjduWzDpHnOF+7QNdce0+XfaYMzkHNfM
         J/6Q==
X-Gm-Message-State: AO0yUKXGckz0HFuOaauXunyHqI0pzzOxPLMyK89hthi7GA85UfolrDKX
        ll0U74u8asLDc1EeO4DshZgUEA==
X-Google-Smtp-Source: AK7set+b7/3DtCVoBQmtej3h+VpybWv/zNE0+pjBMwDKDJflxlaFXz1qoImo83u8/PG0yJAWxb46wQ==
X-Received: by 2002:a05:6512:3911:b0:4db:3a70:e9f3 with SMTP id a17-20020a056512391100b004db3a70e9f3mr456279lfu.69.1676683548802;
        Fri, 17 Feb 2023 17:25:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j11-20020a19f50b000000b004d85f2acd8esm826414lfb.295.2023.02.17.17.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 17:25:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
Date:   Sat, 18 Feb 2023 03:25:45 +0200
Message-Id: <20230218012546.3655999-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
References: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The variable ring is not used by msm_parse_deps() and
msm_ioctl_gem_submit() and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
 drivers/gpu/drm/msm/msm_gpu_trace.h  | 10 ++++------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ac8ed731f76d..a539eb31042f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
                                            uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride,
-                                           struct msm_ringbuffer *ring)
+                                           size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
 	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
@@ -722,7 +721,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
-	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	int out_fence_fd = -1;
@@ -760,8 +758,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
-	ring = gpu->rb[queue->ring_nr];
-
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
 		if (out_fence_fd < 0) {
@@ -774,7 +770,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (IS_ERR(submit))
 		return PTR_ERR(submit);
 
-	trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
+	trace_msm_gpu_submit(pid_nr(submit->pid), submit->ident,
 		args->nr_bos, args->nr_cmds);
 
 	ret = mutex_lock_interruptible(&queue->lock);
@@ -803,7 +799,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		syncobjs_to_reset = msm_parse_deps(submit, file,
 		                                   args->in_syncobjs,
 		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride, ring);
+		                                   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc45..12ef10f1de4c 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -9,24 +9,22 @@
 #define TRACE_INCLUDE_FILE msm_gpu_trace
 
 TRACE_EVENT(msm_gpu_submit,
-	    TP_PROTO(pid_t pid, u32 ringid, u32 id, u32 nr_bos, u32 nr_cmds),
-	    TP_ARGS(pid, ringid, id, nr_bos, nr_cmds),
+	    TP_PROTO(pid_t pid, u32 id, u32 nr_bos, u32 nr_cmds),
+	    TP_ARGS(pid, id, nr_bos, nr_cmds),
 	    TP_STRUCT__entry(
 		    __field(pid_t, pid)
 		    __field(u32, id)
-		    __field(u32, ringid)
 		    __field(u32, nr_cmds)
 		    __field(u32, nr_bos)
 		    ),
 	    TP_fast_assign(
 		    __entry->pid = pid;
 		    __entry->id = id;
-		    __entry->ringid = ringid;
 		    __entry->nr_bos = nr_bos;
 		    __entry->nr_cmds = nr_cmds
 		    ),
-	    TP_printk("id=%d pid=%d ring=%d bos=%d cmds=%d",
-		    __entry->id, __entry->pid, __entry->ringid,
+	    TP_printk("id=%d pid=%d bos=%d cmds=%d",
+		    __entry->id, __entry->pid,
 		    __entry->nr_bos, __entry->nr_cmds)
 );
 
-- 
2.39.1

