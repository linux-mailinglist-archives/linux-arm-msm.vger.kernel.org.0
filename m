Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49F944B245
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241375AbhKISG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbhKISGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:06:55 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB98FC061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 10:04:09 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id u17so22338971plg.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 10:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2+xJGkDBOZWGJP8Vgj9Jp4xfje1A4o6RI5urEpWgzbc=;
        b=Qe3EKDXqgdaFTKZY1q4tqEldsbvNpzUkXmhkbbXze0kne9eVBWt7Xm/Ly6XZYG08K2
         8igI6o2ZT8qd6rqQsLB2qFMFSuVY2PZKn3GMgPmsBsRxswQLtuoeBy2848MllnMoxOLf
         vzk6R9pYEBycuxiF7vsoQl2RGOhsYuI63ymB3P4tIyFFC8AG4FGuw5tIkP5qJXNpdYpx
         kbdUUIkxKDVXHCQTjVBJ/plBa9s/Lzuv+Rjg73uD/fPjPpHFbj2WMdf+a7N4agL14C+n
         jQnCSM2XWJys/iZ1EUue+f9BG7hp3OXErJXgd/eW1Hpx21DzMsww/TW3PodIfETSq4VU
         xVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+xJGkDBOZWGJP8Vgj9Jp4xfje1A4o6RI5urEpWgzbc=;
        b=it2oAwdGI+PVhRqjJXmoidXOuHK5jUqHYRhn1XoHzjiZ6z+mA+TCY5BTrjdFCN0yl2
         45J/uPfc4URsvBWdEufTkxviZ3t3ZJn6+GQf+myHLgKHdMpgwwSmGJKVk+NkoqrMBDiZ
         58eNh0i2NK4ynn6QtkrMGGz97gRQj1qq2wHZ6UvaMVR2Pg6Vhp9uH3/mon1fjso56JnS
         JJINPwHLn5tYvHpA4uonCBNBeHnhrCuQ1EYc7GUWF4rVeVT5Rzi6MQFzCXHt6/4Cx4Pn
         hoqNve5Nq+SK/0Ja9Hm9djpVYkvq7YmDIq0Wbq+0B0peoMWvfWK4ZQgUvFWu73QI6yMY
         ZpJg==
X-Gm-Message-State: AOAM532n8/cgnKWkncxUh/KftwSabThxX5n2PNLcn0RxE1pGfrtQwP/E
        rIE5CNORgCG6T5jRbVi5e5C8mDDzE5I=
X-Google-Smtp-Source: ABdhPJwoRm9Lx0oxt1WOF4P6IFdTf9WES9i9PUF90V2LuKpHTObe2AsA3VSBAcIZTBz3bmkYx9qLtg==
X-Received: by 2002:a17:90b:2389:: with SMTP id mr9mr9429180pjb.152.1636481049178;
        Tue, 09 Nov 2021 10:04:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p188sm9592782pfg.102.2021.11.09.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:04:08 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 2/3] msm: Add helper for cmdstream building and submission
Date:   Tue,  9 Nov 2021 10:09:04 -0800
Message-Id: <20211109180905.590773-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109180905.590773-1-robdclark@gmail.com>
References: <20211109180905.590773-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

A pretty minimal subset compared to what a full gallium driver would
need, but OTOH for igt tests we should only need to emit fairly basic
command stream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h |  48 ++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index b9534164..e9cf588f 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -91,6 +91,19 @@ igt_msm_dev_close(struct msm_device *dev)
 	free(dev);
 }
 
+static uint64_t
+get_iova(struct msm_bo *bo)
+{
+	struct drm_msm_gem_info req = {
+			.handle = bo->handle,
+			.info = MSM_INFO_GET_IOVA,
+	};
+
+	do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+
+	return req.value;
+}
+
 /**
  * igt_msm_bo_new:
  * @dev: the device to allocate the BO from
@@ -115,6 +128,7 @@ igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
 	do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
 
 	bo->handle = req.handle;
+	bo->iova = get_iova(bo);
 
 	return bo;
 }
@@ -209,3 +223,91 @@ igt_msm_pipe_close(struct msm_pipe *pipe)
 	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
 	free(pipe);
 }
+
+/**
+ * igt_msm_cmd_new:
+ * @pipe: the submitqueue to submit cmdstream against
+ * @size: the size of requested cmdstream buffer
+ */
+struct msm_cmd *
+igt_msm_cmd_new(struct msm_pipe *pipe, size_t size)
+{
+	struct msm_cmd *cmd = calloc(1, sizeof(*cmd));
+
+	cmd->pipe = pipe;
+	cmd->cmdstream_bo = igt_msm_bo_new(pipe->dev, size, MSM_BO_WC);
+	cmd->cur = igt_msm_bo_map(cmd->cmdstream_bo);
+
+	__igt_msm_append_bo(cmd, cmd->cmdstream_bo);
+
+	return cmd;
+}
+
+static uint32_t
+cmdstream_size(struct msm_cmd *cmd)
+{
+	uint8_t *start = igt_msm_bo_map(cmd->cmdstream_bo);
+	return (uint8_t *)cmd->cur - start;
+}
+
+/**
+ * igt_msm_cmd_submit:
+ * @cmd: the command stream object to submit
+ *
+ * Returns dma-fence fd
+ */
+int
+igt_msm_cmd_submit(struct msm_cmd *cmd)
+{
+	struct drm_msm_gem_submit_bo bos[cmd->nr_bos];
+	struct drm_msm_gem_submit_cmd cmds[] = {
+		[0] = {
+			.type       = MSM_SUBMIT_CMD_BUF,
+			.submit_idx = 0,
+			.size       = cmdstream_size(cmd),
+		},
+	};
+	struct drm_msm_gem_submit req = {
+			.flags   = cmd->pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT,
+			.queueid = cmd->pipe->submitqueue_id,
+			.nr_cmds = ARRAY_SIZE(cmds),
+			.cmds    = VOID2U64(cmds),
+			.nr_bos  = ARRAY_SIZE(bos),
+			.bos     = VOID2U64(bos),
+	};
+
+	for (unsigned i = 0; i < cmd->nr_bos; i++) {
+		bos[i] = (struct drm_msm_gem_submit_bo) {
+			.handle  = cmd->bos[i]->handle,
+			.flags   = MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE,
+		};
+	}
+
+	do_ioctl(cmd->pipe->dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+
+	return req.fence_fd;
+}
+
+void
+__igt_msm_append_bo(struct msm_cmd *cmd, struct msm_bo *bo)
+{
+	for (unsigned i = 0; i < cmd->nr_bos; i++)
+		if (cmd->bos[i] == bo)
+			return;
+
+	assert((cmd->nr_bos + 1) < ARRAY_SIZE(cmd->bos));
+	cmd->bos[cmd->nr_bos++] = bo;
+}
+
+/**
+ * igt_msm_cmd_free:
+ * @cmd: the command stream object to free
+ *
+ * Free a command stream object
+ */
+void
+igt_msm_cmd_free(struct msm_cmd *cmd)
+{
+	igt_msm_bo_free(cmd->cmdstream_bo);
+	free(cmd);
+}
diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 99a099c1..1a66c806 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -24,6 +24,8 @@
 #ifndef IGT_MSM_H
 #define IGT_MSM_H
 
+#include "ioctl_wrappers.h"
+
 #include "msm_drm.h"
 
 /**
@@ -47,6 +49,7 @@ void igt_msm_dev_close(struct msm_device *dev);
  * @handle: the BO's GEM handle
  * @size: the BO's size
  * @map: the BO's memory mapping (if mapped)
+ * @iova: the BO's GPU address
  *
  * Helper wrapper for a GEM buffer object.
  */
@@ -55,6 +58,7 @@ struct msm_bo {
 	int handle;
 	uint32_t size;
 	void *map;
+	uint64_t iova;
 };
 
 struct msm_bo *igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags);
@@ -136,6 +140,50 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
 			((pm4_odd_parity_bit(opcode) << 23));
 }
 
+/**
+ * msm_cmd:
+ * @pipe: the submitqueue to submit cmdstream against
+ * @cmdstream_bo: the backing cmdstream buffer object
+ * @cur: pointer to current position in cmdstream
+ *
+ * Helper for building cmdstream and cmdstream submission
+ */
+struct msm_cmd {
+	struct msm_pipe *pipe;
+	struct msm_bo *cmdstream_bo;
+	uint32_t *cur;
+	uint32_t nr_bos;
+	struct msm_bo *bos[8];
+};
+
+struct msm_cmd *igt_msm_cmd_new(struct msm_pipe *pipe, size_t size);
+int igt_msm_cmd_submit(struct msm_cmd *cmd);
+void igt_msm_cmd_free(struct msm_cmd *cmd);
+
+static inline void
+msm_cmd_emit(struct msm_cmd *cmd, uint32_t dword)
+{
+	*(cmd->cur++) = dword;
+}
+
+static inline void
+msm_cmd_pkt7(struct msm_cmd *cmd, uint8_t opcode, uint16_t cnt)
+{
+	msm_cmd_emit(cmd, pm4_pkt7_hdr(opcode, cnt));
+}
+
+void __igt_msm_append_bo(struct msm_cmd *cmd, struct msm_bo *bo);
+
+static inline void
+msm_cmd_bo(struct msm_cmd *cmd, struct msm_bo *bo, uint32_t offset)
+{
+	uint64_t addr = bo->iova + offset;
+
+	__igt_msm_append_bo(cmd, bo);
+	msm_cmd_emit(cmd, lower_32_bits(addr));
+	msm_cmd_emit(cmd, upper_32_bits(addr));
+}
+
 #define U642VOID(x) ((void *)(uintptr_t)(x))
 #define VOID2U64(x) ((uint64_t)(uintptr_t)(x))
 
-- 
2.31.1

