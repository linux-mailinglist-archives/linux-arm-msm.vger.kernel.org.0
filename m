Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255EE4528BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbhKPDxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbhKPDxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:53:33 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EBAC06BAB2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:37 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id u11so15914091plf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqrW9nHWzQpTwPt4kFO8L0a1eBCCO9fOX9w/ulJ/Q8U=;
        b=jncI4Fib4NDM+mtOm4qFC9nFR2R+XoQNEuVyQNR5ikFdFMWDGqWy+tZDRjSJaJcLMq
         RSiHiFJfitEzPKTVmAWb9J4hszkUm1XgtWPn1ESUwy2PpKVVA/gCgq+sf8HEsmw3NSdC
         6SPhjmp67oenC/MVLvlyCfcMXv0dzhcLPYRXTF9ACFQFto7IzYcqbsx9aDyhZyCpuidN
         zRLNW7P/rMIbpmeB8spPrs0VDtmuDH5PidAyXRpn9zIuFSTrZyI/SdX/xNJbS8IbANKj
         gr0a6x26yslIowdXEsRObsmtMMNVeYruqWkKAM0tCGyz/kwHydw4QELymcWwnLeuBIA9
         qnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqrW9nHWzQpTwPt4kFO8L0a1eBCCO9fOX9w/ulJ/Q8U=;
        b=nRe9NGhwnPJu0LFPbMc8ICrq23hDqamZ+tVKcYndCa2+DuVD4OnG8Yr1NqaGy2FRPd
         DW0GDb1RvJHtc6NYSNKOr3ob+DmLXbidxu4aVFXhcPrrBQ3Cckvgq+10gM0zAIXALKfa
         01EfNKx4FIwMuW/S5Y1T6XTDp61tBF8waBsunLcwcL6pHPMgGzC8GKLJRVuOwq0N5Apl
         IhBQ7sUO4NHItYmLjCEVU0IhX2iXiDGn5EsMvlxFPZaiTJNDX2X8rh10WkfJd8ZDAwOt
         QcgNfJAY8kYUekdnt7MGygu1aD9pehRgrCPSFrgFDQkjDsb40lzENa+D7K024JVmn+8j
         wHgQ==
X-Gm-Message-State: AOAM531A8+cABDGuCNmzm3kgMDzd9AwKSjprp0egmdtWqgj/bOZHIN06
        IB7F5/+QjXQRV6pPl3wgc57ht5iNFwU=
X-Google-Smtp-Source: ABdhPJwqzUGTfrfWsbR/mtWm9PMJvguyYDys47yVA2udV6WViPmULPzvWEUnUu7gM3koMKvC1JW6GQ==
X-Received: by 2002:a17:902:a584:b0:143:c2e3:c4 with SMTP id az4-20020a170902a58400b00143c2e300c4mr17031107plb.69.1637022337312;
        Mon, 15 Nov 2021 16:25:37 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id qe2sm415449pjb.42.2021.11.15.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 16:25:36 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 3/4] msm: Add helper for cmdstream building and submission
Date:   Mon, 15 Nov 2021 16:30:41 -0800
Message-Id: <20211116003042.439107-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
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
2.33.1

