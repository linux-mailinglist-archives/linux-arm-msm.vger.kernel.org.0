Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792C43FCB46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 18:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239804AbhHaQNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 12:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239794AbhHaQNu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 12:13:50 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1125CC061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:12:55 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r2so17201808pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJ0YEXpLntU+DOTXnIO553DfxMRSTnMyz1rQxbWIyZ4=;
        b=kaycFKO/e4q8FWOCk9ib7tFhoGJB6B2rn+nmscd0ednZGWxnR3QGol70O9E/jAmJrM
         DYjj0oPsePfdtwPGgGl56m/5QWAYTYL26DGYsLPqsXywnlDoQz3SR1++rgG/TPjfLevJ
         2fWeKUMOe0nGAjSGU6QSYlnOWunforN1diODGjqzHyHMyv2vDasCqjDvzvevj6JEnRBc
         bOs6Z9WT8zJNJnHIBy+6mXh9osBWN/jjoz/AtNZF0rZeTZtQrKGezvSusBCZpSkXxKNK
         akHxrliFMdj3maQxbjth/j6eQlApU3gl/6A05MBGcxFHQBCw0hU9qiGYErO8PWCm0ZPs
         Ugag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJ0YEXpLntU+DOTXnIO553DfxMRSTnMyz1rQxbWIyZ4=;
        b=LbDMbsCPeashEE1Y2WywI47I2DwtQe7054I0zy3R6rMNlbhvp7EGEh2KM+HPZXNy7X
         U9zCPuUdlnvIuKPjhTnFVuKIZ3/JdE+tuNyqA5WafNip6MxH5chWqEXILYv8BL/I5yQy
         L38hw8uLkb4wM7zHstcAh0AyIWbSHqXXfyQhXsmBBwxwtw/SHgt+F4sf5WM0Wxf8dUQn
         KMZ/NHOoDlaGNVek7hLHrn6dJvZ7oOMnoLvNuo50Xrs5ba+XI3mzg0XY4p2J+uMDGoWV
         OrQqg/MshWcIyzZ1vh1kamRRjdxLSFrQdHS7UnCNMUBXqN/uR9J0FfmlbX8roX/TPdn7
         M/Mg==
X-Gm-Message-State: AOAM532cn2ZM1MS4XFbWGZSg3zyDvhBo9vgTDVku71tFs1VCE381oSWl
        B3r03FHEGINsgaNnN0T+60Q=
X-Google-Smtp-Source: ABdhPJyJKerZEWDMveCSFJRpMnuR3ZSgxGElQ9kyw7BfOpeMGhiDytDvsi/G8KGaZNFXlBeCqQ9z6Q==
X-Received: by 2002:a63:4455:: with SMTP id t21mr27386813pgk.91.1630426374549;
        Tue, 31 Aug 2021 09:12:54 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b5sm14025835pfr.26.2021.08.31.09.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:12:53 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v4 3/3] msm: Add submit ioctl tests
Date:   Tue, 31 Aug 2021 09:17:16 -0700
Message-Id: <20210831161716.1400057-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831161716.1400057-1-robdclark@gmail.com>
References: <20210831161716.1400057-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the submit ioctl.

v2: Add NULL inits, igt_describe()
v3: Alphabetize meson.build

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/meson.build  |   1 +
 tests/msm_submit.c | 194 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 tests/msm_submit.c

diff --git a/tests/meson.build b/tests/meson.build
index 1bdfddbb..cbc02534 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -78,6 +78,7 @@ test_progs = [
 	'kms_vrr',
 	'kms_writeback',
 	'meta_test',
+	'msm_submit',
 	'panfrost_get_param',
 	'panfrost_gem_new',
 	'panfrost_prime',
diff --git a/tests/msm_submit.c b/tests/msm_submit.c
new file mode 100644
index 00000000..95f8318f
--- /dev/null
+++ b/tests/msm_submit.c
@@ -0,0 +1,194 @@
+/*
+ * Copyright © 2021 Google, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include "igt_msm.h"
+
+igt_main
+{
+	struct msm_device *dev = NULL;
+	struct msm_pipe *pipe = NULL;
+	struct msm_bo *a = NULL, *b = NULL;
+
+	igt_fixture {
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
+		a = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
+		b = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
+	}
+
+	igt_describe("Check that a valid empty submit succeeds");
+	igt_subtest("empty-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+		};
+		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+	}
+
+	igt_describe("Check that submit with invalid submitqueue id fails");
+	igt_subtest("invalid-queue-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = 0x1234,
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, ENOENT);
+	}
+
+	igt_describe("Check that submit with invalid flags fails");
+	igt_subtest("invalid-flags-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = 0x1234,
+				.queueid = pipe->submitqueue_id,
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_describe("Check that submit with invalid in-fence fd fails");
+	igt_subtest("invalid-in-fence-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe | MSM_SUBMIT_FENCE_FD_IN,
+				.queueid = pipe->submitqueue_id,
+				.fence_fd = dev->fd,  /* This is not a fence fd! */
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_describe("Check that submit with duplicate bo fails");
+	igt_subtest("invalid-duplicate-bo-submit") {
+		struct drm_msm_gem_submit_bo bos[] = {
+			[0] = {
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+			[1] = {
+				.handle     = b->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+			[2] = {
+				/* this is invalid.. there should not be two entries
+				 * for the same bo, instead a single entry w/ all
+				 * usage flags OR'd together should be used.  Kernel
+				 * should catch this, and return an error code after
+				 * cleaning up properly (not leaking any bo's)
+				 */
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_WRITE,
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_bos  = ARRAY_SIZE(bos),
+				.bos     = VOID2U64(bos),
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_describe("Check that submit with cmdstream referencing an invalid bo fails");
+	igt_subtest("invalid-cmd-idx-submit") {
+		struct drm_msm_gem_submit_cmd cmds[] = {
+			[0] = {
+				.type       = MSM_SUBMIT_CMD_BUF,
+				.submit_idx = 0,      /* bos[0] does not exist */
+				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_cmds    = ARRAY_SIZE(cmds),
+				.cmds       = VOID2U64(cmds),
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_describe("Check that submit with invalid cmdstream type fails");
+	igt_subtest("invalid-cmd-type-submit") {
+		struct drm_msm_gem_submit_bo bos[] = {
+			[0] = {
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+		};
+		struct drm_msm_gem_submit_cmd cmds[] = {
+			[0] = {
+				.type       = 0x1234,
+				.submit_idx = 0,
+				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_cmds    = ARRAY_SIZE(cmds),
+				.cmds       = VOID2U64(cmds),
+				.nr_bos  = ARRAY_SIZE(bos),
+				.bos     = VOID2U64(bos),
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_describe("Check that a valid non-empty submit succeeds");
+	igt_subtest("valid-submit") {
+		struct drm_msm_gem_submit_bo bos[] = {
+			[0] = {
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+		};
+		struct drm_msm_gem_submit_cmd cmds[] = {
+			[0] = {
+				.type       = MSM_SUBMIT_CMD_BUF,
+				.submit_idx = 0,
+				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_cmds    = ARRAY_SIZE(cmds),
+				.cmds       = VOID2U64(cmds),
+				.nr_bos  = ARRAY_SIZE(bos),
+				.bos     = VOID2U64(bos),
+		};
+		uint32_t *cmdstream = igt_msm_bo_map(a);
+		if (dev->gen >= 5) {
+			*(cmdstream++) = pm4_pkt7_hdr(CP_NOP, 3);
+		} else {
+			*(cmdstream++) = pm4_pkt3_hdr(CP_NOP, 3);
+		}
+		*(cmdstream++) = 0;
+		*(cmdstream++) = 0;
+		*(cmdstream++) = 0;
+
+		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+	}
+
+	igt_fixture {
+		igt_msm_bo_free(a);
+		igt_msm_bo_free(b);
+		igt_msm_pipe_close(pipe);
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.31.1

