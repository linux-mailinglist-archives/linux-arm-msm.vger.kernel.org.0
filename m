Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB6D3F6BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 00:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhHXWqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 18:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhHXWqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 18:46:03 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D20FC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:45:19 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g14so19645157pfm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p6vdQA00eKFU+PIZg0PQP3pMsthjikwy/TY0DdhhGJc=;
        b=G04Dv174k/Ammm2uA8b0lt9Y4mTP+NwK+L3YARt4K6So+8CmLOrRzYJlPwhq2OGdBS
         dIDpsM/S0YiCtmCMWoQvvPMX/6e7jTeQIg6ERIqaIzwduFB+KvVOLoHL0TLlTGSdS8wf
         f2/Apv1Kj/PG+ZsZfnbIGNf27SBTYrxT6SRAzm9jR0p47VMR3aHKsl0ickuYxj5lA4Ni
         iE1PH1YjtWkOrdlrrcvVW37j8i3SFz7qa6Pm6CXrTKY6bmZYRyAZICtZId99SAlahQna
         IIq64AcNP6Af/XwioLstKO0HZNcZqE2ODQQwNyfuw2XTnN/8YC/t4IXECH5dTA0kBlCo
         vJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6vdQA00eKFU+PIZg0PQP3pMsthjikwy/TY0DdhhGJc=;
        b=kWQV0FLwjbrxENZnQ6EPXGfRVTdEr3xnZI6L9k9Q4v+PrKEzpLPJ54oB/bnNlJBtbq
         xJRRxHLbdk42+6DrXPD36tyUmIpEXV4WYUU7UzaT1K4mnI+B+GrGNWj79r2W2LV4OkIT
         7pDBCgBslA/rXh2zspKq/hmzlUkWg6FIEhnfLmqZSCNLwRU/qm4do0JtuiM4x8gTqPu3
         qmgWxG2+OmtjHGxh4tz/NIB2u9quLEPEspC9C1rZ8UH34hsvzENzs/9wb8N/6R2fCl2V
         k1UkmN1kmX20G9PALOmlAwzDAjQLHYvgoHhBO8vcTQXdaoRCaymCxbQZMUF3fGR2YTC8
         quCw==
X-Gm-Message-State: AOAM530QaI5iBqjzaUzihP+PMXJBhuoUAgGXupIf2Z3NewKEt5Wx3DBd
        pqGr7lMD8W6uCaa5XsZ6qEg=
X-Google-Smtp-Source: ABdhPJxVYyHPZZfMvxshni5V5bgqFA4ngRI3sbW+YheZ55DzWT5xDgcFi7+OyxpTsqpDZV8ySAbMWQ==
X-Received: by 2002:a62:5c7:0:b029:3e0:dd9c:8fd2 with SMTP id 190-20020a6205c70000b02903e0dd9c8fd2mr41924642pff.28.1629845118514;
        Tue, 24 Aug 2021 15:45:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c64sm18556456pfc.8.2021.08.24.15.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 15:45:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 2/3] msm: Add helper library
Date:   Tue, 24 Aug 2021 15:49:31 -0700
Message-Id: <20210824224932.564352-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824224932.564352-1-robdclark@gmail.com>
References: <20210824224932.564352-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Handle some of the boilerplate for tests.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.c   | 163 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h   | 128 +++++++++++++++++++++++++++++++++++++
 lib/meson.build |   1 +
 3 files changed, 292 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
new file mode 100644
index 00000000..1bcb08d9
--- /dev/null
+++ b/lib/igt_msm.c
@@ -0,0 +1,163 @@
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
+struct msm_device *
+igt_msm_dev_open(void)
+{
+	struct msm_device *dev = calloc(1, sizeof(*dev));
+
+	dev->fd = drm_open_driver_render(DRIVER_MSM);
+	if (dev->fd < 0) {
+		free(dev);
+		return NULL;
+	}
+
+	return dev;
+}
+
+void
+igt_msm_dev_close(struct msm_device *dev)
+{
+	close(dev->fd);
+	free(dev);
+}
+
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
+void
+igt_msm_bo_free(struct msm_bo *bo)
+{
+	if (bo->map)
+		munmap(bo->map, bo->size);
+	gem_close(bo->dev->fd, bo->handle);
+	free(bo);
+}
+
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
+	/* Note that kerenels prior to v4.15 did not support submitqueues.
+	 * Mesa maintains support for older kernels, but I do not think
+	 * that IGT needs to.
+	 */
+	do_ioctl(dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_NEW, &req);
+
+	pipe->submitqueue_id = req.id;
+
+	return pipe;
+}
+
+void
+igt_msm_pipe_close(struct msm_pipe *pipe)
+{
+	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
+	free(pipe);
+}
+
+uint64_t
+igt_msm_pipe_get_param(struct msm_pipe *pipe, uint32_t param)
+{
+	struct drm_msm_param req = {
+			.pipe = pipe->pipe,
+			.param = param,
+	};
+
+	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_GET_PARAM, &req);
+
+	return req.value;
+}
diff --git a/lib/igt_msm.h b/lib/igt_msm.h
new file mode 100644
index 00000000..0d302e18
--- /dev/null
+++ b/lib/igt_msm.h
@@ -0,0 +1,128 @@
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
+struct msm_device {
+	int fd;
+};
+
+struct msm_device *igt_msm_dev_open(void);
+void igt_msm_dev_close(struct msm_device *dev);
+
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
+struct msm_pipe {
+	struct msm_device *dev;
+	uint32_t pipe;
+	uint32_t submitqueue_id;
+};
+
+struct msm_pipe *igt_msm_pipe_open(struct msm_device *dev, uint32_t prio);
+void igt_msm_pipe_close(struct msm_pipe *pipe);
+uint64_t igt_msm_pipe_get_param(struct msm_pipe *pipe, uint32_t param);
+
+/* Helper to get GPU gen.. we don't need too much actual cmdstream generation,
+ * but even CP_NOP is different between generations
+ */
+static inline unsigned
+igt_msm_pipe_gen(struct msm_pipe *pipe)
+{
+	uint64_t chip_id = igt_msm_pipe_get_param(pipe, MSM_PARAM_CHIP_ID);
+	return (chip_id >> 24) & 0xff;
+}
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

