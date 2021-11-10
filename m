Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C210244C6D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 19:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhKJSkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 13:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhKJSkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 13:40:01 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD87C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 10:37:14 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so2402352pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2+xJGkDBOZWGJP8Vgj9Jp4xfje1A4o6RI5urEpWgzbc=;
        b=POSYxwthV40B4oPaCCUOmLsXN+bkOOj5luV8WPGnOwcKFJH7XmStdBa7hIZCnhE35M
         m8KeEdg0F/DZl/2AcW2zNqFA/WmjlGl+EzfDadZXiSzRv+f62ydKlgZVXMnGeP7B0q/0
         qn7OC8fWTY3cV3bQjNn0WEwFV86MyM2vUG0MtzRTwVQMf4yiPGJ/UcImQ6Nh5oLx20LF
         U7alp77/7r9C+Dw7CRVJq1kEdLQtCDgUfdZjPW/j2r+qZ2pZz1O4BTdRYkcEMSFy9CE6
         pz2sL9QodxoAdlbQ/q5CRKbyAw0c+9PJasstVR7/j0pq87I6Pk8Y2eDKicCs0FG2mx+d
         tsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+xJGkDBOZWGJP8Vgj9Jp4xfje1A4o6RI5urEpWgzbc=;
        b=Dacw1ZdIQ2h1o5gZT5N/TfZn0/nC9QJ1g6ehov1m+uRxbXGQ7TSr5qD0eNWPPU4LgT
         ka8qDDaCmR3SEpqBZmDAWAnQ1H3Q2O72dCjFKYA1iZKHDApeZ9aOUBdwwCBp5m3S7Xmb
         5vN86Nju1ChkXONMZcG9dRusMng4qsVOoFTqTeXBtGDjWKUWMBd6QWb1EpRC8v4lfaoh
         p9TgfM4LKp3epv3VMN7bofCUZNRtrizLiRH/b8Nk+0GvwnCnMJWQhHtJxqvm990xtPiN
         +R3khKvrSTO/QuaTrbYN6uCFhwN550AoKKZHCbeoUj9lAMohuLKHlqF6Gsscnwvo+cZJ
         cm9A==
X-Gm-Message-State: AOAM5308AenWIsVQkCFRZl5kr6idS7KwWHBXLr3G00MXlMBRBVMiatky
        RQCowMVBQ7lpYNyg23dsGHM=
X-Google-Smtp-Source: ABdhPJzf/mXj4Id0c7pAt2/KmLlvRR7a+LV5cOtkXqUfQgWScfNayHuTN8O0oBBlwuNQOSSSSB+WZA==
X-Received: by 2002:a17:903:31d3:b0:142:5da6:299e with SMTP id v19-20020a17090331d300b001425da6299emr1164708ple.30.1636569433639;
        Wed, 10 Nov 2021 10:37:13 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e24sm374715pfn.8.2021.11.10.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 10:37:12 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v2 2/3] msm: Add helper for cmdstream building and submission
Date:   Wed, 10 Nov 2021 10:42:12 -0800
Message-Id: <20211110184213.649787-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110184213.649787-1-robdclark@gmail.com>
References: <20211110184213.649787-1-robdclark@gmail.com>
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

