Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BCF3FBA02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 18:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhH3QTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 12:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237767AbhH3QTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 12:19:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2918CC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:18:11 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so14259684pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ta+t34lKnUrLQOsPGUBd9N3dkbds9Rs6YT2aBHaNSNY=;
        b=EzknnOj7tDEbruT3ZIdIgAGo9YsaE+f6liTiFB+eGgUEJ2K9s+MBqvorM69Aw6K7Oa
         YG71uGdRunoh4MALrrLUq1odBP9XP85RzpzbWm6R3LiS7YF7E27mnakwR9Q7/X1r65XE
         xFPbUN9G+cwDeDmr6yhgbWY/DA1iK+8Z0b8VU2TauW718ct3qhFGlROIDLdM2sVT1d4z
         g4gWgK19GT+5K1fjM3vOokjKDWmb78Yhkm3IkssERt5B+4YXzESb9Qa0Rv6tyghhN0uo
         sP3Fq0hj/rnAnP1oS+t+dEUZONVFovZ97rp75LCWv8W2m6gkKF+zZJX7bAFGU5zXLpD+
         ocGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ta+t34lKnUrLQOsPGUBd9N3dkbds9Rs6YT2aBHaNSNY=;
        b=uLIvH97rohPBXU8XUe3qbJA4FBevZMh4Dq0jT1vCa18FKB+fApf9ANWeK249X+b3S9
         qZRWk2iXZGdEzA3mDIJpZ7eKbH9Bcd3wGwlVeAi2uvRc6yr419RRxRbKpQEXOG8TF3By
         Sda5pQTVMhCQcnOF8Odfl/S3EOWy2ArFmOjVdRCADxge6Eygbeh9jBdMtTPf+dGSf5RT
         PmVbWQh37c5/1I/KWulK7WddlOGk03L0i+StNCRXtHKHa96th8Rcuas/uV3Us0B/SDWc
         70wZ8hkJnQ8XqOTHglymXs7T6l/3CW7pWpxb6ArNR/jqbZnFc/2kC+1+rItalxF+cAmI
         coKQ==
X-Gm-Message-State: AOAM533GlRfGIG2T8auzHS2hYGwm52GStQ7kmBqetXt/clmhZu/oa2SX
        PlNKP4OJ/QX/xwxvqDgku4Q=
X-Google-Smtp-Source: ABdhPJx2wRX3Ew7evQZz6N9CfV4VCZTYHJe684ttMwqQ6E8AN5JT1bmE1orZoxXVQyJiBK3xhuW4VA==
X-Received: by 2002:a17:902:a407:b0:138:849b:56f6 with SMTP id p7-20020a170902a40700b00138849b56f6mr433788plq.0.1630340290569;
        Mon, 30 Aug 2021 09:18:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id r13sm18639395pgl.90.2021.08.30.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 09:18:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 2/3] msm: Add helper library
Date:   Mon, 30 Aug 2021 09:22:31 -0700
Message-Id: <20210830162232.1328594-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830162232.1328594-1-robdclark@gmail.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Handle some of the boilerplate for tests.

v2: fix comment, drop unnecessary drm_open_driver_render() error
    handling, docs fixes, drop igt_msm_pipe_get_param() (for now),
    handle NULL in destructors

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/igt_msm.c                                 | 211 ++++++++++++++++++
 lib/igt_msm.h                                 | 142 ++++++++++++
 lib/meson.build                               |   1 +
 4 files changed, 355 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 0f49b4a3..189597c6 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -34,6 +34,7 @@
     <xi:include href="xml/igt_kms.xml"/>
     <xi:include href="xml/igt_list.xml"/>
     <xi:include href="xml/igt_map.xml"/>
+    <xi:include href="xml/igt_msm.xml"/>
     <xi:include href="xml/igt_pm.xml"/>
     <xi:include href="xml/igt_primes.xml"/>
     <xi:include href="xml/igt_rand.xml"/>
diff --git a/lib/igt_msm.c b/lib/igt_msm.c
new file mode 100644
index 00000000..b9534164
--- /dev/null
+++ b/lib/igt_msm.c
@@ -0,0 +1,211 @@
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
+#include <assert.h>
+#include <string.h>
+#include <signal.h>
+#include <errno.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <fcntl.h>
+
+#include "drmtest.h"
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_msm.h"
+#include "ioctl_wrappers.h"
+
+/**
+ * SECTION:igt_msm
+ * @short_description: msm support library
+ * @title: msm
+ * @include: igt_msm.h
+ *
+ * This library provides various auxiliary helper functions for writing msm
+ * tests.
+ */
+
+static uint64_t
+get_param(struct msm_device *dev, uint32_t pipe, uint32_t param)
+{
+	struct drm_msm_param req = {
+			.pipe = pipe,
+			.param = param,
+	};
+
+	do_ioctl(dev->fd, DRM_IOCTL_MSM_GET_PARAM, &req);
+
+	return req.value;
+}
+
+/**
+ * igt_msm_dev_open:
+ *
+ * Open the msm drm device.
+ */
+struct msm_device *
+igt_msm_dev_open(void)
+{
+	struct msm_device *dev = calloc(1, sizeof(*dev));
+
+	dev->fd = drm_open_driver_render(DRIVER_MSM);
+	dev->gen = (get_param(dev, MSM_PIPE_3D0, MSM_PARAM_CHIP_ID) >> 24) & 0xff;
+
+	return dev;
+}
+
+/**
+ * igt_msm_dev_close:
+ * @dev: the device to close
+ *
+ * Close the msm drm device.
+ */
+void
+igt_msm_dev_close(struct msm_device *dev)
+{
+	if (!dev)
+		return;
+	close(dev->fd);
+	free(dev);
+}
+
+/**
+ * igt_msm_bo_new:
+ * @dev: the device to allocate the BO from
+ * @size: the requested BO size in bytes
+ * @flags: bitmask of MSM_BO_x
+ *
+ * Allocate a buffer object of the requested size.
+ */
+struct msm_bo *
+igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
+{
+	struct msm_bo *bo = calloc(1, sizeof(*bo));
+
+	struct drm_msm_gem_new req = {
+			.size = size,
+			.flags = flags,
+	};
+
+	bo->dev = dev;
+	bo->size = size;
+
+	do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
+
+	bo->handle = req.handle;
+
+	return bo;
+}
+
+/**
+ * igt_msm_bo_free:
+ * @bo: the BO to free
+ *
+ * Free a buffer object
+ */
+void
+igt_msm_bo_free(struct msm_bo *bo)
+{
+	if (!bo)
+		return;
+	if (bo->map)
+		munmap(bo->map, bo->size);
+	gem_close(bo->dev->fd, bo->handle);
+	free(bo);
+}
+
+/**
+ * igt_msm_bo_map:
+ * @bo: the BO to map
+ *
+ * Returns a pointer to mmap'd buffer.
+ */
+void *
+igt_msm_bo_map(struct msm_bo *bo)
+{
+	if (!bo->map) {
+		struct drm_msm_gem_info req = {
+				.handle = bo->handle,
+				.info = MSM_INFO_GET_OFFSET,
+		};
+		void *ptr;
+
+		do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+
+		ptr = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+				bo->dev->fd, req.value);
+		if (ptr == MAP_FAILED)
+			return NULL;
+
+		bo->map = ptr;
+	}
+	return bo->map;
+}
+
+/**
+ * igt_msm_pipe_open:
+ * @dev: the device to create a submitqueue/pipe against
+ * @prio: the requested priority, from 0 (highest) to MSM_PARAM_PRIORITIES-1
+ *        (lowest)
+ *
+ * Allocate a pipe/submitqueue against which cmdstream may be submitted.
+ */
+struct msm_pipe *
+igt_msm_pipe_open(struct msm_device *dev, uint32_t prio)
+{
+	struct msm_pipe *pipe = calloc(1, sizeof(*pipe));
+	struct drm_msm_submitqueue req = {
+			.flags = 0,
+			.prio = prio,
+	};
+
+	pipe->dev = dev;
+	pipe->pipe = MSM_PIPE_3D0;
+
+	/* Note that kernels prior to v4.15 did not support submitqueues.
+	 * Mesa maintains support for older kernels, but IGT does not need
+	 * to.
+	 */
+	do_ioctl(dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_NEW, &req);
+
+	pipe->submitqueue_id = req.id;
+
+	return pipe;
+}
+
+/**
+ * igt_msm_pipe_close:
+ * @pipe: the pipe to close
+ *
+ * Close a pipe
+ */
+void
+igt_msm_pipe_close(struct msm_pipe *pipe)
+{
+	if (!pipe)
+		return;
+	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
+	free(pipe);
+}
diff --git a/lib/igt_msm.h b/lib/igt_msm.h
new file mode 100644
index 00000000..99a099c1
--- /dev/null
+++ b/lib/igt_msm.h
@@ -0,0 +1,142 @@
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
+#ifndef IGT_MSM_H
+#define IGT_MSM_H
+
+#include "msm_drm.h"
+
+/**
+ * msm_device:
+ * @fd: the drm device file descriptor
+ * @gen: the device major generation (ie. 2 for a2xx, etc)
+ *
+ * Helper container for device and device related parameters used by tests.
+ */
+struct msm_device {
+	int fd;
+	unsigned gen;
+};
+
+struct msm_device *igt_msm_dev_open(void);
+void igt_msm_dev_close(struct msm_device *dev);
+
+/**
+ * msm_bo:
+ * @dev: the device the BO is allocated from
+ * @handle: the BO's GEM handle
+ * @size: the BO's size
+ * @map: the BO's memory mapping (if mapped)
+ *
+ * Helper wrapper for a GEM buffer object.
+ */
+struct msm_bo {
+	struct msm_device *dev;
+	int handle;
+	uint32_t size;
+	void *map;
+};
+
+struct msm_bo *igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags);
+void igt_msm_bo_free(struct msm_bo *bo);
+void *igt_msm_bo_map(struct msm_bo *bo);
+
+/**
+ * msm_pipe:
+ * @dev: the device the pipe is allocated from
+ * @pipe: the pipe id
+ * @submitqueue_id: the submitqueue id
+ *
+ * Helper wrapper for a submitqueue for cmdstream submission.
+ */
+struct msm_pipe {
+	struct msm_device *dev;
+	uint32_t pipe;
+	uint32_t submitqueue_id;
+};
+
+struct msm_pipe *igt_msm_pipe_open(struct msm_device *dev, uint32_t prio);
+void igt_msm_pipe_close(struct msm_pipe *pipe);
+
+/*
+ * Helpers for cmdstream building:
+ */
+
+enum adreno_pm4_packet_type {
+	CP_TYPE0_PKT = 0,
+	CP_TYPE1_PKT = 0x40000000,
+	CP_TYPE2_PKT = 0x80000000,
+	CP_TYPE3_PKT = 0xc0000000,
+	CP_TYPE4_PKT = 0x40000000,
+	CP_TYPE7_PKT = 0x70000000,
+};
+
+enum adreno_pm4_type3_packets {
+	CP_NOP = 16,
+};
+
+static inline unsigned
+pm4_odd_parity_bit(unsigned val)
+{
+	/* See: http://graphics.stanford.edu/~seander/bithacks.html#ParityParallel
+	 * note that we want odd parity so 0x6996 is inverted.
+	 */
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	val &= 0xf;
+	return (~0x6996 >> val) & 1;
+}
+
+static inline uint32_t
+pm4_pkt0_hdr(uint16_t regindx, uint16_t cnt)
+{
+	return CP_TYPE0_PKT | ((cnt - 1) << 16) | (regindx & 0x7fff);
+}
+
+static inline uint32_t
+pm4_pkt3_hdr(uint8_t opcode, uint16_t cnt)
+{
+	return CP_TYPE3_PKT | ((cnt - 1) << 16) | ((opcode & 0xff) << 8);
+}
+
+static inline uint32_t
+pm4_pkt4_hdr(uint16_t regindx, uint16_t cnt)
+{
+	return CP_TYPE4_PKT | cnt | (pm4_odd_parity_bit(cnt) << 7) |
+			((regindx & 0x3ffff) << 8) |
+			((pm4_odd_parity_bit(regindx) << 27));
+}
+
+static inline uint32_t
+pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
+{
+	return CP_TYPE7_PKT | cnt | (pm4_odd_parity_bit(cnt) << 15) |
+			((opcode & 0x7f) << 16) |
+			((pm4_odd_parity_bit(opcode) << 23));
+}
+
+#define U642VOID(x) ((void *)(uintptr_t)(x))
+#define VOID2U64(x) ((uint64_t)(uintptr_t)(x))
+
+#endif /* IGT_MSM_H */
diff --git a/lib/meson.build b/lib/meson.build
index 67d40512..c3080fc8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -82,6 +82,7 @@ lib_sources = [
 	'igt_eld.c',
 	'igt_infoframe.c',
 	'veboxcopy_gen12.c',
+	'igt_msm.c',
 ]
 
 lib_deps = [
-- 
2.31.1

